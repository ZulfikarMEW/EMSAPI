//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MEW.EMS.API.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class SubMenu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SubMenu()
        {
            this.SubMenuRoles = new HashSet<SubMenuRole>();
        }
    
        public int Id { get; set; }
        public int MainMenuId { get; set; }
        public string title { get; set; }
        public string url { get; set; }
        public int SeqNo { get; set; }
        public bool IsActive { get; set; }
        public bool IsSync { get; set; }
    
        public virtual MainMenu MainMenu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubMenuRole> SubMenuRoles { get; set; }
    }
}