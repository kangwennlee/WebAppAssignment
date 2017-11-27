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
            string Id = Membership.GetUser().ProviderUserKey.ToString();

            HttpPostedFile postedFile = FileUpload1.PostedFile;
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

            DataTable dt = new DataTable();
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
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
                using (con)
                {
                    SqlCommand cmd = new SqlCommand("UpdateCustProfile", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter paramId1 = new SqlParameter()
                    {
                        ParameterName = "@custId",
                        Value = Id
                    };
                    cmd.Parameters.Add(paramId1);

                    SqlParameter paramFirstName = new SqlParameter()
                    {
                        ParameterName = "@firstName",
                        Value = firstName
                    };
                    cmd.Parameters.Add(paramFirstName);

                    SqlParameter paramPicturePrice = new SqlParameter()
                    {
                        ParameterName = "@lastName",
                        Value = lastName
                    };
                    cmd.Parameters.Add(paramPicturePrice);

                    SqlParameter paramArtistId = new SqlParameter()
                    {
                        ParameterName = "@gender",
                        Value = gender
                    };
                    cmd.Parameters.Add(paramArtistId);

                    SqlParameter paramPhoneNumber = new SqlParameter()
                    {
                        ParameterName = "@phoneNum",
                        Value = phoneNum
                    };
                    cmd.Parameters.Add(paramPhoneNumber);

                    SqlParameter paramPictureData = new SqlParameter()
                    {
                        ParameterName = "@pictureData",
                        Value = bytes
                    };
                    cmd.Parameters.Add(paramPictureData);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                using (con)
                {
                    SqlCommand cmd = new SqlCommand("firstUpdateProfile", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter paramId1 = new SqlParameter()
                    {
                        ParameterName = "@custId",
                        Value = Id
                    };
                    cmd.Parameters.Add(paramId1);

                    SqlParameter paramFirstName = new SqlParameter()
                    {
                        ParameterName = "@firstName",
                        Value = firstName
                    };
                    cmd.Parameters.Add(paramFirstName);

                    SqlParameter paramPicturePrice = new SqlParameter()
                    {
                        ParameterName = "@lastName",
                        Value = lastName
                    };
                    cmd.Parameters.Add(paramPicturePrice);

                    SqlParameter paramArtistId = new SqlParameter()
                    {
                        ParameterName = "@gender",
                        Value = gender
                    };
                    cmd.Parameters.Add(paramArtistId);

                    SqlParameter paramPhoneNumber = new SqlParameter()
                    {
                        ParameterName = "@phoneNum",
                        Value = phoneNum
                    };
                    cmd.Parameters.Add(paramPhoneNumber);

                    SqlParameter paramPictureData = new SqlParameter()
                    {
                        ParameterName = "@pictureData",
                        Value = bytes
                    };
                    cmd.Parameters.Add(paramPictureData);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Write("<script>alert('Successfully updated your profile!');</script>");
            Response.Redirect("Gallery.aspx");
        }
    }
}