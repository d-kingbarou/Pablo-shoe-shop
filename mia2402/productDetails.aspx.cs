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
    public partial class productDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblPID.Text = Session["pid"].ToString();
            if (Session["cid"] != null)
            {
                loadProduct();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        private void loadProduct ()
        {
            string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            //open connection
            conn.Open();

            string query = "SELECT * FROM tblProducts WHERE PID=@pid";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@pid", Session["PID"].ToString());
            SqlDataReader reader = comm.ExecuteReader();
            if (reader.Read() == true)
            {
                Image1.ImageUrl = reader["picture"].ToString();
                lblName.Text = reader["name"].ToString();
                lblBrand.Text = reader["brand"].ToString();
                lblDescription.Text = reader["description"].ToString();
                lblPrice.Text = reader["price"].ToString();
            }
            reader.Close();
            conn.Close();
        }

        protected void btnAddToCard_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            string query = "INSERT INTO tblShoppingCart(cid, pid, quantity, price, paymentStatus, deliveryStatus, dtAdded) " +
                "VALUES(@cid, @pid, @quantity, @price, @paymentStatus, @deliveryStatus, @dtadded)";
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@cid", Session["cid"].ToString());
            comm.Parameters.AddWithValue("@pid", Session["pid"].ToString());
            comm.Parameters.AddWithValue("@quantity", txtQuantity.Text);
            comm.Parameters.AddWithValue("@price", lblPrice.Text);
            comm.Parameters.AddWithValue("@paymentStatus", "PENDING");
            comm.Parameters.AddWithValue("@deliveryStatus", "PENDING");
            comm.Parameters.AddWithValue("@dtAdded", DateTime.Now.ToString());

            int result = comm.ExecuteNonQuery();
            if (result > 0){
                lblMessage.Text = "Item has been added to cart!";
            }
            conn.Close();
        }
    }
}