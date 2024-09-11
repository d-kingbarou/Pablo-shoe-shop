using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//namespace for connecting to DB
using System.Data;
using System.Data.SqlClient;
using System.Configuration; //use configuration name i.e mia2402


namespace mia2402
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //create connection from login to DB
            string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            //open connection
            conn.Open();

            //create sql command
            string query = "SELECT * FROM tblCustomers WHERE email=@email AND password=@password";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
            comm.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

            //read data / execute the command
            SqlDataReader reader = comm.ExecuteReader();
            if (reader.Read() == true)
            {
                Session["CID"] = reader["CID"].ToString();
                Session["email"] = reader["email"].ToString();
                Session["name"] = reader["firstname"].ToString() + " " + reader["lastname"].ToString();

                //this will be used in your manage profile loading
                Session["fname"] = reader["firstname"].ToString();
                Session["lname"] = reader["lastname"].ToString();
                Session["country"] = reader["country"].ToString();

                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "Login Failed. Please try again.";
            }

            //close all connections
            reader.Close();
            conn.Close();
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}