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
using System.IO;
namespace Hamtec.Account
{
    public partial class myaccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            //controleren of gebruiker is ingelogd
            if (Session["username"] != null)
            {
                //mogelijke afbeeldingen in een string zetten
                string imgpng = "/profile/" + Session["username"] + ".png";
                string imgjpg = "/profile/" + Session["username"] + ".jpg";
                //controleren of de png bestaat
                if (File.Exists(Server.MapPath(imgpng)))
                {
                    profileimg.Src = imgpng;
                }
                //controleren of de jpg bestaat
                else if (File.Exists(Server.MapPath(imgjpg)))
                {
                    profileimg.Src = imgjpg;
                }
                //controleren of post is verstuurd
                if (IsPostBack)
                {

                    if (FileUpload1.HasFile)
                        try
                        {
                            string filename = Session["username"] + "." + FileUpload1.PostedFile.FileName.Substring(FileUpload1.PostedFile.FileName.IndexOf('.') + 1);
                            FileUpload1.SaveAs(Server.MapPath("/profile/" + filename));
                            //Label1.Text = "File name: " +
                            //     FileUpload1.PostedFile.FileName + "<br>" +
                            //     FileUpload1.PostedFile.ContentLength + " kb<br>" +
                            //     "Content type: " +
                            //     FileUpload1.PostedFile.ContentType;

                        }
                        catch (Exception ex)
                        {
                            //Label1.Text = "ERROR: " + ex.Message.ToString();
                        }
                    //controleren of password reuqest post is verstuurd
                    if (Request.Form["oldpassword"] != null)
                    {
                        //connection string ophalen en daarna database connectie beginnen
                        string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
                        string _query = "select count(userid) from users where username = '" + Session["username"] + "' and password = '" + FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["oldpassword"], "SHA1") + "'";
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
                                    if (count == 1)
                                    {
                                        //controleren of wachtwoorden overeenkomen
                                        string pw1 = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password"], "SHA1");
                                        string pw2 = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password2"], "SHA1");
                                        if (pw1 == pw2)
                                        {
                                            //controleren of  oude wachtwoord klopt
                                            comm.CommandText = "UPDATE users set password = '" + pw1 + "' where username = '" + Session["username"] + "'";
                                            comm.ExecuteNonQuery();
                                            Label2.Visible = true;
                                            //weergeven dat het wachtwoord is gewijzigt
                                            Label2.Text = "Password changed";
                                        }
                                        else
                                        {
                                            Label1.Visible = true;
                                            Label1.Text = "New passwords dont match";
                                            //wachtwoorden komen niet overeen
                                        }

                                    }
                                    else
                                    {
                                        //oude wachtwoord klopt niet
                                        Label1.Visible = true;
                                        Label1.Text = "Old password is wrong";
                                    }
                                }
                                catch (SqlException ex)
                                {
                                    Label1.Visible = true;
                                    Label1.Text = Convert.ToString(ex);
                                }
                            }
                        }
                    }
                    else
                    {
                        
                    }
                }

            }
            else
            {
                //user terugsturen als er niet is ingelogd
                Response.Redirect("/Default.aspx");
            }
        }
    }
}