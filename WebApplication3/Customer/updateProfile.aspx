<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" CodeBehind="updateProfile.aspx.cs" Inherits="WebApplication3.Customer.updateProfile" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <h3 style="text-align: center">
                <asp:Label ID="lblHead" runat="server" Text="LABEL"></asp:Label></h3>
            <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Name is required." ToolTip="Name is required." ValidationGroup="Profile1">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" ControlToValidate="txtLastName" ErrorMessage="Name is required." ToolTip="Name is required." ValidationGroup="Profile1">*</asp:RequiredFieldValidator>
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
            <asp:TextBox ID="txtPhoneNum" runat="server" placeholder="Phone Number"></asp:TextBox>
            <br /><br />
            <asp:Label ID="Label1" runat="server" Text="Profile Picture:"></asp:Label>   
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br /><br />
            <ul class="actions">
                <li>
                    <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="Button1_Click" ValidationGroup="Profile1"/>
                </li>
            </ul>
        </div>
    </div>
</asp:content>
