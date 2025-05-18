using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LOrdCardShop.Models;

namespace LOrdCardShop.Views
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        DatabaseEntities1 db = new DatabaseEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null || Request.Cookies["user_cookie"] != null)
            {
                Response.Redirect("HomePage.aspx");
            }
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            string username = UsernameTb.Text;
            string email = EmailTb.Text;
            string password = PasswordTb.Text;
            string confirmPassword = ConfirmTb.Text;
            string gender = GenderDdl.SelectedValue;
            string role = "customer";

            if (username == null || email == null || password == null || confirmPassword == null || gender == null)
            {
                ErrorLbl.Text = "All field is required.";
                return;
            }

            if (username.Length < 5 || username.Length > 30 || !Regex.IsMatch(username, @"^[A-Za-z\s]+$"))
            {
                ErrorLbl.Text = "Username must be between 5 and 30 letters, contains alphabets or space only";
                return;
            }

            if (!email.Contains("@") || email.Length < 3)  // basic check
            {
                ErrorLbl.Text = "Email must contain '@'.";
                return;
            }

            if (password.Length < 8 || !Regex.IsMatch(password, @"^[A-Za-z0-9]+$"))
            {
                ErrorLbl.Text = "Password must be at least 8 chars and alphanumeric.";
                return;
            }

            if (string.IsNullOrEmpty(gender))
            {
                ErrorLbl.Text = "Gender must not be empty.";
                return;
            }

            if (!confirmPassword.Equals(password))
            {
                ErrorLbl.Text = "Confirmation password must match password.";
                return;
            }

            // Save to your database here
            User newUser = new User();

            newUser.UserName = username;
            newUser.UserEmail = email;
            newUser.UserPassword = password;
            newUser.UserGender = gender;
            newUser.UserRole = role;

            db.Users.Add(newUser);
            db.SaveChanges();

            Response.Redirect("LoginPage.aspx");
        }
    }
}