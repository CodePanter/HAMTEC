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
            string imgpng = "/profile/" + Session["username"] + ".png";
            string imgjpg = "/profile/" + Session["username"] + ".jpg";
            if (File.Exists(Server.MapPath(imgpng)))
            {
                profileimg.Src = imgpng;
            }
            else if (File.Exists(Server.MapPath(imgjpg)))
            {
                profileimg.Src = imgjpg;
            }

            if (Session["username"] != null)
            {
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

                    if (Request.Form["savepw"] != null)
                    {
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
                                        string pw1 = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password"], "SHA1");
                                        string pw2 = FormsAuthentication.HashPasswordForStoringInConfigFile(Request.Form["password2"], "SHA1");
                                        if (pw1 == pw2)
                                        {
                                            comm.CommandText = "UPDATE users set password = '" + pw1 + "' where username = '" + Session["username"] + "'";
                                            comm.ExecuteNonQuery();
                                            Label2.Visible = true;
                                            Label2.Text = "Wachtwoord is gewijzigt";
                                        }
                                        else
                                        {
                                            //wachtwoorden komen niet overeen
                                        }

                                    }
                                    else
                                    {
                                        //oude wachtwoord klopt niet
                                        Label1.Visible = true;
                                        Label1.Text = "Wachtwoord klopt niet";
                                    }
                                }
                                catch(SqlException ex)
                                {
                                    Label1.Text = Convert.ToString(ex);
                                }
                            }
                        }
                    }
                    else
                    {
                        Label1.Text = "Balen";
                    }
                }

            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}