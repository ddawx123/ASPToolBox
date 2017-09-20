using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace ServerWebMonitor
{
    public partial class reboot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "text/plain;charset=utf-8";
            if (Request.Cookies["token"] != null)
            {
                string token = Request.Cookies["token"].Value;
                string post_token = Request.Form["usertoken"];
                if (String.IsNullOrEmpty(token) || String.IsNullOrEmpty(post_token))
                {
                    Response.Redirect("Authority.aspx?callback=" + HttpUtility.UrlEncode(Request.Url.ToString()));
                }
                else
                {
                    if(!token.Equals(post_token))
                    {
                        Response.ContentType = "text/plain;charset=utf-8";
                        Response.Write("您的请求存在未知安全隐患，已被系统自动拒绝！请不要通过其他通道请求本接口。\n\r");
                        Response.End();
                        return;
                    }
                    Process prc = new Process();
                    prc.StartInfo.FileName = "cmd.exe";
                    prc.StartInfo.UseShellExecute = false;
                    prc.StartInfo.RedirectStandardInput = true;
                    prc.StartInfo.RedirectStandardOutput = true;
                    prc.StartInfo.RedirectStandardError = true;
                    prc.StartInfo.CreateNoWindow = true;
                    prc.Start();
                    prc.StandardInput.WriteLine("shutdown -r -f -t 60");
                    prc.StandardInput.Close();
                    Response.Write("Result: 操作成功结束！\n\n远程命令执行结果输出如下：\n\n\n" + prc.StandardOutput.ReadToEnd());
                }
            }
            else
            {
                Response.Redirect("Authority.aspx?callback=" + HttpUtility.UrlEncode(Request.Url.ToString()));
            }
        }
    }
}