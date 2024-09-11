using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mia2402
{
    public partial class products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //check for file
            if (fuImage.HasFile.ToString() != null)
            {
                //save physical file to folder
                fuImage.SaveAs(Server.MapPath("images//" + fuImage.FileName));
                //save to as: i.e. ~/images/shoe.jpg
                lblFileName.Text = "~/images/" + fuImage.FileName.ToString();
                dsProducts.Insert();
                lblMessage.Text = "Product added successfully.";
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            dsProducts.Update();
            lblMessage.Text = "Product has been updated successfully.";
            //txtName.Text = "";
            //txtDescription.Text = "";
            //lblcatID.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dsProducts.Delete();
            lblMessage.Text = "Product has been deleted successfully.";
            //txtName.Text = "";
            //txtDescription.Text = "";
            //lblcatID.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblProdID.Text = GridView1.SelectedRow.Cells[1].Text;
            txtName.Text = GridView1.SelectedRow.Cells[2].Text;
            txtBrand.Text = GridView1.SelectedRow.Cells[3].Text;
            txtDescription.Text = GridView1.SelectedRow.Cells[4].Text;
            lblFileName.Text = GridView1.SelectedRow.Cells[5].Text;
            txtPrice.Text = GridView1.SelectedRow.Cells[6].Text;
            ddlCategory.SelectedValue = GridView1.SelectedRow.Cells[7].Text;
        }
    }
}