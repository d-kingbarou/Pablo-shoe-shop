using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mia2402
{
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(txtEmail.Text == "admin@gmail.com" && txtPassword.Text == "admin")
            {
                Response.Redirect("adminDefault.aspx");
            }
            else
            {
                Response.Write("Please try again");
            }
        }
    }
}