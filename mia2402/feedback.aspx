<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="mia2402.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Feedback Form</h2>
        <p>&nbsp;</p>
        <p>Name
            <asp:TextBox ID="txtFeedbackName" runat="server" Width="245px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFeedbackName" ErrorMessage="Please input your name" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>Email&nbsp;
            <asp:TextBox ID="txtFeedbackEmail" runat="server" OnTextChanged="TextBox2_TextChanged" Width="245px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFeedbackEmail" ErrorMessage="Please input your email" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>Subject
            <asp:TextBox ID="txtFeedbackSubject" runat="server" Width="245px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFeedbackSubject" ErrorMessage="Please input a subject" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>Message
            <asp:TextBox ID="txtFeedbackMessage" runat="server" Height="105px" TextMode="MultiLine" Width="284px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFeedbackMessage" ErrorMessage="Please input your message" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblDtadded" runat="server"></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send Feedback" />
        </p>
        <p>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mia2402 %>" DeleteCommand="DELETE FROM [tblFeedback] WHERE [FID] = @FID" InsertCommand="INSERT INTO [tblFeedback] ([name], [email], [subject], [message], [dtadded]) VALUES (@name, @email, @subject, @message, @dtadded)" SelectCommand="SELECT * FROM [tblFeedback]" UpdateCommand="UPDATE [tblFeedback] SET [name] = @name, [email] = @email, [subject] = @subject, [message] = @message, [dtadded] = @dtadded WHERE [FID] = @FID">
            <DeleteParameters>
                <asp:Parameter Name="FID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtFeedbackName" Name="name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtFeedbackEmail" Name="email" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtFeedbackSubject" Name="subject" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtFeedbackMessage" Name="message" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="lblDtadded" Name="dtadded" PropertyName="Text" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="subject" Type="String" />
                <asp:Parameter Name="message" Type="String" />
                <asp:Parameter Name="dtadded" Type="DateTime" />
                <asp:Parameter Name="FID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyField="FID" DataSourceID="SqlDataSource1" GridLines="Both">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <ItemStyle BackColor="White" ForeColor="#330099" />
            <ItemTemplate>
                FID:
                <asp:Label ID="FIDLabel" runat="server" Text='<%# Eval("FID") %>' />
                <br />
                name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                subject:
                <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' />
                <br />
                message:
                <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' />
                <br />
                dtadded:
                <asp:Label ID="dtaddedLabel" runat="server" Text='<%# Eval("dtadded") %>' />
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        </asp:DataList>
        <br />
    </div>

</asp:Content>
