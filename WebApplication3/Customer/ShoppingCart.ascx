<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.ascx.cs" Inherits="WebApplication3.Customer.WebUserControl1" %>
<table>
    <asp:DataList ID="DataList1" runat="server">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Picture</th>
                    <th>Picture Name</th>
                    <th>Price(RM)</th>
                    <th></th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>

                <td style="width: 200px;"><span class="image fit">
                    <asp:Image ID="Image1" runat="server"
                        ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("pictureData")) %>' /></span></td>
                <td><%#Eval("pictureName")%></td>
                <td><%#Eval("price","{0:n}")%></td>
                <td>
                    <asp:LinkButton ID="removeBtn" class="button special" runat="server" Text="Remove" CommandArgument='<%#Eval("pictureId") %>' OnCommand="RemoveCart_Click" /></td>
            </tr>
        </ItemTemplate>
    </asp:DataList>
    <tr>
        <td>
            <asp:Label ID="cartrowCountLabel" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="checkoutBtn1" runat="server" Text="Checkout" class="button special" OnClick="CheckoutBtn_Command" /></td>
    </tr>
</table>
