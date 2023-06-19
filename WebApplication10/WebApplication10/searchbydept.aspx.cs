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
    public partial class searchbydept : System.Web.UI.Page
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
                    SqlCommand cmd = new SqlCommand("FilterMeetingbyDept", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();
                    string email = Session["DepartmentName"].ToString();
                    cmd.Parameters.Add("@dept", SqlDbType.NVarChar, 20);
                    cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters["@dept"].Value = email;

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