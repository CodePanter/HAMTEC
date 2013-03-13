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
           if(IsPostBack)
           {
               string userName  = Request.Form["username"];
               string passWord  = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password"],"SHA1");
               string voorNaam  = Request.Form["voornaam"];
               string achterNaam = Request.Form["achternaam"];
               string insertAccountQuery = (userName + passWord);
               TextInput.Text   = insertAccountQuery;

               string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
               string _query = "INSERT INTO [users] (username, password, voornaam, achternaam) VALUES ('" + userName + "', '" + passWord + "', '" + voorNaam + "', '" + achterNaam + "')";
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
}
