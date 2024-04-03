using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System.Collections.Generic;
using FinalReport.Data;

namespace FinalReport.Controllers
{
    public class HasCredentialAttribute : AuthorizeAttribute, IAuthorizationFilter
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public HasCredentialAttribute(IWebHostEnvironment webHostEnvironment, ApplicationDbContext context)
        {
            _webHostEnvironment = webHostEnvironment;
            _context = context;
        }
        public string RoleCode { get; set; }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var httpContext = context.HttpContext;
            var a = _context.Roless.ToList();
            List<string> credential = GetCredentialByLoggedInMember(httpContext);
            if (credential != null && credential.Contains(RoleCode))
            {
                return;
            }

            context.Result = new RedirectToActionResult("NotCredential", "Admin", null);
        }

        private List<string> GetCredentialByLoggedInMember(HttpContext context)
        {
            return JsonConvert.DeserializeObject<List<string>>(context.Session.GetString("Credential"));
        }
    }
}
