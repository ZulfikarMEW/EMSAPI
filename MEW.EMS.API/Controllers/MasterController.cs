using MEW.EMS.API.DAL;
using MEW.EMS.API.PartialClass;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace MEW.EMS.API.Controllers
{
    [Authorize]
    [RoutePrefix("MEW/Master")]
    public class MasterController : ApiController
    {
        private MEW_EMS_Entities _db = new MEW_EMS_Entities();

        [HttpGet]
        public async Task<IHttpActionResult> GetMasterList([FromUri] int opt)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;
                _db.Configuration.ProxyCreationEnabled = false;

                var result = new List<MastersData>();

                //if (id == null)
                //{
                if (opt == 1)
                {
                    var source = await _db.MasterJobDegrees.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 2)
                {
                    var source = await _db.MasterGrades.Where(x => x.Active == true).Include(i => i.MasterJobDegree).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp, FkId1 = item.MasterJobDegreeId, FkDesc1 = item.MasterJobDegree.Description });
                    }
                }
                else if (opt == 3)
                {
                    var source = await _db.MasterQualifications.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 4)
                {
                    var source = await _db.MasterFunctionalGroups.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 5)
                {
                    var source = await _db.MasterBudgetTypes.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 6)
                {
                    var source = await _db.MasterDesignations.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 7)
                {
                    var source = await _db.MasterContractTypes.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 8)
                {
                    var source = await _db.MasterJobLevels.Where(x => x.Active == true).Include(i => i.MasterFunctionalGroup).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp, FkId1 = item.MasterFunctionalGroupId, FkDesc1 = item.MasterFunctionalGroup.Description });
                    }
                }
                else if (opt == 9)
                {
                    var source = await _db.MasterJobDescriptions.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 10)
                {
                    var source = await _db.MasterPrograms.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 11)
                {
                    var source = await _db.MasterSectors.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 12)
                {
                    var source = await _db.MasterDepartments.Where(x => x.Active == true).Include(i => i.MasterProgram).Include(i => i.MasterSector).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp, FkId1 = item.MasterSectorId, FkDesc1 = item.MasterSector.Description, FkId2 = item.MasterProgramId, FkDesc2 = item.MasterProgram.Description });
                    }
                }
                else if (opt == 13)
                {
                    var source = await _db.MasterAnnualEvaluations.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp, FkId1 = item.StartValue, FkId2 = item.EndValue });
                    }
                }
                else if (opt == 14)
                {
                    var source = await _db.MasterVacationTypes.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 15)
                {
                    var source = await _db.MasterAllowanceTypes.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 16)
                {
                    var source = await _db.MasterNationalities.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 17)
                {
                    var source = await _db.MasterReasonForRetirements.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 18)
                {
                    var source = await _db.MasterWorkPlaces.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 19)
                {
                    var source = await _db.MasterSocialStatus.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 20)
                {
                    var source = await _db.MasterJobTitles.Where(x => x.Active == true).Include(i => i.MasterFunctionalGroup).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp, FkId1 = item.MasterFunctionalGroupId, FkDesc1 = item.MasterFunctionalGroup.Description });
                    }
                }
                else if (opt == 21)
                {
                    var source = await _db.MasterReasonForPromotions.Where(x => x.Active == true).ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.Code, Description = item.Description, Active = item.Active, Tstamp = item.Tstamp });
                    }
                }
                else if (opt == 22)
                {
                    var source = await _db.Genders.ToListAsync();

                    foreach (var item in source)
                    {
                        result.Add(new MastersData { Id = item.Id, Code = item.ArabicDescription, Description = item.Description });
                    }
                }
                return Ok(result.ToList().OrderBy(x => x.Description));
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }

        [HttpPost]
        public async Task<IHttpActionResult> PostMaster([FromUri] int opt, MastersData model)
        {
            try
            {
                _db.Configuration.LazyLoadingEnabled = false;
                _db.Configuration.ProxyCreationEnabled = false;

                var result = new List<MastersData>();

                if (opt == 1)
                {
                    var a = new MasterJobDegree()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterJobDegrees.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 2)
                {
                    var a = new MasterGrade()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        MasterJobDegreeId = (int)model.FkId1,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterGrades.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.FkId1 = a.MasterJobDegreeId;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 3)
                {
                    var a = new MasterQualification()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterQualifications.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 4)
                {
                    var a = new MasterFunctionalGroup()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterFunctionalGroups.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 5)
                {
                    var a = new MasterBudgetType()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterBudgetTypes.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 6)
                {
                    var a = new MasterDesignation()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterDesignations.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 7)
                {
                    var a = new MasterContractType()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterContractTypes.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 8)
                {
                    var a = new MasterJobLevel()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        MasterFunctionalGroupId = (int)model.FkId1,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterJobLevels.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.FkId1 = a.MasterFunctionalGroupId;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 9)
                {
                    var a = new MasterJobDescription()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterJobDescriptions.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 10)
                {
                    var a = new MasterProgram()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterPrograms.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 11)
                {
                    var a = new MasterSector()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterSectors.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 12)
                {
                    var a = new MasterDepartment()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        MasterSectorId = (int)model.FkId1,
                        MasterProgramId = (int)model.FkId2,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterDepartments.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.FkId1 = a.MasterSectorId;
                    model.FkId2 = a.MasterProgramId;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 13)
                {
                    var a = new MasterAnnualEvaluation()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        StartValue = (int)model.FkId1,
                        EndValue = (int)model.FkId2,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterAnnualEvaluations.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.FkId1 = a.StartValue;
                    model.FkId2 = a.EndValue;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 14)
                {
                    var a = new MasterVacationType()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterVacationTypes.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 15)
                {
                    var a = new MasterAllowanceType()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterAllowanceTypes.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 16)
                {
                    var a = new MasterNationality()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterNationalities.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 17)
                {
                    var a = new MasterReasonForRetirement()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterReasonForRetirements.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 18)
                {
                    var a = new MasterWorkPlace()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterWorkPlaces.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 19)
                {
                    var a = new MasterSocialStatu()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterSocialStatus.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 20)
                {
                    var a = new MasterJobTitle()
                    {

                        Active = model.Active,
                        Id = model.Id,
                        MasterFunctionalGroupId = (int)model.FkId1,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterJobTitles.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.FkId1 = a.MasterFunctionalGroupId;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 21)
                {
                    var a = new MasterReasonForPromotion()
                    {
                        Active = model.Active,
                        Id = model.Id,
                        Code = model.Code,
                        Description = model.Description,
                        Tstamp = DateTime.Now,
                    };

                    _db.MasterReasonForPromotions.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                    model.Tstamp = a.Tstamp;
                }
                else if (opt == 22)
                {
                    var a = new Gender()
                    {
                        Id = model.Id,
                        ArabicDescription = model.Code,
                        Description = model.Description,
                    };

                    _db.Genders.AddOrUpdate(a);
                    await _db.SaveChangesAsync();

                    model.Id = a.Id;
                }



                return Json(model);
            }
            catch (Exception e)
            {
                return Json(e);
            }
        }
    }
}