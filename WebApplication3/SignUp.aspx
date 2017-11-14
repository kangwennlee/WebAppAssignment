<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <section>
                <h3 style="text-align: center">Sign Up</h3>
                <div class="row uniform 50%">
                    <div class="6u 12u$(medium)">
                        <asp:TextBox ID="txtname" name="name" runat="server" placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="6u 12u$(medium)">
                        <asp:TextBox ID="txtemail" name="email" runat="server" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="6u 12u$(medium)">
                        <asp:TextBox ID="txtpassword" TextMode="Password" name="password" runat="server" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="6u 12u$(medium)">
                        <asp:TextBox ID="txtconfirmPassword" TextMode="Password" name="confirmPassword" runat="server" placeholder="Confirm Password"></asp:TextBox>
                    </div>
                    <div class="12u$ 12u$(medium)">
                        <asp:RadioButtonList ID="userType" runat="server" AutoPostBack="true" RepeatDirection="Horizontal">
                            <asp:ListItem>Customer</asp:ListItem>
                            <asp:ListItem>Artist</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="6u 12u$(medium)">
                        <asp:CheckBox ID="term" runat="server" Text="I agree with the terms and conditions."/>
                    </div>
                    <div class="12u$">
                        <ul class="actions">
                            <li>
                                <asp:Button ID="SignUpBtn" runat="server" Text="Sign Up" class="special" OnClick="SignUpBtn_Click" />
                                </li>
                            <li>
                                <input type="reset" value="Reset" /></li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
