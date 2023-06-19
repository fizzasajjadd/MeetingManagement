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
    public partial class rescheduleMeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            myDal obj = new myDal();
            string date2 = datetime.Text;
            string id = Session["id"].ToString();
            int idd = int.Parse(id);
            int Found = obj.rescheduleMeeting(idd, date2);



            if (Found == 0)
            {
                Response.Write("<script> alert('Cannot Reschedule the Meeting!'); </script>");

            }
            else
            {

                Response.Write("<script> alert('Meeting Rescheduled Successfully'); </script>");
                Response.Redirect("/myMeetings.aspx");
            }
        }
    }
}