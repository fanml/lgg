<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/2/26 0026
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        function test()
        {
            var user_name=$("#a").attr("value");
            alert(user_name);
        }
        function refresh() {
            var url = "http://localhost:8080/dream/user/check.jpg?number="+Math.random();
            $("#img").attr("src",url);
        }
    </script>
</head>
<body>
index.jsp页面
<input type="text" id="a" value="aaa"/>
<input type="button" id="btn1" onclick="test()"/>
验证码
<input type="text" id="code"/>
<img id="img" src="http://localhost:8080/dream/user/check.jpg">
<input type="button" onclick="refresh()" value="看不清换一张" width="300"/>
</body>
</html>
