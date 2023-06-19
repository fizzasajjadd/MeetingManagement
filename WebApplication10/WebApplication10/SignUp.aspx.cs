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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            if (isFormValid())
            {
                string Type = "NONE";
                string deptt = "NONE";

               
                if (RadioButton3.Checked)
                {
                    deptt = "Social Media";
                }
                else if (RadioButton4.Checked)
                {
                    deptt = "Marketing";
                }
                else if (RadioButton5.Checked)
                {
                    deptt = "Sales";
                }

                myDal objMyDal = new myDal();
                int Found = 0;

                if (RadioButton1.Checked)
                {
                  
                  Found  = objMyDal.SignupCheckEmployee(name.Text, CNIC.Text, deptt, Phone.Text, email.Text, password_.Text);

                }
                else if (RadioButton2.Checked)
                {
                    Found = objMyDal.SignupCheckHost(name.Text, deptt, Phone.Text, email.Text, password_.Text);
                }


                if (Found == 0)
                {
                    Response.Write("<script> alert('User already Registered!'); </script>");
                }
                else
                {

                    if (Found == 1)
                    {

                        Response.Redirect("/Login.aspx");
                    }
                }


                ClearForm();

            }
        }

        private void ClearForm()
        {
            name.Text = string.Empty;
            CNIC.Text = string.Empty;

            Phone.Text = string.Empty;

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