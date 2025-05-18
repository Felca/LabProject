using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LOrdCardShop.Models;

namespace LOrdCardShop.Views
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        DatabaseEntities1 db = new DatabaseEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var loggedInUser = Session["user"] as User;

                UsernameTb.Text = loggedInUser.UserName;
                EmailTb.Text = loggedInUser.UserEmail;
                GenderDdl.SelectedValue = loggedInUser.UserGender;
                OldPasswordTb.Text = loggedInUser.UserPassword;
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            var user = Session["user"] as User;

            string username = UsernameTb.Text;
            string email = EmailTb.Text;
            string gender = GenderDdl.SelectedValue;
            string oldPass = OldPasswordTb.Text;
            string newPass = NewPasswordTb.Text;
            string confirmPass = ConfirmPasswordTb.Text;

            if (!Regex.IsMatch(username, @"^[A-Za-z ]{5,30}$"))
            {
                ErrorLbl.Text = "Username must be 5–30 characters and letters only.";
                return;
            }

            if (!email.Contains("@"))
            {
                ErrorLbl.Text = "Email must contain '@'.";
                return;
            }

            if (string.IsNullOrEmpty(gender))
            {
                ErrorLbl.Text = "Gender must be selected.";
                return;
            }

            if (!string.IsNullOrEmpty(newPass))
            {
                if (oldPass != user.UserPassword)
                {
                    ErrorLbl.Text = "Old password is incorrect.";
                    return;
                }

                if (!Regex.IsMatch(newPass, @"^(?=.*[A-Za-z])(?=.*\d).{8,}$"))
                {
                    ErrorLbl.Text = "New password must be at least 8 characters and alphanumeric.";
                    return;
                }

                if (newPass != confirmPass)
                {
                    ErrorLbl.Text = "Confirmation password does not match new password.";
                    return;
                }

                user.UserPassword = newPass;
            }

            user.UserName = username;
            user.UserEmail = email;
            user.UserGender = gender;

            // save to database
            var userToUpdate = db.Users.Find(user.UserId);
            userToUpdate.UserName = username;
            userToUpdate.UserEmail = email;
            userToUpdate.UserGender = gender;
            userToUpdate.UserPassword = newPass;
            db.SaveChanges();

            Session["user"] = userToUpdate;

            Response.Redirect("HomePage.aspx");
        }
    }
}