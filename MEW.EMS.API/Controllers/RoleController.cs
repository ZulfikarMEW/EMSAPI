using MEW.EMS.API.DAL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace MEW.EMS.API.Controllers
{
    [Authorize]
    [RoutePrefix("MEW/Role")]

    public class RoleController : ApiController
    {
        private MEW_EMS_Entities _db = new MEW_EMS_Entities();

        //Role
        [HttpGet]
        public async Task<IHttpActionResult> GetRolesList()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                return Ok(await _db.SystemRoles
                    .Include(i => i.RoleFunctions)
                    .Include(i => i.RoleFunctions.Select(x => x.SystemRoleFunction))
                    .ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        //Role
        [HttpPost]
        public async Task<IHttpActionResult> PostRole(SystemRole model)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                model.Tstamp = DateTime.Now;

                foreach (var row in model.RoleFunctions)
                {
                    row.Id = Guid.NewGuid();
                    row.Tstamp = DateTime.Now;
                }

                //if (!ModelState.IsValid)
                //{
                //    return BadRequest(ModelState);
                //}

                List<RoleFunction> d = _db.RoleFunctions.Where(x => x.SystemRoleId == model.Id).ToList();

                if (d.Count != 0)
                {
                    _db.RoleFunctions.RemoveRange(d);
                }

                _db.SystemRoles.AddOrUpdate(model);

                _db.RoleFunctions.AddRange(model.RoleFunctions);
                await _db.SaveChangesAsync();

                return Ok(model);
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        //Role/RoleFunction
        [HttpGet]
        [Route("RoleFunction")]
        public async Task<IHttpActionResult> GetRolesFunction()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                return Ok(await _db.SystemRoleFunctions.Include(i => i.RoleFunctions)
                    .ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        //Role/UserRoleFunction
        [HttpGet]
        [Route("UserRoleFunction")]
        public async Task<IHttpActionResult> GetUserRolesFunction()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                var userId = new Guid(User.Identity.GetUserId());

                SystemUser u = await _db.SystemUsers.FindAsync(userId);

                SystemRole r = await _db.SystemRoles.Include(x => x.RoleFunctions).FirstOrDefaultAsync(x => x.Id == u.SystemRoleId);

                return Ok(r);
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }
    }
}