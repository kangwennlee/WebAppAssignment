using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebApplication3
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            Membership.DeleteUser("admin@admin.com");
            if (!Roles.RoleExists("Admin"))
                Roles.CreateRole("Admin");

            if (Membership.FindUsersByName("admin@admin.com").Count == 0)
            {
                Membership.CreateUser("admin@admin.com", "abc12345");
            }

            if (!Roles.IsUserInRole("admin@admin.com", "Admin"))
                Roles.AddUserToRole("admin@admin.com", "Admin");
        }
    }
}