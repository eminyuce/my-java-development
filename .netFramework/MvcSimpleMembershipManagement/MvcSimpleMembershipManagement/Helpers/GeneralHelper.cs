using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcSimpleMembershipManagement.Helpers
{
    public class GeneralHelper
    {
        public static SelectList GetAllRoles(String [] roles)
        {
            var AllRoles = new SelectList(roles);
            var list = (from a in AllRoles
                        select new SelectListItem
                        {
                            Text = a.Text, //anyProperty you want to be display as text
                            Value = a.Value
                        }).ToList<SelectListItem>();

            var sl = new SelectList(list);
            return sl;
        }
        public static string GenerateRandomPassword(int length)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            char[] chars = new char[length];
            Random rd = new Random();
            for (int i = 0; i < length; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }
            return new string(chars);
        }

    }
}