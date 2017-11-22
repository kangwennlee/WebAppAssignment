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

namespace WebApplication3
{
    public partial class Home : System.Web.UI.Page
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
                //Label1.Text = Context.User.Identity.Name
                Label1.Text = Membership.GetUser().UserName;
            }
            else
            {
                Response.Redirect("updateProfile.aspx");
            } 
        }

        protected void addToCartBtn_Click(object sender, CommandEventArgs e)
        {
            string pictureId = e.CommandArgument.ToString();

            if (Session["ShoppingCart"] != null)
            {
                DataTable dt = (DataTable)Session["ShoppingCart"];
                var checkAdded = dt.AsEnumerable().Where(r => r.Field<string>("pictureId") == pictureId);
                if(checkAdded.Count() == 0)
                {
                    string query = "SELECT * FROM [dbo].[picture] WHERE pictureId = '" + pictureId + "'";
                    DataTable dtPicture = getDataFromDB(query);

                    DataRow dr = dt.NewRow();
                    dr["pictureId"] = pictureId;
                    dr["pictureName"] = Convert.ToString(dtPicture.Rows[0]["pictureName"]);
                    dr["price"] = Convert.ToString(dtPicture.Rows[0]["price"]);

                    dt.Rows.Add(dr);

                    Session["ShoppingCart"] = dt;
                }
            }
            else
            {
                string query = "SELECT * FROM [dbo].[picture] WHERE pictureId = '" + pictureId + "'";
                DataTable dtPicture = getDataFromDB(query);

                DataTable dt = new DataTable();

                dt.Columns.Add("pictureId", typeof(string));
                dt.Columns.Add("pictureName", typeof(string));
                dt.Columns.Add("price", typeof(string));

                DataRow dr = dt.NewRow();
                dr["pictureId"] = pictureId;
                dr["pictureName"] = Convert.ToString(dtPicture.Rows[0]["pictureName"]);
                dr["price"] = Convert.ToString(dtPicture.Rows[0]["price"]);

                dt.Rows.Add(dr);
                Session["ShoppingCart"] = dt;
            }

        }

        protected void WishlistBtn_Click(object sender, CommandEventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string pictureId = e.CommandArgument.ToString();
            string Id = Membership.GetUser().ProviderUserKey.ToString();
            string cmdTxt = "INSERT INTO [dbo].[wishlist] VALUES('" + Id + "', '" + pictureId + "')";
            SqlCommand com = new SqlCommand(cmdTxt, con);

            try {
                com.CommandType = CommandType.Text;
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully added to wishlist !');</script>");
            }
            catch
            {
                Response.Write("<script>alert('Failed to add.');</script>");
            }
        }

        public DataTable getDataFromDB(string query)
        {
            DataTable dt = new DataTable();
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.Fill(dt);
            con.Close();
            return dt;

        }
    }
}