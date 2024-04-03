using FinalReport.Data;
using FinalReport.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Linq;

namespace FinalReport.Controllers
{
    public class MemberController : BaseController
    {
        private readonly ApplicationDbContext _context;

        public Member Member { get; private set; }

        public MemberController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
        
        [HttpPost]
        public IActionResult CheckMember(IFormCollection form)
        {
            string LoginName = form["LoginName"],
                Password = form["Password"];
            var item = _context.Members.Where(m=>m.LoginName == LoginName && m.Password==Password).FirstOrDefault();
            if (item == null)
            {
                return RedirectToAction("Login","Member");
            }
            //var a = _context.Roless.ToList();
            //var RoleCodeList = _context.Roless.Where(r=>RoleIdOfMember.Contains(r.Id)).Select(r=>r.Code).ToList();
            //var RoleIdOfMember = _context.Credentials.Where(c=>c.GroupID == item.GroupID).Select(c=>c.RoleID).ToList();
            //HttpContext.Session.SetString("Credential", JsonConvert.SerializeObject(RoleCodeList));
            base.SetMemberSession(item);
            return RedirectToAction("Index","Admin");
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("Member");
            return RedirectToAction("Login", "Member");
        }
        [HttpPost]
        public IActionResult ChangePassword(IFormCollection form)
        {
            // Lấy thông tin từ form
            string oldPassword = form["OldPassword"];
            string newPassword = form["NewPassword"];
            string confirmNewPassword = form["ConfirmNewPassword"];

            // Kiểm tra mật khẩu cũ có đúng không
            if (oldPassword != Member.Password)
            {
                // Mật khẩu cũ không đúng, xử lý thông báo lỗi hoặc chuyển hướng về trang đổi mật khẩu
                // (tùy thuộc vào yêu cầu của bạn)
                return RedirectToAction("ChangePassword", "Member");
            }

            // Kiểm tra mật khẩu mới và xác nhận mật khẩu mới có khớp không
            if (newPassword != confirmNewPassword)
            {
                // Mật khẩu mới và xác nhận mật khẩu mới không khớp, xử lý thông báo lỗi
                // (tùy thuộc vào yêu cầu của bạn)
                return RedirectToAction("ChangePassword", "Member");
            }

            // Cập nhật mật khẩu mới vào cơ sở dữ liệu
            Member.Password = newPassword;
            _context.SaveChanges();

            // Xử lý thông báo thành công hoặc chuyển hướng về trang khác (tùy thuộc vào yêu cầu của bạn)
            return RedirectToAction("Index", "Home");
        }


    }
}
