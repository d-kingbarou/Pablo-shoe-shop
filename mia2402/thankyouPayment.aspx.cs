using System;
using System.Web.UI;

namespace mia2402
{
    public partial class thankyouPayment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}
