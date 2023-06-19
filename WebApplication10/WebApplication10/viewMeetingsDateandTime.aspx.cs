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
    public partial class viewMeetingsDateandTime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-HQRSB5I;; Initial Catalog=db;Integrated Security=True"))
                {
                    SqlCommand cmd = new SqlCommand("meetingView", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    DataList3.DataSource = cmd.ExecuteReader();
                    DataList3.DataBind();

                }
            }

        }

        protected void ButtonSearchbydateTime_Click(object sender, EventArgs e)
        {

            myDal objMyDal = new myDal();

            int Found = objMyDal.SearchingByDateTime(searchbydatetime.Text);

            if (Found == 1)
            {

                Session["DateTime"] = searchbydatetime.Text;
                Response.Redirect("/searchbydatetime.aspx");


            }
            else
            {

                Response.Write("<script> alert('Invalid DateTime!'); </script>");
                Response.Redirect("/viewMeetings.aspx");

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