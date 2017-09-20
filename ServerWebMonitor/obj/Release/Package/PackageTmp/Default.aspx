<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ServerWebMonitor.Default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>网络工具箱</title>
    <script>
        <%
        if(Request.Cookies["token"]!=null)
        {
            string token = Request.Cookies["token"].Value;
            if (String.IsNullOrEmpty(token))
            {
                Response.Redirect("Authority.aspx?callback=" + HttpUtility.UrlEncode(Request.Url.ToString()));
            }
            else
            {
                Response.Write("var usertoken = " + token + "; //初始化用户登陆成功的令牌");
            }
        }
        else
        {
            Response.Redirect("Authority.aspx?callback=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        %>

        function goQuestion() {
            if (confirm("确认要继续操作吗？")) {
                return true;
            }
            return false;
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 71%;
            border-collapse: collapse;
            border: 2px solid #000000;
            background-color: #FFFFCC;
            height: 175px;
        }
        .auto-style3 {
            height: 106px;
            width: 395px;
        }
        .auto-style4 {
            height: 110px;
            width: 395px;
        }
        .auto-style5 {
            height: 110px;
            width: 309px;
        }
        .auto-style6 {
            height: 106px;
            width: 309px;
        }
        .auto-style7 {
            height: 110px;
            width: 411px;
        }
        .auto-style8 {
            height: 106px;
            width: 411px;
        }
    </style>
</head>
<body>
    <div id="header" align="center"><h1 style="color:lightsalmon">网络工具箱Web版_内测自用版</h1></div>
    <div id="container" align="center">
        
        <table align="center" class="auto-style1">
            <tr>
                <td class="auto-style5">ICMP报文测试（ping）<br />
                <form method="post" action="icmp.aspx" target="output" onsubmit="return goQuestion()"><input type="text" name="host" placeholder="键入主机名或IP地址" /><input type="submit" value="启动测试" /></form></td>
                <td class="auto-style7">远程执行cmd命令<br />
                <form method="post" action="shell.aspx" target="output" onsubmit="return goQuestion()"><input type="text" name="cmdstr" placeholder="键入shell指令" /><input type="submit" value="执行命令" /></form></td>
                <td class="auto-style4">http协议报文抓取<br />
                <form method="post" action="httpclient.aspx" target="output" onsubmit="return goQuestion()"><input type="text" name="url" placeholder="键入网址(URL)" /><input type="submit" value="拉取数据" /></form></td>
            </tr>
            <tr>
                <td class="auto-style6">重启远程服务器（延迟1分钟执行）<br />
                <form method="post" action="reboot.aspx" target="output" onsubmit="return goQuestion()"><input type="hidden" name="usertoken" value="<% Response.Write(Request.Cookies["token"].Value); %>" /><input type="submit" value="发送指令" /></form></td>
                <td class="auto-style8">修改控制中心密码<br />
                <form method="post" action="repwd.aspx" target="output"><input type="text" name="usrpwd" placeholder="控制中心新密码" value="由于安全策略已被停用" disabled="disabled" /><input type="button" value="立即修改" onclick="location.href = 'https://passport.dingstudio.cn/sso/usercenter?action=account-config#pwdchange';" /></form></td>
                <td class="auto-style3"><a href="Logout.aspx" target="_self" onclick="return goQuestion()">退出登录</a></td>
            </tr>
        </table>
        <br />
        执行结果输出区：
        <br />
        <iframe id="output" name="output" src="about:blank" width="800" height="600"></iframe>
    </div>
    <div id="footer" align="center" style="filter: alpha(Opacity=80);-moz-opacity: 0.5;opacity: 0.5;position: fixed;bottom: 0;left: 0;height: 20px;width: 100%;background-color: #000000;color: #ffffff">Powered By <a href="http://www.dingstudio.cn" target="_blank">DingStudio</a> 小丁工作室网络信息中心</div>
</body>
</html>
