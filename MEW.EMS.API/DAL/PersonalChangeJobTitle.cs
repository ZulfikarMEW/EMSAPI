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
    
    public partial class PersonalChangeJobTitle
    {
        public System.Guid Id { get; set; }
        public int PersonalDataId { get; set; }
        public int MasterJobTitleId { get; set; }
        public System.DateTime DateAffected { get; set; }
        public string Note { get; set; }
        public System.Guid EnteredBy { get; set; }
        public System.DateTime Tstamp { get; set; }
    
        public virtual MasterJobTitle MasterJobTitle { get; set; }
        public virtual PersonalData PersonalData { get; set; }
        public virtual SystemUser SystemUser { get; set; }
    }
}
