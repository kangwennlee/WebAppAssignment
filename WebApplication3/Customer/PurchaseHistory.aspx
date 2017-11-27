<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="WebApplication3.Customer.WebForm1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <asp:DataList ID="DataList1" runat="server">
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
                    <tr>
                        <td><%#Eval("orderId")%></td>
                        <td><%#Eval("pictureId")%></td>
                        <td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
