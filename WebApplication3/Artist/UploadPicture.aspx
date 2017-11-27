<%@ Page Language="C#" MasterPageFile="Artist.Master" AutoEventWireup="true" CodeBehind="UploadPicture.aspx.cs" Inherits="WebApplication3.Artist.UploadPicture" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <h2>Upload your art in our platform<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConfigConString %>" SelectCommand="SELECT [pictureData], [price], [pictureName], [pictureDesc], [pictureId], [artistId] FROM [picture]"></asp:SqlDataSource>
                </h2>
            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
            <asp:TextBox ID="txtImgName" runat="server" placeholder="Picture Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtPrice" runat="server" placeholder="Image Price"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtImgDesc" runat="server" placeholder="Picture Description"></asp:TextBox>
            <br />
            <li><asp:LinkButton ID="UploadBtn" class="button special" runat="server" Text="Upload Your Image" CommandArgument='<%#Eval("pictureId") %>' OnClick="UploadBtn_Click"/></li>

            </div>
        </div>
            </asp:content>
