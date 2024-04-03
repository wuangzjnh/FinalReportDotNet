using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace FinalReport.Controllers
{
    //[Authorize(Roles = "Admin")]
    public class AdminController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult NotCredential()
        {
            return View();
        }

    }
}
