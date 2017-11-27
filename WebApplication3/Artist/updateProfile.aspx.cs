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

namespace WebApplication3.Artist
{
    public partial class updateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            DataTable dt = new DataTable();
            String Id = Membership.GetUser().ProviderUserKey.ToString();
            string cmdTxt = "Select * FROM artistProfile WHERE artistId = @Id";
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
            string Id = Membership.GetUser().ProviderUserKey.ToString();
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string bio = txtBio.Text;
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string gender = rblGender.SelectedItem.Value.ToString();


            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            DataTable dt = new DataTable();
            string cmdTxt = "Select * FROM artistProfile WHERE artistId = @Id";
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
                string cmdTxt1 = "UPDATE artistProfile SET firstName = '" + firstName + "', lastName = '" + lastName + "', bio = '" + bio + "', profilePic = '" + bytes + "', '"+ gender +"' WHERE artistId = '" + Id + "'";
                SqlCommand com1 = new SqlCommand(cmdTxt1, con);

                com1.CommandType = CommandType.Text;
                con.Open();
                com1.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                string cmdTxt1 = "INSERT INTO [dbo].[artistProfile] VALUES('" + Id + "', '" + firstName + "', '" + lastName + "', '" + bio + "', '" + bytes + "', '"+ gender +"')";
                SqlCommand com2 = new SqlCommand(cmdTxt1, con);

                com2.CommandType = CommandType.Text;
                con.Open();
                com2.ExecuteNonQuery();
                con.Close();

                Response.Redirect("ViewProfile.aspx");
            }
        }
    }
}