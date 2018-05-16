<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/16 0016
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminLogin</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("#jump").click(function () {
                $("#form1").submit();
            })
        })
    </script>
</head>
<body>
<div>
    <form id="form1" action="http://localhost:8080/dream/admin/main" method="post" name="form1">
        <input type="text" name="adusername">
        <input type="password" name="adpsw">
        <input type="button" id="jump" value="管理员登陆">
    </form>
</div>
</body>
</html>
