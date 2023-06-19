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
    public partial class myMeetings : System.Web.UI.Page
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
                    con.Open();
                    SqlCommand cmd = new SqlCommand("MyMeetings", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    string email = Session["email"].ToString();
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 60);
                    cmd.Parameters["@email"].Value = email;

                    DataList3.DataSource = cmd.ExecuteReader();
                    DataList3.DataBind();

                }
            }

        }

        protected void cancel_Click(object sender, EventArgs e)
        {

            Button btn = sender as Button;
            myDal objMyDal = new myDal();
            int Found = 0;


            int id = Convert.ToInt32(btn.CommandArgument);
            Found = objMyDal.cancelMeeting(id);

            if (Found == 0)
            {
                Response.Write("<script> alert('Cannot Cancel the Meeting!'); </script>");
            }
            else
            {

                Response.Write("<script> alert('Meeting Cancelled Successfully'); </script>");
                Response.Redirect("/myMeetings.aspx");
            }
        }

        protected void reschedule_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string id = Convert.ToString(btn.CommandArgument);
            Session["id"] = id;
            myDal objMyDal = new myDal();
            
            int found = objMyDal.getInfo();

            if (found == 1)
            {
                Response.Redirect("/rescheduleMeeting.aspx");
            }


        }

       

        protected void details_Click1(object sender, EventArgs e)
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
