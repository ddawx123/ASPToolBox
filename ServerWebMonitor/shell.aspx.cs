using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace ServerWebMonitor
{
    public partial class shell : System.Web.UI.Page
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

            Response.ContentType = "text/plain;charset=utf-8";
            string cmdstr = Request.Form["cmdstr"];
            if (String.IsNullOrEmpty(cmdstr))
            {
                Response.Write("Shell命令远程执行 By DingStudio(小丁工作室)\n\r");
                Response.Write("使用帮助：请在URL后传入cmdstr信息，如shell.aspx?cmdstr=www.dingstudio.cn\n\r");
                Response.Write("shell.aspx为本程序文件名，www.dingstudio.cn为您要ping的主机名或IP地址\n\r");
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
            prc.StandardInput.WriteLine(cmdstr);
            prc.StandardInput.Close();
            Response.Write(prc.StandardOutput.ReadToEnd());
        }
    }
}
