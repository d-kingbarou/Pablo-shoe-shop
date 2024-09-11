<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manageDelivery.aspx.cs" Inherits="MIA2402.manageDelivery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Delivery</h2>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mia2402 %>" SelectCommand="SELECT * FROM tblShoppingCart 
WHERE paymentStatus='PAID' 
	AND deliveryStatus='PENDING' 
"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cid">
        <Columns>
            <asp:BoundField DataField="cid" HeaderText="CID" />
            <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" />
            <asp:BoundField DataField="PaymentStatus" HeaderText="Payment Status" />
            <asp:BoundField DataField="DeliveryStatus" HeaderText="Delivery Status" />
            <asp:BoundField DataField="OrderCount" HeaderText="Order Count" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="Pending" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Out for Delivery" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Delivered" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />

</asp:Content>
