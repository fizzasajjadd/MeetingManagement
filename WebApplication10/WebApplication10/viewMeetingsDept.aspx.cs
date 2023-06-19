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
    public partial class viewMeetingsDept : System.Web.UI.Page
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


     

        protected void ButtonSearchbydept_Click1(object sender, EventArgs e)
        {
            myDal objMyDal = new myDal();

            int Found = objMyDal.SearchingByDept(searchbydept.Text);

            if (Found == 1)
            {

                Session["DepartmentName"] = searchbydept.Text;
                Response.Redirect("/searchbydept.aspx");


            }
            else
            {

                Response.Write("<script> alert('No Meeitng Exists!'); </script>");
              //  Response.Redirect("/viewMeetings.aspx");

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