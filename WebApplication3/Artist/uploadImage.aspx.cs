using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;

namespace WebApplication3.Customer
{
    public partial class WebForm3 : System.Web.UI.Page
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
                //Label1.Text = Context.User.Identity.Name
                //Label1.Text = Membership.GetUser().UserName;
                HyperLink1.Text = "HI";
            }
            else
            {
                Response.Redirect("updateProfile.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            string name = txtName.Text;
            int price = int.Parse(txtPrice.Text);
            string desc = txtDesc.Text;
            string artistId = Membership.GetUser().ProviderUserKey.ToString();

            //int fileSize = postedFile.ContentLength;

            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == "..bmp" || 
                fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                string cs = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("uploadImg", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramPictureName = new SqlParameter()
                    {
                        ParameterName = "@pictureName",
                        Value = name
                    };
                    cmd.Parameters.Add(paramPictureName);

                    SqlParameter paramPictureData = new SqlParameter()
                    {
                        ParameterName = "@pictureData",
                        Value = bytes
                    };
                    cmd.Parameters.Add(paramPictureData);

                    SqlParameter paramPicturePrice = new SqlParameter()
                    {
                        ParameterName = "@price",
                        Value = price
                    };
                    cmd.Parameters.Add(paramPicturePrice);

                    SqlParameter paramArtistId = new SqlParameter()
                    {
                        ParameterName = "@artistId",
                        Value = artistId
                    };
                    cmd.Parameters.Add(paramArtistId);

                    SqlParameter paramPictureDesc = new SqlParameter()
                    {
                        ParameterName = "@pictureDesc",
                        Value = desc
                    };
                    cmd.Parameters.Add(paramPictureDesc);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {

            }
        }
    }
}