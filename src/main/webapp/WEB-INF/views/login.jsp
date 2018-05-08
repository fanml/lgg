<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/2/26 0026
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.md5.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/myJS/login.js" type="text/javascript"></script>
    <script  type="text/javascript">
    </script>
</head>
<body>
<h1>我们都对了还是错了，我们都爱了但还是忘了，你走的时候是哭了还是怎么了，我是疼了但还是笑了?</h1>
<form action="login" method="post" id="form1">
    <table>
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
        <tr>
            <td colspan="2"><div id="messDiv" style="display: block"><%=mess%></div></td></tr>
        <tr>
            <td><label>用户名：</label></td>
            <td><input type="text" name="username" id="username" value="<%=username%>" onclick="usernameClear()"/></td>
        </tr>
        <tr>
            <td><label>密&nbsp;&nbsp;码：</label><input type="hidden" name="pwdMD5" id="pwdMD5"></td>
            <td><input type="password" name="pwd" id="pwd" value="<%=password%>" onblur="mdjia()" onclick="pswClear()"/></td>
        </tr>
        <tr>
            <td>记住密码<input type="checkbox" id="saveCheck" onchange="check()"/></td>
            <td><input type="hidden" name="savePwd"id="savePwd"/></td>
        </tr>
        <tr>
            <td>验证码</td>
            <td><img id="img" src="http://localhost:8080/dream/user/check.jpg"></td>
        </tr>
        <tr>
            <td><input type="text" id="code" name="code"/>
            </td><td><input type="button" onclick="refresh()" value="看不清换一张" width="300"/></td>
        </tr>
        <tr>
            <td><input type="button" name="submitBtn" onclick="submit()" width="300px" value="登录"/></td>
            <td><input type="button" value="注册" onclick="toRegister()"/></td>
        </tr>
        <tr>
            <td><input type="button" value="忘记密码？" onclick="toSecretQuestion()"/></td><td></td>
        </tr>


    </table>

</form>
</body>
</html>
