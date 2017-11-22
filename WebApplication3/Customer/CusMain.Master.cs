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
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if(ContentPlaceHolder1.Visible == true)
            {
                GetCart();
                ContentPlaceHolder1.Visible = false;
                ContentPlaceHolder2.Visible = true;
            }
            else
            {
                ContentPlaceHolder1.Visible = true;
                ContentPlaceHolder2.Visible = false;
            }
        }

        

        protected void LinkButton2_Click(object sender, CommandEventArgs e)
        {
            string pictureId = e.CommandArgument.ToString();
            if(Session["ShoppingCart"] != null)
            {
                DataTable dt = (DataTable)Session["ShoppingCart"];

                DataRow drr = dt.Select("pictureId=" + pictureId + " ").FirstOrDefault();

                if(drr != null)
                {
                    dt.Rows.Remove(drr);
                }

                Session["ShoppingCart"] = dt;
            }
            GetCart();
        }

        private void GetCart()
        {
            DataTable dtPicture;
            if (Session["ShoppingCart"] != null)
            {
                dtPicture = (DataTable)Session["ShoppingCart"];
            }
            else
            {
                dtPicture = new DataTable();
            }

            if (dtPicture.Rows.Count > 0)
            {
                DataList1.DataSource = dtPicture;
                DataList1.DataBind();
            }
            else
            {
                DataList1.DataSource = null;
                DataList1.DataBind();
            }

        }
    }
}