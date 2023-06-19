using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using WebApplication10.DAL;

namespace WebApplication10
{
    public partial class searchbyvenue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-HQRSB5I; Initial Catalog=db;Integrated Security=True"))
                {
                    SqlCommand cmd = new SqlCommand("FilterbyVenue", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    string email = Session["Venue"].ToString();
                    cmd.Parameters.Add("@venue", SqlDbType.NVarChar, 50);
                    cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters["@venue"].Value = email;

                    DataList3.DataSource = cmd.ExecuteReader();
                    DataList3.DataBind();

                }
            }
        }

        protected void details_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string id = Convert.ToString(btn.CommandArgument);
            Session["meeting_id"] = id;
            myDal objMyDal = new myDal();

            int found = objMyDal.getInfo();

            if (found == 1)
            {
                Response.Redirect("/meetingDetails.aspx");
            }
        }
    }
}