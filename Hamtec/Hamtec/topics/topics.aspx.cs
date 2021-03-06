﻿using System;
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
        public bool EnableButton(int solved)
        {
            if (solved == 0)
                return true;
            else
                return false;
        }
        Int64 userID = 0;
        string _connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            userID = Convert.ToInt64(Session["userid"]);
            //if (IsPostBack)
            //{
            //    Label2.Visible = true;
            //    int userid = Convert.ToInt32(Request.Form["userid"]);
            //    int postid = Convert.ToInt32(Request.Form["postid"]);
            //    string _query = "UPDATE [users] SET rating = (rating +10) where userid = '" + userid + "'";
            //    string _query2 = "UPDATE [posts] SET answer = 1 where postid = '" + postid + "'";
            //    string _query3 = "UPDATE [topics] SET solved = 1 where topicid = '" + Request.QueryString["topicid"] + "'";

            //    using (SqlConnection conn = new SqlConnection(_connStr))
            //    {

            //        using (SqlCommand comm = new SqlCommand())
            //        {
            //            comm.Connection = conn;
            //            comm.CommandType = CommandType.Text;
            //            comm.CommandText = _query;

            //            try
            //            {
            //                conn.Open();
            //                comm.ExecuteNonQuery();
            //                comm.CommandText = _query2;
            //                comm.ExecuteNonQuery();
            //                comm.CommandText = _query3;
            //                comm.ExecuteNonQuery();
            //                //Response.Redirect(Request.RawUrl);
            //            }
            //            catch (SqlException ex)
            //            {
            //                Label2.Visible = true;
            //                Label2.Text += Convert.ToString(ex);
            //            }
            //        }
            //    }

            //}


        }
        protected void closeTopic(object sender, EventArgs e)
        {
            string argument = Request.QueryString["topicid"];
            string _query = "UPDATE [topics] SET closed = 2 where topicid = '" + argument + "'";

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
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (SqlException ex)
                    {
                        Label2.Visible = true;
                        Label2.Text += Convert.ToString(ex);
                    }
                }
            }
        }

        protected void openTopic(object sender, EventArgs e)
        {
            string argument = Request.QueryString["topicid"];
            string _query = "UPDATE [topics] SET closed = 1 where topicid = '" + argument + "'";

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
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (SqlException ex)
                    {
                        Label2.Visible = true;
                        Label2.Text += Convert.ToString(ex);
                    }
                }
            }
        }

        protected void deleteTopic(object sender, EventArgs e)
        {
            string argument = Request.QueryString["topicid"];
            string _query = "DELETE FROM [topics] where topicid = '" + argument + "'";
            string _query2 = "DELETE FROM [posts] where topicid = '" + argument + "'";

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
                        comm.CommandText = _query2;
                        comm.ExecuteNonQuery();
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (SqlException ex)
                    {
                        Label2.Visible = true;
                        Label2.Text += Convert.ToString(ex);
                    }
                }
            }
        }

        protected void delComment(object sender, EventArgs e)
        {
            string argument = ((Button)sender).CommandArgument;
            string _query = "DELETE FROM [posts] where postid = '" + argument + "'";

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
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (SqlException ex)
                    {
                        Label2.Visible = true;
                        Label2.Text += Convert.ToString(ex);
                    }
                }
            }
        }




        protected void GiveRating(object sender, EventArgs e)
        {
            string argument = ((Button)sender).CommandArgument;
            string[] strSplitArr = argument.Split(',');
            Label2.Visible = true;
            string _query = "UPDATE [users] SET rating = (rating +10) where userid = '" + strSplitArr[0] + "'";
            string _query2 = "UPDATE [posts] SET answer = 1 where postid = '" + strSplitArr[1] + "'";
            string _query3 = "UPDATE [topics] SET solved = 1 where topicid = '" + Request.QueryString["topicid"] + "'";

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
                        comm.CommandText = _query2;
                        comm.ExecuteNonQuery();
                        comm.CommandText = _query3;
                        comm.ExecuteNonQuery();
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (SqlException ex)
                    {
                        Label2.Visible = true;
                        Label2.Text += Convert.ToString(ex);
                    }
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            string _query = "INSERT INTO [posts] (userid, topicid, message) VALUES ('" + userID + "', '" + Request.QueryString["topicid"] + "', '" + Convert.ToString(TextBox1.Text) + "' )";


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
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (SqlException ex)
                    {
                        Label2.Visible = true;
                        Label2.Text += Convert.ToString(ex);
                    }
                }

            }
        }
    }
}