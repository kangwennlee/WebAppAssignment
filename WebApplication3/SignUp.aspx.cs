﻿using System;
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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            RadioButtonList rblUserType = (RadioButtonList) CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserType");
            String type = rblUserType.SelectedValue.ToString();
            String username = CreateUserWizard1.UserName.ToString();
            String password = CreateUserWizard1.Password.ToString();
            if (type == "Artist")
            {
                if (!Roles.IsUserInRole(username, "Artist"))
                    Roles.AddUserToRole(username, "Artist");
                Membership.ValidateUser(username, password);
                FormsAuthentication.RedirectFromLoginPage(username, true);
                Response.Redirect("~/Artist/ArtistProfile.aspx");
            }
            else if(type == "Customer")
            {
                if (!Roles.IsUserInRole(username, "Customer"))
                    Roles.AddUserToRole(username, "Customer");
                Membership.ValidateUser(username, password);
                FormsAuthentication.RedirectFromLoginPage(username, true);
                Response.Redirect("~/Customer/Gallery.aspx");
            }
        }
    }
}