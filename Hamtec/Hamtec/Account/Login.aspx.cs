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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Controleren of er een POST is gestuurd
            if (IsPostBack)
            {   //Username en wachtwoord ophalen en in strings zetten. Moet nog SQLinjection proof worden gemaakt
                string userName = Convert.ToString(Request.Form["username"]);
                string passWord = Convert.ToString(FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password"], "SHA1"));
               
                //Connectiestring ophalen
                string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
                //De query om te controleren of gebruikersnaam en wachtwoord juist zijn
                string _query = "select count(userid) from users where username = '" + userName + "' and password = '" + passWord + "'";
                //Database connectie starten en openen
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
                            int count = (int)comm.ExecuteScalar();
                            if (count == 0)
                            {
                                //Text weergeven als het wachtwoord of gebruikersnaam niet juist is
                                TextInput.Text = "Wrong username or password";
                            }
                            else
                            {
                                //Sessie aanmaken waarin de gebruikersnaam komt
                                Session["username"] = userName;
                                //Website doorsturen naar de homepage
                            }
                        }
                        catch (SqlException ex)
                        {
                            //SQL error weergeven als er een database fout is. WEllicht later per email versturen naar de beheerder?
                            TextInput.Text = Convert.ToString(ex);
                        }
                    }
                }
                //Query om userid op te halen 
                string _query2 = "SELECT [userid] FROM [users] WHERE [username] = '" + userName + "'";
                Int64 _res = 0;

                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandType = CommandType.Text;
                        comm.CommandText = _query2;
                        try
                        {
                            conn.Open();
                            //userid opslaan in een session
                            _res = (Int64)comm.ExecuteScalar(); //resultaat van de query komt in deze string
                            Session["userid"] = _res;

                        }
                        catch (SqlException ex)
                        {
                            TextInput.Text = Convert.ToString(ex);
                        }
                    }




                }
                //query voor moederator session
                string _query3 = "SELECT [moderator] FROM [users] WHERE [username] = '" + userName + "'";
                byte _mod = 0;

                using (SqlConnection conn = new SqlConnection(_connStr))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandType = CommandType.Text;
                        comm.CommandText = _query3;
                        try
                        {
                            conn.Open();
                            //userid opslaan in een session
                            _mod = (byte)comm.ExecuteScalar(); //resultaat van de query komt in deze string
                            Session["moderator"] = _mod;

                        }
                        catch (SqlException ex)
                        {
                            TextInput.Text = Convert.ToString(ex);
                        }
                    }
                }

                Response.Redirect("/Default.aspx");
            }
        }
    }
}
