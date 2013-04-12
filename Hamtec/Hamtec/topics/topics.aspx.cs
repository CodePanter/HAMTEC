using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Hamtec.topics
{
    public partial class topics : System.Web.UI.Page
    {
        Int64 userID = 0;
        string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Convert.ToInt64(Session["userid"]);            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string _query = "INSERT INTO [posts] (userid, topicid, message) VALUES ('" + userID + "', '" + Request.QueryString["topicid"] + "', '" + Convert.ToString(TextBox1.Text) + "' )";         


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
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (SqlException ex)
                    {
                        Label2.Visible = true;
                        Label2.Text += Convert.ToString(ex);
                    }
                }
                
            }
        }
    }
}