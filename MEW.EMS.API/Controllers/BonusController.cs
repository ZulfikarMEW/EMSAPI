using MEW.EMS.API.DAL;
using MEW.EMS.API.PartialClass;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Data;
using ClosedXML.Excel;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading;

namespace MEW.EMS.API.Controllers
{
    [Authorize]
    [RoutePrefix("MEW/Bonus")]

    public class BonusController : ApiController
    {
        private MEW_EMS_Entities _db = new MEW_EMS_Entities();

        //Bonus
        [HttpGet]
        public async Task<IHttpActionResult> GetBonus()
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

        //Bonus
        [HttpPost]
        public async Task<IHttpActionResult> PostBonus(List<Bonu> model)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                foreach (var row in model)
                {
                    Bonu s = _db.Bonus.Where(x => x.PersonalDataId == row.PersonalDataId && x.Year == row.Year).FirstOrDefault();

                    row.Id = s != null ? s.Id : Guid.NewGuid();

                    //row.Id = Guid.NewGuid();
                    row.Tstamp = DateTime.Now;

                    _db.Bonus.AddOrUpdate(row);
                }

                await _db.SaveChangesAsync();

                return Ok();
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        //Bonus/BonusList?id=1
        [HttpGet]
        [Route("BonusList")]
        public async Task<IHttpActionResult> GetBonusList([FromUri] int id)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                return Ok(await _db.V_BonusList.Where(x => x.PersonalDataId == id).OrderByDescending(x => x.Year).AsNoTracking()
                    .ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        //Bonus/Adjustment
        [HttpPost]
        [Route("Adjustment")]
        public async Task<IHttpActionResult> PostBonusAdjustment(BonusAdjustment model)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                //Bonu s = _db.Bonus.Where(x => x.PersonalDataId == row.PersonalDataId && x.Year == row.Year).FirstOrDefault();

                //row.Id = s != null ? s.Id : Guid.NewGuid();

                model.Id = Guid.NewGuid();
                model.Tstamp = DateTime.Now;

                _db.BonusAdjustments.AddOrUpdate(model);

                await _db.SaveChangesAsync();

                return Ok();
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        ////Bonus/BonusReport
        //[HttpPost]
        //[Route("BonusReport")]
        //public async Task<IHttpActionResult> PostBonusReport(V_BonusReport model)
        //{
        //    try
        //    {
        //        _db.Configuration.LazyLoadingEnabled = false;

        //        //Bonu s = _db.Bonus.Where(x => x.PersonalDataId == row.PersonalDataId && x.Year == row.Year).FirstOrDefault();

        //        //row.Id = s != null ? s.Id : Guid.NewGuid();

        //        model.Id = Guid.NewGuid();
        //        model.Tstamp = DateTime.Now;

        //        _db.BonusAdjustments.AddOrUpdate(model);

        //        await _db.SaveChangesAsync();

        //        return Ok();
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(e.Message);
        //    }
        //}

        //Bonus/Upload
        [HttpPost]
        [Route("Upload")]
        public IHttpActionResult UploadBonusFiles()
        {
            try
            {
                var httpRequest = HttpContext.Current.Request;

                if (httpRequest.Files.Count < 1)
                {
                    return BadRequest();//Request.CreateResponse(HttpStatusCode.BadRequest);
                }

                var filePath = "";
                var fileName = "";

                var monthNumber = "";

                if (DateTime.Now.Month.ToString().Length == 1)
                {
                    monthNumber = $"0{DateTime.Now.Month.ToString()}";
                }
                else
                {
                    monthNumber = DateTime.Now.Month.ToString();
                }

                string subPath = String.Concat(monthNumber, DateTime.Now.Year);

                bool exists = Directory.Exists(HttpContext.Current.Server.MapPath($"~/Files/Bonus/{subPath}"));

                if (!exists)
                    Directory.CreateDirectory(HttpContext.Current.Server.MapPath($"~/Files/Bonus/{subPath}"));

                foreach (string file in httpRequest.Files)
                {
                    var postedFile = httpRequest.Files[file];
                    filePath = HttpContext.Current.Server.MapPath($"~/Files/Bonus/{subPath}/" + postedFile.FileName);
                    postedFile.SaveAs(filePath);

                    fileName = postedFile.FileName;

                    //EditExcelFile(filePath);
                    // NOTE: To store in memory use postedFile.InputStream
                }


                //string[] subdirectoryEntries = Directory.GetDirectories(HttpContext.Current.Server.MapPath($"~/Files/"));


                //FileListModel fileList = new FileListModel();

                //foreach (string subdirectory in subdirectoryEntries)
                //{
                //    fileList.FolderName = subdirectory.Replace(Directory.GetDirectories(HttpContext.Current.Server.MapPath($"~/Files/")).ToString(), "");
                //    fileList.FolderPath = subdirectory;

                //    string[] files = Directory.GetFiles(subdirectory);

                //    foreach (var sub in files)
                //    {
                //        fileList.FilePath.Add(sub);
                //        fileList.FileName.Add(sub.Replace(subdirectory, ""));
                //    }
                //}

                //// Loop through them to see if they have any other subdirectories

                //foreach (string subdirectory in subdirectoryEntries)

                //    LoadSubDirs(subdirectory);


                return Json(fileName);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        //public async Task<IHttpActionResult> Upload()
        //{
        //    if (!Request.Content.IsMimeMultipartContent())
        //        throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);

        //    var provider = new MultipartMemoryStreamProvider();
        //    await Request.Content.ReadAsMultipartAsync(provider);
        //    foreach (var file in provider.Contents)
        //    {
        //        var filename = file.Headers.ContentDisposition.FileName.Trim('\"');
        //        var buffer = await file.ReadAsByteArrayAsync();


        //        //Do whatever you want with filename and its binary data.
        //    }

        //    return Ok();
        //}

        internal void EditExcelFile(string filePath)
        {
            // path to your excel file
            string path = filePath;//"C:/****/sample_data.xlsx";
            FileInfo fileInfo = new FileInfo(path);

            ExcelPackage package = new ExcelPackage(fileInfo);
            ExcelWorksheet worksheet = package.Workbook.Worksheets.FirstOrDefault();

            // get number of rows in the sheet
            int rows = worksheet.Dimension.Rows; // 10

            // loop through the worksheet rows
            for (int i = 1; i <= rows; i++)
            {
                // replace occurences
                //if (worksheet.Cells[i, 2].Value.ToString() == "Central")
                worksheet.Cells[i, 2].Value = (double)(worksheet.Cells[i, 2].Value) * 1;
            }

            // save changes
            package.Save();

            //MemoryStream ms = new MemoryStream();
            //using (FileStream fs = File.OpenRead(@"Path\Test.xlsx"))
            //using (ExcelPackage excelPackage = new ExcelPackage(fs))
            //{
            //    ExcelWorkbook excelWorkBook = excelPackage.Workbook;
            //    ExcelWorksheet excelWorksheet = excelWorkBook.Worksheets.First();
            //    excelWorksheet.Cells[1, 1].Value = "Test";
            //    excelWorksheet.Cells[3, 2].Value = "Test2";
            //    excelWorksheet.Cells[3, 3].Value = "Test3";

            //    excelPackage.SaveAs(ms); // This is the important part.
            //}

            //ms.Position = 0;
            //return new FileStreamResult(ms, "application/xlsx")
            //{
            //    FileDownloadName = "Tester.xlsx"
            //};
        }

        internal string ConvertExcelToJson(string filePath)
        {
            var pathToExcel = filePath;
            var sheetName = "sheetOne";

            //This connection string works if you have Office 2007+ installed and your 
            //data is saved in a .xlsx file
            var connectionString = String.Format(@"
            Provider=Microsoft.ACE.OLEDB.12.0;
            Data Source={0};
            Extended Properties=""Excel 12.0 Xml;HDR=YES""
        ", pathToExcel);

            //Creating and opening a data connection to the Excel sheet 
            using (var conn = new OleDbConnection(connectionString))
            {
                conn.Open();

                var cmd = conn.CreateCommand();
                cmd.CommandText = String.Format(
                    @"SELECT * FROM [{0}$]",
                    sheetName
                    );


                using (var rdr = cmd.ExecuteReader())
                {
                    //LINQ query - when executed will create anonymous objects for each row
                    var query =
                        (from DbDataRecord row in rdr
                         select row).Select(x =>
                         {


                             //dynamic item = new ExpandoObject();
                             Dictionary<string, object> item = new Dictionary<string, object>();
                             item.Add(rdr.GetName(0), x[0]);
                             item.Add(rdr.GetName(1), x[1]);
                             item.Add(rdr.GetName(2), x[2]);
                             item.Add(rdr.GetName(3), x[3]);
                             item.Add(rdr.GetName(4), x[4]);
                             return item;

                         });

                    //Generates JSON from the LINQ query
                    var json = JsonConvert.SerializeObject(query);
                    return json;
                }
            }
        }

        // POST: MEW/Bonus/InsertTemData
        [HttpPost]
        [Route("InsertTemData")]
        //public async Task<HttpResponseMessage> InsertTemData(List<TmpBonu> data)
        public IHttpActionResult InsertTemData(List<TmpBonu> data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            string i = "";
            try
            {
                _db.Database.ExecuteSqlCommand("TRUNCATE TABLE TmpBonus");

                //List<TmpBonu> bonus = new List<TmpBonu>();

                foreach (var item in data)
                {
                    i = item.FileNo;

                    item.Id = Guid.NewGuid();
                    item.FileNo = (Convert.ToDouble(Regex.Replace(item.FileNo.Trim(), "[^0-9]", "")) * 1).ToString();
                    //item.FileNo = (Convert.ToDouble(item.FileNo.Trim()) * 1).ToString();
                }

                _db.TmpBonus.AddRange(data);
                _db.SaveChanges();

                //List<V_PersonalQualification> a = await _db.V_PersonalQualification.Where(x => x.Id == data.Id).ToListAsync();

                var validate = _db.spValidateBonus();

                //List<BonusValidation> bonus = await _db.BonusValidations.ToListAsync();

                return Ok();
                //return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                var message = $"Invalid Data found in File No = {i}";
                //HttpError err = new HttpError(message);
                //return Request.CreateErrorResponse(HttpStatusCode.BadRequest, err);
                return Json(BadRequest(message));
            }
        }

        //Bonus/Validation
        [HttpGet]
        [Route("Validation")]
        public IHttpActionResult GetValidationErrors()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                //IEnumerable<BonusValidation> list = await _db.BonusValidations.ToListAsync();

                //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                //using (SqlConnection con = new SqlConnection(constr))
                //{
                //    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Customers"))
                //    {
                //        using (SqlDataAdapter sda = new SqlDataAdapter())
                //        {
                //            cmd.Connection = con;
                //            sda.SelectCommand = cmd;
                //            using (DataTable dt = new DataTable())
                //            {
                //                sda.Fill(dt);
                //using (XLWorkbook wb = new XLWorkbook())
                //                {
                //                    wb.Worksheets.Add((DataTable)list, "ValidationErrors");

                //                    Response.Clear();
                //                    Response.Buffer = true;
                //                    Response.Charset = "";
                //                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                //                    Response.AddHeader("content-disposition", "attachment;filename=SqlExport.xlsx");
                //                    using (MemoryStream MyMemoryStream = new MemoryStream())
                //                    {
                //                        wb.SaveAs(MyMemoryStream);
                //                        MyMemoryStream.WriteTo(Response.OutputStream);
                //                        Response.Flush();
                //                        Response.End();
                //                    }
                //                }
                //            }
                //        }
                //    }
                //}

                //// query data from database   
                //var list = await _db.BonusValidations.ToListAsync();

                //var stream = new MemoryStream();
                ////required using OfficeOpenXml;
                //// If you use EPPlus in a noncommercial context
                //// according to the Polyform Noncommercial license:
                //ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                //using (var package = new ExcelPackage(stream))
                //{
                //    var workSheet = package.Workbook.Worksheets.Add("Sheet1");
                //    workSheet.Cells.LoadFromCollection(list, true);
                //    package.Save();
                //}
                //stream.Position = 0;
                //string excelName = $"ValidationErrors-{DateTime.Now.ToString("yyyyMMddHHmmssfff")}.xlsx";

                //return  File(stream, "application/octet-stream", excelName);
                ////return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", excelName);

                //ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

                ////using (var package = new ExcelPackage(new FileInfo("ValidationErrors.xlsx")))
                ////{
                //ExcelPackage ExcelPkg = new ExcelPackage();
                //ExcelWorksheet wsSheet1 = ExcelPkg.Workbook.Worksheets.Add("Sheet1");
                //using (ExcelRange Rng = wsSheet1.Cells[2, 2, 2, 2])
                //{
                //    Rng.Value = "Welcome to Everyday be coding - tutorials for beginners";
                //    Rng.Style.Font.Size = 16;
                //    Rng.Style.Font.Bold = true;
                //    Rng.Style.Font.Italic = true;
                //}
                //wsSheet1.Protection.IsProtected = false;
                //wsSheet1.Protection.AllowSelectLockedCells = false;
                //ExcelPkg.SaveAs("ValidationErrors.xlsx");
                ////}

                //return Ok();
                List<BonusValidation> BonusValidation = _db.BonusValidations
                    .ToList();

                Thread.Sleep(1000);

                return Json(BonusValidation);
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        //Bonus/UpdateAnnualEvaluationData
        [HttpGet]
        [Route("UpdateAnnualEvaluationData")]
        public async Task<IHttpActionResult> GetUpdateAnnualEvaluationData()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                int year = DateTime.Now.Year;

                var d = _db.spUpdatePersonalAnnualEvaluationData(year, new Guid(User.Identity.GetUserId()));

                return Ok();
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        internal void CreateExcelFile()
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            //using (var package = new ExcelPackage(new FileInfo("ValidationErrors.xlsx")))
            //{
            ExcelPackage ExcelPkg = new ExcelPackage();
            ExcelWorksheet wsSheet1 = ExcelPkg.Workbook.Worksheets.Add("Sheet1");
            using (ExcelRange Rng = wsSheet1.Cells[2, 2, 2, 2])
            {
                Rng.Value = "Welcome to Everyday be coding - tutorials for beginners";
                Rng.Style.Font.Size = 16;
                Rng.Style.Font.Bold = true;
                Rng.Style.Font.Italic = true;
            }
            wsSheet1.Protection.IsProtected = false;
            wsSheet1.Protection.AllowSelectLockedCells = false;
            ExcelPkg.SaveAs("ValidationErrors.xlsx");
            //}
        }

        //Bonus/MasterMappingData
        [HttpGet]
        [Route("MasterMappingData")]
        public async Task<IHttpActionResult> GetMasterMappingData()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;


                var result = new List<MastersData>();

                var source1 = await _db.MasterJobTitles.Where(x => x.Active == true).ToListAsync();

                foreach (var item in source1)
                {
                    result.Add(new MastersData { Id = item.Id, Code = "JobTitle", Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                }

                var source2 = await _db.MasterGrades.Where(x => x.Active == true).ToListAsync();

                foreach (var item in source2)
                {
                    result.Add(new MastersData { Id = item.Id, Code = "Grade", Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                }


                return Json(result.OrderBy(x => x.Code).ThenBy(x => x.Description));
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }


        //Bonus/MasterMappedData
        [HttpGet]
        [Route("MappedData")]
        public async Task<IHttpActionResult> GetMasterMappedData()
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                return Json(await _db.V_BonusAmountMapping.OrderBy(x => x.Amount).ThenBy(x => x.Type).ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }

        //Bonus/RemoveMappedData
        [HttpGet]
        [Route("RemoveMappedData/{id}")]
        public async Task<IHttpActionResult> RemoveMappedData([FromUri] Guid id)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                BonusAmountMapping a = await _db.BonusAmountMappings.FirstOrDefaultAsync(x => x.Id == id);
                if (a != null)
                {
                    _db.BonusAmountMappings.Remove(a);
                }
                await _db.SaveChangesAsync();

                return Json(await _db.V_BonusAmountMapping.OrderBy(x => x.Amount).ThenBy(x => x.Type).ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }

        //Bonus/AddMappedData
        [HttpPost]
        [Route("AddMappedData")]
        public async Task<IHttpActionResult> AddMappedData(List<BonusAmountMapping> model)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                foreach (var item in model)
                {
                    item.Id = Guid.NewGuid();
                    item.Tstamp = DateTime.Now;
                }

                _db.BonusAmountMappings.AddRange(model);

                await _db.SaveChangesAsync();

                return Json(await _db.V_BonusAmountMapping.OrderBy(x => x.Amount).ThenBy(x => x.Type).ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }

        ////Bonus/Adjustment
        //[HttpPost]
        //[Route("Adjustment")]
        //public async Task<IHttpActionResult> Adjustment(PersonalData data)
        //{
        //    try
        //    {

        //        try
        //        {
        //            _db.Configuration.LazyLoadingEnabled = false;

        //            //_db.spSearchPersonalData(
        //            //    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
        //            //    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
        //            //    );

        //            List<PersonalData> q = _db.PersonalDatas.ToList();

        //            if (data.Name != null) q = q.Where(x => x.Name.Contains(data.Name)).ToList();
        //            if (data.FileNo != null) q = q.Where(x => x.FileNo.Contains(data.FileNo)).ToList();
        //            if (data.CivilIdNo != null) q = q.Where(x => x.CivilIdNo.Contains(data.CivilIdNo)).ToList();
        //            //if (data.DateBirth != null) q = q.Where(x => x.DateBirth.Contains(data.DateBirth)).ToList();
        //            //if (data.DateJoin != null) q = q.Where(x => x.DateJoin.Contains(data.DateJoin)).ToList();
        //            //if (data.PhoneNo != null) q = q.Where(x => x.PhoneNo.Contains(data.PhoneNo)).ToList();
        //            //if (data.ArticleNo != null) q = q.Where(x => x.ArticleNo.Contains(data.ArticleNo)).ToList();
        //            //if (data.PermanencyType != null) q = q.Where(x => x.PermanencyType.Contains(data.PermanencyType)).ToList();
        //            //if (data.InsideBuilding != null) q = q.Where(x => x.InsideBuilding.Contains(data.InsideBuilding)).ToList();
        //            //if (data.AdvHousing != null) q = q.Where(x => x.AdvHousing.Contains(data.AdvHousing)).ToList();
        //            //if (data.AdvMobile != null) q = q.Where(x => x.AdvMobile.Contains(data.AdvMobile)).ToList();
        //            //if (data.AdvVehicle != null) q = q.Where(x => x.AdvVehicle.Contains(data.AdvVehicle)).ToList();
        //            //if (data.GenderId != null) q = q.Where(x => x.GenderId.Contains(data.GenderId)).ToList();
        //            //if (data.MasterDepartmentId != null) q = q.Where(x => x.MasterDepartmentId.Contains(data.MasterDepartmentId)).ToList();
        //            //if (data.MasterJobDegreeId != null) q = q.Where(x => x.MasterJobDegreeId.Contains(data.MasterJobDegreeId)).ToList();
        //            //if (data.MasterFunctionalGroupId != null) q = q.Where(x => x.MasterFunctionalGroupId.Contains(data.MasterFunctionalGroupId)).ToList();
        //            //if (data.MasterDesignationId != null) q = q.Where(x => x.MasterDesignationId.Contains(data.MasterDesignationId)).ToList();
        //            //if (data.MasterJobTitleId != null) q = q.Where(x => x.MasterJobTitleId.Contains(data.MasterJobTitleId)).ToList();
        //            //if (data.MasterJobDescriptionId != null) q = q.Where(x => x.MasterJobDescriptionId.Contains(data.MasterJobDescriptionId)).ToList();
        //            //if (data.MasterNationalityId != null) q = q.Where(x => x.MasterNationalityId.Contains(data.MasterNationalityId)).ToList();
        //            //if (data.MasterBudgetTypeId != null) q = q.Where(x => x.MasterBudgetTypeId.Contains(data.MasterBudgetTypeId)).ToList();
        //            //if (data.MasterJobLevelId != null) q = q.Where(x => x.MasterJobLevelId.Contains(data.MasterJobLevelId)).ToList();
        //            //if (data.NextJobLevelId != null) q = q.Where(x => x.NextJobLevelId.Contains(data.NextJobLevelId)).ToList();
        //            //if (data.NextJobLevelDate != null) q = q.Where(x => x.NextJobLevelDate.Contains(data.NextJobLevelDate)).ToList();
        //            //if (data.MasterGradeId != null) q = q.Where(x => x.MasterGradeId.Contains(data.MasterGradeId)).ToList();
        //            //if (data.CurrentGradeDate != null) q = q.Where(x => x.CurrentGradeDate.Contains(data.CurrentGradeDate)).ToList();
        //            //if (data.NextGradeId != null) q = q.Where(x => x.NextGradeId.Contains(data.NextGradeId)).ToList();
        //            //if (data.NextGradeDate != null) q = q.Where(x => x.NextGradeDate.Contains(data.NextGradeDate)).ToList();
        //            //if (data.CurrentNoOfAllowances != null) q = q.Where(x => x.CurrentNoOfAllowances.Contains(data.CurrentNoOfAllowances)).ToList();
        //            //if (data.NextNoOfAllowances != null) q = q.Where(x => x.NextNoOfAllowances.Contains(data.NextNoOfAllowances)).ToList();
        //            //if (data.IsRetired != null) q = q.Where(x => x.IsRetired.Contains(data.IsRetired)).ToList();
        //            //if (data.MasterReasonForRetirementId != null) q = q.Where(x => x.MasterReasonForRetirementId.Contains(data.MasterReasonForRetirementId)).ToList();
        //            //if (data.RevisedBy != null) q = q.Where(x => x.RevisedBy.Contains(data.RevisedBy)).ToList();
        //            //if (data.DateRevised != null) q = q.Where(x => x.DateRevised.Contains(data.DateRevised)).ToList();
        //            //if (data.Notes != null) q = q.Where(x => x.Notes.Contains(data.Notes)).ToList();

        //            int[] ids = q.Select(x => x.Id).ToArray();



        //            List<BonusAdjustment> a = await _db.BonusAdjustments.Where(x => ids.Contains(x.PersonalData.Id))
        //                .ToListAsync();

        //            return Ok(a);
        //        }
        //        catch (Exception ex)
        //        {
        //            return Json(ex);
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(e);
        //    }
        //}

        ////Bonus/Adjustment
        //[HttpPost]
        //[Route("Adjustment/Remove")]
        //public async Task<IHttpActionResult> AdjustmentRemove(BonusAdjustment model)
        //{
        //    try
        //    {
        //        _db.Configuration.LazyLoadingEnabled = false;
        //        _db.Configuration.ProxyCreationEnabled = false;

        //        try
        //        {
        //            var a = _db.BonusAdjustments.Remove(model);

        //            return Json(model);
        //        }
        //        catch (Exception ex)
        //        {
        //            return Json(ex);
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(e);
        //    }
        //}

        ////Bonus/Adjustment
        //[HttpPost]
        //[Route("Adjustment/Save")]
        //public async Task<IHttpActionResult> AdjustmentSave(BonusAdjustment model)
        //{
        //    try
        //    {
        //        _db.Configuration.LazyLoadingEnabled = false;
        //        _db.Configuration.ProxyCreationEnabled = false;

        //        model.Tstamp = DateTime.Now;
        //        model.Id = Guid.NewGuid();


        //        try
        //        {
        //            var b = _db.BonusAdjustments.FirstOrDefault(x => x.Year == model.Year && x.PersonalDataId == model.PersonalDataId);

        //            if (b != null)
        //            {
        //                model.Id = b.Id;
        //            }

        //            _db.BonusAdjustments.AddOrUpdate(model);

        //            await _db.SaveChangesAsync();

        //            return Json(model);
        //        }
        //        catch (Exception ex)
        //        {
        //            return Json(ex);
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        return Json(e);
        //    }
        //}

        //Bonus/EligibilityList?year=2022
        [HttpGet]
        [Route("EligibilityList")]
        public async Task<IHttpActionResult> GetBonusEligibilityList([FromUri] int year)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;

                return Json(await _db.V_BonusEligibleList.Where(x => x.Year == year).AsNoTracking()
                    .ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }


        #region Bonus Reports

        [HttpPost]
        [Route("BonusReport")]
        public async Task<IHttpActionResult> GetCustomReport(BonusReportModel data)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            try
            {
                _db.spSearchBonusData(
                    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo, data.YearFrom, data.YearTo
                    );

                //        var s = _db.V_PersonalDataSearch
                //.Join(
                //    _db.V_BonusList,
                //    p => p.Id,
                //    b => b.PersonalDataId,
                //    (p, b) => new V_BonusReport()

                //).ToList();

                List<V_BonusReport> a = await _db.V_BonusReport.OrderBy(x=>x.FileNo).ThenBy(x => x.Year).ToListAsync();


                return Json(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        #endregion Bonus Reports


    }
}
