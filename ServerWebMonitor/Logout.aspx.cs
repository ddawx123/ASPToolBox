using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerWebMonitor
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["token"] != null)
            {
                HttpCookie token = Request.Cookies["token"];
                TimeSpan ts = new TimeSpan(-1, 0, 0, 0);
                token.Expires = DateTime.Now.Add(ts);
                Response.AppendCookie(token);
                Response.Redirect("Default.aspx");
                Response.End();
            }
            else
            {
                Response.ContentType = "text/plain;charset=utf-8";
                Response.Write("目前您没有有效的登录会话，无需注销哦。");
                Response.End();
                return;
            }
        }
    }
}