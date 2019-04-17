using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project5
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        string cs = "Data Source =(local); Initial Catalog = ShoppingMall; Integrated Security = True";

        ShoppingCart shoppingcart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        string pid = Request.QueryString["ProductID"];

                        if (pid != null)
                        {
                            string query = "Select * from Product where ProductID =" + pid;
                            con.Open();
                            SqlCommand cmd = new SqlCommand(query, con);
                            DataSet ds = new DataSet();
                            SqlDataAdapter sda = new SqlDataAdapter(query, con);

                            sda.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                dlproduct.DataSourceID = null;
                                dlproduct.DataSource = ds;
                                dlproduct.DataBind();
                            }

                            sda.Dispose();
                        }


                        /*
                        SqlDataReader rdr = cmd.ExecuteReader();
                        DataTable dt = new DataTable();
                        
                        dlmenu.DataSource = dt;
                        dlmenu.DataBind();
                        rdr.Close(); */
                    }
                    catch (Exception ex)
                    {
                        ex.Message.ToString();

                    }
                    finally
                    {

                        con.Close();
                    }
                }

            }

        }

        protected void btnaddtocart_Click(object sender, EventArgs e)
        {
            if(Session["CART"] == null)
            {
                shoppingcart = new ShoppingCart();
                Session["CART"] = shoppingcart;    
            }
            
                shoppingcart = (ShoppingCart)Session["CART"];
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    string pid = Request.QueryString["ProductID"];

                  
                        string query = "Select * from Product where ProductID =" + pid;
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        DataTable dt = new DataTable();

                    DataRow row = dt.Rows[0];
                    shoppingcart.Insert(new CartItem(Int32.Parse(pid),
                                   row["ProductName"].ToString(), 
                                   row["ProductImage"].ToString(),
                                   row["Description"].ToString(), 
                                   Int32.Parse(row["ProductPrice"].ToString()), 1));                    
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();

                }
                finally
                {

                    con.Close();
                }
            }

        }


    }
}
