<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="WebApplication3.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerName" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" ReadOnly="True" SortExpression="CustomerName" />
                <asp:BoundField DataField="CustomerPassword" HeaderText="CustomerPassword" SortExpression="CustomerPassword" />
                <asp:BoundField DataField="CustomerEmail" HeaderText="CustomerEmail" SortExpression="CustomerEmail" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConfigConString %>" SelectCommand="SELECT * FROM [Customer]" DeleteCommand="DELETE FROM [Customer] WHERE [CustomerName] = @CustomerName" InsertCommand="INSERT INTO [Customer] ([CustomerName], [CustomerPassword], [CustomerEmail]) VALUES (@CustomerName, @CustomerPassword, @CustomerEmail)" UpdateCommand="UPDATE [Customer] SET [CustomerPassword] = @CustomerPassword, [CustomerEmail] = @CustomerEmail WHERE [CustomerName] = @CustomerName">
            <DeleteParameters>
                <asp:Parameter Name="CustomerName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="CustomerPassword" Type="String" />
                <asp:Parameter Name="CustomerEmail" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerPassword" Type="String" />
                <asp:Parameter Name="CustomerEmail" Type="String" />
                <asp:Parameter Name="CustomerName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>

        </div>
    </form>
</body>
</html>
