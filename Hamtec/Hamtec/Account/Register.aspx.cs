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
               //DB connectie in string zetten
               string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;    
               //DB connectie beginnen, in using zodat de connectie daarna automatisch gesloten wordt   
               using (SqlConnection conn = new SqlConnection(_connStr))
               {
                   using (SqlCommand comm = new SqlCommand())
                   {
                       //username in string zetten
                       string userName  = Request.Form["username"];
                       //query om te kijken of username al bestaat
                       string _query = "select count(userid) from users where username = '" + userName + "'";
                       //connectie settings
                       comm.Connection = conn;
                       comm.CommandType = CommandType.Text;
                       comm.CommandText = _query;
                       //connectie openen
                       conn.Open();
                       //sql query uitvoeren
                       int count = (int)comm.ExecuteScalar();  
                       //verder met registratie als gebruikersnaam nog niet bestaat
                       if (count == 0)
                       {
                           string passWord = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password"], "SHA1");
                           string passWord2 = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password2"], "SHA1");
                           if (passWord == passWord2)
                           {
                               string naam = Request.Form["naam"];                             
                               string email = Request.Form["email"];
                               string city = Request.Form["city"];
                               string adress = Request.Form["adress"];
                               comm.CommandText = "INSERT INTO [users] (username, password, name, email, city, adress) VALUES ('" + userName + "', '" + passWord + "', '" + naam + "', '" + email + "','" + city + "', '" + adress +"')";
                               try
                               {
                                   comm.ExecuteNonQuery();
                                   //Label3.Visible = true;
                                   //Label3.Text = "Account " + userName + " aangemaakt. U kunt nu inloggen";
                               }
                               catch (SqlException ex)
                               {
                                   //SQL error
                                   Label3.Visible = true;
                                   Label3.Text = Convert.ToString(ex);
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
