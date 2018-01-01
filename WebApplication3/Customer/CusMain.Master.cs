using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Net.Mail;
using System.Net;

namespace WebApplication3.Customer
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String username = HttpContext.Current.User.Identity.Name;
            Label1.Text = "Hi, " + username;
            if (!IsPostBack)
            {
                ContentPlaceHolder2.Visible = false;
            }
            Control control;
            control = LoadControl("ShoppingCart.ascx");
            ContentPlaceHolder2.Controls.Add(control);
        }

        protected void ShoppingCart_Click(object sender, EventArgs e)
        {

            if (ContentPlaceHolder1.Visible == true)
            {
                ContentPlaceHolder1.Visible = false;
                ContentPlaceHolder2.Visible = true;
                ShoppingCartLabel.Text = "Return";
            }
            else
            {
                ContentPlaceHolder1.Visible = true;
                ContentPlaceHolder2.Visible = false;
                ShoppingCartLabel.Text = "Shopping Cart";
            }
        }
    }
}