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
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            DataTable dt = new DataTable();
            String name = txtname.Text;
            String rtName;
            string cmdTxt = "Select userName FROM webUser WHERE userName = @name";
            SqlCommand com = new SqlCommand(cmdTxt, con);
            com.Parameters.Add("@name", SqlDbType.VarChar);
            com.Parameters["@name"].Value = name;
            com.CommandType = CommandType.Text;
            try
            {
                con.Open();
                Int32 rowsAffected = com.ExecuteNonQuery();
                Console.WriteLine("RowsAffected: {0}", rowsAffected);
                SqlDataAdapter da = new SqlDataAdapter(com);
                da.Fill(dt);
                rtName = "" + dt.Rows[0]["userName"];
                if (rtName == name)
                {
                    txtError.Text = "Error. User exits in the database!";
                    return;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            try
            {
                if (txtpassword.Text == txtconfirmPassword.Text)
                {
                    SqlCommand cmd = new SqlCommand("sp_signup", con);
                    cmd.Parameters.AddWithValue("name", txtname.Text);
                    cmd.Parameters.AddWithValue("password", txtpassword.Text);
                    cmd.Parameters.AddWithValue("email", txtemail.Text);
                    cmd.Parameters.AddWithValue("type", rbluserType.SelectedValue);
                    cmd.CommandType = CommandType.StoredProcedure;
                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                        Response.Redirect("LoginHome.aspx");
                    }
                    con.Close();
                }
                else
                {
                    txtError.Text = "Error. Please re-enter user details";
                }
            }
            catch (Exception ex)
            {
                txtError.Text = "Error. Please fill in every user details";
                Console.WriteLine(ex.Message);
            }

        }

    }
}