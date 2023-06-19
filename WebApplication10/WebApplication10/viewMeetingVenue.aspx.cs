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
    public partial class viewMeetingVenue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string venue = "";
            if (RadioButton1.Checked)
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
                    else
                    {
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
                    }

                }
            }

            Session["Venue"] = venue;

            myDal objMyDal = new myDal();
            int Found;

            Found = objMyDal.SearchingByVenue(venue);


            if (Found == 0)
            {
                Response.Write("<script> alert('No Meeting Found!'); </script>");
            }
            else
            {
                if (Found == 1)
                {
                    Response.Redirect("/searchbyvenue.aspx");
                  
                }
                
               
            }

            ClearForm();

        }

        public void ClearForm()
        {
            if (RadioButton1.Checked==true)
            {
                RadioButton1.Checked = false;
            }
            else
            {

                if (RadioButton2.Checked == true)
                {
                    RadioButton2.Checked = false;
                }
                else
                {

                    if (RadioButton3.Checked == true)
                    {
                        RadioButton3.Checked = false;
                    }
                    else
                    {

                        if (RadioButton4.Checked == true)
                        {
                            RadioButton4.Checked = false;
                        }
                        else
                        {
                            if (RadioButton5.Checked == true)
                            {
                                RadioButton5.Checked = false;
                            }
                            else
                            {
                                if (RadioButton6.Checked == true)
                                {
                                    RadioButton6.Checked = false;
                                }
                            }
                        }
                    }

                }
            }
        }
    }
}