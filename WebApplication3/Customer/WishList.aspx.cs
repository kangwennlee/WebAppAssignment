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
            getWish();
        }

        protected void addToCartBtn_Click(object sender, CommandEventArgs e)
        {
            string pictureId = e.CommandArgument.ToString();

            if (Session["ShoppingCart"] != null)
            {
                DataTable dt = (DataTable)Session["ShoppingCart"];
                var checkAdded = dt.AsEnumerable().Where(r => r.Field<string>("pictureId") == pictureId);
                if (checkAdded.Count() == 0)
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

        protected void removeBtn_Click(object sender, CommandEventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            string wishId = e.CommandArgument.ToString();
            using (SqlConnection con = new SqlConnection(strCon))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[wishlist] WHERE wishId = "+ wishId +";", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            getWish();
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

        private void getWish()
        {
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            String Id = Membership.GetUser().ProviderUserKey.ToString();
            using (SqlConnection con = new SqlConnection(strCon))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[picture] p,[dbo].[wishlist] WHERE p.pictureId = [dbo].[wishlist].pictureId AND [dbo].[wishlist].custId = '" + Id + "';", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                ListView1.DataSource = rdr;
                ListView1.DataBind();
            }
        }
    }
}