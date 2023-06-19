
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using WebApplication10.DAL;

namespace WebApplication10
{
    public partial class hostHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }

        }


        
    }
}