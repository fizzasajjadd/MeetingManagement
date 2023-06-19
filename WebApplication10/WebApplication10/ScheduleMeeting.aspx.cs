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
    public partial class ScheduleMeetingaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
        }

        protected void ScheduleMeeting(object sender, EventArgs e)
        {
            if (isFormValid())
            {
                
                string deptt = "NONE";
                string mode = "";
                string venue = "";

                if (Button1.Visible==true)
                {
                    mode = "online";
                }
                else if (Button2.Visible==true)
                {
                    mode = "physical";
                }

                if(RadioButton1.Checked)
                {
                    venue = "V1";
                }
                else
                {
                    if (RadioButton2.Checked)
                    {
                        venue = "V3";
                    }
                    else
                    {
                        if (RadioButton3.Checked)
                        {
                            venue = "V5";
                        }

                    }
                }

                if (RadioButton4.Checked)
                {
                    venue = "V2";
                }
                else
                {
                    if (RadioButton5.Checked)
                    {
                        venue = "V4";
                    }
                    else
                    {
                        if (RadioButton6.Checked)
                        {
                            venue = "V6";
                        }
                    }
                }

                if (RadioButton7.Checked)
                {
                    deptt = "D1";
                }
                else
                {
                    if (RadioButton8.Checked)
                    {
                        deptt = "D2";
                    }
                    else
                    {
                        if (RadioButton9.Checked)
                        {
                            deptt = "D3";
                        }
                    }
                }

                
             
                myDal objMyDal = new myDal();
                int Found ;

                Found = objMyDal.ScheduleAMeeting(title.Text,desc.Text,mode, DateT.Text,duration.Text,deptt,HOST.Text,venue);

                
                if (Found == 0)
                {
                    Response.Write("<script> alert('Cannot Schedule Meeting!'); </script>");
                }
                else
                {
                    if (Found == 1)
                    {
                        Response.Write("<script> alert('Venue Booked!'); </script>");
                    }
                    else
                    {
                        if (Found == 2)
                        {
                            Response.Redirect("/AddParticipants.aspx");
                        }

                    }
                }


                ClearForm();


            }
        }

            private void ClearForm()
            {
               
            }


            private bool isFormValid()
            {
               

                return true;
            }


        }
}