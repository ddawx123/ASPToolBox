using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;

namespace ServerWebMonitor
{
    public partial class httpclient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["token"] != null)
            {
                string token = Request.Cookies["token"].Value;
                if (String.IsNullOrEmpty(token))
                {
                    Response.Redirect("Authority.aspx?callback=" + HttpUtility.UrlEncode(Request.Url.ToString()));
                    Response.End();
                    return;
                }
            }
            else
            {
                Response.Redirect("Authority.aspx?callback=" + HttpUtility.UrlEncode(Request.Url.ToString()));
                Response.End();
                return;
            }

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Request.Form["url"]);
            request.Method = "GET";
            request.ContentType = "text/plain;charset=utf-8";
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream myResponseStream = response.GetResponseStream();
            StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.UTF8);
            string retString = myStreamReader.ReadToEnd();
            myStreamReader.Close();
            myResponseStream.Close();
            Response.ContentType = "text/plain;charset=utf-8";
            Response.Write(retString);
            Response.End();
        }
    }
}