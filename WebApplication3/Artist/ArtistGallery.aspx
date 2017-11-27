<%@ Page Language="C#" MasterPageFile="Artist.Master" AutoEventWireup="true" CodeBehind="ArtistGallery.aspx.cs" Inherits="WebApplication3.Artist.ArtistGallery" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="Image1" class="image fit" runat="server" height="200px" Width="400px" 
                                            ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("pictureData")) %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="pictureName" HeaderText="Picture Name" SortExpression="pictureName" />
                    <asp:BoundField DataField="pictureDesc" HeaderText="Picture Description" SortExpression="pictureDesc" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                
                </Columns>
                   
                    
            </asp:GridView>
            
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConfigConString %>" SelectCommand="SELECT [pictureData], [pictureName], [price] FROM [picture]"></asp:SqlDataSource>
            
            
        </div>
     </div>
</asp:content>