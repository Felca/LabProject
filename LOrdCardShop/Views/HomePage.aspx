<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="LOrdCardShop.Views.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <div>
        <h1>Welcome, 
            <asp:Label ID="UsernameLbl" runat="server" Text=" "></asp:Label>
            !</h1>
    </div>

    <form method="get" action="Home.aspx" style="display:inline;">
        <input type="text" name="search" placeholder="Search shows..." value="<%= Request.QueryString["search"] ?? "" %>" />
        <input type="submit" value="Search" />
    </form>

    <div>
        <nav id="NavCustomer" runat="server" visible="false">
            <a href="HomePage.aspx">Home</a>
            <a href="HomePage.aspx">Order Card</a>
            <a href="HomePage.aspx">Profile</a>
            <a href="HomePage.aspx">History</a>
            <a href="LoginPage.aspx">Logout</a>
            <a>Cart</a>
        </nav>
    </div>

    <div>
        <nav id="NavAdmin" runat="server" visible="false">
            <a>Home</a>
            <a>Manage Card</a>
            <a>View Transaction</a>
            <a>Transaction Report</a>
            <a>Logout</a>
            <a>Order Queue</a>
        </nav>
    </div>

</body>
</html>
