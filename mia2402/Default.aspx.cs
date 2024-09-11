using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mia2402
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["name"] != null)
            {
                hypLogin.Visible = false;
                hypRegister.Visible = false;
                btnLogout.Visible = true;
                hypMProfile.Visible = true;
                lblMessage.Text = "Welcome back, " + Session["name"].ToString();
            }
            else
            {
                hypLogin.Visible = true;
                hypRegister.Visible = true;
                btnLogout.Visible = false;
                hypMProfile.Visible = false;
                lblMessage.Text = "Welcome to Pablo's Shoe Shop!";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}