<%@ Page Language="C#" MasterPageFile="Artist.Master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="WebApplication3.ArtistProfile" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    
                    
                    <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                    <asp:BoundField DataField="bio" HeaderText="Bio" SortExpression="bio" />
                    <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                
                </Columns>
                   
                    
            </asp:GridView>
            <li><asp:LinkButton ID="EditBtn" class="button special" runat="server" Text="Edit Profile" CommandArgument='<%#Eval("pictureId") %>' OnClick="EditBtn_Click"/></li>
            
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConfigConString %>" SelectCommand="SELECT [pictureData], [pictureName], [price] FROM [picture]"></asp:SqlDataSource>
            
            
        </div>
     </div>
</asp:content>
