<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="WebApplication3.Role" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Role Manager</h1>
            Add Role:
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <p>
                <asp:Button ID="Button1" runat="server" Text="Add Role to Application"
                    OnClick="Button1_Click" />
            </p>
            Role Defined:
            <br />
            <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
            <asp:Button ID="DeleteButton" runat="server"
                Text="Delete Role" OnClick="DeleteButton_Click" />
            <p>
                Roles:
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"
                    Text="Get Users in Role" />
            </p>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Delete User" />
            <br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </div>
    </form>
</body>
</html>
