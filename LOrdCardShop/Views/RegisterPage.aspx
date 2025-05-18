<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="LOrdCardShop.Views.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Register Page</h1>
            <br />

            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <br />
            <asp:TextBox ID="UsernameTb" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="EmailTb" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="PasswordTb" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
            <br />
            <asp:DropDownList ID="GenderDdl" runat="server">
                <asp:ListItem Value="" Text="-- Select a Gender --"></asp:ListItem>
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
            </asp:DropDownList>
            <br />

            <asp:Label ID="Label5" runat="server" Text="Confirmation Password"></asp:Label>
            <br />
            <asp:TextBox ID="ConfirmTb" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label6" runat="server" Text="Role"></asp:Label>
            <br />
            <asp:TextBox ID="RoleTb" runat="server"></asp:TextBox>
            <br />


            <asp:Label ID="ErrorLbl" runat="server" Text=" "></asp:Label>
            <br />
            
            <asp:Button ID="RegisterBtn" runat="server" Text="Register" OnClick="RegisterBtn_Click"/>

        </div>
    </form>
</body>
</html>
