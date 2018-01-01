using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.Customer
{
    public partial class paymentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String creditCardType = rbCreditCardType.SelectedItem.Value;
            if (creditCardType == "Visa")
            {
                RegularExpressionValidator2.ValidationExpression = "^4[0-9]{13}";
            }
            else if (creditCardType == "Master")
            {
                RegularExpressionValidator2.ValidationExpression = "^5[0-9]{13}";
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Write("<script>alert('Payment Successful !');</script>");
                Response.Redirect("PurchaseHistory.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Payment Failed !');</script>");
            }
        }
    }
}