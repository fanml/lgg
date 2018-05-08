<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/3/14 0014
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All球队页面</title>
    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        function toTeamSchedule(i) {
            location.href="http://localhost:8080/dream/toTeamSchedule?teamId="+i+"&startTime=2018-01-01"+"&endTime=2018-07-01";
        }
    </script>
</head>
<body>
<%--List<Map<String,Object>> 赛程表，--%>
<input type="image" src="img/Warriors.jpg" width="100" onclick="toTeamSchedule(1)"/>
<%--<img src="img/Warriors.jpg" width="100" >--%>
</body>
</html>
