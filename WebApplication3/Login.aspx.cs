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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            String name = txtnameLogin.Text;
            String pass = txtpasswordLogin.Text;
            string cmdTxt = "Select userName,userPassword FROM webUser WHERE userName = @name";
            SqlCommand cmd = new SqlCommand(cmdTxt, con);
            cmd.Parameters.Add("@name", SqlDbType.VarChar);
            cmd.Parameters["@name"].Value = name;
            cmd.CommandType= CommandType.Text;
            try
            {
                con.Open();
                Int32 rowsAffected = cmd.ExecuteNonQuery();
                Console.WriteLine("RowsAffected: {0}", rowsAffected);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                String rtName = "" + dt.Rows[0]["userName"];
                String rtPass = "" + dt.Rows[0]["userPassword"];
                if (rowsAffected != 0 && name==rtName && pass==rtPass)
                {
                    Response.Redirect("LoginHome.aspx");
                }
                else
                {
                    Label1.Text = "Error. login details is incorrect.";
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "User not found.";
                Console.WriteLine(ex.Message);
            }
        }
    }
}