using MEW.EMS.API.DAL;
using MEW.EMS.API.PartialClass;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;

namespace MEW.EMS.API.Controllers
{
    [Authorize]
    [RoutePrefix("MEW/Personal")]
    public class PersonalController : ApiController
    {
        private MEW_EMS_Entities _db = new MEW_EMS_Entities();

        #region PersonalData
        [HttpPost]
        public async Task<IHttpActionResult> SearchPersonalData(PersonalData data)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            try
            {

                _db.spSearchPersonalData(
                    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                    );

                List<V_PersonalDataSearch> a = await _db.V_PersonalDataSearch.ToListAsync();

                //var a = _db.spSearchPersonalDataId(
                //    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                //    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                //    );

                //int?[] c = a.ToArray();

                //List<PersonalData> b = new List<PersonalData>();

                //b.AddRange(a);


                //List<PersonalData> b = await _db.PersonalDatas.Where(x => a.Contains(x.Id))
                //    .Include(x => x.MasterBudgetType)
                //    .Include(x => x.MasterDepartment)
                //    .Include(x => x.MasterDesignation)
                //    .Include(x => x.MasterFunctionalGroup)
                //    .Include(x => x.MasterGrade)
                //    .Include(x => x.MasterJobDegree)
                //    .Include(x => x.MasterJobDescription)
                //    .Include(x => x.MasterJobLevel)
                //    .Include(x => x.MasterJobTitle)
                //    .Include(x => x.MasterNationality)
                //    .ToListAsync();

                //return Ok(b);
                return Json(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Save
        [HttpPost]
        [Route("Save")]
        public async Task<IHttpActionResult> SavePersonalData(PersonalData data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                int dId = 0;

                PersonalData s = _db.PersonalDatas.FirstOrDefault(x => x.Id == data.Id);

                if (s != null)
                {
                    dId = s.MasterDepartmentId;

                    if (data.MasterDepartmentId == 0 && data.MasterDepartmentId != dId)
                    {
                        PersonalInternalTransfer t = new PersonalInternalTransfer()
                        {
                            ToDepartmentId = data.MasterDepartmentId,
                            Id = Guid.NewGuid(),
                            DateTransfered = DateTime.Now,
                            EnteredBy = new Guid(User.Identity.GetUserId()),
                            FromDepartmentId = dId,
                            PersonalDataId = data.Id,
                            Tstamp = DateTime.Now
                        };

                        _db.PersonalInternalTransfers.Add(t);
                    };
                }

                _db.PersonalDatas.AddOrUpdate(data);
                await _db.SaveChangesAsync();

                List<V_PersonalDataSearch> a = await _db.V_PersonalDataSearch.Where(x => x.Id == data.Id).ToListAsync();

                return Ok(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        #endregion PersonalData

        #region Personal Qualification

        [HttpPost]
        [Route("Qualification")]
        public async Task<IHttpActionResult> GetPersonalQualification(PersonalData data)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            try
            {

                _db.spSearchPersonalData(
                    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                    );

                List<V_PersonalQualification> a = await _db.V_PersonalQualification.ToListAsync();

                return Json(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Qualification/Save
        [HttpPost]
        [Route("Qualification/Save")]
        public async Task<IHttpActionResult> SavePersonalQualification(PersonalQualification data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                data.Tstamp = DateTime.Now;
                data.EnteredBy = new Guid(User.Identity.GetUserId());
                data.Id = Guid.NewGuid();

                _db.PersonalQualifications.AddOrUpdate(data);
                await _db.SaveChangesAsync();

                List<V_PersonalQualification> a = await _db.V_PersonalQualification.Where(x => x.Id == data.Id).ToListAsync();

                return Ok(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Qualification/Remove
        [HttpPost]
        [Route("Qualification/Remove")]
        public async Task<IHttpActionResult> RemovePersonalQualification(V_PersonalQualification data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                var r = await _db.PersonalQualifications.FindAsync(data.Id);

                _db.PersonalQualifications.Remove(r);
                await _db.SaveChangesAsync();

                //List<V_PersonalQualification> a = await _db.V_PersonalQualification.Where(x => x.Id == data.Id).ToListAsync();

                return Ok();
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        #endregion Personal Qualification

        #region Personal Experience

        [HttpPost]
        [Route("Experience")]
        public async Task<IHttpActionResult> GetPersonalExperience(PersonalData data)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            try
            {

                _db.spSearchPersonalData(
                    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                    );

                List<V_PersonalPriorExperience> a = await _db.V_PersonalPriorExperience.ToListAsync();

                return Json(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Experience/Save
        [HttpPost]
        [Route("Experience/Save")]
        public async Task<IHttpActionResult> SavePersonalExperience(PersonalPriorExperience data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                data.Tstamp = DateTime.Now;
                data.EnteredBy = new Guid(User.Identity.GetUserId());
                data.Id = Guid.NewGuid();

                _db.PersonalPriorExperiences.AddOrUpdate(data);
                await _db.SaveChangesAsync();

                List<V_PersonalPriorExperience> a = await _db.V_PersonalPriorExperience.Where(x => x.Id == data.Id).ToListAsync();

                return Ok(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Experience/Remove
        [HttpPost]
        [Route("Experience/Remove")]
        public async Task<IHttpActionResult> RemovePersonalExperience(V_PersonalPriorExperience data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                var r = await _db.PersonalPriorExperiences.FindAsync(data.Id);

                _db.PersonalPriorExperiences.Remove(r);
                await _db.SaveChangesAsync();

                //List<V_PersonalQualification> a = await _db.V_PersonalQualification.Where(x => x.Id == data.Id).ToListAsync();

                return Ok();
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        #endregion Personal Experience

        #region Personal Promotion

        [HttpPost]
        [Route("Promotion")]
        public async Task<IHttpActionResult> GetPersonalPromotion(PersonalData data)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            try
            {

                _db.spSearchPersonalData(
                    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                    );

                List<V_PersonalPromotion> a = await _db.V_PersonalPromotion.ToListAsync();

                return Json(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Promotion/Save
        [HttpPost]
        [Route("Promotion/Save")]
        public async Task<IHttpActionResult> SavePersonalPromotion(PersonalPromotion data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                data.Tstamp = DateTime.Now;
                data.EnteredBy = new Guid(User.Identity.GetUserId());
                data.Id = Guid.NewGuid();

                _db.PersonalPromotions.AddOrUpdate(data);
                await _db.SaveChangesAsync();

                List<V_PersonalPromotion> a = await _db.V_PersonalPromotion.Where(x => x.Id == data.Id).ToListAsync();

                return Ok(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Promotion/Remove
        [HttpPost]
        [Route("Promotion/Remove")]
        public async Task<IHttpActionResult> RemovePersonalPromotion(V_PersonalPromotion data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                var r = await _db.PersonalPromotions.FindAsync(data.Id);

                _db.PersonalPromotions.Remove(r);
                await _db.SaveChangesAsync();

                //List<V_PersonalQualification> a = await _db.V_PersonalQualification.Where(x => x.Id == data.Id).ToListAsync();

                return Ok();
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        #endregion Personal Promotion

        #region Personal Change Job Title

        [HttpPost]
        [Route("MasterJobTitle")]
        public async Task<IHttpActionResult> GetMasterJobTitles(PersonalData data)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;
                _db.Configuration.ProxyCreationEnabled = false;

                var source = await _db.MasterJobTitles
                    .Where(x => x.Active == true && x.MasterFunctionalGroupId == data.MasterFunctionalGroupId)
                    .Include(i => i.MasterFunctionalGroup)
                    .ToListAsync();

                var result = new List<MastersData>();

                foreach (var item in source)
                {
                    result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp, FkId1 = item.MasterFunctionalGroupId, FkDesc1 = item.MasterFunctionalGroup.Description });
                }

                return Ok(result.ToList().OrderBy(x => x.Description));
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }

        [HttpPost]
        [Route("JobTitle")]
        public async Task<IHttpActionResult> GetPersonalChangeJobTitle(PersonalData data)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            try
            {

                _db.spSearchPersonalData(
                    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                    );

                List<V_PersonalChangeJobTitle> a = await _db.V_PersonalChangeJobTitle.ToListAsync();

                return Json(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/JobTitle/Save
        [HttpPost]
        [Route("JobTitle/Save")]
        public async Task<IHttpActionResult> SavePersonalChangeJobTitle(PersonalChangeJobTitle data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                data.Tstamp = DateTime.Now;
                data.EnteredBy = new Guid(User.Identity.GetUserId());
                data.Id = Guid.NewGuid();

                _db.PersonalChangeJobTitles.AddOrUpdate(data);
                await _db.SaveChangesAsync();

                List<V_PersonalChangeJobTitle> a = await _db.V_PersonalChangeJobTitle.Where(x => x.Id == data.Id).ToListAsync();

                return Ok(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/JobTitle/Remove
        [HttpPost]
        [Route("JobTitle/Remove")]
        public async Task<IHttpActionResult> RemovePersonalChangeJobTitle(V_PersonalChangeJobTitle data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                var r = await _db.PersonalChangeJobTitles.FindAsync(data.Id);

                _db.PersonalChangeJobTitles.Remove(r);
                await _db.SaveChangesAsync();

                //List<V_PersonalQualification> a = await _db.V_PersonalQualification.Where(x => x.Id == data.Id).ToListAsync();

                return Ok();
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        #endregion Personal Change Job Title

        #region Personal Evauation

        [HttpPost]
        [Route("Evaluation")]
        public async Task<IHttpActionResult> GetPersonalEvaluation(PersonalData data)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            try
            {

                _db.spSearchPersonalData(
                    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                    );

                List<V_PersonalAnnualEvaluation> a = await _db.V_PersonalAnnualEvaluation.OrderByDescending(x => x.Year).ToListAsync();

                return Json(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Evauation/Save
        [HttpPost]
        [Route("Evaluation/Save")]
        public async Task<IHttpActionResult> SavePersonalEvaluation(PersonalAnnualEvaluation data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                data.Tstamp = DateTime.Now;
                data.EnteredBy = new Guid(User.Identity.GetUserId());


                PersonalAnnualEvaluation s = _db.PersonalAnnualEvaluations.Where(x => x.PersonalDataId == data.PersonalDataId && x.Year == data.Year).FirstOrDefault();

                data.Id = s != null ? s.Id : Guid.NewGuid();

                _db.PersonalAnnualEvaluations.AddOrUpdate(data);
                await _db.SaveChangesAsync();

                List<V_PersonalAnnualEvaluation> a = await _db.V_PersonalAnnualEvaluation.Where(x => x.Id == data.Id).ToListAsync();

                return Ok(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        // POST: MEW/Personal/Evauation/Remove
        [HttpPost]
        [Route("Evaluation/Remove")]
        public async Task<IHttpActionResult> RemovePersonalEvaluation(V_PersonalAnnualEvaluation data)
        {
            _db.Configuration.LazyLoadingEnabled = false;

            try
            {
                var r = await _db.PersonalAnnualEvaluations.FindAsync(data.Id);

                _db.PersonalAnnualEvaluations.Remove(r);
                await _db.SaveChangesAsync();

                //List<V_PersonalQualification> a = await _db.V_PersonalQualification.Where(x => x.Id == data.Id).ToListAsync();

                return Ok();
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        #endregion Personal Evauation


        #region Personal Reports

        [HttpPost]
        [Route("CustomReport")]
        public async Task<IHttpActionResult> GetCustomReport(PersonalData data)
        {
            _db.Configuration.LazyLoadingEnabled = false;
            _db.Configuration.ProxyCreationEnabled = false;

            try
            {
                _db.spSearchPersonalData(
                    data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                    , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                    );

                List<V_PersonalDataSearch> a = await _db.V_PersonalDataSearch.OrderByDescending(x => x.FileNo).ToListAsync();

                //_db.spSearchPersonalData(
                //     data.ArticleNo, data.GenderId, data.MasterDepartmentId, data.MasterJobDegreeId, data.MasterFunctionalGroupId, data.MasterDesignationId, data.MasterJobTitleId, data.MasterJobDescriptionId, data.MasterNationalityId, data.MasterBudgetTypeId, data.MasterJobLevelId, data.NextJobLevelId
                //     , data.MasterGradeId, data.NextGradeId, data.MasterReasonForRetirementId, data.DateBirth, data.DateJoin, data.FileNo, data.Name, data.Notes, data.PhoneNo, data.CivilIdNo
                //     );


                //List<ColumnList> list = reportdata.columnLists.OrderBy(x => x.currentTimeStamp).ToList();

                //string sql = "";
                //sql += "Select ";

                //foreach (var col in list)
                //{
                //    sql += col.columnName + ",";
                //}

                //sql = sql.Remove(sql.Length - 1, 1);

                //sql += " From V_PersonalDataSearch";

                //var a = _db.V_PersonalDataSearch
                //        .SqlQuery(sql)
                //        .ToList<object>();

                //List<V_PersonalDataSearch> a = await _db.V_PersonalDataSearch.OrderByDescending(x => x.FileNo).ToListAsync();

                return Json(a);
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
        }

        #endregion Personal Reports
    }
}
