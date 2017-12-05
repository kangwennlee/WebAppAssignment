<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="WebApplication3.Customer.WebForm1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConfigConString %>" SelectCommand="SELECT * FROM [dbo].[OrderDetail] d,[dbo].[Order] o WHERE o.orderId = d.orderId AND o.custId = @Id;">
        <SelectParameters>
            <asp:SessionParameter Name="Id" SessionField="memberId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="main" class="wrapper style1">
        <div class="container">
            <table>
                
            <asp:DataList ID="DataList1" runat="server" DataKeyField="orderId" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>OrderId</th>
                            <th>PictureId</th>
                            <th>Price(RM)</th>
                            <th></th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    orderId:
                    <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
                    <br />
                    pictureId:
                    <asp:Label ID="pictureIdLabel" runat="server" Text='<%# Eval("pictureId") %>' />
                    <br />
                    quantity:
                    <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                    <br />
                    orderId1:
                    <asp:Label ID="orderId1Label" runat="server" Text='<%# Eval("orderId1") %>' />
                    <br />
                    custId:
                    <asp:Label ID="custIdLabel" runat="server" Text='<%# Eval("custId") %>' />
                    <br />
                    orderDate:
                    <asp:Label ID="orderDateLabel" runat="server" Text='<%# Eval("orderDate") %>' />
                    <br />
                    orderPrice:
                    <asp:Label ID="orderPriceLabel" runat="server" Text='<%# Eval("orderPrice") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
                
            </table>
        </div>
    </div>
</asp:Content>
