using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace mia2402
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["CID"] = 2006;
            grandTotal();
        }

        private void grandTotal()
        {
            string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT SUM(subtotal) AS grand_total FROM (" +
                "SELECT sc.quantity * sc.price as subtotal " +
                "FROM tblProducts p, tblShoppingCart sc " +
                "WHERE p.pid = sc.pid AND sc.cid = @cid " +
                "AND sc.paymentStatus = 'PENDING' and sc.deliveryStatus = 'PENDING') AS subquery";

            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@cid", Session["cid"].ToString());
            object result = comm.ExecuteScalar(); //retrieving 1 value

            decimal grandTotal;
            if (result != null && decimal.TryParse(result.ToString(), out grandTotal))
            {
                lblGrandTotal.Text = grandTotal.ToString("C");
            }
            else
            {
                lblGrandTotal.Text = "Grand Total: 0.00";
            }
            conn.Close();
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            try
            {
                // get connection string from configuration
                string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // update the payment status to "PAID" for the current customer using CID
                    string updateQuery = @"
                        UPDATE tblShoppingCart 
                        SET paymentStatus = 'PAID' 
                        WHERE cid = @cid AND paymentStatus = 'PENDING'";

                    SqlCommand comm = new SqlCommand(updateQuery, conn);
                    comm.Parameters.AddWithValue("@cid", Session["CID"].ToString());

                    int rowsAffected = comm.ExecuteNonQuery(); // execute the update command

                    if (rowsAffected > 0)
                    {
                        //redirect to thank you for payment page
                        Response.Redirect("thankyouPayment.aspx");
                    }
                    else
                    {
                        //changing the styles of lblMessage
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Font.Size = 16;
                        // feedback message if no records are updated
                        lblMessage.Text = "No pending items to pay for.";

                    }
                }
            }
            catch (Exception ex)
            {
                // changing styles for error messages when an exception occurs
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Font.Size = 16;
                // handling exceptions & producing error message when necessary
                lblMessage.Text = "Error during payment processing. Please try again.";
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}