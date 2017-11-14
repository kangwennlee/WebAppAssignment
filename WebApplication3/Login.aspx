<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication3.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container" style="width: 40%">
            <section>
                <h3>Login</h3>
                <div class="row uniform 50%">
                    <div class="12u$">
                        <asp:TextBox ID="txtnameLogin" name="name" runat="server" placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="12u$">
                        <asp:TextBox ID="txtpasswordLogin" TextMode="Password" name="password" runat="server" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="12u$">
                        <asp:HyperLink ID="HyperLink1" runat="server">Forgot your password?</asp:HyperLink>
                    </div>
                    <div class="3u 6u(medium) 12u$(xsmall)">
                        <ul class="actions">
                            <li>
                                <asp:Button ID="LoginBtn" class="button special" runat="server" Text="Login" OnClick="LoginBtn_Click" />
                            </li>
                        </ul>
                    </div>
                    <div class="6u 6u(medium) 12u$(xsmall)">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
