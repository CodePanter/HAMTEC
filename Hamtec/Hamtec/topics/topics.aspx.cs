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

namespace Hamtec.topics
{
    public partial class topics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["topicid"] != null)
            {
                Label1.Text = "Deze pagina is voor het topic met ID: " + Convert.ToString(Request.QueryString["topicid"]);
                //code om query te maken voor inhoud topic mbv topic id
                string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
                string _query = "SELECT [message] FROM [topics] WHERE [topicid] = " + Request.QueryString["topicid"];
                string _res = "ASDFGHJKL";

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
                            _res = (string)comm.ExecuteScalar();
                        }
                        catch (SqlException ex)
                        {
                            Label2.Text = Convert.ToString(ex);
                        }
                    }
                }

                Label2.Text = _res;
            }
        }
    }
}