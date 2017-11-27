using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.Customer
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            String Id = Membership.GetUser().ProviderUserKey.ToString();
            using (SqlConnection con = new SqlConnection(strCon))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[OrderDetail] d,[dbo].[Order] o WHERE o.orderId = d.orderId AND o.custId = '" + Id + "';", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                DataList1.DataSource = rdr;
                DataList1.DataBind();
            }
                
        }
    }
}