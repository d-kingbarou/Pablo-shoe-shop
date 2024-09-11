<%@ Page Title="Thank You" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="thankyouPayment.aspx.cs" Inherits="mia2402.thankyouPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thankyou-container">
        <div class="thankyou-message">
            <h1>Thank You for Your Payment!</h1>
            <p>Your transaction has been successfully completed.</p>
            <p>We appreciate your business and hope to see you again soon.</p>

            
            <asp:Button ID="btnHome" runat="server" Text="Go to Homepage" CssClass="btn-home" OnClick="btnHome_Click" />
        </div>
    </div>

<style>
    .thankyou-container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 80vh;
        background-color: #f4f4f9;
    }

    .thankyou-message {
        text-align: center;
        background-color: white;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 500px;
        width: 100%;
    }

    .thankyou-message h1 {
        color: #4CAF50; /* Green color */
        font-size: 2.5em;
        margin-bottom: 20px;
    }

    .thankyou-message p {
        font-size: 1.2em;
        color: #333;
        margin-bottom: 20px;
    }

    .btn-home {
        display: inline-block;
        padding: 12px 24px;
        font-size: 1.1em;
        color: white;
        background-color: #4CAF50; /* Green color */
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .btn-home:hover {
        background-color: #45a049; /* Darker green on hover */
    }
</style>
</asp:Content>