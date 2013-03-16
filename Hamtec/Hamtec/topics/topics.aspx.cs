using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hamtec.topics
{
    public partial class topics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["topicid"] != null)
            {
                Label1.Text = "Deze pagina is voor het topic met ID:";
                Label1.Text += Convert.ToString(Request.QueryString["topicid"]);

            }

        }
    }
}