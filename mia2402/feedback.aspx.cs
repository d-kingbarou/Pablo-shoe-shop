using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mia2402
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblDtadded.Text = DateTime.Now.ToString();
            SqlDataSource1.Insert();
            lblMessage.Text = "Thank you for your feedback!";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}