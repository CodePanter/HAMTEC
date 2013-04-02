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
            if (Request.QueryString["topicid"] != null)
            {
                //Label2.Text = "De vraag: ";

                Label1.Text = "Deze pagina is voor het topic met ID:";
                Label1.Text += Convert.ToString(Request.QueryString["topicid"]);

                //Label1.Text += Session["userid"];

                string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
                string _query = "SELECT [userid] FROM [users] WHERE [username] = '" + Session["username"] + "'";
                Int64 _res = 0;

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
                            _res = (Int64)comm.ExecuteScalar(); //resultaat van de query komt in deze string
                            userID = _res;
                            Label2.Text = Convert.ToString(userID);
                        }
                        catch (SqlException ex)
                        {
                            Label2.Text = Convert.ToString(ex);
                        }
                    }
                

                
                
            }

        }
            }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //string _query = "SELECT [tags] FROM [topics] WHERE [topicid] = " + Request.QueryString["topicid"];
            string test = "wooasfasfdp ";
            Int64 test2 = 99;
            string _query = "INSERT INTO [posts] (userid, topicid, message) VALUES ('" + userID + "', '" + Request.QueryString["topicid"] + "', '" + Convert.ToString(TextBox1.Text) + "' )";
            string _res = "";


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
                        _res = (string)comm.ExecuteScalar(); //resultaat van de query komt in deze string
                    }
                    catch (SqlException ex)
                    {
                        Label2.Text = Convert.ToString(ex);
                    }
                }

                Label2.Text = _res;
            }
        }
    }
}