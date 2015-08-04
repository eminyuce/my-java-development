using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcSimpleMembershipManagement.Models;

namespace MvcSimpleMembershipManagement.Entities
{
    public class UserRoleModelView
    {
        public List<String> roles { get; set; }
        public String UserName { get; set; }
        public String [] selectedRoles { get; set; }
        public int page { get; set; }
    }
}