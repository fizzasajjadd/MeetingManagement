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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logIn_Click(object sender, EventArgs e)
        {
            if (isFormValid())
            {
                myDal objMyDal = new myDal();
                

                int Found = objMyDal.SignIn(email.Text, password_.Text);
                Session["email"] = email.Text;



                if (Found == 1)
                {

                    //employee home
                   

                    Response.Redirect("/EmployeeHome.aspx");
                }
                else
                {
                    if (Found == 2)
                    {
                        //host home
                        

                        Response.Redirect("/hostHomePage.aspx");
                    }
                    else
                    {
                        Response.Write("<script> alert('Invalid Email or Password!'); </script>");
                        Response.Redirect("/Login.aspx");
                    }
                }
            }

            else
            {
                Response.Write("<script> alert('Please fill out all fields!'); </script>");
                Response.Redirect("/Login.aspx");
            }



            ClearForm();

        }

        private void ClearForm()
        {
            email.Text = string.Empty;
            password_.Text = string.Empty;
        }


        private bool isFormValid()
        {
            if (email.Text == "" || password_.Text == "")
            {
                return false;
            }

            return true;
        }

    }
}
