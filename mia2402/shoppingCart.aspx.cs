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
    public partial class shoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if session CID exists
            if (Session["CID"] != null)
            {
                // If CID is present, proceed to display shopping cart
                grandTotal();
            }
            else
            {
                // If no CID, redirect to login page
                Response.Redirect("login.aspx");
            }
        }

        private void grandTotal()
        {
            // Check if Session["CID"] is null before proceeding
            if (Session["CID"] == null)
            {
                lblGrandTotal.Text = "Grand Total: 0.00";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            string query = "SELECT SUM(subtotal) AS grand_total FROM (" +
                "SELECT sc.quantity * sc.price as subtotal " +
                "FROM tblProducts p, tblShoppingCart sc " +
                "WHERE p.pid = sc.pid AND sc.cid = @cid " +
                "AND sc.paymentStatus = 'PENDING' and sc.deliveryStatus = 'PENDING') AS subquery";

            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@cid", Session["CID"].ToString());
            object result = comm.ExecuteScalar(); // retrieving total value of cart
            decimal grandTotal;

            if (result != null && decimal.TryParse(result.ToString(), out grandTotal) && grandTotal > 0)
            {
                lblGrandTotal.Text = grandTotal.ToString("C");
            }
            else
            {
                // Display the "Shopping Cart is Empty" message
                lblGrandTotal.Text = "Shopping Cart is Empty";
            }

            conn.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //write code for detecting delete button
            if (e.CommandName == "remove")
            {
                Label scid = e.Item.FindControl("lblSCID") as Label;
                if (scid != null)
                {
                    //delete code
                    string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connStr);
                    conn.Open();
                    string query = "DELETE FROM tblShoppingCart WHERE scid=@scid";
                    SqlCommand comm = new SqlCommand(query, conn);
                    comm.Parameters.AddWithValue("@scid", scid.Text);
                    int result = comm.ExecuteNonQuery();
                    if (result > 0)
                    {
                        // Redirect to refresh shopping cart after deletion
                        Response.Redirect("shoppingCart.aspx");
                    }
                    conn.Close();
                }
            }

            //code for update button
            if (e.CommandName == "update")
            {
                Label scid = e.Item.FindControl("lblSCID") as Label;
                TextBox qty = e.Item.FindControl("txtQTY") as TextBox;

                if (scid != null && qty != null)
                {
                    string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connStr);
                    conn.Open();
                    string query = "UPDATE tblShoppingCart SET quantity=@qty WHERE scid=@scid";
                    SqlCommand comm = new SqlCommand(query, conn);
                    comm.Parameters.AddWithValue("@qty", qty.Text);
                    comm.Parameters.AddWithValue("@scid", scid.Text);
                    int result = comm.ExecuteNonQuery();

                    if (result > 0)
                    {
                        // Redirect to refresh shopping cart after update
                        Response.Redirect("shoppingCart.aspx");
                    }
                    conn.Close();
                }
            }
        }
    }
}
