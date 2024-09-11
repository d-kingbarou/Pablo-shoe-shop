<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="mia2402._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>
            <asp:Label ID="lblMessage" align="centre" runat="server"></asp:Label>
        </h1>
        <p class="lead">Step Up in Style – Handmade Elegance for Every Occasion.</p>
        <p>&nbsp;</p>
        <p>
            <asp:HyperLink ID="hypRegister" runat="server" NavigateUrl="~/registration.aspx">Register</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="hypLogin" runat="server" NavigateUrl="~/login.aspx">Login</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="hypMProfile" runat="server" NavigateUrl="~/manageProfile.aspx">Manage Profile</asp:HyperLink>
        </p>
        <p>
            <asp:Button ID="btnLogout" runat="server" OnClick="Button1_Click" Text="Logout" />
        </p>
        <p>
            <a href="shoppingCart.aspx">Shopping Cart</a></p>
        <p>
            &nbsp;</p>
        <p>&nbsp;</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
