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
    

    public partial class AddParticipantgs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection("Data Source = DESKTOP-HQRSB5I; Initial Catalog = db; Integrated Security = True"))
                {

                    SqlCommand cmd = new SqlCommand("Employee_Detail", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    DataList2.DataSource = cmd.ExecuteReader();
                    DataList2.DataBind();

                }
            }
        }

        protected void AddParticipants(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            myDal objMyDal = new myDal();
            int Found = 0;


            string email = Convert.ToString(btn.CommandArgument);
            Found = objMyDal.AddParticipants(email);




            if (Found == 0)
            {
              
                Response.Write("<script> alert('User already Added!'); </script>");
            }
            else
            {

                if (Found == 1)
                {
                    
                    Response.Write("<script> alert('Participant Added!'); </script>");
                    
                }
            }


        }
    }
}