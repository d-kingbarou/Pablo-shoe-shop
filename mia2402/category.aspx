<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="mia2402.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
        <h2>Manage Category</h2>
            <p>&nbsp;</p>
            <p>ID:
                <asp:Label ID="lblcatID" runat="server"></asp:Label>
            </p>
            <p>Name
                <asp:TextBox ID="txtName" runat="server" Width="359px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Please input a category name." ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>Description
                <asp:TextBox ID="txtDescription" runat="server" OnTextChanged="TextBox2_TextChanged" Width="316px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="Please input the description." ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>&nbsp;</p>
            <p>
                <asp:Button ID="btnAdd" runat="server" Height="44px" OnClick="btnAdd_Click" Text="Add" Width="72px" />
                <asp:Button ID="btnUpdate" runat="server" Height="46px" OnClick="btnUpdate_Click" Text="Update" />
                <asp:Button ID="btnDelete" runat="server" Height="46px" OnClick="btnDelete_Click" Text="Delete" />
            </p>
            <p>&nbsp;</p>
            <p>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mia2402 %>" DeleteCommand="DELETE FROM [tblCategory] WHERE [catID] = @catID" InsertCommand="INSERT INTO [tblCategory] ([name], [description]) VALUES (@name, @description)" SelectCommand="SELECT * FROM [tblCategory]" UpdateCommand="UPDATE [tblCategory] SET [name] = @name, [description] = @description WHERE [catID] = @catID">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="lblcatID" Name="catID" PropertyName="Text" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDescription" Name="description" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDescription" Name="description" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="lblcatID" Name="catID" PropertyName="Text" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                <asp:Label ID="lblMessage" runat="server" ForeColor="#00CC00"></asp:Label>
            </p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="catID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="539px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="catID" HeaderText="catID" InsertVisible="False" ReadOnly="True" SortExpression="catID" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </p>
    
    <p>
        &nbsp;</p>
            </div>
</asp:Content>
