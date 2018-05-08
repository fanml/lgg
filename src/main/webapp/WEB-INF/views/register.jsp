<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/2/28 0028
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>注册</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.md5.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/myJS/register.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</head>
<body>
<form action="register" method="post" id="form1">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input type="text" id="username" name="username" class="input" onblur="checkUsername()"/></td>
            <td><span id="usernameMess"></span></td>
        </tr>
        <tr>
            <td>密码：<input type="hidden" name="pwdMD5" id="pwdMD5"></td>
            <td><input type="password" id="psw" name="psw" class="input"/></td>
            <td></td></tr>
        <tr>
            <td>再次输入密码：</td>
            <td><input type="password" id="psw2" name="psw2" class="input"onblur="mdjia()"/></td>
            <td></td>
        </tr>
        <tr>
            <td>身份证号：</td>
            <td><input type="text" id="idCard" name="idCard" class="input" /></td>
            <td></td>
        </tr>
        <tr>
            <td>手机号：</td>
            <td><input type="text" id="tel" name="tel" class="input"/></td>
            <td></td>
        </tr>
        <tr>
            <td>住址：</td>
            <td><input type="text" id="location" name="location" class="input"/></td>
            <td></td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td><input type="text" id="email" name="email" class="input"/></td>
            <td></td>
        </tr>
        <tr>
            <td><input type="button" onclick="submit()" value="设置密保问题"/></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</form>
</body>
</html>
