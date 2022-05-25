using MEW.EMS.API.DAL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;

namespace MEW.EMS.API.Controllers
{
    [Authorize]
    // [RoutePrefix("MEW/Company")]
    public class SystemFunctionController : ApiController
    {
        private MEW_EMS_Entities _db = new MEW_EMS_Entities();

        // internal static int GetEnterpriseId(Guid id)
        // {
        //     MEW_EMS_Entities _db = new MEW_EMS_Entities();
        //
        //     var r = _db.SystemUsers.FirstOrDefault(x => x.Id == id);
        //
        //     return r.EnterpriseId;
        // }

        // internal static int[] GetUserCompanyIdList(Guid id)
        // {
        //     MEW_EMS_Entities _db = new MEW_EMS_Entities();
        //
        //     var r = _db.SystemUsers.FirstOrDefault(x => x.Id == id);
        //
        //
        //     int[] userCompanies = (from u in _db.UserCompanies where u.Company.EnterpriseId == r.EnterpriseId && u.SystemUserId == id select u.CompanyId).ToArray();
        //
        //     return userCompanies;
        // }
        internal static bool isSuperUser(Guid id)
        {
            MEW_EMS_Entities _db = new MEW_EMS_Entities();

            var r = _db.SystemUsers.FirstOrDefault(x => x.Id == id);

            return r.IsSuperUser;
        }

        [HttpGet]
        [Route("MEW/SystemFunction/Gender")]
        public async Task<IHttpActionResult> GetGender()
        {
            _db.Configuration.LazyLoadingEnabled = false;
            try
            {
                return Json(await _db.SystemGenders.ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        [HttpGet]
        [Route("MEW/SystemFunction/Language")]
        public async Task<IHttpActionResult> GetLanguage()
        {
            _db.Configuration.LazyLoadingEnabled = false;
            try
            {
                return Json(await _db.SystemLanguages.ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        [HttpGet]
        [Route("MEW/SystemFunction/SystemSettings")]
        public async Task<IHttpActionResult> GetSettings()
        {
            _db.Configuration.LazyLoadingEnabled = false;
            try
            {
                return Json(await _db.SystemConfigurations.AsNoTracking().ToListAsync());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        [HttpGet]
        [Route("MEW/SystemFunction/GetColumnNames")]
        public IHttpActionResult GetColumnNames([FromUri] string tblName)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            try
            {
                return Json(_db.ColumnSelectors.Where(x => x.Active == true && x.TableName == tblName).AsNoTracking().OrderBy(x => x.ColumnName).ToList());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        [HttpGet]
        [Route("MEW/SystemFunction/GetSelection")]
        public IHttpActionResult GetSelection()
        {
            _db.Configuration.LazyLoadingEnabled = false;
            try
            {
                return Json(_db.CustomReportSelections.Where(x => x.Active == true && x.ReportSection == "Personal").AsNoTracking().OrderByDescending(x => x.Tstamp).ToList());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        [HttpPost]
        [Route("MEW/SystemFunction/SaveSelection")]
        public async Task<IHttpActionResult> PostSaveSelection(CustomReportSelection model)
        {
            try
            {
                if (model.Id == Guid.Empty)
                {
                    model.Id = Guid.NewGuid();
                }

                model.Tstamp = DateTime.Now;
                model.Active = true;

                _db.CustomReportSelections.AddOrUpdate(model);
                await _db.SaveChangesAsync();

                return Json(model);
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }

        [HttpPost]
        [Route("MEW/SystemFunction/DeleteSelection")]
        public async Task<IHttpActionResult> PostDeleteSelection(CustomReportSelection model)
        {
            try
            {

                var s = await _db.CustomReportSelections.FirstOrDefaultAsync(x => x.Id == model.Id);

                if (s == null) { return BadRequest(); }

                s.Active = false;

                _db.CustomReportSelections.AddOrUpdate(s);
                await _db.SaveChangesAsync();

                return Json(s);
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }


        [HttpGet]
        [Route("MEW/SystemFunction/GetBonusSelection")]
        public IHttpActionResult GetBonusSelection()
        {
            _db.Configuration.LazyLoadingEnabled = false;
            try
            {
                return Json(_db.CustomReportSelections.Where(x => x.Active == true && x.ReportSection == "Bonus").AsNoTracking().OrderByDescending(x => x.Tstamp).ToList());
            }
            catch (Exception e)
            {
                return Json(e.Message);
            }
        }

        [HttpPost]
        [Route("MEW/SystemFunction/SaveBonusSelection")]
        public async Task<IHttpActionResult> PostSaveBonusSelection(CustomReportSelection model)
        {
            try
            {
                if (model.Id == Guid.Empty)
                {
                    model.Id = Guid.NewGuid();
                }

                model.Tstamp = DateTime.Now;
                model.Active = true;

                _db.CustomReportSelections.AddOrUpdate(model);
                await _db.SaveChangesAsync();

                return Json(model);
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }


        // [HttpPost]
        // [Route("MEW/Suspend")]
        // public async Task<IHttpActionResult> PostSuspect(Suspend suspend)
        // {
        //     try
        //     {
        //         if (suspend.Id == Guid.Empty)
        //         {
        //             suspend.Id = Guid.NewGuid();
        //         }
        //
        //         if (suspend.Status == "U")
        //         {
        //             suspend.Reason = null;
        //         }
        //
        //         Guid userid = new Guid(User.Identity.GetUserId());
        //
        //         suspend.SystemUserId = userid;
        //         suspend.Tstamp = DateTime.Now;
        //         _db.Suspends.Add(suspend);
        //         await _db.SaveChangesAsync();
        //         return Json(suspend);
        //     }
        //     catch (Exception e)
        //     {
        //         return BadRequest(e.InnerException.InnerException.Message.ToString());
        //     }
        // }

        [HttpPost]
        [Route("MEW/ExecSql")]
        public async Task<IHttpActionResult> PostSqlFile([FromBody] string query)
        {
            // if (!_db.CableSweepDebug.Any(rec => /* CHECK TO SEE IF SQL ALREADY RUN */ ))
            // {
            try
            {
                // if (!Request.Content.IsMimeMultipartContent())
                //     throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
                //
                // var provider = new MultipartMemoryStreamProvider();
                // await Request.Content.ReadAsMultipartAsync(provider);
                // foreach (var file in provider.Contents)
                // {
                //     var filename = file.Headers.ContentDisposition.FileName.Trim('\"');
                //     var buffer = await file.ReadAsByteArrayAsync();
                //     //Do whatever you want with filename and its binary data.
                // }

                // var sql = File.ReadAllText("SqlScript.sql");

                // var sql = File.ReadAllText(file);
                // return Ok(_db.Database.ExecuteSqlCommand(sql));


                var result = _db.Database.SqlQuery<IEnumerable<Tuple<int, string>>>(query);

                // List<string> result = await _db.Database.SqlQuery<string>(query)
                //     .ToListAsync();
                return Ok(result);
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
            // }
        }

        // [HttpGet]
        // [Route("MEW/Currency")]
        // public async Task<IHttpActionResult> GetCurrency()
        // {
        //     try
        //     {
        //         int entId = SystemFunctionController.GetEnterpriseId(new Guid(User.Identity.GetUserId()));
        //
        //         _db.Configuration.LazyLoadingEnabled = false;
        //         List<Currency> currencies = await _db.Currencies.Where(x => x.EnterpriseId == entId).ToListAsync();
        //
        //         return Ok(currencies);
        //     }
        //     catch (Exception e)
        //     {
        //         return BadRequest(e.InnerException.InnerException.Message);
        //     }
        // }

        // [HttpGet]
        // [Route("MEW/SystemDocumentType")]
        // public async Task<IHttpActionResult> GetSystemDocumentType()
        // {
        //     try
        //     {
        //         int entId = GetEnterpriseId(new Guid(User.Identity.GetUserId()));
        //
        //         _db.Configuration.LazyLoadingEnabled = false;
        //         List<SystemDocumentType> data = await _db.SystemDocumentTypes.Where(x => x.EnterpriseId == entId).ToListAsync();
        //
        //         return Ok(data);
        //     }
        //     catch (Exception e)
        //     {
        //         return BadRequest(e.InnerException.InnerException.Message);
        //     }
        // }

    }
}
