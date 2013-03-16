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
               string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;                      
               using (SqlConnection conn = new SqlConnection(_connStr))
               {
                   using (SqlCommand comm = new SqlCommand())
                   {
                       string userName  = Request.Form["username"];
                       string _query = "select count(userid) from users where username = '" + userName + "'";
                       comm.Connection = conn;
                       comm.CommandType = CommandType.Text;
                       comm.CommandText = _query;
                       conn.Open();
                       int count = (int)comm.ExecuteScalar();                       
                       if (count == 0)
                       {
                           string passWord = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password"], "SHA1");
                           string passWord2 = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password2"], "SHA1");
                           if (passWord == passWord2)
                           {
                               string voorNaam = Request.Form["voornaam"];
                               string achterNaam = Request.Form["achternaam"];
                               string email = Request.Form["email"];
                               
                               _query = "INSERT INTO [users] (username, password, voornaam, achternaam, email) VALUES ('" + userName + "', '" + passWord + "', '" + voorNaam + "', '" + achterNaam + "', '" + email + "')";

                               try
                               {
                                   comm.ExecuteNonQuery();
                               }
                               catch (SqlException ex)
                               {
                                   //TextInput.Text = "ERROR";
                               }
                           }
                           else
                           {
                                //als wachtwoorden niet overeenkomen
                               Label2.Visible = true;
                               Label2.Text = "Wachtwoorden komen niet overeen";
                           }
                       }
                       else
                       {
                           //als gebruiker bestaat 
                           Label1.Visible = true;
                           Label1.Text = "Gebruiker bestaat al";
                       }
                   }
               }
           }

        }      

    }
}
