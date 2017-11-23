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
using System.IO;

namespace WebApplication3.Customer
{
    public partial class updateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            DataTable dt = new DataTable();
            String Id = Membership.GetUser().ProviderUserKey.ToString();
            string cmdTxt = "Select * FROM customerProfile WHERE custId = @Id0";
            SqlCommand com = new SqlCommand(cmdTxt, con);
            SqlParameter paramId = new SqlParameter()
            {
                ParameterName = "@Id0",
                Value = Id
            };
            com.Parameters.Add(paramId);
            com.CommandType = CommandType.Text;


            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(com);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblHead.Text = "Update Profile";
            }
            else
            {
                lblHead.Text = "Update your profile before proceed";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string gender = rblGender.SelectedItem.Value.ToString();
            string phoneNum = txtPhoneNum.Text;

            HttpPostedFile postedFile = FileUpload1.PostedFile;
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            DataTable dt = new DataTable();
            string Id = Membership.GetUser().ProviderUserKey.ToString();
            string cmdTxt = "Select * FROM customerProfile WHERE custId = @Id";
            SqlCommand com = new SqlCommand(cmdTxt, con);
            SqlParameter paramId = new SqlParameter()
            {
                ParameterName = "@Id",
                Value = Id
            };
            com.Parameters.Add(paramId);
            com.CommandType = CommandType.Text;


            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(com);
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                string cmdTxt1 = "UPDATE customerProfile SET firstName = '"+ firstName +"', lastName = '" + lastName +"', gender = '" + gender + "', profilePic = '" + bytes +"', phoneNum = '" + phoneNum +"' WHERE custId = '" + Id +"'";
                SqlCommand com1 = new SqlCommand(cmdTxt1, con);
                com1.CommandType = CommandType.Text;
                con.Open();
                com1.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                string cmdTxt1 = "INSERT INTO [dbo].[customerProfile] VALUES('"+ Id +"', '"+ firstName + "', '" + lastName + "', '" + gender + "', '" + phoneNum + "', '" + bytes+"')";
                SqlCommand com2 = new SqlCommand(cmdTxt1, con);

                com2.CommandType = CommandType.Text;
                con.Open();
                com2.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect("Gallery.aspx");
        }
    }
}