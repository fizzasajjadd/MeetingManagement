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
    public partial class empMeetings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }

            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-HQRSB5I; Initial Catalog=db;Integrated Security=True"))
            {


                SqlCommand cmd = new SqlCommand("OneMeetingDetail", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                string m_id = Session["meeting_id"].ToString();
                int id = int.Parse(m_id);
                cmd.Parameters.Add("@ID", SqlDbType.Int);

                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@ID"].Value = id;





                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                //Found = (int)cmd.Parameters["@flag"].Value;

                con.Close();

                SqlCommand cmd1 = new SqlCommand("OneMeetingParticipants", con);
                con.Open();
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@ID", SqlDbType.Int);

                cmd1.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd1.Parameters["@ID"].Value = id;
                DataList3.DataSource = cmd1.ExecuteReader();
                DataList3.DataBind();
                con.Close();

            }
        }
    }
}