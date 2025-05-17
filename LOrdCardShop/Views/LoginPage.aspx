<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="LOrdCardShop.Views.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Login Page</h1>
            <br />

            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <br />
            <asp:TextBox ID="UsernameTb" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="PasswordTb" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="ErrorLbl" runat="server" Text=" "></asp:Label>
            <br />
            <asp:CheckBox ID="RememberMeCb" runat="server" Text ="Remember Me"/>
            <br />
            <asp:Button ID="LoginBtn" runat="server" Text="Login" />

        </div>
    </form>
</body>
</html>
