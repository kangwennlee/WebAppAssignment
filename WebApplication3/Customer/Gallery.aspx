<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WebApplication3.Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <header class="major">
                <h2>Welcome back <asp:Label ID="Label1" runat="server" Text=""></asp:Label> !</h2>
                <p>You can view our artworks here</p>
            </header>
            <!-- Image -->

                <h2>Gallery<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConfigConString %>" SelectCommand="SELECT [pictureData], [price], [pictureName], [pictureDesc], [pictureId], [artistId] FROM [picture]"></asp:SqlDataSource>
                </h2>


                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
								<div class="box alt">
									<div class="row 50% uniform">
                                        <div class="12u$">
                                <asp:Image ID="Image1" class="image fit" runat="server"
                                                ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("pictureData")) %>'/>
								            <h3>"<%#Eval("pictureName") %>"</h3>
                                            <h4>RM<%#Eval("price","{0:n}") %></h4>
                                            <p><%#Eval("pictureDesc")%></p>

                                            <ul class="actions">
									            <li><asp:LinkButton ID="addToCartBtn" class="button special" runat="server" Text="Add to cart" CommandArgument='<%#Eval("pictureId") %>' OnCommand="addToCartBtn_Click"/></li>
									            <li><asp:LinkButton ID="wishlistBtn" class="button special" runat="server" Text="Save to wishlist" CommandArgument='<%#Eval("pictureId") %>' OnCommand="WishlistBtn_Click"/></li>
								            </ul>
                                            </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <ItemSeparatorTemplate><hr /></ItemSeparatorTemplate>
                        </asp:ListView>
        </div>
    </div>
</asp:Content>


