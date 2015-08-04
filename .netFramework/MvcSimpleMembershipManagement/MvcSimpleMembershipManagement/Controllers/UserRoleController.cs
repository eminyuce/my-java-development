using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MvcSimpleMembershipManagement.Entities;
using MvcSimpleMembershipManagement.Filters;
using MvcSimpleMembershipManagement.Helpers;
using MvcSimpleMembershipManagement.Models;
using WebMatrix.WebData;

namespace MvcSimpleMembershipManagement.Controllers
{
    [InitializeSimpleMembership]
    [Authorize(Roles = "Administrators, Administrator, Admin")]
    public class UserRoleController : Controller
    {
        //
        // GET: /UserRole/

        public ActionResult Index(int? page, String searchItem = "")
        {
            String searchRole = searchItem;
            var roles = (SimpleRoleProvider)Roles.Provider;
            var resultRoleList = new List<String>();
            var roleList = roles.GetAllRoles().ToList();
            if (!String.IsNullOrEmpty(searchRole))
            {
                searchRole = searchRole.ToLower();
                resultRoleList = roleList.Where(r => r.ToLower().Contains(searchRole))
                            .ToList();
            }
            else
            {
                resultRoleList = roleList.ToList();
            }
            var pagedRoles = new PaginatedList<String>(resultRoleList.AsQueryable<String>(), page.HasValue ? page.Value : 0, 20);
            return View(pagedRoles);
        }
        public ActionResult CreateOrEditRole()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateOrEditRole(String roleName = "")
        {
            var roles = (SimpleRoleProvider)Roles.Provider;
            if (roles.RoleExists(roleName))
            {

            }
            else
            {
                roles.CreateRole(roleName);
            }
            return RedirectToAction("Index");
        }

        public ActionResult DeleteRole(String id = "", int page = 0)
        {
            try
            {
                String roleName = id;
                var roles = (SimpleRoleProvider)Roles.Provider;
                roles.DeleteRole(roleName, true);
            }
            catch (Exception ex)
            {

            }

            return RedirectToAction("Index", new { page = page });
        }
        public ActionResult AssignRole(int id, int page = 0)
        {
            using (UsersContext db = new UsersContext())
            {
                var user = db.UserProfiles.FirstOrDefault(r => r.UserId == id);
                var roles = (SimpleRoleProvider)Roles.Provider;
                var roleList = roles.GetAllRoles().ToList();
                var ur = new UserRoleModelView();
                ur.roles = roleList;
                ur.page = page;
                ur.UserName = user.UserName;
                ur.selectedRoles = roles.GetRolesForUser(user.UserName);
                return View(ur);
            }
        }
        [HttpPost]
        public ActionResult AssignRolesforUser(UserRoleModelView userRoleModelView)
        {
            var roles = (SimpleRoleProvider)Roles.Provider;
            roles.RemoveUsersFromRoles(new string[] { userRoleModelView.UserName }, roles.GetRolesForUser(userRoleModelView.UserName).ToArray());
            if (userRoleModelView.selectedRoles != null)
            {
                foreach (var role in userRoleModelView.selectedRoles)
                {
                    if (!roles.GetRolesForUser(userRoleModelView.UserName).Contains(role))
                    {
                        roles.AddUsersToRoles(new[] { userRoleModelView.UserName }, new[] { role });
                    }
                }
            }
            return RedirectToAction("GetAllUsers", "User", new { page = userRoleModelView.page });
        }
    }
}
