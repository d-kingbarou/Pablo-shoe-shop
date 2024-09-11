<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="catalog.aspx.cs" Inherits="mia2402.catalogue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Product Catalogue</h2>
        <p>
            <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:mia2402 %>" SelectCommand="SELECT * FROM [tblProducts]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="PID" 
                DataSourceID="dsProducts" RepeatColumns="4" RepeatDirection="Horizontal" 
                OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>

                    <asp:Image ID="Image1" runat="server" Height="100" Width="150" ImageUrl='<%# Eval("picture") %>' />
                    <br />
                    PID:
                    <asp:Label ID="PIDLabel" runat="server" Text='<%# Eval("PID") %>' />
                    <br />
                    Name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    <br />
                    Brand:
                    <asp:Label ID="brandLabel" runat="server" Text='<%# Eval("brand") %>' />
                    <br />
                    Price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    <br />
                    <asp:Button ID="btnDetails" runat="server" CommandName="details" Text="Details" />
<br />
                </ItemTemplate>
            </asp:DataList>
        </p>
        </div>
</asp:Content>
