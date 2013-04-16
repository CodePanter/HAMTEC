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
using System.Text.RegularExpressions;

namespace Hamtec
{
    public partial class newtopic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("/Default.aspx");
            }
            if (IsPostBack)
            {
                string subject = Request.Form["subject"];
                string question = Request.Form["question"];
                string tag = Request.Form["tag"];
                string categorie = DropDownList1.SelectedValue;
                bool twotags = false;

                string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
                string _query = "INSERT INTO [topics] (subject, userid, message, tags, categorie) VALUES ('" + subject + "', 2, '" + question + "', '" + tag + "', '" + categorie +"')";
                string _query2 = "";
                string _query3 = "";

                if (Regex.IsMatch(tag, "[\\w\\s,]+") == true)  //////////////////////////////dit moet anders
                {
                    if (tag.Contains(","))
                    {
                        string tag1 = tag;
                        int index = tag1.IndexOf(",");
                        int lastindex = tag1.LastIndexOf(",");
                        int index2 = tag.IndexOf(",");

                        if (index == lastindex)
                        {
                            if (index > 0)
                            {
                                tag1 = tag1.Substring(0, index);
                            }
                            string tag2 = tag.Substring((index2 + 1));
                            _query2 = "INSERT INTO [tags] (Tags) VALUES ('" + tag1 + "')";
                            _query3 = "INSERT INTO [tags] (Tags) VALUES ('" + tag2 + "')";
                            twotags = true;
                        }
                        else
                        {
                            Label1.Visible = true;
                            Label1.Text = "You can not add more than two tags.";
                        }
                    }
                    else
                    {
                        _query2 = "INSERT INTO [tags] (Tags) VALUES ('" + tag + "')";
                    }
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "You can not add more than two tags.";
                }
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
                                TextInput.Text = Convert.ToString(ex);
                            }
                            conn.Close();
                        }
                        if (Label1.Visible == false)
                        {
                            if (twotags == false)
                            {
                                using (SqlCommand comm = new SqlCommand())
                                {
                                    comm.Connection = conn;
                                    comm.CommandType = CommandType.Text;
                                    comm.CommandText = _query2;
                                    try
                                    {
                                        conn.Open();
                                        comm.ExecuteNonQuery();
                                    }
                                    catch (SqlException ex)
                                    {
                                        TextInput.Text = Convert.ToString(ex);
                                    }
                                }
                            }
                            else
                            {
                                using (SqlCommand comm = new SqlCommand())
                                {
                                    comm.Connection = conn;
                                    comm.CommandType = CommandType.Text;
                                    comm.CommandText = _query2;
                                    try
                                    {
                                        conn.Open();
                                        comm.ExecuteNonQuery();
                                    }
                                    catch (SqlException ex)
                                    {
                                        TextInput.Text = Convert.ToString(ex);
                                    }
                                    conn.Close();
                                }
                                using (SqlCommand comm = new SqlCommand())
                                {
                                    comm.Connection = conn;
                                    comm.CommandType = CommandType.Text;
                                    comm.CommandText = _query3;
                                    try
                                    {
                                        conn.Open();
                                        comm.ExecuteNonQuery();
                                    }
                                    catch (SqlException ex)
                                    {
                                        TextInput.Text = Convert.ToString(ex);
                                    }
                                }
                            }
                        }
                    }
            }
        }
    }
}