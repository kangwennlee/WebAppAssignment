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
    public partial class WishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            String Id = Membership.GetUser().ProviderUserKey.ToString();
             using (SqlConnection con = new SqlConnection(strCon))
             {
                 SqlCommand cmd = new SqlCommand("SELECT p.pictureData, p.pictureName, p.price FROM [dbo].[picture] p,[dbo].[wishlist] WHERE p.pictureId = [dbo].[wishlist].pictureId AND [dbo].[wishlist].custId = '" + Id +"';", con);
                 con.Open();
                 SqlDataReader rdr = cmd.ExecuteReader();
                 GridView1.DataSource = rdr;
                 GridView1.DataBind();
             }
        }
    }
}