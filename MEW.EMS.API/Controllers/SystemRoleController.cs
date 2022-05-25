using MEW.EMS.API.DAL;
using Microsoft.AspNet.Identity;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;

namespace MEW.EMS.API.Controllers
{
    [Authorize]
    [RoutePrefix("MEW/SystemRole")]
    public class SystemRoleController : ApiController
    {
        private MEW_EMS_Entities _db = new MEW_EMS_Entities();

        // [HttpGet]
        // public async Task<IHttpActionResult> GetSystemRoleList()
        // {
        //     return Ok(_db.xsp_getSystemRole());
        // }

        [HttpGet]
        [Route("RoleSubMenu")]
        public async Task<IHttpActionResult> GetRoleSubMenuList()
        {
            // int entId = SystemFunctionController.GetEnterpriseId(new Guid(User.Identity.GetUserId()));
            //
            // var d = await _db.AppSubMenus.Join(_db.AppMainMenus.Where(m => m.EnterpriseId == entId),
            //     s => s.MainMenuId,
            //     m => m.Id,
            //     (s, m) => new
            //     {
            //         Id = s.Id,
            //         Name = s.Description
            //     }).ToListAsync();
            //
            // return Ok(d);

            return Ok();
        }

        [HttpPost]
        public async Task<IHttpActionResult> PostSystemRoleList(SystemRole model)
        {
            return Ok();
        }

    }
}
