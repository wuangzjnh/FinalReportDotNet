using FinalReport.Data;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;
using FinalReport.Models;
using System.Web.Mvc;

namespace FinalReport.Controllers
{
    public class PriceController : BaseController
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public PriceController(IWebHostEnvironment webHostEnvironment, ApplicationDbContext context)
        {
            _webHostEnvironment = webHostEnvironment;
            _context = context;
        }
        public IActionResult Index(Guid Id)
        {
            return View(Id);
        }
        public IActionResult getPrices(Guid productId)
        {
            var draw = HttpContext.Request.Form["draw"].FirstOrDefault();
            var start = HttpContext.Request.Form["start"].FirstOrDefault();
            var length = HttpContext.Request.Form["length"].FirstOrDefault();
            int recordsTotal = 0;
            int skip = start != null ? Convert.ToInt32(start) : 0;
            int pageSize = length != null ? Convert.ToInt32(length) : 0;
            string searchValue = HttpContext.Request.Form["search[value]"].FirstOrDefault();
            var items = _context.ProductPrices.ToList().Select(p => new
            {
                p.Id,
                p.Picture,
                Color = _context.Colors.Find(p.ColorID).Name,
                Size = _context.Sizes.Find(p.SizeID).Name,
                p.Price,
                p.Amount
            });
            if (!string.IsNullOrEmpty(searchValue))
            {
                items = items.Where(n => n.Size.ToLower().Contains(searchValue.ToLower()) || n.Color.ToLower().Contains(searchValue.ToLower())).ToList();
            }
            recordsTotal = items.Count();
            items = items.OrderByDescending(n => n.Amount).Skip(skip).Take(pageSize).ToList();
            return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = items });
        }
        public IActionResult Edit (Guid? Id, Guid productId)
        {
            ProductPrice items = new ProductPrice();
            items.ProductID=productId;
            if (Id != null)
            {
                items = _context.ProductPrices.Find(Id);
            }
            var colors = _context.Colors
                .Select(b => new Microsoft.AspNetCore.Mvc.Rendering.SelectListItem
                {
                    Value = b.ID.ToString(),
                    Text = b.Name
                })
                .ToList();

            ViewBag.Color = colors;
            var sizes = _context.Sizes.Where(s=>s.ParentID.ToString()== "dfe8ad7d-2e46-438e-bd5d-2c19daa30c95")
                .Select(b => new Microsoft.AspNetCore.Mvc.Rendering.SelectListItem
                {
                    Value = b.Id.ToString(),
                    Text = b.Name
                })
                .ToList();

            ViewBag.Size = sizes;
            return View(items);

        }
        [Microsoft.AspNetCore.Mvc.HttpPost]
        public IActionResult Save(IFormCollection form)
        {
            try
            {
                Guid Id = Guid.Parse(form["Id"]);
                ProductPrice item = new ProductPrice();

                // If the Id is empty, it's a new item
                if (Id == Guid.Empty)
                {
                    item.Id = Guid.NewGuid();
                    _context.ProductPrices.Add(item);
                }
                else
                {
                    // If it's an existing item, fetch it from the database
                    item = _context.ProductPrices.Find(Id);

                    // Check if the item exists
                    if (item == null)
                    {
                        return NotFound(); // Or handle this case as appropriate
                    }
                }

                // Update item properties
                item.ProductID = Guid.Parse(form["ProductId"]);
                item.ColorID = Guid.Parse(form["ColorId"]);
                item.SizeID = Guid.Parse(form["SizeId"]);
                item.Price = float.Parse(form["Price"]);
                item.Amount = int.Parse(form["Amount"]);

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
                    return RedirectToAction("Index", "Price");
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
