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
    
    public partial class V_BonusReport
    {
        public System.Guid Id { get; set; }
        public int PersonalDataId { get; set; }
        public int Year { get; set; }
        public decimal Amount { get; set; }
        public string Note { get; set; }
        public System.DateTime Tstamp { get; set; }
        public string Name { get; set; }
        public string FileNo { get; set; }
        public string CivilIdNo { get; set; }
        public Nullable<System.DateTime> DateBirth { get; set; }
        public Nullable<System.DateTime> DateJoin { get; set; }
        public string PhoneNo { get; set; }
        public Nullable<int> ArticleNo { get; set; }
        public int PermanencyType { get; set; }
        public bool InsideBuilding { get; set; }
        public bool AdvHousing { get; set; }
        public bool AdvMobile { get; set; }
        public bool AdvVehicle { get; set; }
        public int GenderId { get; set; }
        public int MasterDepartmentId { get; set; }
        public int MasterJobDegreeId { get; set; }
        public int MasterFunctionalGroupId { get; set; }
        public Nullable<int> MasterDesignationId { get; set; }
        public Nullable<int> MasterJobTitleId { get; set; }
        public int MasterJobDescriptionId { get; set; }
        public int MasterNationalityId { get; set; }
        public int MasterBudgetTypeId { get; set; }
        public Nullable<int> MasterJobLevelId { get; set; }
        public Nullable<int> NextJobLevelId { get; set; }
        public Nullable<System.DateTime> NextJobLevelDate { get; set; }
        public Nullable<int> MasterGradeId { get; set; }
        public Nullable<System.DateTime> CurrentGradeDate { get; set; }
        public Nullable<int> NextGradeId { get; set; }
        public Nullable<System.DateTime> NextGradeDate { get; set; }
        public Nullable<int> CurrentNoOfAllowances { get; set; }
        public Nullable<int> NextNoOfAllowances { get; set; }
        public bool IsRetired { get; set; }
        public Nullable<int> MasterReasonForRetirementId { get; set; }
        public Nullable<System.Guid> RevisedBy { get; set; }
        public Nullable<System.DateTime> DateRevised { get; set; }
        public string Notes { get; set; }
    }
}