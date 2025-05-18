<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="LOrdCardShop.Views.ProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Profile Page</h1>
        <div>
            <asp:Label runat="server" Text="Username: "></asp:Label>
            <br />
            <asp:TextBox ID="UsernameTb" runat="server" />

            <br />

            <asp:Label runat="server" Text="Email:" />
            <br />
            <asp:TextBox ID="EmailTb" runat="server" />

            <br />

            <asp:Label runat="server" Text="Gender:" />
            <br />
            <asp:DropDownList ID="GenderDdl" runat="server">
                <asp:ListItem Text="--Select Gender--" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>

            <br />

            <asp:Label runat="server" Text="Old Password:" />
            <br />
            <asp:TextBox ID="OldPasswordTb" runat="server" />

            <br />

            <asp:Label runat="server" Text="New Password:" />
            <br />
            <asp:TextBox ID="NewPasswordTb" runat="server" TextMode="Password" />

            <br />

            <asp:Label runat="server" Text="Confirm New Password:" />
            <br />
            <asp:TextBox ID="ConfirmPasswordTb" runat="server" TextMode="Password" />

            <br /> <br />
            <asp:Label ID="ErrorLbl" runat="server" Text=" "></asp:Label> <br />
            <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
        </div>
    </form>
</body>
</html>
