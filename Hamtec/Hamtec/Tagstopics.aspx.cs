using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Hamtec
{
    public partial class Tagstopics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
            string _query = "UPDATE tags SET Count = (Count + 1) WHERE Tags = ('" + Request.QueryString["Tags"] + "')";


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
                        //Response.Redirect(Request.RawUrl);
                    }
                    catch (SqlException ex)
                    {
                        //Label2.Visible = true;
                        // Label2.Text += Convert.ToString(ex);
                    }
                }

            }
        }
    }
}