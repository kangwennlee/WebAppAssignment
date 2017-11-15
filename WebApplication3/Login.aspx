<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication3.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container" style="width: 40%">
            <section>
                <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Customer/Profile.aspx">
                    <LayoutTemplate>
                        <h3>Login</h3>
                        <div class="row uniform 50%">
                            <div class="12u$">
                                <asp:TextBox ID="UserName" name="name" runat="server" placeholder="Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="12u$">
                                <asp:TextBox ID="Password" TextMode="Password" name="password" runat="server" placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="12u$">
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                            </div>
                            <div class="12u$">
                                <asp:HyperLink ID="HyperLink1" runat="server">Forgot your password?</asp:HyperLink>
                            </div>
                            <div class="3u 6u(medium) 12u$(xsmall)">
                                <ul class="actions">
                                    <li>
                                        <asp:Button ID="LoginButton" class="button special" runat="server" Text="Login" CommandName="Login" ValidationGroup="Login1" />
                                    </li>
                                </ul>
                            </div>
                            <div class="6u 6u(medium) 12u$(xsmall)">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </div>
                        </div>
                    </LayoutTemplate>
                </asp:Login>
            </section>
        </div>
    </div>
</asp:Content>
