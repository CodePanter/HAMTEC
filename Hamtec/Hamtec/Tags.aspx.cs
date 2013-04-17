using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hamtec
{
    public partial class Tags : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string encode = Request.QueryString["tag"];
            //string encode = Server.UrlEncode("C#");
            Label1.Text = encode;
        }
    }
}