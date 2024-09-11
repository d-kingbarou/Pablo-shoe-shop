<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="mia2402.productDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Product Details
            </h2>
        <p>&nbsp;</p>
        <p>
            <asp:Image ID="Image1" runat="server" Height="400" Width="500px" />
        </p>
<p>
            Name:
            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
        </p>
<p>
            Brand:
            <asp:Label ID="lblBrand" runat="server" Text="Label"></asp:Label>
        </p>
<p>
            Description:
            <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label>
        </p>
<p>
            Price:
            <asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
        </p>
<p>
            Quanitity:
            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number">1</asp:TextBox>
        </p>
<p>
            <asp:Button ID="btnAddToCard" runat="server" OnClick="btnAddToCard_Click" Text="Add To Cart" />
&nbsp;<asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </p>
<p>
            <a href="catalog.aspx">Continue Shopping</a></p>
<p>
            &nbsp;</p>
<p>
            &nbsp;</p>
</asp:Content>
