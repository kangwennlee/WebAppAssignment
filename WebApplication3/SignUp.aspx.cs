using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
            if (txtpassword.Text == txtconfirmPassword.Text)
            {
                string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd = new SqlCommand("sp_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("name", txtname.Text);
                cmd.Parameters.AddWithValue("password", txtpassword.Text);
                cmd.Parameters.AddWithValue("email", txtemail.Text);
                con.Open();
                int k = cmd.ExecuteNonQuery();
                if (k != 0)
                {
                    Response.Redirect("LoginHome.aspx");
                }
                con.Close();
            }
            else
            {
               
            }
            
        }

    }
}