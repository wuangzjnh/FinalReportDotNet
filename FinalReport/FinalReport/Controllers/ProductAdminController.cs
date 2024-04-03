using FinalReport.Data;
using FinalReport.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System.Web.Mvc;

namespace FinalReport.Controllers
{
    public class ProductAdminController : BaseController
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public ProductAdminController(IWebHostEnvironment webHostEnvironment, ApplicationDbContext context)
        {
            _webHostEnvironment = webHostEnvironment;
            _context = context;
        }
        public IActionResult Index()
        {
            var categories = _context.Categories.Where(c=>c.ParentID.ToString() == "b8e34204-c9fe-4ab1-b8cb-cdcd11ad385f").ToList() ;
            ViewBag.Categories = categories ;
            return View();
        }
        public IActionResult getCategoryChecked(Guid productId)
        {
            var items = _context.ProductCategories.Where(p=>p.ProductID== productId).Select(p=>p.Category).ToList() ;
            return new Microsoft.AspNetCore.Mvc.JsonResult(items);
        }
        public IActionResult saveCategory(Guid productId,Guid categoryId)
        {
            var items = _context.ProductCategories.Where(p=> p.Category == categoryId && p.ProductID == productId).FirstOrDefault();
            if (items == null)
            {
                items = new ProductCategory();
                items.Id = Guid.NewGuid();
                items.ProductID = productId;
                items.Category = categoryId;
                _context.ProductCategories.Add(items);
            }
            else
            {
                _context.ProductCategories.Remove(items);
            }
            _context.SaveChanges();
            return new Microsoft.AspNetCore.Mvc.JsonResult("");
        }
        public IActionResult getProducts()
        {
            var draw = HttpContext.Request.Form["draw"].FirstOrDefault();
            var start = HttpContext.Request.Form["start"].FirstOrDefault();
            var length = HttpContext.Request.Form["length"].FirstOrDefault();
            int recordsTotal = 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            string searchValue = HttpContext.Request.Form["search[value]"].FirstOrDefault(); 

            var items = _context.Products.ToList().Select(n => new
            {
                n.ID,
                n.Name,
                Picture = n.Picture.Split(';')[0],
                BrandName = _context.Brands.Find(n.BrandID).Name,
                n.CreatedDate,
                MemberName = _context.Members.Find(n.CreatedBy).Name
            });
            if (!string.IsNullOrEmpty(searchValue))
            {
                items = items.Where(n=>n.Name.ToLower().Contains(searchValue.ToLower())).ToList();
            }
            recordsTotal = items.Count();
            items = items.OrderByDescending(n => n.CreatedDate).Skip(skip).Take(pageSize).ToList();
            return Json(new { draw =draw, recordsFiltered = recordsTotal, recordsTotal= recordsTotal, data=items});
        }
        public IActionResult Edit(Guid? Id)
        {
            Product items = new Product();
            if (Id != null)
            {
                items = _context.Products.Find(Id);
            }

            var brands = _context.Brands
                .Select(b => new Microsoft.AspNetCore.Mvc.Rendering.SelectListItem
                {
                    Value = b.Id.ToString(),
                    Text = b.Name
                })
                .ToList();

            ViewBag.Brands = brands;
            _context.SaveChanges();
            return View(items);
        }


        [Microsoft.AspNetCore.Mvc.HttpPost]
        [ValidateInput(false)]
        public IActionResult Remove(Guid Id)
        {
            _context.Votings.RemoveRange(_context.Votings.Where(p=>p.ProductID==Id).ToList());
            List<string> picture_product_price = _context.ProductPrices.Where(p => p.ProductID == Id).Select(p=>p.Picture).ToList();
            _context.ProductPrices.RemoveRange(_context.ProductPrices.Where(p => p.ProductID == Id).ToList());
            foreach (var item in  picture_product_price)
            {
                string path = Path.Combine(_webHostEnvironment.WebRootPath, "assets/images", item);
                if (System.IO.File.Exists(path)){
                    System.IO.File.Delete(path);
                }
            }
            _context.ProductCategories.RemoveRange(_context.ProductCategories.Where(p => p.ProductID == Id).ToList());
            var product = _context.Products.Find(Id);
            string[] product_picture = product.Picture.Split(',');
            for (int i=0; i<product_picture.Length; i++)
            {
                string path = Path.Combine(_webHostEnvironment.WebRootPath, "assets/images", product_picture[i]);
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
            }
            _context.Products.Remove(_context.Products.Find(Id));
            _context.SaveChanges();
            return RedirectToAction("Index","ProductAdmin");
        }

        public IActionResult Save(IFormCollection form)
        {
            try
            {
                Guid Id = Guid.Parse(form["ID"]);
                Product item = new Product();

                // If the Id is empty, it's a new item
                if (Id == Guid.Empty)
                {
                    item.ID = Guid.NewGuid();
                    item.CreatedDate = DateTime.Now;
                    item.CreatedBy = Member.Id;
                    _context.Products.Add(item);
                }
                else
                {
                    // If it's an existing item, fetch it from the database
                    item = _context.Products.Find(Id);

                    // Check if the item exists
                    if (item == null)
                    {
                        return NotFound(); // Or handle this case as appropriate
                    }
                }

                // Update item properties
                item.Name = form["Name"];
                item.Description = form["Description"];
                item.Information = form["Information"];
                item.Addtional = form["Addtional"];
                item.Shipping = form["Shipping"];

                // Get selected brand ID
                if (Guid.TryParse(form["BrandID"], out Guid brandId))
                {
                    item.BrandID = brandId;
                }
                else
                {
                    ModelState.AddModelError("BrandID", "Invalid BrandID");
                    // Handle the invalid BrandID, you might want to return a View with errors
                    // or redirect to an error page.
                    return View(item);
                }

                IFormFile file = form.Files.FirstOrDefault();
                if (file != null && file.Length > 0)
                {
                    using (var stream = file.OpenReadStream())
                    {
                        var fileName = Path.GetFileName(file.FileName);
                        var path = Path.Combine(_webHostEnvironment.WebRootPath, "assets/images", fileName);

                        using (var fileStream = new FileStream(path, FileMode.Create))
                        {
                            stream.CopyTo(fileStream);
                        }
                        item.Picture = fileName;
                    }
                }

                if (ModelState.IsValid)
                {
                    _context.SaveChanges();
                    return RedirectToAction("Index", "ProductAdmin");
                }

                // If ModelState is not valid, return to the view with errors
                return View(item);
            }
            catch (Exception ex)
            {
                // Log the exception details
                Console.WriteLine($"An error occurred: {ex.Message}");
                return StatusCode(500); // Or handle the error as appropriate
            }
        }
    }
}