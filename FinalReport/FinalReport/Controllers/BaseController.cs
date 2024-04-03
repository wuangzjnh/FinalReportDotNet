using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;  
using FinalReport.Data;
using FinalReport.Models;
using Newtonsoft.Json;

namespace FinalReport.Controllers
{
    public class BaseController : Controller
    {
        public readonly ApplicationDbContext _context;
        public Member Member { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (HttpContext.Session.GetString("Member") == null && filterContext.RouteData.Values["controller"].ToString() != "Member")
            {
                filterContext.Result = new RedirectResult("/Member/Login");
            }
            else
            {
                var memberJson = HttpContext.Session.GetString("Member");
                if (string.IsNullOrEmpty(memberJson))
                {
                    return;
                }

                Member = Newtonsoft.Json.JsonConvert.DeserializeObject<Member>(memberJson);
            }
            base.OnActionExecuting(filterContext);
        }

        protected void SetMemberSession(Member member)
        {
            HttpContext.Session.SetString("Member", JsonConvert.SerializeObject(member));
            Member = member;

        }
    }
}
