using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Hamtec
{
    
    public partial class About : System.Web.UI.Page
    {
        public static string GetConnectionString()
        {
            string connStr = String.Format("server={0};user id={1}; password={2};" +
              "database=hamtec; pooling=false", "localhost",
              "hamtec", "Spektaart2013!");

            return connStr;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            MySql.Data.MySqlClient.MySqlConnection mycon = new MySqlConnection(GetConnectionString());
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
