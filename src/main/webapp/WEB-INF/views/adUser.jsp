<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/16 0016
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title><script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/all.css">
    <style>
        * { padding: 0; margin: 0; }
        table {
            border-collapse: collapse;
            border-spacing: 0;
            border: 1px solid #c0c0c0;
        }

        th,td {
            border: 1px solid #d0d0d0;
            color: #404060;
            padding: 10px;
        }

        th {
            background-color: #09c;
            font: bold 16px "微软雅黑";
            color: #fff;
        }

        td {
            font: 14px "微软雅黑";
        }
        tbody tr {
            background-color: #f0f0f0;
        }
        tbody tr:hover {
            cursor: pointer;
            background-color: #fafafa;
        }
    </style>
    <script>
        var data =${list};
        $(function(){
            //第一种：动态创建表格的方式，使用拼接html的方式 （推荐）
            // var html = "";
            // for( var i = 0; i < data.length; i++ ) {
            //     html += "<tr>";
            //     html +=     "<td>" + data[i].name + "</td>"
            //     html +=     "<td>" + data[i].url + "</td>"
            //     html +=     "<td>" + data[i].type + "</td>"
            //     html += "</tr>";
            // }
            // $("#J_TbData").html(html);

            //第二种： 动态创建表格的方式，使用动态创建dom对象的方式
            //清空所有的子节点
            $("#J_TbData").empty();

            //自杀
            // $("#J_TbData").remove();

            for( var i = 0; i < data.length; i++ ) {
                //动态创建一个tr行标签,并且转换成jQuery对象
                var $trTemp = $("<tr></tr>");

                //往行里面追加 td单元格
                $trTemp.append("<td>"+ data[i].userName +"</td>");
                $trTemp.append("<td>"+ data[i].idCard +"</td>");
                $trTemp.append("<td>"+ data[i].telephone +"</td>");
                $trTemp.append("<td>"+ data[i].email +"</td>");
                $trTemp.append("<td>"+ data[i].location +"</td>");
                $trTemp.append("<td>"+ "<a href='deleteUsers?userId="+data[i].id+"'>删除</a>"+"</td>");
                // $("#J_TbData").append($trTemp);
                $trTemp.appendTo("#J_TbData");
            }
        });
    </script>
</head>
<body>
<%@ include file="adTitle.jsp"%>
<div id="all" style="text-align: center">
    <table>
        <thead>
        <tr>
            <th>用户名</th>
            <th>证件号码</th>
            <th>联系方式</th>
            <th>e-mail</th>
            <th>地址</th>
            <th><a href="deleteUsers?userId=all">删除</a></th>
        </tr>
        </thead>
        <tbody id="J_TbData">
        </tbody>
    </table>
</div>
</body>
</html>
