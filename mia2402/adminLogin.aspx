<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="mia2402.adminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
        <h2>Admin Login</h2>
        <p>&nbsp;</p>
        <p>Email Address:
            <asp:TextBox ID="txtEmail" runat="server" Width="232px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please input your email" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>Password:
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="268px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please input your password" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
            <p>
                <asp:Button ID="btnLogin" runat="server" OnClick="Button1_Click" Text="Login" />
        </p>
        </div>
</asp:Content>
