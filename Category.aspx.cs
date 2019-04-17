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
    public partial class Category : System.Web.UI.Page
    {
        string cs = "Data Source =(local); Initial Catalog = ShoppingMall; Integrated Security = True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        string catid = Request.QueryString["CategoryID"];

                        if(catid != null)
                        {
                            string query = "Select * from Product where CategoryID =" + catid;
                            con.Open();
                            SqlCommand cmd = new SqlCommand(query, con);
                            DataSet ds = new DataSet();
                            SqlDataAdapter sda = new SqlDataAdapter(query, con);

                            sda.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                dlcategory.DataSourceID = null;
                                dlcategory.DataSource = ds;
                                dlcategory.DataBind();
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
    }
}
