<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="WebApplication3.Customer.WishList" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <!-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
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
            
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource> -->

            <asp:ListView ID="ListView1" runat="server">
                            <ItemTemplate>
								<div class="box alt">
									<div class="row 50% uniform">
                                        <div class="12u$">
                                <asp:Image ID="Image1" class="image fit" runat="server"
                                                ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("pictureData")) %>'/>
								            <h3>"<%#Eval("pictureName") %>"</h3>
                                            <h4>RM<%#Eval("price","{0:n}") %></h4>

                                            <ul class="actions">
									            <li><asp:LinkButton ID="addToCartBtn" class="button special" runat="server" Text="Add to cart" CommandArgument='<%#Eval("pictureId") %>' OnCommand="addToCartBtn_Click"/></li>
									            <li><asp:LinkButton ID="removeBtn" class="button special" runat="server" Text="Remove" CommandArgument='<%#Eval("wishId") %>' OnCommand="removeBtn_Click"/></li>
								            </ul>                                            </div>                                    </div>
                                </div>
                            </ItemTemplate>
                            <ItemSeparatorTemplate><hr /></ItemSeparatorTemplate>
                        </asp:ListView>
            
            
        </div>
     </div>
</asp:content>