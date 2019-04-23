using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project5.AdminPages
{
    public partial class UserAccounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshData();
            }
        }

        private void RefreshData()
        {
            tbid.Text = string.Empty;
            tbUsername.Text = string.Empty;
            tbPassword.Text = string.Empty;
            passConfirm.Text = string.Empty;
            tbEmail.Text = string.Empty;
            tbFullname.Text = string.Empty;
            tbAddress.Text = string.Empty;
            tbPhone.Text = string.Empty;
            tbAge.Text = string.Empty;


            string cs = "Data Source =(local); Initial Catalog = ShoppingMall; Integrated Security = True";

            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    string query = "Select * from MemberTable;";
                    SqlCommand cmd = new SqlCommand(query, con);

                    con.Open();
                    //DataSet ds = new DataSet();
                    /* SqlDataAdapter sda = new SqlDataAdapter(query, con);

                     sda.Fill(ds);
                     if (ds.Tables[0].Rows.Count > 0)
                     {
                         GridView1.DataSourceID = null;
                         GridView1.DataSource = ds;
                         GridView1.DataBind();
                     }

                     sda.Dispose(); */
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(rdr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    rdr.Close();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message.ToString();
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                finally
                {

                    con.Close();
                }
            }

        }

        protected void add_btn_Click1(object sender, EventArgs e)
        {
            string username = tbUsername.Text;
            string password = tbPassword.Text;
            string email = tbEmail.Text;
            string fullname = tbFullname.Text;
            string address = tbAddress.Text;
            string phone = tbPhone.Text;
            string age = tbAge.Text;


            try
            {               
                if (UserExists(username))
                {
                    lblMessage.Text = "The user name is already taken. Please try again!!!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    if (CreateUser(username, password, email, fullname))
                    {
                        lblMessage.Text = "User Registered";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        lblMessage.Text = "User NOT Registered";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }

            RefreshData();
        }


        private bool CreateUser(string username, string password, string email, string fullname)
        {
            string query = "Insert into MemberTable  values (@username, @password, @email, @fullname, @address, @phone, @age)";

            int result = 0;

            string cs = "Data Source =(local); Initial Catalog = ShoppingMall; Integrated Security = True";

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", tbUsername.Text);
                cmd.Parameters.AddWithValue("@password", tbPassword.Text);
                cmd.Parameters.AddWithValue("@email", tbEmail.Text);
                cmd.Parameters.AddWithValue("@fullname", tbFullname.Text);
                cmd.Parameters.AddWithValue("@address", tbAddress.Text);
                cmd.Parameters.AddWithValue("@phone", tbPhone.Text);
                cmd.Parameters.AddWithValue("@age", tbAge.Text);

                con.Open();

                result = (int)cmd.ExecuteNonQuery();
            }

            if (result == 1)
                return true;
            else
                return false;

        }

        private bool UserExists(string username)
        {
            string query = "Select Count(username) from login where UserName = @username";

            int result;

            string cs = "Data Source =(local); Initial Catalog = ShoppingMall; Integrated Security = True";

            // check an user account if it exists
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", tbUsername.Text);
                con.Open();

                result = (int)cmd.ExecuteScalar();
            }

            if (result == 1)
                return true;
            else
                return false;

        }

        protected void UpdateBtn_Click(object sender, GridViewEditEventArgs e)
        {
            // Edit 
            lblMessage.Text = string.Empty;
            GridView1.EditIndex = e.NewEditIndex;
            RefreshData();
        }


        private void handlerException(Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        protected void refresh_btn_Click1(object sender, EventArgs e)
        {
            RefreshData();
        }

        protected void del_btn_Click(object sender, EventArgs e)
        {
            try
            {
                string cs = "Data Source =(local); Initial Catalog = ShoppingMall; Integrated Security = True";

                SqlConnection con = new SqlConnection(cs);
                con.Open();

                int id = Convert.ToInt32(tbid.Text);

                string query = "Delete from MemberTable where UserID=@UserID ";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@UserID", id);
                cmd.ExecuteNonQuery();
                RefreshData();
                con.Close();

                // if this works, a row should have been deleted
                lblMessage.Text = "Delete successful";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                handlerException(ex);
            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(tbid.Text);

            try
            {
                string cs = "Data Source =(local); Initial Catalog = ShoppingMall; Integrated Security = True";

                SqlConnection con = new SqlConnection(cs);

                string query = "Update MemberTable Set UserName=@username, Password=@password, Email=@email, FullName=@fullname, Address=@address, Phone=@phone, Age=@age WHERE UserID= '" + id + "'";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.CommandText = query;

                cmd.Parameters.AddWithValue("@username", tbUsername.Text);
                cmd.Parameters.AddWithValue("@password", tbPassword.Text);
                cmd.Parameters.AddWithValue("@email", tbEmail.Text);
                cmd.Parameters.AddWithValue("@fullname", tbFullname.Text);
                cmd.Parameters.AddWithValue("@address", tbAddress.Text);
                cmd.Parameters.AddWithValue("@phone", tbPhone.Text);
                cmd.Parameters.AddWithValue("@age", tbAge.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;

                lblMessage.Text = "Successfully Update ";
                lblMessage.ForeColor = System.Drawing.Color.Red;

                con.Close();
                RefreshData();
            }
            catch (Exception ex)
            {
                handlerException(ex);
            }
        }



        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            Response.Redirect("~/Home.aspx");
        }
    }
}
