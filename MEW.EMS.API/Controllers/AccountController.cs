using MEW.EMS.API.DAL;
using MEW.EMS.API.Models;
using MEW.EMS.API.PartialClass;
using MEW.EMS.API.Providers;
using MEW.EMS.API.Results;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace MEW.EMS.API.Controllers
{
    [Authorize]
    [RoutePrefix("MEW/Account")]
    public class AccountController : ApiController
    {
        private const string LocalLoginProvider = "Local";
        private ApplicationUserManager _userManager;
        private MEW_EMS_Entities _context = new MEW_EMS_Entities();

        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager,
            ISecureDataFormat<AuthenticationTicket> accessTokenFormat)
        {
            UserManager = userManager;
            AccessTokenFormat = accessTokenFormat;
        }

        public ApplicationUserManager UserManager
        {
            get { return _userManager ?? Request.GetOwinContext().GetUserManager<ApplicationUserManager>(); }
            private set { _userManager = value; }
        }

        public ISecureDataFormat<AuthenticationTicket> AccessTokenFormat { get; private set; }

        // GET api/Account/UserInfo
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [Route("UserInfo")]
        public UserInfoViewModel GetUserInfo()
        {
            ExternalLoginData externalLogin = ExternalLoginData.FromIdentity(User.Identity as ClaimsIdentity);

            return new UserInfoViewModel
            {
                Email = User.Identity.GetUserName(),
                HasRegistered = externalLogin == null,
                LoginProvider = externalLogin != null ? externalLogin.LoginProvider : null
            };
        }

        // GET api/Account/UserDetails
        [HttpGet]
        [Route("UserDetails")]
        public IQueryable<UserInformation> GetUserDetails(string userId)
        {
            using (var context = new ApplicationDbContext())
            {
                return context.Users
                     .Include("Roles")
                     .Include("UserRoles")
                     .Where(x => x.Id == userId)
                     .Select(u =>
                         new UserInformation
                         {
                             Id = u.Id,
                             UserName = u.UserName,
                             Email = u.Email,
                             IsSuperUser = u.IsSuperUser,
                             PhoneNumber = u.PhoneNumber,
                             Name = u.Name,

                             UserRole = u.Roles.Where(r => r.UserId == userId).ToList(),
                             // Role = u.Roles.ToList();
                         });
            }

            // return View(viewModels);
        }

        // return new UserInformation
        // {
        //     Email = User.Identity.GetUserName(),
        //     EnterpriseId = User.Identity.Ge(),
        // };

        // POST MEW/Account/LogOut
        [Route("Logout")]
        public IHttpActionResult Logout()
        {
            Authentication.SignOut(CookieAuthenticationDefaults.AuthenticationType);

            using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
            {
                // var userId = User.Identity.GetUserId();
                // List<AspNetUserObject> o = _db.AspNetUserObjects.Where(x => x.AspNetUserId == userId).ToList();
                //
                // _db.AspNetUserObjects.RemoveRange(o);
                _db.SaveChanges();
            }

            return Ok();
        }

        // GET api/Account/ManageInfo?returnUrl=%2F&generateState=true
        [Route("ManageInfo")]
        public async Task<ManageInfoViewModel> GetManageInfo(string returnUrl, bool generateState = false)
        {
            IdentityUser user = await UserManager.FindByIdAsync(User.Identity.GetUserId());

            if (user == null)
            {
                return null;
            }

            List<UserLoginInfoViewModel> logins = new List<UserLoginInfoViewModel>();

            foreach (IdentityUserLogin linkedAccount in user.Logins)
            {
                logins.Add(new UserLoginInfoViewModel
                {
                    LoginProvider = linkedAccount.LoginProvider,
                    ProviderKey = linkedAccount.ProviderKey
                });
            }

            if (user.PasswordHash != null)
            {
                logins.Add(new UserLoginInfoViewModel
                {
                    LoginProvider = LocalLoginProvider,
                    ProviderKey = user.UserName,
                });
            }

            return new ManageInfoViewModel
            {
                LocalLoginProvider = LocalLoginProvider,
                Email = user.UserName,
                Logins = logins,
                ExternalLoginProviders = GetExternalLogins(returnUrl, generateState)
            };
        }

        // POST api/Account/ChangePassword
        [Route("ChangePassword")]
        public async Task<IHttpActionResult> ChangePassword(ChangePasswordBindingModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            IdentityResult result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword,
                model.NewPassword);

            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }

            return Ok();
        }

        // POST api/Account/ResetPassword
        [Route("ResetPassword")]
        public async Task<IHttpActionResult> RestPassword(ResetPasswordBindingModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var id = model.Id;

            //var user = await UserManager.FindByIdAsync(id);

            var token = await UserManager.GeneratePasswordResetTokenAsync(model.Id);

            var result = await UserManager.ResetPasswordAsync(model.Id, token, model.NewPassword);

            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }

            return Ok();
        }

        // POST api/Account/SetPassword
        [Route("SetPassword")]
        public async Task<IHttpActionResult> SetPassword(SetPasswordBindingModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            IdentityResult result = await UserManager.AddPasswordAsync(User.Identity.GetUserId(), model.NewPassword);

            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }

            return Ok();
        }

        // POST api/Account/AddExternalLogin
        [Route("AddExternalLogin")]
        public async Task<IHttpActionResult> AddExternalLogin(AddExternalLoginBindingModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            Authentication.SignOut(DefaultAuthenticationTypes.ExternalCookie);

            AuthenticationTicket ticket = AccessTokenFormat.Unprotect(model.ExternalAccessToken);

            if (ticket == null || ticket.Identity == null || (ticket.Properties != null
                && ticket.Properties.ExpiresUtc.HasValue
                && ticket.Properties.ExpiresUtc.Value < DateTimeOffset.UtcNow))
            {
                return BadRequest("External login failure.");
            }

            ExternalLoginData externalData = ExternalLoginData.FromIdentity(ticket.Identity);

            if (externalData == null)
            {
                return BadRequest("The external login is already associated with an account.");
            }

            IdentityResult result = await UserManager.AddLoginAsync(User.Identity.GetUserId(),
                new UserLoginInfo(externalData.LoginProvider, externalData.ProviderKey));

            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }

            return Ok();
        }

        // POST api/Account/RemoveLogin
        [Route("RemoveLogin")]
        public async Task<IHttpActionResult> RemoveLogin(RemoveLoginBindingModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            IdentityResult result;

            if (model.LoginProvider == LocalLoginProvider)
            {
                result = await UserManager.RemovePasswordAsync(User.Identity.GetUserId());
            }
            else
            {
                result = await UserManager.RemoveLoginAsync(User.Identity.GetUserId(),
                    new UserLoginInfo(model.LoginProvider, model.ProviderKey));
            }

            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }

            return Ok();
        }

        // GET api/Account/ExternalLogin
        [OverrideAuthentication]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalCookie)]
        [AllowAnonymous]
        [Route("ExternalLogin", Name = "ExternalLogin")]
        public async Task<IHttpActionResult> GetExternalLogin(string provider, string error = null)
        {
            if (error != null)
            {
                return Redirect(Url.Content("~/") + "#error=" + Uri.EscapeDataString(error));
            }

            if (!User.Identity.IsAuthenticated)
            {
                return new ChallengeResult(provider, this);
            }

            ExternalLoginData externalLogin = ExternalLoginData.FromIdentity(User.Identity as ClaimsIdentity);

            if (externalLogin == null)
            {
                return InternalServerError();
            }

            if (externalLogin.LoginProvider != provider)
            {
                Authentication.SignOut(DefaultAuthenticationTypes.ExternalCookie);
                return new ChallengeResult(provider, this);
            }

            ApplicationUser user = await UserManager.FindAsync(new UserLoginInfo(externalLogin.LoginProvider,
                externalLogin.ProviderKey));

            bool hasRegistered = user != null;

            if (hasRegistered)
            {
                Authentication.SignOut(DefaultAuthenticationTypes.ExternalCookie);

                ClaimsIdentity oAuthIdentity = await user.GenerateUserIdentityAsync(UserManager,
                   OAuthDefaults.AuthenticationType);
                ClaimsIdentity cookieIdentity = await user.GenerateUserIdentityAsync(UserManager,
                    CookieAuthenticationDefaults.AuthenticationType);

                AuthenticationProperties properties = ApplicationOAuthProvider.CreateProperties(user.UserName, user.Id);
                Authentication.SignIn(properties, oAuthIdentity, cookieIdentity);
            }
            else
            {
                IEnumerable<Claim> claims = externalLogin.GetClaims();
                ClaimsIdentity identity = new ClaimsIdentity(claims, OAuthDefaults.AuthenticationType);
                Authentication.SignIn(identity);
            }

            return Ok();
        }

        // GET api/Account/ExternalLogins?returnUrl=%2F&generateState=true
        [AllowAnonymous]
        [Route("ExternalLogins")]
        public IEnumerable<ExternalLoginViewModel> GetExternalLogins(string returnUrl, bool generateState = false)
        {
            IEnumerable<AuthenticationDescription> descriptions = Authentication.GetExternalAuthenticationTypes();
            List<ExternalLoginViewModel> logins = new List<ExternalLoginViewModel>();

            string state;

            if (generateState)
            {
                const int strengthInBits = 256;
                state = RandomOAuthStateGenerator.Generate(strengthInBits);
            }
            else
            {
                state = null;
            }

            foreach (AuthenticationDescription description in descriptions)
            {
                ExternalLoginViewModel login = new ExternalLoginViewModel
                {
                    Name = description.Caption,
                    Url = Url.Route("ExternalLogin", new
                    {
                        provider = description.AuthenticationType,
                        response_type = "token",
                        client_id = Startup.PublicClientId,
                        redirect_uri = new Uri(Request.RequestUri, returnUrl).AbsoluteUri,
                        state = state
                    }),
                    State = state
                };
                logins.Add(login);
            }

            return logins;
        }

        // POST api/Account/Register
        [AllowAnonymous]
        [Route("Register")]
        public async Task<IHttpActionResult> Register([FromBody] RegisterBindingModel model)
        {
            //List<Company> company;

            // using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
            // {
            //     company = model.CompanyList;//await _db.Companies.Where(x => x.Id == model.CompanyList);
            // }
            //
            // if (!ModelState.IsValid || company == null)
            // {
            //     return BadRequest(ModelState);
            // }

            //int entId = company[0].EnterpriseId;

            var user = new ApplicationUser()
            {
                UserName = model.Email,
                // EnterpriseId = entId,
                Name = model.Name,
                Email = model.Email
            };

            IdentityResult result = await UserManager.CreateAsync(user, model.Password);

            if (!result.Succeeded)
            {
                return GetErrorResult(result);
                //string[] errList = result.Errors.ToArray();

                //string err = errList[0];

                //return BadRequest(err);
            }

            var userId = UserManager.Users.FirstOrDefault(x => x.UserName == model.Email);

            try
            {
                SystemUser u = new SystemUser();

                using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
                {
                    u.IsSuperUser = userId.IsSuperUser;
                    u.Id = new Guid(userId.Id);
                    u.Active = true;
                    u.IsLockedOut = false;
                    u.Name = userId.Name;
                    u.UserName = userId.UserName;
                    u.Tstamp = DateTime.Now;
                    u.Address = model.Address;
                    u.DateOfBirth = model.DateOfBirth;
                    u.DateOfJoin = model.DateOfJoin;
                    u.Description = model.Description;
                    u.HomePhone = model.HomePhone;
                    u.Mobile = model.Mobile;
                    u.OfficePhone = model.OfficePhone;
                    u.SystemRoleId = model.SystemRoleId;
                    u.GenderId = model.GenderId;
                    u.SystemLanguageId = model.SystemLanguageId;
                    u.CivilId = model.CivilId;
                    u.FileNo = model.FileNo;
                    u.Email = model.Email;

                    _db.SystemUsers.AddOrUpdate(u);

                    // UserCompany c = new UserCompany();
                    //
                    // foreach (var item in company)
                    // {
                    //     c.Id = Guid.NewGuid();
                    //     c.CompanyId = item.Id;
                    //     c.SystemUserId = new Guid(userId.Id);
                    //     c.IsSync = false;
                    //     c.Tstamp = DateTime.Now;
                    //
                    //     _db.UserCompanies.Add(c);
                    // }

                    await _db.SaveChangesAsync();

                    var r = _db.SystemUsers.FirstOrDefault(x => x.Id == new Guid(userId.Id));

                    return Ok(r);
                }
            }
            catch (Exception e)
            {
                using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
                {
                    var d = _db.SystemUsers.Find(userId.Id);
                    _db.SystemUsers.Remove(d);
                    _db.SaveChanges();
                }
                using (var db = new ApplicationDbContext())
                {
                    var apuser = db.Users.Find(userId.Id);
                    db.Users.Remove(apuser);
                    db.SaveChanges();
                }
                return InternalServerError(e.InnerException);
            }
        }

        // POST api/Account/UpdateUser
        [AllowAnonymous]
        [Route("UpdateUser")]
        public async Task<IHttpActionResult> UpdateUser([FromBody] UpdateBindingModel model)
        {

            var userId = UserManager.Users.FirstOrDefault(x => x.Id == model.Id);

            try
            {
                using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
                {
                    _db.Configuration.LazyLoadingEnabled = false;

                    SystemUser u = _db.SystemUsers.FirstOrDefault(x => x.Id == new Guid(model.Id)); //new SystemUser();

                    u.IsSuperUser = userId.IsSuperUser;
                    u.Active = true;
                    u.IsLockedOut = false;
                    u.Name = userId.Name;
                    u.Tstamp = DateTime.Now;
                    u.Address = model.Address;
                    u.DateOfBirth = model.DateOfBirth;
                    u.DateOfJoin = model.DateOfJoin;
                    u.Description = model.Description;
                    u.HomePhone = model.HomePhone;
                    u.Mobile = model.Mobile;
                    u.OfficePhone = model.OfficePhone;
                    u.SystemRoleId = model.SystemRoleId;
                    u.GenderId = model.GenderId;
                    u.SystemLanguageId = model.SystemLanguageId;
                    u.CivilId = model.CivilId;
                    u.FileNo = model.FileNo;
                    u.Email = userId.Email;
                    u.UserName = userId.Email;

                    _db.SystemUsers.AddOrUpdate(u);

                    await _db.SaveChangesAsync();

                    var r = _db.SystemUsers.FirstOrDefault(x => x.Id == new Guid(userId.Id));

                    return Ok(r);
                }
            }
            catch (Exception e)
            {
                using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
                {
                    var d = _db.SystemUsers.Find(userId.Id);
                    _db.SystemUsers.Remove(d);
                    _db.SaveChanges();
                }
                using (var db = new ApplicationDbContext())
                {
                    var apuser = db.Users.Find(userId.Id);
                    db.Users.Remove(apuser);
                    db.SaveChanges();
                }
                return InternalServerError(e.InnerException);
            }
        }

        // POST MEW/Account/RegisterUser
        //[AllowAnonymous]
        [Authorize]
        [Route("RegisterUser")]
        public async Task<IHttpActionResult> RegisterUser(RegisterUserBindingModel model)
        {
            // List<Company> company;

            // using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
            // {
            //     company = model.CompanyList;//await _db.Companies.Where(x => x.Id == model.CompanyList);
            // }
            //
            // if (!ModelState.IsValid || company == null)
            // {
            //     return BadRequest(ModelState);
            // }
            //
            // int entId = company[0].EnterpriseId;

            var user = new ApplicationUser()
            {
                UserName = model.UserName,
                //EnterpriseId = entId,
                Name = model.Name,
                //Email = model.Email
            };

            IdentityResult result = await UserManager.CreateAsync(user, model.Password);

            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }

            var userId = UserManager.Users.FirstOrDefault(x => x.UserName == model.UserName);

            try
            {
                SystemUser u = new SystemUser();

                using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
                {
                    u.IsSuperUser = userId.IsSuperUser;
                    u.Id = new Guid(userId.Id);
                    u.Active = false;
                    u.IsLockedOut = false;
                    u.Name = userId.Name;
                    u.UserName = userId.UserName;
                    u.Tstamp = DateTime.Now;
                    u.Address = model.Address;
                    u.DateOfBirth = model.DateOfBirth;
                    u.DateOfJoin = model.DateOfJoin;
                    u.Description = model.Description;
                    u.HomePhone = model.HomePhone;
                    u.Mobile = model.Mobile;
                    u.OfficePhone = model.OfficePhone;
                    //u.SystemCountryId = model.SystemCountryId;
                    u.GenderId = model.GenderId;
                    u.SystemLanguageId = model.SystemLanguageId;
                    u.CivilId = model.CivilId;
                    u.FileNo = model.FileNo;

                    _db.SystemUsers.Add(u);

                    // UserCompany c = new UserCompany();
                    //
                    // foreach (var item in company)
                    // {
                    //     c.Id = Guid.NewGuid();
                    //     c.CompanyId = item.Id;
                    //     c.SystemUserId = new Guid(userId.Id);
                    //     c.IsSync = false;
                    //     c.Tstamp = DateTime.Now;
                    //
                    //     _db.UserCompanies.Add(c);
                    // }

                    await _db.SaveChangesAsync();

                    var r = _db.SystemUsers.FirstOrDefault(x => x.Id == new Guid(userId.Id));

                    return Ok(r);
                }
            }
            catch (Exception e)
            {
                using (MEW_EMS_Entities _db = new MEW_EMS_Entities())
                {
                    var d = _db.SystemUsers.Find(userId.Id);
                    _db.SystemUsers.Remove(d);
                    _db.SaveChanges();
                }
                using (var db = new ApplicationDbContext())
                {
                    var apuser = db.Users.Find(userId.Id);
                    db.Users.Remove(apuser);
                    db.SaveChanges();
                }
                return InternalServerError(e.InnerException);
            }
        }

        // POST api/Account/RegisterExternal
        [OverrideAuthentication]
        [HostAuthentication(DefaultAuthenticationTypes.ExternalBearer)]
        [Route("RegisterExternal")]
        public async Task<IHttpActionResult> RegisterExternal(RegisterExternalBindingModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var info = await Authentication.GetExternalLoginInfoAsync();
            if (info == null)
            {
                return InternalServerError();
            }

            var user = new ApplicationUser() { UserName = model.Email, Email = model.Email };

            IdentityResult result = await UserManager.CreateAsync(user);
            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }

            result = await UserManager.AddLoginAsync(user.Id, info.Login);
            if (!result.Succeeded)
            {
                return GetErrorResult(result);
            }
            return Ok();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && _userManager != null)
            {
                _userManager.Dispose();
                _userManager = null;
            }

            base.Dispose(disposing);
        }

        #region Helpers

        private IAuthenticationManager Authentication
        {
            get { return Request.GetOwinContext().Authentication; }
        }

        private IHttpActionResult GetErrorResult(IdentityResult result)
        {
            if (result == null)
            {
                return InternalServerError();
            }

            if (!result.Succeeded)
            {
                if (result.Errors != null)
                {
                    foreach (string error in result.Errors)
                    {
                        ModelState.AddModelError("", error);
                    }
                }

                if (ModelState.IsValid)
                {
                    // No ModelState errors are available to send, so just return an empty BadRequest.
                    return BadRequest();
                }

                return BadRequest(ModelState);
            }

            return null;
        }

        private class ExternalLoginData
        {
            public string LoginProvider { get; set; }
            public string ProviderKey { get; set; }
            public string UserName { get; set; }

            public IList<Claim> GetClaims()
            {
                IList<Claim> claims = new List<Claim>();
                claims.Add(new Claim(ClaimTypes.NameIdentifier, ProviderKey, null, LoginProvider));

                if (UserName != null)
                {
                    claims.Add(new Claim(ClaimTypes.Name, UserName, null, LoginProvider));
                }

                return claims;
            }

            public static ExternalLoginData FromIdentity(ClaimsIdentity identity)
            {
                if (identity == null)
                {
                    return null;
                }

                Claim providerKeyClaim = identity.FindFirst(ClaimTypes.NameIdentifier);

                if (providerKeyClaim == null || String.IsNullOrEmpty(providerKeyClaim.Issuer)
                    || String.IsNullOrEmpty(providerKeyClaim.Value))
                {
                    return null;
                }

                if (providerKeyClaim.Issuer == ClaimsIdentity.DefaultIssuer)
                {
                    return null;
                }

                return new ExternalLoginData
                {
                    LoginProvider = providerKeyClaim.Issuer,
                    ProviderKey = providerKeyClaim.Value,
                    UserName = identity.FindFirstValue(ClaimTypes.Name)
                };
            }
        }

        private static class RandomOAuthStateGenerator
        {
            private static RandomNumberGenerator _random = new RNGCryptoServiceProvider();

            public static string Generate(int strengthInBits)
            {
                const int bitsPerByte = 8;

                if (strengthInBits % bitsPerByte != 0)
                {
                    throw new ArgumentException("strengthInBits must be evenly divisible by 8.", "strengthInBits");
                }

                int strengthInBytes = strengthInBits / bitsPerByte;

                byte[] data = new byte[strengthInBytes];
                _random.GetBytes(data);
                return HttpServerUtility.UrlTokenEncode(data);
            }
        }

        #endregion Helpers
    }
}