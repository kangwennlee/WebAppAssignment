<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" AutoEventWireup="true" CodeBehind="paymentPage.aspx.cs" Inherits="WebApplication3.Customer.paymentPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div id="main" class="wrapper style1">
        <div class="container">
    Payment Information <br />
    Please enter your credit card information below and click Submit.
    <table>
        <tr>
            <td>Credit Card Accepted</td>
            <td><div style="float:left"><asp:RadioButtonList ID="rbCreditCardType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem>Visa</asp:ListItem>
                    <asp:ListItem>Master</asp:ListItem>
                </asp:RadioButtonList></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Credit Card Type is required" ControlToValidate="rbCreditCardType" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        <tr>
            <td>Credit Card Number:</td>
            <td><div style="float:left"><asp:TextBox ID="txtCreditCardNum" runat="server"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Credit Card Number is required" ControlToValidate="txtCreditCardNum" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Credit Card Number" ControlToValidate="txtCreditCardNum" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Expiry Date (MM)</td>
            <td><div><div style="float:left"><asp:DropDownList ID="ddlEDmonth" runat="server">
                <asp:ListItem>01</asp:ListItem>
                <asp:ListItem>02</asp:ListItem>
                <asp:ListItem>03</asp:ListItem>
                <asp:ListItem>04</asp:ListItem>
                <asp:ListItem>05</asp:ListItem>
                <asp:ListItem>06</asp:ListItem>
                <asp:ListItem>07</asp:ListItem>
                <asp:ListItem>08</asp:ListItem>
                <asp:ListItem>09</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Expiry Month is required" ControlToValidate="ddlEDmonth" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator> </div> <div style="float:left">  /  </div> <div style="float:left"><asp:DropDownList ID="ddlEDyear" runat="server">
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
                <asp:ListItem>22</asp:ListItem>
                <asp:ListItem>23</asp:ListItem>
                <asp:ListItem>24</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Expiry year is required" ControlToValidate="ddlEDyear" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></div></div></td>
        </tr>
        <tr>
            <td>CVV</td>
            <td><div style="float:left"><asp:TextBox ID="txtCVV" runat="server"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="CVV is required" ControlToValidate="txtCVV" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>Name On Card (Optional)</td>
            <td><div style="float:left"><asp:TextBox ID="txtNameOnCard" runat="server"></asp:TextBox></div></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="submitBtn" runat="server" Text="Submit" CssClass="button special" OnClick="submitBtn_Click"/></td>
        </tr>
    </table>
            </div>
            </div>
</asp:Content>
