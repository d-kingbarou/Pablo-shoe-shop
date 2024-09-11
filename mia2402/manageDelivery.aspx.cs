using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace MIA2402
{
    public partial class manageDelivery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;
            List<Order> orders = new List<Order>();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM tblShoppingcart " +
                    "WHERE (paymentStatus='PAID') AND (deliveryStatus!='DELIVERD')";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    orders.Add(new Order
                    {
                        scid = reader.GetInt32(0),
                        cid = reader.GetInt32(1),
                        pid = reader.GetInt32(2),
                        qty = reader.GetInt32(3),
                        price = reader.GetDecimal(4),
                        paymentstatus = reader.GetString(5),
                        deliverystatus = reader.GetString(6)
                    });
                }
            }

            // Grouping manually
            var groupedData = new List<GroupedOrder>();
            var cidTracker = new Dictionary<int, GroupedOrder>();

            foreach (var order in orders)
            {
                if (!cidTracker.ContainsKey(order.cid))
                {
                    cidTracker[order.cid] = new GroupedOrder
                    {
                        cid = order.cid,
                        TotalPrice = 0,
                        PaymentStatus = order.paymentstatus,
                        DeliveryStatus = order.deliverystatus,
                        OrderCount = 0
                    };
                }

                cidTracker[order.cid].TotalPrice += order.price;
                cidTracker[order.cid].OrderCount++;
            }

            // Prepare the final list for binding
            foreach (var group in cidTracker.Values)
            {
                groupedData.Add(group);
            }

            // Binding the grouped data to the GridView
            GridView1.DataSource = groupedData;
            GridView1.DataBind();
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            int cid = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            if (ddl.SelectedValue == "1") // Action 1 selected
            {
                UpdateDeliveryStatus(cid, "Out for Delivery");
                
            }
            if (ddl.SelectedValue == "2") // Action 1 selected
            {
                UpdateDeliveryStatus(cid, "DELIVERED");
                
            }
            // You can handle other actions similarly if needed
        }

        private void UpdateDeliveryStatus(int cid, string status)
        {
            string connStr = ConfigurationManager.ConnectionStrings["mia2402"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE tblshoppingcart SET deliverystatus = @status WHERE cid = @cid";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@cid", cid);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Optionally, rebind the grid to refresh the data
            BindGrid();
        }

    }

    public class Order
    {
        public int scid { get; set; }
        public int cid { get; set; }
        public int pid { get; set; }
        public int qty { get; set; }
        public decimal price { get; set; }
        public string paymentstatus { get; set; }
        public string deliverystatus { get; set; }
    }

    public class GroupedOrder
    {
        public int cid { get; set; }
        public decimal TotalPrice { get; set; }
        public string PaymentStatus { get; set; }
        public string DeliveryStatus { get; set; }
        public int OrderCount { get; set; }
    }
}