<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="customerManageOrders.aspx.cs" Inherits="mia2402.customerManageOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Customer: Manage Orders</h2>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SCID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="SCID" HeaderText="SCID" InsertVisible="False" ReadOnly="True" SortExpression="SCID" />
                <asp:BoundField DataField="CID" HeaderText="CID" SortExpression="CID" />
                <asp:BoundField DataField="PID" HeaderText="PID" SortExpression="PID" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="paymentStatus" HeaderText="paymentStatus" SortExpression="paymentStatus" />
                <asp:BoundField DataField="deliveryStatus" HeaderText="deliveryStatus" SortExpression="deliveryStatus" />
                <asp:BoundField DataField="dtAdded" HeaderText="dtAdded" SortExpression="dtAdded" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mia2402 %>" SelectCommand="SELECT SCID, CID, PID, quantity, price, paymentStatus, deliveryStatus, dtAdded FROM tblShoppingCart WHERE (paymentStatus = 'PAID') AND (deliveryStatus = 'PENDING') AND (CID = @cid)">
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="CID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>


</asp:Content>
