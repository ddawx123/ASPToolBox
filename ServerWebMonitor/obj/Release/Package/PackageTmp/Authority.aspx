<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authority.aspx.cs" Inherits="ServerWebMonitor.Authority" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>身份验证|小丁工作室</title>
    <script>
        <%
        if(Request.Cookies["token"]!=null)
        {
            string token = Request.Cookies["token"].Value;
            if (!String.IsNullOrEmpty(token))
            {
                //Response.Redirect("Default.aspx?sessionId=" + token);
                Response.Write("location.href=\"Default.aspx?sessionId=" + token + "\";");
            }
            else
            {
                Response.Write("location.href=\"SSOLogin.aspx?callback=" + HttpUtility.UrlEncode(Request.Url.ToString()) + "\";");
                //Response.Redirect("SSOLogin.aspx?returnUrl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
            }
        }
        else
        {
            Response.Write("location.href=\"SSOLogin.aspx?callback=" + HttpUtility.UrlEncode(Request.Url.ToString()) + "\";");
            //Response.Redirect("SSOLogin.aspx?returnUrl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        %>
    </script>
</head>
<body>
    Tip: 正在等待服务器响应，请稍候。
</body>
</html>
