<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="mia2402.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="jumbotron">
        <h2>Manage Products</h2>
            <p>&nbsp;</p>
            <p>Products ID:
                <asp:Label ID="lblProdID" runat="server"></asp:Label>
            </p>
            <p>Name
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </p>
            <p>Brand
                <asp:TextBox ID="txtBrand" runat="server"></asp:TextBox>
            </p>
            <p>Description
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </p>
            <p>Price
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            </p>
            <p>Category
                <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="dsCategory" DataTextField="name" DataValueField="catID">
                </asp:DropDownList>
            </p>
            <p>Picture<asp:FileUpload ID="fuImage" runat="server" />
                <asp:Label ID="lblFileName" runat="server"></asp:Label>
&nbsp;</p>
            <p>
                <asp:Button ID="btnAdd" runat="server" Height="44px" OnClick="btnAdd_Click" Text="Add" Width="72px" />
                <asp:Button ID="btnUpdate" runat="server" Height="46px" OnClick="btnUpdate_Click" Text="Update" />
                <asp:Button ID="btnDelete" runat="server" Height="46px" OnClick="btnDelete_Click" Text="Delete" />
            &nbsp;&nbsp;
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </p>
            <p>
                &nbsp;</p>
            <p>
                <asp:SqlDataSource ID="dsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:mia2402 %>" SelectCommand="SELECT * FROM [tblCategory]"></asp:SqlDataSource>
            </p>
            <p>
                <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:mia2402 %>" DeleteCommand="DELETE FROM [tblProducts] WHERE [PID] = @PID" InsertCommand="INSERT INTO [tblProducts] ([name], [brand], [description], [picture], [price], [catID]) VALUES (@name, @brand, @description, @picture, @price, @catID)" SelectCommand="SELECT * FROM [tblProducts]" UpdateCommand="UPDATE [tblProducts] SET [name] = @name, [brand] = @brand, [description] = @description, [picture] = @picture, [price] = @price, [catID] = @catID WHERE [PID] = @PID">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="lblProdID" Name="PID" PropertyName="Text" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="brand" Type="String" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="picture" Type="String" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="catID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtBrand" Name="brand" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDescription" Name="description" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="lblFileName" Name="picture" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPrice" Name="price" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="ddlCategory" Name="catID" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="lblProdID" Name="PID" PropertyName="Text" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PID" DataSourceID="dsProducts" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="736px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="PID" HeaderText="PID" InsertVisible="False" ReadOnly="True" SortExpression="PID" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                        <asp:BoundField DataField="picture" HeaderText="picture" SortExpression="picture" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="catID" HeaderText="catID" SortExpression="catID" />
                        <asp:ImageField DataImageUrlField="picture" HeaderText="Picture">
                            <ControlStyle Height="50px" Width="50px" />
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            </p>
            <p>&nbsp;</p>
            </div>
</asp:Content>
