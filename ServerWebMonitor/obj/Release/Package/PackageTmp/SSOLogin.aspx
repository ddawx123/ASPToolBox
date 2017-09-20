<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SSOLogin.aspx.cs" Inherits="ServerWebMonitor.SSOLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>统一身份认证平台|小丁工作室</title>
</head>
<body>
    <div id="header" align="center"><h1>用户单点登录-需要身份验证</h1><br />温馨提示：请使用统一身份认证平台账号登陆</div>
    <form id="form" method="post" runat="server">
        <div id="input_group" align="center">
            <label for="username">用户账号：</label><input type="text" id="username" name="username" placeholder="键入用户账号" /><br />
            <label for="password">用户密码：</label><input type="password" id="password" name="password" placeholder="键入用户密码" /><br />
        </div>
        <div id="operate_group" align="center">
            <input type="submit" name="btnLogin" value="登录" />
        </div>
    </form>
    <div id="footer" align="center" style="filter: alpha(Opacity=80);-moz-opacity: 0.5;opacity: 0.5;position: fixed;bottom: 0;left: 0;height: 20px;width: 100%;background-color: #000000;color: #ffffff">Powered By <a href="http://www.dingstudio.cn" target="_blank">DingStudio</a> 小丁工作室网络信息中心</div>
</body>
</html>
