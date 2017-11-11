<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <section>
                <h3 style="text-align: center">Sign Up</h3>
                <div class="row uniform 50%">
                    <div class="6u 12u$(xsmall)">
                        <asp:TextBox ID="name" name="name" runat="server" placeholder="Name"></asp:TextBox>
                    </div>
                    <div class="6u 12u$(xsmall)">
                        <asp:TextBox ID="email" name="email" runat="server" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="6u 12u$(xsmall)">
                        <asp:TextBox ID="password" TextMode="Password" name="password" runat="server" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="6u 12u$(xsmall)">
                        <asp:TextBox ID="confirmPassword" TextMode="Password" name="confirmPassword" runat="server" placeholder="Confirm Password"></asp:TextBox>
                    </div>
                    <div class="12u$">
                        <div class="select-wrapper">
                            <asp:DropDownList ID="category" name="category" runat="server">
                                <asp:ListItem Selected="True">- Category -</asp:ListItem>
                                <asp:ListItem Value="1">Student</asp:ListItem>
                                <asp:ListItem Value="1">Businessman</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="4u 12u$(medium)">
                        <input type="radio" id="priority-low" name="priority" checked>
                        <label for="priority-low">Low Priority</label>
                    </div>
                    <div class="4u 12u$(medium)">
                        <input type="radio" id="priority-normal" name="priority">
                        <label for="priority-normal">Normal Priority</label>
                    </div>
                    <div class="4u$ 12u$(medium)">
                        <input type="radio" id="priority-high" name="priority">
                        <label for="priority-high">High Priority</label>
                    </div>
                    <div class="6u 12u$(medium)">
                        <input type="checkbox" id="copy" name="copy">
                        <label for="copy">Email me a copy of this message</label>
                    </div>
                    <div class="6u$ 12u$(medium)">
                        <input type="checkbox" id="human" name="human" checked>
                        <label for="human">I am a human and not a robot</label>
                    </div>
                    <div class="12u$">
                        <textarea name="message" id="message" placeholder="Enter your message" rows="6"></textarea>
                    </div>
                    <div class="12u$">
                        <ul class="actions">
                            <li>
                                <input type="submit" value="Send Message" class="special" /></li>
                            <li>
                                <input type="reset" value="Reset" /></li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
