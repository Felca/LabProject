<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="LOrdCardShop.Views.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Welcome, 
            <asp:Label ID="UsernameLbl" runat="server" Text=" "></asp:Label>
            !</h1>
    </div>

    <div>
        <input type="text" name="search" placeholder="Search shows..." value="<%= Request.QueryString["search"] ?? "" %>" />
        <input type="submit" value="Search" />
    </div>

    <div>
        <nav id="NavCustomer" runat="server" visible="false">
            <a href="HomePage.aspx">Home</a>
            <a href="OrderCardPage.aspx">Order Card</a>
            <a href="ProfilePage.aspx">Profile</a>
            <a href="TransactionHistoryPage.aspx">History</a>
            <a href="CartPage.aspx">Cart</a>
            <asp:Button class="LogoutBtn" runat="server" Text="Logout" OnClick="Logout_Click"/>
        </nav>
    </div>

    <div>
        <nav id="NavAdmin" runat="server" visible="false">
            <a href="HomePage.aspx">Home</a>
            <a href="ManageCardPage.aspx">Manage Card</a>
            <a href="ViewTransactionsReport.aspx">View Transaction</a>
            <a href="ViewTransactionsReport.aspx">Transaction Report</a>
            <a href="HandleTransaction.aspx">Order Queue</a>
            <asp:Button class="LogoutBtn" runat="server" Text="Logout" OnClick="Logout_Click"/>
        </nav>
    </div>
    </form>
</body>
</html>
