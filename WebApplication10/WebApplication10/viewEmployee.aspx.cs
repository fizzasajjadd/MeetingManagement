using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WebApplication10
{
    public partial class viewEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection("Data Source = DESKTOP-HQRSB5I; Initial Catalog = db; Integrated Security = True"))
                {
                    SqlCommand cmd = new SqlCommand("Employee_View", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    DataList1.DataSource = cmd.ExecuteReader();
                    DataList1.DataBind();

                }



            }
        }
    }
}