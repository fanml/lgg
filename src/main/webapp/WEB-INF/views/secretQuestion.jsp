<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/28 0028
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>密保</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/myJS/secretQuestion.js" type="text/javascript"></script>
    <script type="text/javascript">
        //加载页面后动态加载question,如果是注册页面跳转，这移除onblur属性
        $(function() {
            if(${requestScope.type ne 'login'}){
                $(":input").removeAttr("onblur");
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/loadQuestion",
                data:{

                },
                type:"post",
                success:function (msg) {
                    var resultList = jQuery.parseJSON(msg);
                    for(var i=0;i<resultList.length;i++){
                        $("select.question").append("<option value='"+resultList[i].id+"' class='option"+resultList[i].id+"'>"+resultList[i].question+"</option>");
                    }
                    window.resultListSize = resultList.length;
                }
            });
            $("table tr:nth-child(even)").addClass("even");
        });

    </script>
</head>
<body>
<table>
<form action="addAnswer" method="post" id="form1">
    <input type="text" value="${type eq 'login'}"/>
    <c:choose>
        <c:when test="${requestScope.type eq 'login'}">
            <tr>
            <td><span>找回密码</span></td>
            <td>用户名:<input type="text" name="username" value="${requestScope.username}" id="username"/></td>
            </tr>
            <tr>
                <td><input type="button" value="提交" id="btn1" onclick="submitValidate()"/></td>
                <td></td>
            </tr>
        </c:when>

        <c:otherwise>
            <tr>
            <td><span>添加密保</span></td>
            <td>用户名:<input type="text" name="username2" value="${requestScope.username}" id="username2"/></td>
            </tr>
            <tr>
                <td><input type="button" value="提交" id="btn2" onclick="submitForm()"/></td>
                <td></td>
            </tr>
        </c:otherwise>
    </c:choose>
    <tr><td>问题1：</td>
        <td><select onfocus="loadQue1()" class="question" id="question1" name="q1"><option value="0">请选择问题</option></select></td>
    </tr>
    <tr><td><span id="result1"></span></td>
        <td><input type="text" name="answer1" id="answer1" onblur="answerValidate(1)"/></td>
    </tr>
    <tr>
        <td>问题2：</td>
        <td><select onfocus="loadQue1()" class="question" id="question2" name="q2"><option value="0">请选择问题</option></select></td>
    </tr>
    <tr><td><span id="result2"></span></td><td><input type="text" name="answer2" id="answer2" onblur="answerValidate(2)"/></td></tr>
    <tr>
        <td>问题3：</td>
        <td><select onfocus="loadQue1()" class="question" id="question3" name="q3"><option value="0">请选择问题</option></select></td>
    </tr>
    <tr><td><span id="result3"></span></td><td><input type="text" name="answer3" id="answer3" onblur="answerValidate(3)" /></td></tr>
</form>
</table>

</body>
</html>
