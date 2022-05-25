using ideaXGem.DAL;
using ideaXGem.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Hosting;
using System.Web.Http;

namespace ideaXGem.Controllers
{
    public class ImageController : ApiController
    {
        private ideaXGemEntities _context = new ideaXGemEntities();

        [HttpPost]
        [AllowAnonymous]
        [Route("api/folder/image/old")]
        public IHttpActionResult ImageUploadFolder()
        {
            var httpContext = HttpContext.Current;
            if (httpContext.Request.Files.Count > 0)
            {
                for (int i = 0; i < httpContext.Request.Files.Count; i++)
                {
                    HttpPostedFile httpPostedFile = httpContext.Request.Files[i];
                    if (httpPostedFile != null)
                    {
                        string fileName = System.IO.Path.GetFileName(httpPostedFile.FileName);

                        //Set the Image File Path.
                        string filePath = "/Images/" + fileName;

                        //Save the Image File in Folder.
                        httpPostedFile.SaveAs(HttpContext.Current.Server.MapPath(filePath));

                        //Insert the Image File details in Table.
                        ProductImage folder = new ProductImage()
                        {
                            ProductId = 2,
                            Name = fileName,
                            ImagePath = filePath
                        };
                        _context.ProductImages.Add(folder);
                        _context.SaveChanges();
                    }
                }
            }
            return Ok();
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("api/folder")]
        public HttpResponseMessage Get(int id)
        {
            var result = new HttpResponseMessage(HttpStatusCode.OK);
            String filePath = HostingEnvironment.MapPath("/Images");
            FileStream fileStream = new FileStream(filePath, FileMode.Open);
            Image image = Image.FromStream(fileStream);
            MemoryStream memoryStream = new MemoryStream();
            image.Save(memoryStream, ImageFormat.Jpeg);
            result.Content = new ByteArrayContent(memoryStream.ToArray());
            result.Content.Headers.ContentType = new MediaTypeHeaderValue("image/jpeg");

            return result;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("api/second")]
        public IHttpActionResult GetImg(int id)
        {
            _context.Configuration.LazyLoadingEnabled = false;
            var productImage = _context.ProductImages.Where(x => x.ProductId == id);
            return Json(productImage.ToList());
        }


        [HttpGet]
        [Route("api/foto")]
        public HttpResponseMessage Get(string id)
        {
            var result = new HttpResponseMessage(HttpStatusCode.OK);
            String[] strArray = id.Split(',');

            var ms = new MemoryStream();
            for (int i = 0; i < strArray.Length; i++)
            {
                String filePath = HostingEnvironment.MapPath("~/Images/" + strArray[i] + (i + 1) + ".jpg");

                byte[] bytes = File.ReadAllBytes(filePath);
                byte[] length = BitConverter.GetBytes(bytes.Length);

                // Write length followed by file bytes to stream
                ms.Write(length, 0, 4);
                ms.Write(bytes, 0, bytes.Length);
            }

            result.Content = new StreamContent(ms);

            return result;
        }

        [HttpGet]
        [Route("api/img/get")]
        public HttpResponseMessage ImageGet(int id)
        {
            var response = Request.CreateResponse(HttpStatusCode.OK);
            var path = "~/Images/" + id;
            path = HostingEnvironment.MapPath(path);
            var ext = Path.GetExtension(path);

            var contents = File.ReadAllBytes(path);

            MemoryStream ms = new MemoryStream(contents);
            response.Content = new StreamContent(ms);
            response.Content.Headers.ContentType = new MediaTypeHeaderValue("Image/" + ext);

            return response;
        }


        [HttpPost]
        [AllowAnonymous]
        [Route("api/Upload")]
        public HttpResponseMessage SaveFile()
        {
            bool isDeleted = false;
            //Create HTTP Response.
            // HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);
            var httpContext = HttpContext.Current;
            // httpContext.Request.GetBufferlessInputStream(true);

            if (httpContext.Request.Files.Count > 0)
            {
                for (int i = 0; i < httpContext.Request.Files.Count; i++)
                {
                    HttpPostedFile httpPostedFile = httpContext.Request.Files[i];
                    if (httpPostedFile != null)
                    {
                        byte[] bytes;
                        using (BinaryReader br = new BinaryReader(httpPostedFile.InputStream))
                        {
                            bytes = br.ReadBytes(httpPostedFile.ContentLength);
                        }

                        //Insert the File to Database Table.
                        ProductImage files = new ProductImage()
                        {
                            ProductId = 2,
                            Name = Path.GetFileName(httpPostedFile.FileName),
                            //ContentType = httpPostedFile.ContentType,
                            //Image = bytes,
                            //Tstamp = DateTime.Now
                        };

                        if (files.ProductId == 2 && !isDeleted)
                        {
                            var items = _context.ProductImages.Where(x => x.ProductId == 2);
                            _context.ProductImages.RemoveRange(items);
                            _context.SaveChanges();

                            isDeleted = true;
                        }

                        _context.ProductImages.AddOrUpdate(files);
                        _context.SaveChanges();
                    }
                }
            }
            return Request.CreateResponse(HttpStatusCode.Created);
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("api/FileAPI/GetFiles")]
        public HttpResponseMessage[] GetFiles(int productId)
        {

            //Fetch the File data from Database.
            List<ProductImage> file = _context.ProductImages.Where(p => p.ProductId == productId).ToList();

            //Create HTTP Response.
            HttpResponseMessage[] response = new[] { Request.CreateResponse(HttpStatusCode.OK) };


            List<ProImage> productImages = new List<ProImage>();

            int i = 0;

            if (file.Count > 0)
            {


                foreach (var item in file)
                {

                    //Set the Response Content.
                    //     response[i].Content = new ByteArrayContent(item.Image);

                    //Set the Response Content Length.
                    //  response[i].Content.Headers.ContentLength = item.Image.LongLength;

                    //Set the Content Disposition Header Value and FileName.
                    //response.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");
                    //response.Content.Headers.ContentDisposition.FileName = item.Name;

                    //Set the File Content Type.
                    // response[i].Content.Headers.ContentType = new MediaTypeHeaderValue(item.ContentType);

                    i++;
                }


            }
            return response;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("api/GetImages")]
        public HttpResponseMessage GetImages(int productId)
        {

            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);

            // IEnumerable<ProductImage> files = _context.ProductImages.Where(p => p.ProductId == productId);
            List<ProductImage> file = _context.ProductImages.Where(p => p.ProductId == productId).ToList();

            ProImage temp = new ProImage();

            List<ProImage> tt = new List<ProImage>();

            foreach (var item in file)
            {
                //  response.Content = new ByteArrayContent(item.Image);
                // response.Content.Headers.ContentLength = item.Image.LongLength;

                response.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");
                response.Content.Headers.ContentDisposition.FileName = item.Name;

                //response.Content.Headers.ContentType = new MediaTypeHeaderValue(item.ContentType);

                temp.Name = item.Name;
                // temp.ContentType = item.ContentType;
                // temp.Image = item.Image;

                tt.Add(temp);
            }

            HttpResponseMessage response1 = Request.CreateResponse(HttpStatusCode.OK);

            //foreach (var iitem in temp)
            //{
            //    tt.Add(iitem);
            //}

            var myContent = JsonConvert.SerializeObject(tt);

            var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
            var byteContent = new ByteArrayContent(buffer);

            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");




            response1.Content = byteContent;

            return response1;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("api/another")]
        public HttpResponseMessage GetFile(int productId)
        {

            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);

            IEnumerable<ProductImage> files = _context.ProductImages.Where(p => p.ProductId == productId);
            foreach (var item in files)
            {
                // response.Content = new ByteArrayContent(item.Image);
                //  response.Content.Headers.ContentLength = item.Image.LongLength;

                response.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");
                response.Content.Headers.ContentDisposition.FileName = item.Name;

                //response.Content.Headers.ContentType = new MediaTypeHeaderValue(item.ContentType);
            }
            return response;
        }

    }
}
