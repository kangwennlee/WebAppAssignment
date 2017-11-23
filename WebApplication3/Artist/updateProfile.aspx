<%@ Page Language="C#" MasterPageFile="~/Artist/Artist.Master" AutoEventWireup="true" CodeBehind="updateProfile.aspx.cs" Inherits="WebApplication3.Artist.updateProfile" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <h3 style="text-align: center">
                <asp:Label ID="lblHead" runat="server" Text="LABEL"></asp:Label></h3>
            <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name"></asp:TextBox>
            <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
            <asp:TextBox ID="txtBio" runat="server" placeholder="Biobibliography" TextMode="MultiLine"></asp:TextBox>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
            

            <ul class="actions">
                <li>
                    <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="Button1_Click" />
                </li>
            </ul>
        </div>
    </div>
</asp:content>
