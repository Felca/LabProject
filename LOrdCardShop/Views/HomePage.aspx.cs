using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LOrdCardShop.Models;

namespace LOrdCardShop.Views
{
    public partial class HomePage : System.Web.UI.Page
    {
        DatabaseEntities1 db = new DatabaseEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

            User loggedInUser = Session["user"] as User;

            if (!IsPostBack)
            {
                User LoggedUser = Session["user"] as User;

                if (LoggedUser != null)
                {
                    UsernameLbl.Text = LoggedUser.UserName;
                }
                else
                {
                    UsernameLbl.Text = "Guest";
                }

                // navigation links
                if (loggedInUser != null)
                {
                    if (loggedInUser.UserRole.ToLower() == "customer")
                    {
                        NavCustomer.Visible = true;
                        NavAdmin.Visible = false;
                    }
                    else if (loggedInUser.UserRole.ToLower() == "admin")
                    {
                        NavAdmin.Visible = true;
                        NavCustomer.Visible = false;
                    }
                    else
                    {
                        NavCustomer.Visible = false;
                        NavAdmin.Visible = false;
                    }
                }
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("RegisterPage.aspx");
        }
    }
}