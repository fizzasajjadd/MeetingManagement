using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication10
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            else
            {

                Response.Redirect("/hostHomePage.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["email"] = "";
            Response.Redirect("/homepage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}