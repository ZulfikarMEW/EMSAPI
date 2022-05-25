using ideaXGem.DAL;
using ideaXGem.PartialClass;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;

namespace ideaXGem.Controllers
{
    public class SaleController : ApiController
    {
        private ideaXGemEntities _context = new ideaXGemEntities();

        [HttpGet]
        public async Task<IHttpActionResult> GetSales()
        {
            try
            {
                var user = _context.AspNetUsers.FirstOrDefault(x => x.UserName == User.Identity.Name);
                var userID = user.Id;

                List<V_Sale> sales = await _context.V_Sale.Where(a => a.AspNetUserId == userID)
                    .OrderByDescending(o => o.SellingPrice).ToListAsync();
                return Json(sales);
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }
        [HttpPost]
        public async Task<IHttpActionResult> PostSales(SaleDetails sale)
        {
            try
            {
                decimal? tempAmount = 0;
                decimal? tempPrice = 0;

                var user = _context.AspNetUsers.FirstOrDefault(x => x.UserName == User.Identity.Name);
                var userID = user.Id;

                if (sale.SaleHeader == null && sale.SaleProducts == null)
                {
                    return BadRequest();
                }

                var newSaleId = Guid.NewGuid();

                Sale s = sale.SaleHeader;

                s.Id = newSaleId;
                //s.CustomerId = 1;
                s.AspNetUserId = userID;
                s.TimeSold = DateTime.Now;
                s.TimePaid = DateTime.Now;
                s.Tstamp = DateTime.Now;

                _context.Sales.Add(s);

                //SaleProduct p = new SaleProduct();

                foreach (SaleProduct item in sale.SaleProducts)
                {
                    item.Id = Guid.NewGuid();
                    item.SaleId = newSaleId;
                    item.Tstamp = DateTime.Now;
                    _context.SaleProducts.Add(item);

                    tempPrice += item.SellingPrice;
                }


                if (sale.SalePaymentTypes != null)
                {
                    foreach (SalePaymentType item in sale.SalePaymentTypes)
                    {
                        tempAmount += item.Amount;

                        item.Balance = tempPrice < tempAmount ? tempAmount - tempPrice : 0;

                        item.Id = Guid.NewGuid();

                        item.SaleId = newSaleId;
                        item.Tstamp = DateTime.Now;
                        _context.SalePaymentTypes.Add(item);
                    }
                }

                if (tempAmount < tempPrice)
                {
                    return Conflict();
                }

                await _context.SaveChangesAsync();

                return Ok(sale);
            }
            catch (Exception e)
            {
                return BadRequest(e.InnerException.InnerException.Message.ToString());
            }
        }

    }
}
