<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="customerLogin.aspx.cs" Inherits="mia2402.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Customer Login</h2>
        <p>&nbsp;</p>
        <p>Email Address:
            <asp:TextBox ID="txtEmail" runat="server" Width="232px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please input your email" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>Password:
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="268px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please input your password" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>&nbsp;</p>
        <p>
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" Width="203px" />
        </p>
        <p>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <p>Not yet a member?
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/registration.aspx">Register</asp:HyperLink>
        </p>
    </div>



</asp:Content>
