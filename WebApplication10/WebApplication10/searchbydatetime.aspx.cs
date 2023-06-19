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
    public partial class searchbydatetime : System.Web.UI.Page
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
                    SqlCommand cmd = new SqlCommand("FilterMeetingbyDateTime", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    string email = Session["DateTime"].ToString();
                    DateTime dt = DateTime.Parse(email);
                    cmd.Parameters.Add("@datetime_", SqlDbType.DateTime, 20);
                    cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters["@datetime_"].Value = dt;
                    
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