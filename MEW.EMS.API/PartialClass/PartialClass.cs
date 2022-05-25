using MEW.EMS.API.DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;

namespace MEW.EMS.API.PartialClass
{

    public partial class SystemUserFilterParams
    {
        public string Name { get; set; }
        public string CivilId { get; set; }
        public string FileNo { get; set; }
    }

    public partial class CustomReport
    {
        public PersonalData personalData { get; set; }
        public List<ColumnList> columnLists { get; set; }
    }

    public partial class ColumnList
    {
        public string columnName { get; set; }
        public int currentTimeStamp { get; set; }
    }

    public partial class LeaveFilterParams
    {
        public int? Year { get; set; }
        public Guid UserId { get; set; }
        public string Status { get; set; }
        public int? LeaveTypeId { get; set; }
    }

    public partial class LeaveHeader
    {
        public int TakenLeaves { get; set; } = 0;
        public int DelayedDays { get; set; } = 0;
        public DateTime? LastTakenDate { get; set; }
        public DateTime? LastReturnedDate { get; set; }
        public int PendingRequests { get; set; } = 0;
        public int TotalRequests { get; set; } = 0;

    }

    public partial class LeaveReportData
    {
        public string Name { get; set; }
        public bool Delayed { get; set; }
        public DateTime? LeaveFrom { get; set; }
        public DateTime? LeaveTo { get; set; }
        public string Status { get; set; }
        public int? LeaveTypeId { get; set; }
        public bool Returned { get; set; }
        public bool NotReturned { get; set; }
        public string FileNo { get; set; }
        public string CivilId { get; set; }

    }

    public partial class UpdateRequestModel
    {
        public string Id { get; set; }
        public string Status { get; set; }
        public string Comments { get; set; }
    }

    public partial class LeaveEmployeeDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string FileNo { get; set; }
        public string CivilId { get; set; }
    }

    public partial class LeaveLeaveTypeDto
    {
        public int Id { get; set; }
        public string Description { get; set; }
    }

    public partial class LeaveChart
    {
        public string Month { get; set; }
        public int AppliedDays { get; set; }
        public int TakenDays { get; set; }
        public int DelayedDays { get; set; }
    }

    public partial class MastersData
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public short? Allwonce { get; set; }
        //public short? Choice { get; set; }
        //public short? Sort { get; set; }
        public int? FkId1 { get; set; }
        public string FkDesc1 { get; set; }
        public int? FkId2 { get; set; }
        public string FkDesc2 { get; set; }
        public bool Active { get; set; }
        public DateTime Tstamp { get; set; }

    }

    public partial class FileListModel
    {
        public List<string> FileName { get; set; }
        public List<string> FilePath { get; set; }
        public string FolderName { get; set; }
        public string FolderPath { get; set; }
    }

    //public partial class FolderListModel
    //{
    //    public string Name { get; set; }
    //    public string Path { get; set; }
    //    public List<FileListModel> FilesList { get; set; }
    //}

    // public partial class ProductInfo
    // {
    //     public List<V_Product> ProductList { get; set; }
    //     public List<Shape> Shapes { get; set; }
    //     public List<Supplier> Suppliers { get; set; }
    //     public List<StoneType> StoneTypes { get; set; }
    //     public List<Color> Colors { get; set; }
    //     public IEnumerable<ProductImage> ProductImages { get; set; }
    // }
    // public partial class ProductFilter
    // {
    //     public string AspNetUserId { get; set; }
    //     public decimal? SellingPrice { get; set; }
    // }
    //
    // public partial class SaleDetails
    // {
    //     public Sale SaleHeader { get; set; }
    //     public List<SaleProduct> SaleProducts { get; set; }
    //     public List<SalePaymentType> SalePaymentTypes { get; set; }
    // }

    public partial class CurrentUserInfo
    {
        public SystemUser SystemUser { get; set; }

        //public Enterprise UserEnterprise { get; set; }

        // public IQueryable<SystemUser> SystemUser { get; set; }
        // public List<UserCompany> UserCompanies { get; set; }
        // public List<UserBranch> UserBranches { get; set; }
        // public List<UserRole> UserRoles { get; set; }
        // public Enterprise UserEnterprise { get; set; }
    }

    public partial class CompanyModel
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public int? EnterpriseId { get; set; }
        public int CurrencyId { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
        public string ContactNo { get; set; }
    }

    public partial class BranchModel
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsActive { get; set; }
        public int CompanyId { get; set; }
    }

    public partial class Navigation
    {
        public string MainMenu { get; set; }
        public string Icon { get; set; }
        public int SeqNo { get; set; }
        public int Id { get; set; }
        public string SubMenu { get; set; }
        public int MainMenuId { get; set; }
        public string URL { get; set; }
        public int SubSeqNo { get; set; }

    }

    public partial class SystemUserCompany
    {
        public System.Guid Id { get; set; }
        public int EnterpriseId { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public bool IsActive { get; set; }
        public bool IsLockedOut { get; set; }
        public bool IsSuperUser { get; set; }
        public System.DateTime? Tstamp { get; set; }
        public bool IsSync { get; set; }
        public int CompanyId { get; set; }
    }

    public partial class UserRoleAccess
    {
        public int SubMenuId { get; set; }
        public int MainMenuId { get; set; }
        public string Description { get; set; }
        public int SeqNo { get; set; }
        public int RoleSubMenuId { get; set; }
        public int SystemRoleId { get; set; }
        public int AppSubMenuId { get; set; }
        public bool AccessView { get; set; }
        public bool AccessAdd { get; set; }
        public bool AccessEdit { get; set; }
        public bool AccessDelete { get; set; }
        public int CompanyId { get; set; }
        public string Name { get; set; }
        public string SystemRoleDescription { get; set; }

    }
    public partial class ProductSubgroupReturn
    {
        public int Id { get; set; }
        public int ProductGroupId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime? Tstamp { get; set; }

        public string ProductGroup { get; set; }
    }

    public partial class MainMenuNavigations
    {
        public int Id { get; set; }
        public int EnterpriseId { get; set; }
        public string title { get; set; }
        public string icon { get; set; }
        public string caret { get; set; }
        public int SeqNo { get; set; }
        public string url { get; set; }
        public bool IsActive { get; set; }
        public bool IsSync { get; set; }

        public virtual ICollection<SubMenu> SubMenus { get; set; }
    }


    public partial class imgModel
    {
        public int Id { get; set; }
        public imgFile[] file { get; set; }
    }

    public partial class imgFile
    {
        public string fileName { get; set; }
        public string filePath { get; set; }
    }

    public partial class Rep1params
    {
        public string type { get; set; }
        public int id { get; set; }
    }

    public partial class RepPaymentParams
    {
        public DateTime? startDate { get; set; }
        public DateTime? endDate { get; set; }
        public string type { get; set; }
        public int? id { get; set; }
        public int? Opt { get; set; }
    }

    internal partial class LicenseParams
    {
        public bool CompanyCheck { get; set; } = false;
        public bool BranchCheck { get; set; } = false;
        public bool PosCheck { get; set; } = false;
        public bool UserCheck { get; set; } = false;
        public bool ExpiryDateCheck { get; set; } = false;
        public bool NearExpiryCheck { get; set; } = false;
    }

    public class RegisterUserBindingModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string Name { get; set; }
        public string Mobile { get; set; }
        public string HomePhone { get; set; }
        public string OfficePhone { get; set; }
        public string Description { get; set; }
        public string Address { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public DateTime? DateOfJoin { get; set; }
        public int GenderId { get; set; }
        public int SystemLanguageId { get; set; }
        public string FileNo { get; set; }
        public string CivilId { get; set; }
    }
    public partial class BonusReportModel
    {
        public string Name { get; set; }
        public string FileNo { get; set; }
        public string CivilIdNo { get; set; }
        public DateTime? DateBirth { get; set; }
        public DateTime? DateJoin { get; set; }
        public string PhoneNo { get; set; }
        public int? ArticleNo { get; set; }
        public int PermanencyType { get; set; }
        public bool InsideBuilding { get; set; }
        public bool AdvHousing { get; set; }
        public bool AdvMobile { get; set; }
        public bool AdvVehicle { get; set; }
        public int GenderId { get; set; }
        public int MasterDepartmentId { get; set; }
        public int MasterJobDegreeId { get; set; }
        public int MasterFunctionalGroupId { get; set; }
        public int? MasterDesignationId { get; set; }
        public int? MasterJobTitleId { get; set; }
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
        public System.Guid Id { get; set; }
        public int PersonalDataId { get; set; }
        public int YearFrom { get; set; }
        public int YearTo { get; set; }
        public decimal Amount { get; set; }
        public string Note { get; set; }
        public System.DateTime Tstamp { get; set; }
    }

}
