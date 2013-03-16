using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace Hamtec.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string userName = Convert.ToString(Request.Form["username"]);
                string passWord = Convert.ToString(FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password"], "SHA1"));
               

                string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
                string _query = "select count(userid) from users where username = '" + userName + "' and password = '" + passWord + "'";
                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandType = CommandType.Text;
                        comm.CommandText = _query;
                        try
                        {
                            conn.Open();
                            int count = (int)comm.ExecuteScalar();
                            if (count == 0)
                            {
                                TextInput.Text = "Wrong username or password";
                            }
                            else
                            {
                                Session["username"] = userName;
                                Response.Redirect("/Default.aspx");
                            }
                        }
                        catch (SqlException ex)
                        {
                            TextInput.Text = Convert.ToString(ex);
                        }
                    }
                }
            }
        }
    }
}
