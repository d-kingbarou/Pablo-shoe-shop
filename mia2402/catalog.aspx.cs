using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mia2402
{
    public partial class catalogue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "details")
            {
                //Find pid
                Label pid = e.Item.FindControl("PIDLabel") as Label;
                //display pid
                //Response.Write(pid.Text);
                //create session to hold pid value
                Session["PID"] = pid.Text;

                //redirect to product details page
                Response.Redirect("productDetails.aspx");
            }
        }
    }
}