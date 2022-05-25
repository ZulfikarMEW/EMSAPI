using ideaXApi.DAL;
using Microsoft.AspNet.Identity;
using System;
using System.Threading.Tasks;
using System.Web.Http;

namespace ideaXApi.Controllers
{
    public class CustomerController : ApiController
    {
        private ideaX_CheckmateEntities _context = new ideaX_CheckmateEntities();

        [HttpGet]
        public async Task<IHttpActionResult> GetCustomers()
        {
            try
            {
                _context.Configuration.LazyLoadingEnabled = false;

                var userName = User.Identity.Name;

                var userID = User.Identity.GetUserId();

                return Json(User);

            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }

    }
}
