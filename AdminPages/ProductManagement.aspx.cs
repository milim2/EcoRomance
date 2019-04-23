using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Project5.AdminPages
{
    public partial class ProductManagement : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ShoppingMallConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            Response.Redirect("~/Home.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // To upload image file using the string of path 
            string path = @"/Images/" +FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(path));
            
            SqlConnection con = new SqlConnection(cs);
            String query = "Insert into Product(ProductName,ProductImage, ProductPrice, Description, CategoryID) values('" + tbpname.Text + "','" + path + "','" + tbprice.Text + "','" + tbdesc.Text + "','" + ddlcat.SelectedValue + "')";

            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
