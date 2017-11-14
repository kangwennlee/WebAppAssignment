<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="WebApplication3.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True" SortExpression="userID" />
                <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
                <asp:BoundField DataField="userType" HeaderText="userType" SortExpression="userType" />
                <asp:BoundField DataField="userEmail" HeaderText="userEmail" SortExpression="userEmail" />
                <asp:BoundField DataField="userPassword" HeaderText="userPassword" SortExpression="userPassword" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConfigConString %>" SelectCommand="SELECT * FROM [webUser]" DeleteCommand="DELETE FROM [webUser] WHERE [userID] = @userID" InsertCommand="INSERT INTO [webUser] ([userID], [userName], [userType], [userEmail], [userPassword]) VALUES (@userID, @userName, @userType, @userEmail, @userPassword)" UpdateCommand="UPDATE [webUser] SET [userName] = @userName, [userType] = @userType, [userEmail] = @userEmail, [userPassword] = @userPassword WHERE [userID] = @userID">
            <DeleteParameters>
                <asp:Parameter Name="userID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userID" Type="Int32" />
                <asp:Parameter Name="userName" Type="String" />
                <asp:Parameter Name="userType" Type="String" />
                <asp:Parameter Name="userEmail" Type="String" />
                <asp:Parameter Name="userPassword" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="userName" Type="String" />
                <asp:Parameter Name="userType" Type="String" />
                <asp:Parameter Name="userEmail" Type="String" />
                <asp:Parameter Name="userPassword" Type="String" />
                <asp:Parameter Name="userID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>

        </div>
    </form>
</body>
</html>
