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
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           int userId       = Convert.ToInt32(Request.Form["userId"]);
           string userName  = Request.Form["username"];
           string passWord  = Request.Form["password"];
           string insertAccountQuery = (userId + userName + passWord);
           TextInput.Text   = insertAccountQuery;

           string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
           string _query = "INSERT INTO [users] (userid, username, password) VALUES ('"+ userId +"', '"+ userName + "', '" + passWord + "')";
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
                       TextInput.Text = "ERROR";
                   }
               }
           }

        }      

    }
}
