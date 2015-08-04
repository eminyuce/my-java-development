using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Microsoft.Web.WebPages.OAuth;
using MvcSimpleMembershipManagement.Filters;
using MvcSimpleMembershipManagement.Helpers;
using MvcSimpleMembershipManagement.Models;
using WebMatrix.WebData;

namespace MvcSimpleMembershipManagement.Controllers
{
    [InitializeSimpleMembership]
    [Authorize(Roles = "Administrators, Administrator, Admin")]
    public class UserController : Controller
    {
        //
        // GET: /User/
        public ActionResult GetAllUsers(int? page, String searchItem = "")
        {

            //int totalRecords = 0;
            //var all = membership.GetAllUsers(page.HasValue ? page.Value : 0, 20, out totalRecords);
            String searchUser = searchItem;
            using (UsersContext db = new UsersContext())
            {
                var resultUserList = new List<UserProfile>();
                var userList = db.UserProfiles.ToList();
                if (!String.IsNullOrEmpty(searchUser))
                {
                    searchUser = searchUser.ToLower();
                    resultUserList =
                        userList.Where(
                            r => r.UserName.ToLower().Contains(searchUser))
                                .ToList();
                }
                else
                {
                    resultUserList = userList.ToList();
                }
                var pagedUsers = new PaginatedList<UserProfile>(resultUserList.AsQueryable<UserProfile>(), page.HasValue ? page.Value : 0, 20);

                return View(pagedUsers);
            }
        }

        public ActionResult ResetPassword(int id, int page=0)
        {
            using (UsersContext db = new UsersContext())
            {
                var user = db.UserProfiles.FirstOrDefault(r => r.UserId == id);
                if (user != null)
                {
                    String userName = user.UserName;
                    var roles = (SimpleRoleProvider)Roles.Provider;
                    var membership = (SimpleMembershipProvider)Membership.Provider;
                    String password = GeneralHelper.GenerateRandomPassword(6);

                    if (WebSecurity.UserExists(userName))
                    {
                        var token = WebSecurity.GeneratePasswordResetToken(userName);
                        WebSecurity.ResetPassword(token, password);
                    }
                    else
                    {
                        membership.CreateUserAndAccount(userName, password);
                    }
                    ViewBag.Password = password;
                    ViewBag.UserName = userName;
                }

                ViewBag.Page = page;
                return View();
            }
        }
        private ICollection<OAuthAccount> GetExternalAccounts(String userName)
        {
            ICollection<OAuthAccount> accounts = OAuthWebSecurity.GetAccountsFromUserName(userName);
            return accounts;
        }
        public ActionResult DeleteUser(String userName, int page = 0)
        {
            var roles = (SimpleRoleProvider)Roles.Provider;
            var membership = (SimpleMembershipProvider)Membership.Provider;

            //This will delete the user information from webpages_membership
            bool wasDeleted = membership.DeleteAccount(userName);
            var externalAccounts = GetExternalAccounts(userName);
            if (externalAccounts.Any())
            {
                foreach (var externalAccount in externalAccounts)
                {
                    membership.DeleteOAuthAccount(externalAccount.Provider, externalAccount.ProviderUserId);
                }
            }
            roles.RemoveUsersFromRoles(new string[] { userName }, roles.GetRolesForUser(userName).ToArray());
            wasDeleted = membership.DeleteUser(userName, true);
            return RedirectToAction("GetAllUsers", new { page = page });
        }

        public ActionResult CreateOrEditUser(int id = 0)
        {
            ViewBag.RandomPassword = GeneralHelper.GenerateRandomPassword(6);
            return View();
        }
        [HttpPost]
        public ActionResult CreateOrEditUser(String userName, String password)
        {
            var roles = (SimpleRoleProvider)Roles.Provider;
            var membership = (SimpleMembershipProvider)Membership.Provider;
            var b = WebSecurity.UserExists(userName);
            if (membership.GetUser(userName, false) == null)
            {
                membership.CreateUserAndAccount(userName, password);
            }
            return RedirectToAction("GetAllUsers");
        }
    }
}
