﻿<%@ Page Language="C#" MasterPageFile="~/Customer/CusMain.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="WebApplication3.Customer.CustomerProfile" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <header class="major">
                <h2>Your Profile</h2>
                <p>You can view your information here</p>
            </header>
            <div class="row 150%">
                <div class="4u 12u$(medium)">

                    <!-- Sidebar -->
                    <section id="sidebar">
                        <section>
                            <h3>
                                <asp:Label ID="TxtUserName" runat="server" Text=""></asp:Label></h3>
                            <p>
                                <asp:Label ID="TxtGender" runat="server" Text=""></asp:Label>
                                <asp:Label ID="TxtPhoneNumber" runat="server" Text=""></asp:Label>
                            </p>
                            <footer>
                                <ul class="actions">
                                    <li><a href="#" class="button">Learn More</a></li>
                                </ul>
                            </footer>
                        </section>
                        <hr />
                        <section>
                            <a href="#" class="image fit">
                                <asp:Image ID="ProfilePic" runat="server"/></a>
                            <h3>Amet Lorem Tempus</h3>
                            <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                            <footer>
                                <ul class="actions">
                                    <li><a href="#" class="button">Learn More</a></li>
                                </ul>
                            </footer>
                        </section>
                    </section>

                </div>
                <div class="8u$ 12u$(medium) important(medium)">

                    <!-- Content -->
                    <section id="content">
                        <a href="#" class="image fit">
                            <img src="images/pic05.jpg" alt="" /></a>
                        <h3>Dolore Amet Consequat</h3>
                        <p>Aliquam massa urna, imperdiet sit amet mi non, bibendum euismod est. Curabitur mi justo, tincidunt vel eros ullamcorper, porta cursus justo. Cras vel neque eros. Vestibulum diam quam, mollis at magna consectetur non, malesuada quis augue. Morbi tincidunt pretium interdum est. Curabitur mi justo, tincidunt vel eros ullamcorper, porta cursus justo. Cras vel neque eros. Vestibulum diam.</p>
                        <p>Vestibulum diam quam, mollis at consectetur non, malesuada quis augue. Morbi tincidunt pretium interdum. Morbi mattis elementum orci, nec dictum porta cursus justo. Quisque ultricies lorem in ligula condimentum, et egestas turpis sagittis. Cras ac nunc urna. Nullam eget lobortis purus. Phasellus vitae tortor non est placerat tristique.</p>
                        <h3>Sed Magna Ornare</h3>
                        <p>In vestibulum massa quis arcu lobortis tempus. Nam pretium arcu in odio vulputate luctus. Suspendisse euismod lorem eget lacinia fringilla. Sed sed felis justo. Nunc sodales elit in laoreet aliquam. Nam gravida, nisl sit amet iaculis porttitor, risus nisi rutrum metus.</p>
                        <ul>
                            <li>Faucibus orci lobortis ac adipiscing integer.</li>
                            <li>Col accumsan arcu mi aliquet placerat.</li>
                            <li>Lobortis vestibulum ut magna tempor massa nascetur.</li>
                            <li>Blandit massa non blandit tempor interdum.</li>
                            <li>Lacinia mattis arcu nascetur lobortis.</li>
                        </ul>
                    </section>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
