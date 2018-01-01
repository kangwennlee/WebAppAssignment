using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.Customer
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCart();
        }
        protected void RemoveCart_Click(object sender, CommandEventArgs e)
        {
            string pictureId = e.CommandArgument.ToString();
            if (Session["ShoppingCart"] != null)
            {
                DataTable dt = (DataTable)Session["ShoppingCart"];

                DataRow drr = dt.Select("pictureId=" + pictureId + " ").FirstOrDefault();

                if (drr != null)
                {
                    dt.Rows.Remove(drr);
                }

                Session["ShoppingCart"] = dt;
            }
            GetCart();
        }

        private void GetCart()
        {
            DataTable dtPicture;
            if (Session["ShoppingCart"] != null)
            {
                dtPicture = (DataTable)Session["ShoppingCart"];
            }
            else
            {
                dtPicture = new DataTable();
            }

            if (dtPicture.Rows.Count > 0)
            {
                DataList1.DataSource = dtPicture;
                DataList1.DataBind();
                checkoutBtn1.Enabled = true;
                cartrowCountLabel.Text = "";
            }
            else
            {
                DataList1.DataSource = null;
                DataList1.DataBind();
                checkoutBtn1.Enabled = false;
                cartrowCountLabel.Text = "Cart is Empty! Please add some art into the cart!";
            }

        }

        protected void CheckoutBtn_Command(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string Id = Membership.GetUser().ProviderUserKey.ToString();
            DateTime date = DateTime.Now;

            string retOrderId = "SELECT orderId FROM [dbo].[Order] WHERE custId='" + Id + "';";
            DataTable dtOrderId = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(retOrderId, con);

            try
            {
                SqlCommand cmd = new SqlCommand("createOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramId1 = new SqlParameter()
                {
                    ParameterName = "@custId",
                    Value = Id
                };
                cmd.Parameters.Add(paramId1);

                SqlParameter paramFirstName = new SqlParameter()
                {
                    ParameterName = "@orderDate",
                    Value = date
                };
                cmd.Parameters.Add(paramFirstName);
                con.Open();
                da.Fill(dtOrderId);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully added order !');</script>");
            }
            catch
            {
                Response.Write("<script>alert('Failed to added order !');</script>");
            }


            string orderId = dtOrderId.Rows[0]["orderId"].ToString();
            DataTable dtPicture = (DataTable)Session["ShoppingCart"];


            for (int i = 0; i < dtPicture.Rows.Count; i++)
            {
                string pictureId = (string)dtPicture.Rows[i]["pictureId"];
                try
                {
                    SqlCommand cmd = new SqlCommand("insertOrderDetail", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter paramId1 = new SqlParameter()
                    {
                        ParameterName = "@orderId",
                        Value = orderId
                    };
                    cmd.Parameters.Add(paramId1);

                    SqlParameter paramFirstName = new SqlParameter()
                    {
                        ParameterName = "@pictureId",
                        Value = pictureId
                    };
                    cmd.Parameters.Add(paramFirstName);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Successfully added order detail !');</script>");
                }
                catch
                {
                    Response.Write("<script>alert('Failed to add order detail !');</script>");
                }
            }
            Session["ShoppingCart"] = null;
            //sendEmail("kangwenn@gmail.com", "Lee Kang Wenn");
            Response.Redirect("PurchaseHistory.aspx");
        }
        private void sendEmail(String toEmail, String toName)
        {
            var fromAddress = new MailAddress("leekw-wp15@student.tarc.edu.my", "National Gallery Singapore");
            var toAddress = new MailAddress(toEmail, toName);
            const string fromPassword = "password";
            const string subject = "Order";
            const string body = "Thanks for shopping with us! Here's your receipt: ";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                Timeout = 20000
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body

            })
            {
                smtp.Send(message);
            }
        }
    }
}