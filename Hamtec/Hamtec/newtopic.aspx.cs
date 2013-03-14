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

namespace Hamtec
{
    public partial class newtopic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("/Default.aspx");
            }
            if (IsPostBack)
            {
                string subject = Request.Form["subject"];
                string question = Request.Form["question"];
                string tag = Request.Form["tag"];
               
                string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
                string _query = "INSERT INTO [topics] (subject, userid, message, tags) VALUES ('" + subject + "', 2, '" + question + "', '" + tag + "')";
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
                            comm.ExecuteNonQuery();
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