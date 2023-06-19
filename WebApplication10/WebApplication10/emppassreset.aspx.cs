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
    public partial class emppassreset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void ClearForm()
        {
            oldPass.Text = string.Empty;
            newPass.Text = string.Empty;

            confirmPass.Text = string.Empty;

        }

        private bool isFormValid()
        {
            if (oldPass.Text == "" || newPass.Text == "")
            {
                return false;
            }

            return true;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            myDal objMyDal = new myDal();
            int Found = 0;

            string email = Session["email"].ToString();

            Found = objMyDal.UpdatePassword(email, oldPass.Text, newPass.Text, confirmPass.Text);


            if (Found == 0)
            {
                Response.Write("<script> alert('Password cannot be Updated!'); </script>");
            }
            else
            {

                if (Found == 1)
                {

                    Response.Write("<script> alert('Password Updated Successfully!'); </script>");
                    Response.Redirect("/Login.aspx");
                    Response.Write("<script> alert('Login with New Pass!'); </script>");
                }
            }

            ClearForm();
        }
    }
}