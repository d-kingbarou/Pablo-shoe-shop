using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; //use configuration name i.e mia2402

namespace mia2402
{
    public partial class manageProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                lblCID.Text = Session["CID"].ToString();
                txtFirstName.Text = Session["fname"].ToString();
                txtLastName.Text = Session["lname"].ToString();
                ddlCountryOrigin.SelectedItem.Text = Session["country"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //create connection from update to DB
            string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            //open connection
            conn.Open();

            string query = "UPDATE tblCustomers SET firstname=@fname, lastname=@lname, country=@country WHERE cid=@cid";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@fname", txtFirstName.Text.Trim());
            comm.Parameters.AddWithValue("@lname", txtLastName.Text.Trim());
            comm.Parameters.AddWithValue("@country", ddlCountryOrigin.SelectedItem.Text);
            comm.Parameters.AddWithValue("@cid", Session["CID"].ToString());

            int result = comm.ExecuteNonQuery();
            if(result>0)
            {
                lblMessage.Text = "Profile has been updated!";
            }
            else
            {
                lblMessage.Text = "Unable to update profile. Please try again.";
            }

            //close connection
            conn.Close();
        }
    }
}