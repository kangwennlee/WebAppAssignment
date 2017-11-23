<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadImage.aspx.cs" Inherits="WebApplication3.Customer.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        name<br />
        <br />
        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        price<br />
        <br />
        <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
        desc<p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />
        </p>
        <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>
    </form>
</body>
</html>
