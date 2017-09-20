using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ServerWebMonitor
{
    public partial class SSOLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["callback"] == null)
            {
                Response.ContentType = "text/plain;charset=utf-8";
                Response.Write("没有有效的callback参数，操作无法继续");
                Response.End();
                return;
            }
            if(Server.HtmlEncode(Request.RequestType) == "POST")
            {
                string username = Request.Form["username"];
                string password = Request.Form["password"];
                if(String.IsNullOrEmpty(username) || String.IsNullOrEmpty(password))
                {
                    Response.ContentType = "text/plain;charset=utf-8";
                    Response.Write("用户名或密码不能为空！请返回修改后重试。");
                    Response.End();
                    return;
                }
                else
                {
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://passport.dingstudio.cn/sso/api?format=ajaxlogin");
                    request.Method = "POST";
                    request.ContentType = "application/x-www-form-urlencoded";
                    request.ContentLength = Encoding.UTF8.GetByteCount("username=" + username + "&userpwd=" + password + "&cors_domain=localapp");
                    request.KeepAlive = false;
                    request.ProtocolVersion = HttpVersion.Version10;
                    String post_data = "username=" + username + "&userpwd=" + password + "&cors_domain=localapp";
                    using (StreamWriter dataStream = new StreamWriter(request.GetRequestStream()))
                    {
                        dataStream.Write(post_data);
                        dataStream.Close();
                    }
                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                    string encoding = response.ContentEncoding;
                    if (encoding == null || encoding.Length < 1)
                    {
                        encoding = "UTF-8"; //设置UTF-8为默认编码  
                    }
                    StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding(encoding));
                    string retString = reader.ReadToEnd();
                    JObject jo = (JObject)JsonConvert.DeserializeObject(retString);
                    string login_result = jo["data"]["authcode"].ToString();
                    string requestId = jo["requestID"].ToString();
                    if (login_result.Equals("1"))
                    {
                        HttpCookie token = new HttpCookie("token");
                        token.Value = requestId;
                        Response.SetCookie(token);
                        Response.Redirect(Request.QueryString["callback"]);
                        Response.End();
                    }
                    else
                    {
                        Response.Redirect("NoAccess.htm?fromPage=" + HttpUtility.UrlEncode(Request.Url.ToString()));
                        Response.End();
                        return;
                    }
                }
            }
        }
    }
}