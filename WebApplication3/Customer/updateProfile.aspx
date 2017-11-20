<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" CodeBehind="updateProfile.aspx.cs" Inherits="WebApplication3.Customer.updateProfile" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <h3 style="text-align: center">
                <asp:Label ID="lblHead" runat="server" Text="LABEL"></asp:Label></h3>
            <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name"></asp:TextBox>
            <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>M</asp:ListItem>
                <asp:ListItem>F</asp:ListItem>
            </asp:RadioButtonList>
            <asp:TextBox ID="txtPhoneNum" runat="server" placeholder="Phone Number"></asp:TextBox>

            <ul class="actions">
                <li>
                    <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="Button1_Click" />
                </li>
            </ul>
        </div>
    </div>
</asp:content>
