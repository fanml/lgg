<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/3/17 0017
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<%  String mess ="";
    String username="";
    String password="";
    Object isLogin=request.getAttribute("isLogin");
    if(isLogin!=null){
        mess=(String)isLogin;
    }else{
        Cookie [] cookie=request.getCookies();
        for(int i=0;i<cookie.length;i++){
            if(cookie[i].getName().equals("username"))
                username=cookie[i].getValue();
            if(cookie[i].getName().equals("password"))
                password=cookie[i].getValue();
        }
    }
%>
<div class="login-container">
    <h1>NBA情报分析</h1>

    <div class="connect">
        <p>欢迎访问</p>
    </div>

    <form action="login" method="post" id="loginForm">
        <div>
            <input type="text" name="username" class="username" placeholder="用户名" autocomplete="off" id="username" value="<%=username%>" onclick="usernameClear()"/>
        </div>
        <div>
            <input type="hidden" name="pwdMD5" id="pwdMD5">
            <input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" id="pwd" value="<%=password%>" onblur="mdjia()" onclick="pswClear()" />
        </div>
        <div style="text-align: left">
            <label style="width: 200px; text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;记住密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="checkbox" id="saveCheck" onchange="check()" style="width:30px; height: 20px"/>
            <input type="hidden" name="savePwd"id="savePwd"/>
        </div>
        <div style="text-align: left">
            <label style="width: 200px; text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;验证码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><img id="img" src="http://localhost:8080/dream/user/check.jpg" >
        </div>
        <div>
            <input type="button" onclick="refresh()" value="看不清换一张" width="300"/>
            <input type="text" id="code" name="code" placeholder="输入验证码"/>
        </div>
        <button id="submit" type="submit" name="submitBtn" onclick="submit()">登 陆</button>
    </form>
    <a href="http://localhost:8080/dream/toRegister">
        <button type="button" class="register-tis" style="width: 150px">还有没有账号？</button>
    </a>
        <button type="button" class="register-tis" style="width: 150px" onclick="toSecretQuestion()">忘记密码？</button>

</div>

<script src="js/jquery.min.js"></script>
<script src="js/myJS/common.js"></script>
<script src="js/myJS/login.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>
<%--密码加密--%>
<script src="js/jquery.md5.js" type="text/javascript"></script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>NBA情报分析--广大球迷的新平台</p>
    <%--<p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>--%>
</div>
</body>
</html>
