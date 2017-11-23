using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.Customer
{
    public partial class CustomerProfile : System.Web.UI.Page
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
            String rtName = "" + dt.Rows[0]["firstName"] + " " + dt.Rows[0]["lastName"];
            TxtUserName.Text = rtName;
            TxtGender.Text = "" + dt.Rows[0]["gender"];
            TxtPhoneNumber.Text = "" + dt.Rows[0]["phoneNum"];
            String pictureData = Convert.ToBase64String((byte[])dt.Rows[0]["profilePic"]);
            ProfilePic.ImageUrl = "data:image/png;base64," + pictureData;
        }
    }
}