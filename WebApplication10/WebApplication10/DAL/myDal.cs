using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;



namespace WebApplication10.DAL
{
    public class myDal
    {


        private static readonly string connString =
        System.Configuration.ConfigurationManager.ConnectionStrings["MultitudeDbConnection"].ConnectionString;


        string rescheduleDate = "";
        public int SignIn(string employeeemaill, string password_)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            //SqlCommand cmd;
            int flagv = 0;

            try
            {
                var cmd = new SqlCommand("LoginCheck", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", employeeemaill);
                cmd.Parameters.AddWithValue("@password", password_);
                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                flagv = (int)cmd.Parameters["@flag"].Value;


            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL ERROR " + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return flagv;
        }

        public int SignupCheckEmployee(String fullname, String CNIC, String dept, String phnno, String email, String password)
        {



            int Found = 0;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            // SqlCommand cmd;
            try
            {
                var cmd = new SqlCommand("EmployeesignUp", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 50);
                cmd.Parameters.Add("@CNIC", SqlDbType.NVarChar, 15);
                cmd.Parameters.Add("@Department", SqlDbType.NVarChar, 10);
                cmd.Parameters.Add("@phnNo", SqlDbType.NVarChar, 20);
                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 60);
                cmd.Parameters.Add("@passowrd", SqlDbType.NVarChar, 8);


                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@FullName"].Value = fullname;
                cmd.Parameters["@CNIC"].Value = CNIC;
                cmd.Parameters["@Department"].Value = dept;
                cmd.Parameters["@phnNo"].Value = phnno;
                cmd.Parameters["@Email"].Value = email;
                cmd.Parameters["@passowrd"].Value = password;



                cmd.ExecuteNonQuery();

                // read output value 
                Found = (int)cmd.Parameters["@flag"].Value;

                con.Close();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return Found;
        }

    
        public int SignupCheckHost(String fullname,  String dept, String phnno, String email, String password)
        {
            int Found = 0;
                SqlConnection con = new SqlConnection(connString);
                con.Open();
              //  SqlCommand cmd;
                try
                {
                var cmd= new SqlCommand("Host_signUp", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 50);
                  
                    cmd.Parameters.Add("@Department", SqlDbType.NVarChar, 10);
                    cmd.Parameters.Add("@phnNo", SqlDbType.NVarChar, 20);
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar, 60);
                    cmd.Parameters.Add("@passowrd", SqlDbType.NVarChar, 8);


                    cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                    // set parameter values
                    cmd.Parameters["@FullName"].Value = fullname;
                
                    cmd.Parameters["@Department"].Value = dept;
                    cmd.Parameters["@phnNo"].Value = phnno;
                    cmd.Parameters["@Email"].Value = email;
                    cmd.Parameters["@passowrd"].Value = password;


                    cmd.ExecuteNonQuery();

                    
                    // read output value 
                    Found = (int)cmd.Parameters["@flag"].Value;

                    con.Close();

                }
                catch (SqlException ex)
                {
                    Console.WriteLine("SQL Error" + ex.Message.ToString());
                }
                finally
                {
                    con.Close();
                }

                return Found;

            }


        public int ScheduleAMeeting(string title, string desc, string mode, string date, string duration , string dept , string hostinfo , string venue)
        {
            int flag=0;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            DateTime datetime = DateTime.Parse(date);
            
            //  SqlCommand cmd;
            try
            {
                var cmd = new SqlCommand("ScheduleaMeeting", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 100);
                cmd.Parameters.Add("@description", SqlDbType.NVarChar, 200);
                cmd.Parameters.Add("@mode", SqlDbType.NVarChar, 30);
                cmd.Parameters.Add("@date", SqlDbType.DateTime);
                cmd.Parameters.Add("@duration", SqlDbType.VarChar, 10);
                cmd.Parameters.Add("@department", SqlDbType.NVarChar, 10);
                cmd.Parameters.Add("@hostinfo", SqlDbType.NVarChar, 60);
                cmd.Parameters.Add("@venue", SqlDbType.NVarChar, 10);
               
                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@Title"].Value = title;
                cmd.Parameters["@description"].Value = desc;
                cmd.Parameters["@mode"].Value = mode;
                cmd.Parameters["@date"].Value = datetime;
                cmd.Parameters["@duration"].Value = duration;
                cmd.Parameters["@department"].Value = dept;
                cmd.Parameters["@hostinfo"].Value = hostinfo;
                cmd.Parameters["@venue"].Value = venue;
               


                cmd.ExecuteNonQuery();


                // read output value 
                flag = (int)cmd.Parameters["@flag"].Value;

                con.Close();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }



            return flag;
        }

        public int AddParticipants(string email)
        {
            int flag = 0;
            int meetingId;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            //  SqlCommand cmd;
            try
            {
                //getting id of meeting
                var cmd = new SqlCommand("MeetingId", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();


                // read output value 
                meetingId = (int)cmd.Parameters["@id"].Value;

                var cmd2 = new SqlCommand("AddParticipants", con); //name of your procedure 
                cmd2.CommandType = CommandType.StoredProcedure;

                cmd2.Parameters.Add("@meetingId", SqlDbType.Int);
                cmd2.Parameters.Add("@employeeemail", SqlDbType.NVarChar, 60);
              

                cmd2.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd2.Parameters["@meetingId"].Value = meetingId;
                cmd2.Parameters["@employeeemail"].Value = email;

                cmd2.ExecuteNonQuery();

                flag = (int)cmd2.Parameters["@flag"].Value;
                con.Close();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }


            return flag;
        }

        public int cancelMeeting(int meetingId)
        {
            int flag = 0;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            //  SqlCommand cmd;
            try
            {

                var cmd2 = new SqlCommand("cancelMeeting", con); //name of your procedure 
                cmd2.CommandType = CommandType.StoredProcedure;

                cmd2.Parameters.Add("@id", SqlDbType.Int);
               


                cmd2.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd2.Parameters["@id"].Value = meetingId;
              
                cmd2.ExecuteNonQuery();

                flag = (int)cmd2.Parameters["@flag"].Value;
                con.Close();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return flag;

        }

        public void setDateandTime(string date)
        {
            rescheduleDate= date;
        }
        public int getInfo()
        {
            return 1;
        }
        public int rescheduleMeeting(int meetingId, string date)
        {
            int flag = 0;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            DateTime dt = DateTime.Parse(date);
            //  SqlCommand cmd;

            
            try
            {

                var cmd2 = new SqlCommand("rescheduleMeeting", con); //name of your procedure 
                cmd2.CommandType = CommandType.StoredProcedure;

                cmd2.Parameters.Add("@id", SqlDbType.Int);
                cmd2.Parameters.Add("@dateTime", SqlDbType.DateTime);


                cmd2.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd2.Parameters["@id"].Value = meetingId;
                cmd2.Parameters["@dateTime"].Value = dt;
                cmd2.ExecuteNonQuery();

                flag = (int)cmd2.Parameters["@flag"].Value;
                con.Close();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return flag;
        }

        public int UpdatePassword(String email, String oldPass, String newPass, String confirmPass)
        {
            int Found = 0;
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            //  SqlCommand cmd;
            try
            {
                var cmd = new SqlCommand("ResetPassword", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;


                cmd.Parameters.Add("@ID", SqlDbType.NVarChar, 60);
                cmd.Parameters.Add("@Oldpass", SqlDbType.VarChar, 8);

                cmd.Parameters.Add("@newpass", SqlDbType.VarChar, 8);
                cmd.Parameters.Add("@confirmPass", SqlDbType.VarChar, 8);

                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values

                cmd.Parameters["@ID"].Value = email;
                cmd.Parameters["@Oldpass"].Value = oldPass;

                cmd.Parameters["@newpass"].Value = newPass;
                cmd.Parameters["@confirmPass"].Value = confirmPass;



                cmd.ExecuteNonQuery();


                // read output value
                Found = (int)cmd.Parameters["@flag"].Value;

                con.Close();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return Found;
        }



        public int SearchingByDept(string text_)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            //SqlCommand cmd;
            int flagv = 0;

            try
            {
                var cmd = new SqlCommand("FilterMeetingbyDept", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@dept", SqlDbType.NVarChar, 20);


                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters["@dept"].Value = text_;
                cmd.ExecuteNonQuery();
                flagv = (int)cmd.Parameters["@flag"].Value;



            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL ERROR " + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return flagv;

        }


        public int SearchingByDateTime(string text_)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            //SqlCommand cmd;
            int flagv = 0;
            DateTime dt = DateTime.Parse(text_);

            try
            {
                var cmd = new SqlCommand("FilterMeetingbyDateTime", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@datetime_", SqlDbType.DateTime);


                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters["@datetime_"].Value = dt;
                cmd.ExecuteNonQuery();
                flagv = (int)cmd.Parameters["@flag"].Value;



            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL ERROR " + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return flagv;

        }


        public int SearchingByVenue(string text_)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            //SqlCommand cmd;
            int flagv = 0;
            

            try
            {
                var cmd = new SqlCommand("FilterbyVenue", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@venue", SqlDbType.NVarChar,50);


                cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters["@venue"].Value = text_;
                cmd.ExecuteNonQuery();
                flagv = (int)cmd.Parameters["@flag"].Value;



            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL ERROR " + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return flagv;

        }
    }

}

