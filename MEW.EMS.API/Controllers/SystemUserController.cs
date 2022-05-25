using MEW.EMS.API.DAL;
using MEW.EMS.API.PartialClass;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;

namespace MEW.EMS.API.Controllers
{
    [Authorize]
    [RoutePrefix("MEW/SystemUser")]
    public class SystemUserController : ApiController
    {

        private MEW_EMS_Entities _db = new MEW_EMS_Entities();

        //[HttpGet]
        //public async Task<IHttpActionResult> GetUsersList()
        //{
        //    try
        //    {
        //        _db.Configuration.LazyLoadingEnabled = false;
        //        return Json(await _db.SystemUsers.ToListAsync());
        //    }
        //    catch (Exception e)
        //    {
        //        return BadRequest(e.InnerException.Message.ToString());
        //    }
        //}

        // [HttpGet]
        // public async Task<IHttpActionResult> GetCompanyUsersList()
        // {
        //     try
        //     {
        //         int entId = SystemFunctionController.GetEnterpriseId(new Guid(User.Identity.GetUserId()));
        //
        //         _db.Configuration.LazyLoadingEnabled = false;
        //
        //         var userList = await _db.SystemUsers.Join(_db.UserCompanies,
        //                 u => u.Id,
        //                 c => c.SystemUserId,
        //                 (u, c) => new SystemUserCompany()
        //                 {
        //                     EnterpriseId = u.EnterpriseId,
        //                     Id = u.Id,
        //                     Name = u.Name,
        //                     UserName = u.UserName,
        //                     IsActive = u.Active,
        //                     IsLockedOut = u.IsLockedOut,
        //                     IsSuperUser = u.IsSuperUser,
        //                     Tstamp = u.Tstamp,
        //                     CompanyId = c.CompanyId
        //                 }).Where(x => x.EnterpriseId == entId)
        //             .ToListAsync();
        //
        //
        //         return Json(userList);
        //     }
        //     catch (Exception e)
        //     {
        //         return BadRequest(e.InnerException.Message.ToString());
        //     }
        // }
        [HttpGet]
        [Route("{id}")]
        public async Task<SystemUser> GetUser(Guid id)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;
                return await _db.SystemUsers.FindAsync(id);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("CurrentUser")]

        public async Task<IHttpActionResult> GetCurrentUser()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                Guid userId = new Guid(User.Identity.GetUserId());

                return Json(await _db.SystemUsers.FirstOrDefaultAsync(x => x.Id == userId));
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        [HttpPost]
        [Route("UsersListFiltered")]

        public async Task<IHttpActionResult> GetUsersListFiltered(SystemUser model)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                var usersList = _db.xsp_FilterSystemUsers(model.FileNo, model.Name, model.CivilId);

                var users = await _db.V_SystemUserFilter.Where(x => x.Active == true).ToListAsync();

                //var users = await _db.SystemUsers.Where(x => x.Active == true).ToListAsync();

                //if (model.FileNo !=null)
                //{
                //    users = users.Where(x => model.FileNo.Contains(x.FileNo)).ToList();
                //}

                //if (model.CivilId != null)
                //{
                //    users = users.Where(x => model.CivilId.Contains(x.CivilId)).ToList();
                //}

                //if (model.Name != null)
                //{
                //    users = users.Where(x => model.Name.Contains(x.Name)).ToList();
                //}

                //if (model.FileNo != null)
                //{
                //    users = users.Where(x => model.FileNo.Contains(x.FileNo)).ToList();
                //}

                //if (model.FileNo != null) { users = users.Where(x => model.FileNo.Contains(x.FileNo)).ToList(); }
                //if (model.CivilId != null) { users = users.Where(x => model.CivilId.Contains(x.CivilId)).ToList(); }
                //if (model.Name != null) { users = users.Where(x => model.Name.Contains(x.Name)).ToList(); }
                //if (model.UserName != null) { users = users.Where(x => model.UserName.Contains(x.UserName)).ToList(); }
                //if (model.Email != null) { users = users.Where(x => model.Email.Contains(x.Email)).ToList(); }
                //if (model.Mobile != null) { users = users.Where(x => model.Mobile.Contains(x.Mobile)).ToList(); }
                //if (model.HomePhone != null) { users = users.Where(x => model.HomePhone.Contains(x.HomePhone)).ToList(); }
                //if (model.OfficePhone != null) { users = users.Where(x => model.OfficePhone.Contains(x.OfficePhone)).ToList(); }
                //if (model.Description != null) { users = users.Where(x => model.Description.Contains(x.Description)).ToList(); }
                //if (model.Address != null) { users = users.Where(x => model.Address.Contains(x.Address)).ToList(); }
                //if (model.GenderId != 0) { users = users.Where(x => model.GenderId == x.GenderId).ToList(); }
                //if (model.SystemLanguageId != 0) { users = users.Where(x => x.SystemLanguageId == model.SystemLanguageId).ToList(); }
                //if (model.DateOfBirth != null) { users = users.Where(x => x.DateOfBirth == model.DateOfBirth).ToList(); }
                //if (model.DateOfJoin != null) { users = users.Where(x => x.DateOfJoin == model.DateOfJoin).ToList(); }
                //if (model.SystemRoleId != 0) { users = users.Where(x => x.SystemRoleId == model.SystemRoleId).ToList(); }

                return Json(users);
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        [HttpGet]
        [Route("CurrentUserInfo")]

        // public async Task<CurrentUserInfo> GetCurrentUserInfo()
        public async Task<IQueryable<SystemUser>> GetCurrentUserInfo()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                Guid userId = new Guid(User.Identity.GetUserId());

                // int entId = (await _db.SystemUsers.FindAsync(userId)).EnterpriseId;


                var s = _db.SystemUsers.Where(x => x.Id == userId);
                //.Include(x => x.);

                // CurrentUserInfo s = new CurrentUserInfo
                // {
                //     SystemUser = _db.SystemUsers.Where(x => x.Id == userId),
                //     UserBranches = await _db.UserBranches.Where(x => x.SystemUserId == userId).ToListAsync(),
                //     UserCompanies = await _db.UserCompanies.Where(x => x.SystemUserId == userId).ToListAsync(),
                //     UserRoles = await _db.UserRoles.Where(x => x.SystemUserId == userId).ToListAsync(),
                //     UserEnterprise = _db.Enterprises.FirstOrDefault(x => x.Id == entId)
                // };

                // CurrentUserInfo s = new CurrentUserInfo
                // {
                //     SystemUser = _db.SystemUsers.FirstOrDefault(x => x.Id == userId),
                //     UserEnterprise = _db.Enterprises.FirstOrDefault(x => x.Id == entId),
                //     // (from e in _db.Enterprises
                //     //                         join u in _db.SystemUsers.Where(x => x.Id == userId) on e.Id equals u.EnterpriseId
                //     //                         where u.Id == userId
                //     //                         select new Enterprise()).FirstOrDefault()
                //
                //     //from e in _db.Enterprises join u in _db.SystemUsers.Where(x => x.Id == userId) on e.Id equals u.EnterpriseId select Enterprise
                // };

                return s;

                // return xx;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpGet]
        [Route("Navigation")]
        public async Task<IHttpActionResult> GetNavigation()
        {
            try
            {
                // var navi = _db.xsp_getUserRoleMenu(User.Identity.GetUserId()).ToList();
                // return Ok(navi);

                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }
        [HttpGet]
        [Route("UserMainMenu")]
        public async Task<IHttpActionResult> GetMainNavigation()
        {
            try
            {
                // var mainNavi = _db.xsp_getUserMainMenu().ToList();
                // return Ok(mainNavi);

                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }

        [HttpGet]
        [Route("MenuNavigation")]
        public async Task<IHttpActionResult> MenuNavigations()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                Guid userId = new Guid(User.Identity.GetUserId());

                //List<MainMenu> menus = await _db.RoleFunctions.Where(x => x.SystemUserId == userId)
                //            .Join(_db.SystemRoles,
                //                u => u.SystemRoleId, s => s.Id, (u, s) => s)
                //            .Join(_db.SubMenuRoles,
                //                s => s.Id, r => r.SystemRoleId, (s, r) => r)
                //            .Join(_db.SubMenus,
                //                s => s.AppSubMenuId, sm => sm.Id, (m, sm) => sm)
                //            .Join(_db.MainMenus,
                //                s => s.MainMenuId, m => m.Id, (s, m) => m).OrderBy(s => s.SeqNo)//.ThenBy(x => x.SubMenus.OrderBy(y => y.SeqNo))
                //            .AsNoTracking().Include(x => x.SubMenus)
                //    .ToListAsync();


                //IOrderedEnumerable<MainMenu> menus1 = menus.OrderBy(x => x.SubMenus.OrderBy(y => y.SeqNo));

                //List<MainMenu> t1 = new List<MainMenu>();

                //foreach (var row in menus)
                //{
                //    if (!t1.Any(p => p.Id == row.Id))
                //    {
                //        t1.Add(row);
                //    }
                //}

                //return Json(t1);

                return Json(userId);

                //return Ok(menus);
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }

        [HttpPost]
        public async Task<IHttpActionResult> UpdateUser(SystemUser model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                model.Tstamp = DateTime.Now;
                _db.SystemUsers.AddOrUpdate(model);

                //var user = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new IdentityDbContext()));

                //var uUser = user.FindByIdAsync(model.Id.ToString());

                //if (uUser == null)
                //{
                //    return BadRequest($"Cannot Find User With ID {model.Id}");
                //}

                //uUser.Result.Name = model.Name;

                //   IdentityResult result = await user.UpdateAsync(uUser.Result);

                //if (!result.Succeeded)
                //{
                //    return BadRequest("Failed to update identity details");
                //}

                await _db.SaveChangesAsync();
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message);
            }

            return Ok();
        }


        [HttpPost]
        [Route("AspNetUserCompany")]
        public async Task<IHttpActionResult> AspNetUserCompany([FromUri] int companyId)
        {
            try
            {
                // var userId = User.Identity.GetUserId();
                // var l = await _db.AspNetUserObjects.Where(x => x.AspNetUserId == userId).ToListAsync();
                //
                // AspNetUserObject a = new AspNetUserObject();
                //
                // if (l.Count > 1)
                // {
                //     _db.AspNetUserObjects.RemoveRange(l);
                //     await _db.SaveChangesAsync();
                //
                //     return Conflict();
                // }
                // else if (l.Count == 1)
                // {
                //     a.Id = l[0].Id;
                // }
                // else
                // {
                //     a.Id = Guid.NewGuid();
                // }
                //
                //
                // a.AspNetUserId = userId;
                // a.Tstamp = DateTime.Now;
                // a.CompanyId = companyId;
                //
                //
                // _db.AspNetUserObjects.AddOrUpdate(a);
                // await _db.SaveChangesAsync();

                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message);
            }
        }
    }
}
