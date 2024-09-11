using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mia2402
{
    public partial class customerManageOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //testing purpose
            //Session["CID"] = 2006;
            if (Session["CID"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}