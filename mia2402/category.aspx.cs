using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mia2402
{
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            lblMessage.Text = "Category has been added successfully.";
            txtName.Text = "";
            txtDescription.Text = "";
            lblcatID.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //starts from cells 2 because cell 1 = catID
            lblcatID.Text = GridView1.SelectedRow.Cells[1].Text;
            txtName.Text = GridView1.SelectedRow.Cells[2].Text;
            txtDescription.Text = GridView1.SelectedRow.Cells[3].Text;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            lblMessage.Text = "Category has been updated successfully.";
            txtName.Text = "";
            txtDescription.Text = "";
            lblcatID.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
            lblMessage.Text = "Category has been deleted successfully.";
            txtName.Text = "";
            txtDescription.Text = "";
            lblcatID.Text = "";
        }
    }
}