<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SSOLogin.aspx.cs" Inherits="ServerWebMonitor.SSOLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/ie10-viewport-bug-workaround.css" rel="stylesheet" />
<link href="static/css/signin.css" rel="stylesheet" />
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="static/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="static/js/ie-emulation-modes-warning.js"></script>
<title>统一身份认证平台|小丁工作室</title>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="static/js/html5shiv.min.js"></script>
  <script src="static/js/respond.min.js"></script>
<![endif]-->
</head>
<body>
    <div id="header" align="center"><h1>用户单点登录-需要身份验证</h1><br />温馨提示：请使用统一身份认证平台账号登陆</div>


    <div class="container">

      <form class="form-signin" id="form" method="post" runat="server">
        <label for="username" class="sr-only">用户账号：</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="键入用户账号">
        <label for="password" class="sr-only">用户密码：</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="键入用户密码">
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>

    </div> <!-- /container -->

    <div id="footer" align="center" style="filter: alpha(Opacity=80);-moz-opacity: 0.5;opacity: 0.5;position: fixed;bottom: 0;left: 0;height: 20px;width: 100%;background-color: #000000;color: #ffffff">Powered By <a href="http://www.dingstudio.cn" target="_blank">DingStudio</a> 小丁工作室网络信息中心</div>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="static/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
