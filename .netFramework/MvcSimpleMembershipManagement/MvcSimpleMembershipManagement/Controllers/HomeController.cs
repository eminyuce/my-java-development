using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.Security;
using MvcSimpleMembershipManagement.Filters;
using MvcSimpleMembershipManagement.Helpers;
using MvcSimpleMembershipManagement.Models;
using WebMatrix.WebData;

namespace MvcSimpleMembershipManagement.Controllers
{
    [InitializeSimpleMembership]
    public class HomeController : Controller
    {

      
        public ActionResult Index()
        {
            

            var settings = WebConfigurationManager.AppSettings;

            var query = from string q in settings.Keys
                        where q.StartsWith("ConnectionString_")
                        select q.Replace("ConnectionString_", "");

            var list = new SelectList(query);
            ViewData["UserDatabases"] = list;

            return View();
        }

        public ActionResult InformUser()
        {
            String message = "";
            if (User.Identity.IsAuthenticated)
            {
                message = String.Format(
                        "You cannot see the Users and Roles pages because you as {0}  are not Administrators, Administrator, Admin roles in selected database. Please contact your Admin account. ",
                        User.Identity.Name);
            }

            ViewBag.Message = message;

            return View();
        }
        public ActionResult ChangeConnectionString(String UserDatabases)
        {
            String dbConnectionString = WebConfigurationManager.AppSettings["ConnectionString_" + UserDatabases];
            String applicationName = WebConfigurationManager.AppSettings["Membership_AppName_" + UserDatabases];
            ChangeWebConnectionString(dbConnectionString);

            return RedirectToAction("GetAllUsers","User");
            //return RedirectToAction("LogOn", "Account", new { applicationName = applicationName });
        }

        private static void ChangeAppName(String applicationName)
        {
            MembershipSection mySection = (MembershipSection)WebConfigurationManager.GetSection("system.web/membership");
            if (mySection != null)
            {
                string defaultProvider = mySection.DefaultProvider;
                ProviderSettings providerSettings = mySection.Providers[defaultProvider];
                //string applicationName = providerSettings.Parameters["applicationName"];
                providerSettings.Parameters["applicationName"] = applicationName;
            }
        }
        private static void ChangeWebConnectionString(string dbConnectionString)
        {
            Configuration myConfig = WebConfigurationManager.OpenWebConfiguration("~");
            ConnectionStringsSection mySection = myConfig.GetSection("connectionStrings") as ConnectionStringsSection;
            if (mySection != null)
            {
                String c = mySection.ConnectionStrings["connMembership"].ConnectionString;
                if (c != dbConnectionString)
                {
                    mySection.ConnectionStrings["connMembership"].ConnectionString = dbConnectionString;
                    myConfig.Save(ConfigurationSaveMode.Modified, true);
                }
            }
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            //var roles = (SimpleRoleProvider)Roles.Provider;
            //var membership = (SimpleMembershipProvider)Membership.Provider;

            //if (!roles.RoleExists("Admin"))
            //{
            //    roles.CreateRole("Admin");
            //}
            //if (membership.GetUser("sallen", false) == null)
            //{
            //    membership.CreateUserAndAccount("sallen", "imalittleteapot");
            //}
            //if (!roles.GetRolesForUser("sallen").Contains("Admin"))
            //{
            //    roles.AddUsersToRoles(new[] { "sallen" }, new[] { "admin" });
            //}
          

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
