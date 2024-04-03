using FinalReport.Data;
using Microsoft.AspNetCore.Mvc;
using System.Web.Mvc;


namespace FinalReport.Controllers
{
    public class NewAdminController : BaseController
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public NewAdminController(IWebHostEnvironment webHostEnvironment, ApplicationDbContext context)
        {
            _webHostEnvironment = webHostEnvironment;
            _context = context;

        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult getNews()
        {
            var items = _context.News.ToList().Select(n=>new List<string>
            {
                n.Id.ToString(),
                n.Title,
                n.CreatedDate.ToString("dd-MM-yyyy"),
                _context.Members.Where(m=>m.Id == n.CreatedBy).FirstOrDefault().Name
            }).ToList();

            return new Microsoft.AspNetCore.Mvc.JsonResult(items);

        }
        public IActionResult Edit (Guid? Id)
        {
            FinalReport.Models.News item = new Models.News();
            if (Id != null)
            {
                item = _context.News.Find(Id);
            }
            return View(item);
        }
        [Microsoft.AspNetCore.Mvc.HttpPost]
        [ValidateInput(false)]
        public IActionResult Save(IFormCollection form)
        {

            Guid Id = Guid.Parse(form["Id"]);
            FinalReport.Models.News item;
            if (Id == Guid.Empty)//Thêm
            {
                item = new Models.News();
                item.Id = Id;  // Use the same Id for the new item
                item.CreatedDate = DateTime.Now;
                item.CreatedBy = Member.Id;
                _context.News.Add(item);
            }
            else
            {
                item = _context.News.Find(Id);
            }

            item.Title = form["Title"];
            item.Description = form["Description"];

            IFormFile file = form.Files.FirstOrDefault(); // Use FirstOrDefault to get the first file in the collection
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
            item.Content = form["Content"];
            _context.SaveChanges();
            return RedirectToAction("Index", "NewAdmin");
        }
        public IActionResult Remove (Guid Id)
        {
            var item = _context.News.Find(Id);
            _context.News.Remove(item);
            _context.SaveChanges();
            return RedirectToAction("Index", "NewAdmin");
        }
    }
}
