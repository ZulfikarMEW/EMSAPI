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
    
    public partial class PersonalData
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PersonalData()
        {
            this.PersonalPriorExperiences = new HashSet<PersonalPriorExperience>();
            this.PersonalPromotions = new HashSet<PersonalPromotion>();
            this.PersonalQualifications = new HashSet<PersonalQualification>();
            this.PersonalChangeJobTitles = new HashSet<PersonalChangeJobTitle>();
            this.PersonalAnnualEvaluations = new HashSet<PersonalAnnualEvaluation>();
            this.BonusAdjustments = new HashSet<BonusAdjustment>();
            this.Bonus = new HashSet<Bonu>();
            this.PersonalInternalTransfers = new HashSet<PersonalInternalTransfer>();
        }
    
        public int Id { get; set; }
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
    
        public virtual Gender Gender { get; set; }
        public virtual MasterBudgetType MasterBudgetType { get; set; }
        public virtual MasterDepartment MasterDepartment { get; set; }
        public virtual MasterDesignation MasterDesignation { get; set; }
        public virtual MasterFunctionalGroup MasterFunctionalGroup { get; set; }
        public virtual MasterGrade MasterGrade { get; set; }
        public virtual MasterJobDegree MasterJobDegree { get; set; }
        public virtual MasterJobDescription MasterJobDescription { get; set; }
        public virtual MasterJobLevel MasterJobLevel { get; set; }
        public virtual MasterJobTitle MasterJobTitle { get; set; }
        public virtual MasterNationality MasterNationality { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PersonalPriorExperience> PersonalPriorExperiences { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PersonalPromotion> PersonalPromotions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PersonalQualification> PersonalQualifications { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PersonalChangeJobTitle> PersonalChangeJobTitles { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PersonalAnnualEvaluation> PersonalAnnualEvaluations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BonusAdjustment> BonusAdjustments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Bonu> Bonus { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PersonalInternalTransfer> PersonalInternalTransfers { get; set; }
    }
}
