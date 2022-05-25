using Microsoft.AspNet.Identity.EntityFramework;
using System.Collections.Generic;

namespace MEW.EMS.API.Models
{
    public class UserInformation
    {
        public string Id { get; set; }
        public bool IsSuperUser { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public string Name { get; set; }

        public List<IdentityUserRole> UserRole { get; set; }
        public List<IdentityRole> Role { get; set; }
    }
}
