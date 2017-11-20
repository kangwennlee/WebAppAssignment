<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="WebApplication3.Customer.WishList" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image1" class="image fit" runat="server" height="200px" Width="200px"
                                            ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("pictureData")) %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="pictureName" HeaderText="pictureName" SortExpression="pictureName" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                </Columns>
            </asp:GridView>
            
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            
            
        </div>
     </div>
</asp:content>