<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="mia2402.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Checkout</h2>
    <p>&nbsp;</p>
    <p>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="CID" DataSourceID="dsShoppingCart" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <HeaderTemplate>
                <table>
                    <tr>
                        <td>Image</td>
                        <td>Name</td>
                        <td>Quantity</td>
                        <td>Price</td>
                        <td>Subtotal</td
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("picture") %>' Height="100" Width="100"/>
                    </td>
                    <td>
                        <h4>
                            <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                        </h4>
                        <asp:Label ID="lblSCID" runat="server" Text='<%# Eval("scid") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblQTY" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                    </td>
                    <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price", "{0:c}") %>' />
                    </td>
                    <td>
                    <asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal", "{0:c}") %>' />
                    </td>
                  </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:DataList>

        <h2>Grand Total : <asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label></h2>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

        <asp:SqlDataSource ID="dsShoppingCart" runat="server" ConnectionString="<%$ ConnectionStrings:mia2402 %>" SelectCommand="SELECT sc.scid, p.picture, p.name, sc.quantity, sc.price, sc.quantity * sc.price AS subtotal, c.CID FROM tblCustomers AS c INNER JOIN tblShoppingCart AS sc ON c.CID = sc.CID INNER JOIN tblProducts AS p ON sc.PID = p.PID WHERE (sc.paymentStatus = 'PENDING') AND (c.CID = @CID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="CID" SessionField="cid" />
            </SelectParameters>
        </asp:SqlDataSource>
    <h2><a href="shoppingCart.aspx">Back to Cart</a></h2>
    <p>
        <asp:Button ID="btnPay" runat="server" Font-Size="Large" OnClick="btnPay_Click" Text="Pay now" />
    </p>
</asp:Content>
