using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using LOrdCardShop.Models;

namespace LOrdCardShop.Views
{
    public partial class LoginPage : System.Web.UI.Page
    {
        DatabaseEntities1 db = new DatabaseEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null || Request.Cookies["user_cookie"] != null)
            {
                Response.Redirect("HomePage.aspx");
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string username = UsernameTb.Text;
            string password = PasswordTb.Text;

            if (!string.IsNullOrEmpty(username) || !string.IsNullOrEmpty(password))
            {
                User user = (from usr in db.Users
                              where usr.UserName == username
                              && usr.UserPassword == password
                              select usr).FirstOrDefault();

                // bikin session
                if (user != null)
                {
                    // bikin cookie
                    Session["user"] = user;

                    if (RememberMeCb.Checked)
                    {
                        HttpCookie cookie = new HttpCookie("user_cookie");
                        cookie.Value = user.UserId.ToString();
                        cookie.Expires = DateTime.Now.AddDays(3);

                        Response.Cookies.Add(cookie);
                    }

                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    ErrorLbl.Text = "User not found.";
                    return;
                }
            }
            else
            {
                ErrorLbl.Text = "Username or password cannot be empty.";
                return;
            }
        }
    }
}