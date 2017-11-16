using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            String username = Login1.UserName;
            if(Roles.IsUserInRole(username, "Artist"))
            {
                Server.Transfer("ArtistProfile.aspx", false);
            }
            if (Roles.IsUserInRole(username, "Customer"))
            {
                Server.Transfer("CusProfile.aspx", false);
            }
            if (Roles.IsUserInRole(username, "Admin"))
            {
                Server.Transfer("Role.aspx",true);
            }
        }
    }
}