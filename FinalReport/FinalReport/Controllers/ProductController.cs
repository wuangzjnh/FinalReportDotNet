using Microsoft.AspNetCore.Mvc;
using FinalReport.Models;
using FinalReport.Data;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Diagnostics;
using Newtonsoft.Json;
using System.Text;
using Microsoft.AspNetCore.Http;

namespace FinalReport.Controllers
{
    public class ProductController : Controller
    {
        private readonly ApplicationDbContext _context;
        public class myCart
        {
            public ProductPrice _productPrice { get; set; }
            public Product _product { get; set; }
            public int _amount { get; set; }
        }

        public ProductController(ApplicationDbContext context)
        {
            _context = context;

        }
        public IActionResult Index()
        {
            var items = _context.Categories.Where(c => c.ParentID.ToString() == "b8e34204-c9fe-4ab1-b8cb-cdcd11ad385f").OrderBy(c => c.Name).ToList();
            var categories = items.Select(i => new List<string>
            {
                i.Id.ToString(),
                i.Name,
                _context.ProductCategories.Where(p=>p.Category == i.Id).Count().ToString()
            }).ToList();
            ViewBag.Categories = categories;
            var sizes = _context.Sizes.Where(s=>s.ParentID.ToString() == "dfe8ad7d-2e46-438e-bd5d-2c19daa30c95").OrderBy(s=>s.Name).ToList();
            ViewBag.Sizes = sizes;
            var colors = _context.Colors.ToList();
            ViewBag.Colors = colors;
            var brands = _context.Brands.ToList();
            ViewBag.Brands = brands;
            return View();
        }
        
        public IActionResult Details(Guid Id)
        {
            if (_context.Products == null)
            {
                return NotFound();
            }

            var product = _context.Products.Find(Id);
            var viewModel = new ProductViewModel();
            viewModel.Product = product;

            // Truyền context vào view model
            viewModel.Context = _context;
            return View(viewModel);

        }

        public IActionResult getPrices(Guid productID, Guid colorID, Guid sizeID)
        {
            var item = _context.ProductPrices
                .Where(p => p.ProductID == productID && p.ColorID==colorID && p.SizeID==sizeID )
                .FirstOrDefault();

            if (item == null)
            {
                item = new ProductPrice();
            }
            return new JsonResult(item);
        }


        public IActionResult Products(List<Guid?> Categories, List<Guid?> Sizes, Guid? Color, List<Guid?> Brands, float PriceFrom=0, float PriceTo =0, int PageNumber = 1,string SortBy ="Date" ) 
        {
            int itemPerPage = 3;
            var items = _context.Products.ToList();
            if (Categories.Count !=0 && Categories !=null ) 
            {
                items = items.Where(p => _context.ProductCategories.Where(c => Categories.Contains(c.Category)).Select(c => c.ProductID).ToList().Contains(p.ID)).ToList();
            }
            if (Sizes !=null && Sizes.Count !=0)
            {
                items=items.Where( p=>_context.ProductPrices.Where( c=>Sizes.Contains(c.SizeID)).Select(c=>c.ProductID).ToList().Contains(p.ID)).ToList();
            }
            if (Color != null && !Color.Equals(""))
            {
                items = items.Where(p => _context.ProductPrices.Where(c => c.ColorID == Color).Select(c => c.ProductID).ToList().Contains(p.ID)).ToList();
            }
            if (Brands != null && Brands.Count!=0)
            {
                items = items.Where(p => Brands.Contains(p.BrandID)).ToList();
            }
            items = items.Where(p => _context.ProductPrices.Where(c => c.Price >= PriceFrom && c.Price <= PriceTo).Select(c => c.ProductID).Contains(p.ID)).ToList();
            switch (SortBy)
            {
                case "Date":
                    items=items.OrderByDescending(p => p.CreatedDate).ToList(); break;
                case "Rated":
                    var productVote = (from v in _context.Votings
                                       group v by new
                                       {
                                           v.ProductID
                                       } into g
                                       select new
                                       {
                                           g.Key,
                                           VoteAvg = g.Average(p => p.Star)
                                       }).ToList();
                    var data = (from a in productVote
                                join b in items on a.Key.ProductID equals b.ID
                                orderby a.VoteAvg descending
                                select b).ToList();
                    items.Clear();
                    items.AddRange(data);
                    break;
                case "PriceDown":
                    var productPricesDown = _context.ProductPrices.ToList();
                    items = items.OrderByDescending(p => productPricesDown.Where(x => x.ProductID == p.ID).Min(x => x.Price)).ToList();
                    break;
                case "PriceUp":
                    var productPrices = _context.ProductPrices.ToList();
                    items = items.OrderBy(p => productPrices.Where(x => x.ProductID == p.ID).Min(x => x.Price)).ToList();
                    break;
            }
            int totalItems = items.Count();
            items = items.Skip((PageNumber - 1) * itemPerPage).Take(itemPerPage).ToList();
            Dictionary<string, object> mydata = new Dictionary<string, object>(); 

            var products = items.Select(i => new List<string>
            {
                i.ID.ToString(),
                i.Picture,
                string.Join(",",_context.Categories.Where(c=>_context.ProductCategories.Where(d=>d.ProductID == i.ID).Select(d=>d.Category).Contains(c.Id)).Select(c=>c.Name).ToArray()),
                i.Name,
                i.Description,
                string.Join(",",_context.ProductPrices.Where(p=>p.ProductID==i.ID).Select(p=>p.Picture).ToArray()),
               _context.ProductPrices.Where(p=>p.ProductID==i.ID).Min(p=>p.Price).ToString(),
               _context.Votings.Where(p=>p.ProductID==i.ID).Count().ToString(),
               _context.Votings.Where(p=>p.ProductID==i.ID).Average(p=>p.Star).ToString()
            });
            mydata.Add("Products", products);
            mydata.Add("Totals", totalItems);
            int totalPages = totalItems / itemPerPage;
            if (totalPages * itemPerPage < totalItems)
            {
                totalPages ++ ;
            }
            mydata.Add("TotalPages", totalPages);
            return new JsonResult(mydata);
        }

        public IActionResult getCart()
        {
            List<myCart> myProducts = new List<myCart>();  // Fix syntax error here
            if (HttpContext.Session.TryGetValue("Cart", out var cartData))
            {
                myProducts = JsonConvert.DeserializeObject<List<myCart>>(Encoding.UTF8.GetString(cartData));
            }
            return new JsonResult(myProducts);
        }
        public IActionResult addCart(Guid productId, Guid colorId, Guid sizeId, int amount=1)
        {
            List<myCart> myProducts = new List<myCart>();  // Fix syntax error here
            if (HttpContext.Session.TryGetValue("Cart", out var cartData))
            {
                myProducts = JsonConvert.DeserializeObject<List<myCart>>(Encoding.UTF8.GetString(cartData));
            }
            var product = _context.Products.Find(productId);
            var productprice = _context.ProductPrices.Where(p => p.ProductID == productId && p.ColorID == colorId && p.SizeID==sizeId ).FirstOrDefault();
            if (productprice != null)
            {
                myProducts.Add(new myCart()
                {
                    _product = product,
                    _productPrice = productprice,
                    _amount = amount
                });
            HttpContext.Session.SetString("Cart", JsonConvert.SerializeObject(myProducts));
            }
            return new JsonResult("");
        }
        public IActionResult Checkout()
        {
            List<myCart> myProducts = new List<myCart>();

            if (HttpContext.Session.TryGetValue("Cart", out var cartData))
            {
                myProducts = JsonConvert.DeserializeObject<List<myCart>>(Encoding.UTF8.GetString(cartData));
            }

            return View(myProducts);
        }



    }



}