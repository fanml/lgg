<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/18 0018
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<div class="register-container">
    <h1>ShareLink</h1>

    <div class="connect">
        <p>Link the world. Share to world.</p>
    </div>

    <form action="register" method="post" id="registerForm">
        <div>
            <input type="text" name="username" class="username" id="username" placeholder="您的用户名" autocomplete="off" onblur="checkUsername()"/>
        </div>
        <div><span id="usernameMess"></span></div>
        <div>
            <input type="hidden" name="pwdMD5" id="pwdMD5">
            <input type="password" name="password" class="password" id="psw" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="password" name="confirm_password" class="confirm_password" id="psw2" placeholder="再次输入密码" onblur="mdjia()" oncontextmenu="return false" onpaste="return false"/>
        </div>
        <div>
            <%--<input type="hidden" name="phone_number"value="183456789"/>--%>
            <%--<input type="text" name="phone_number" class="phone_number" placeholder="输入手机号码" autocomplete="off" />--%>
        </div>
        <div>
            <input type="text" name="idCard"  placeholder="输入身份证号" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
        </div>

        <button id="submit" type="submit">设置密保问题</button>
    </form>
    <a href="http://localhost:8080/dream/index">
        <button type="button" class="register-tis">已经有账号？</button>
    </a>
</div>
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<script src="js/myJS/register.js" type="text/javascript"></script>
<script src="js/jquery.min.js"></script>
<script src="js/myJS/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>
<%--密码加密--%>
<script src="js/jquery.md5.js" type="text/javascript"></script>
</body>

</html>
