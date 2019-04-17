using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project5
{
    public partial class Cart : System.Web.UI.Page
    {
        ShoppingCart shoppingCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["CART"] == null)
            {
                Session["CART"] = new ShoppingCart();
            }
            shoppingCart = (ShoppingCart)Session["CART"];
            if (!IsPostBack)
            {               
                FillData();
            }
        }

        private void FillData()
        {
            GridView1.DataSource = shoppingCart.Items;
            GridView1.DataBind();
            if(shoppingCart.Items.Count == 0)
            {
                lblgtotal.Visible = false;
            }
            else
            {
                lblgtotal.Text = string.Format("Grand Total = {0, 19:C}", shoppingCart.GrandTotal);
                lblgtotal.Visible = true;
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            FillData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox tbQuantity = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
            int quantity = Int32.Parse(tbQuantity.Text);
            shoppingCart.Update(e.RowIndex, quantity);
            GridView1.EditIndex = -1;
            FillData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            FillData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            shoppingCart.Delete(e.RowIndex);
            FillData();
        }
    }
}