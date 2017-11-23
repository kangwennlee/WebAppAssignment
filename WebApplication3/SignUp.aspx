<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="main" class="wrapper style1">
        <div class="container">
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server">
                        <ContentTemplate>
                                <h3 style="text-align: center">Sign Up for your new account</h3>
                                <div class="row uniform 50%">
                                    <div class="12u 12u$(medium)">
                                        <asp:TextBox ID="UserName" name="name" runat="server" placeholder="Username"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="12u 12u$(medium)">
                                        <asp:TextBox ID="Email" TextMode="Email" name="email" runat="server" placeholder="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="12u 12u$(medium)">
                                        <asp:TextBox ID="Password" TextMode="Password" name="password" runat="server" placeholder="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="12u 12u$(medium)">
                                        <asp:TextBox ID="ConfirmPassword" TextMode="Password" name="confirmPassword" runat="server" placeholder="Confirm Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="12u$ 12u$(medium)">
                                        <asp:RadioButtonList ID="UserType" name="UserType" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>Customer</asp:ListItem>
                                            <asp:ListItem>Artist</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="UserType" ErrorMessage="User type is required." ToolTip="User type is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </div>
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </div>
                        </ContentTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep runat="server" />
                </WizardSteps>
            </asp:CreateUserWizard>
        </div>
    </div>
</asp:Content>
