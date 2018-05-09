<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/8 0008
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>球队历史展现</title>


    <link href="css/normalize.min.css" rel="stylesheet" media="all">
    <link href="css/jquery.jbooklet.css" rel="stylesheet" media="all">
    <style>
        body {
            text-rendering: optimizeLegibility;
        }
        h1 {
            text-align: center;
        }
        h3 {
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .b-page {
            border: 1px solid #ccc;
        }
        .b-page.b-grab {
            border: none;
        }
        p {
            font-size: .7em;
            font-family: Baskerville, ‘Times New Roman’, Times, serif;
            line-height: 1.4;
        }
        #tfont{
            position: absolute;
            top: 100px;
            left: 152px;
        }
        #title{
            font-size: 25px;
            font-weight:900;
        }
        .flash2{
            position: absolute;
        }
    </style>
    <link rel="stylesheet" href="css/all.css">
</head>
<body>
<div id="all">
        <div class="flash2">
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version

					=7,0,19,0" width="711" height="198">
                <param name="movie" value="img/fl2.swf" />
                <param name="quality" value="high" />
                <param name="WMODE" value="transparent">
                <embed src="img/fl2.swf" quality="high" wmode="transparent"
                       pluginspage="http://www.macromedia.com/go/getflashplayer"
                       type="application/x-shockwave-flash"
                       width="1210" height="600">

                </embed>
            </object>
        </div>
<div id="tfont"><label id="title"></label></div>
<div style="text-align: center"><img id="teamImg" src="" width="200px"></div>
<div id="mybook">
</div>
    <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';z-index:10 ">
        <p>球队近代史纲要</p>
        <p><a href="http://localhost:8080/dream/toTeamDetail?teamId=${teamId}">返回主页</a></p>
    </div>
</div>
<!--[if lt IE 9]>
<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
<script src="js/teamHistoryjs/jquery.min.js"></script>
<script src="js/teamHistoryjs/jquery-ui.min.js"></script>
<script src="js/teamHistoryjs/jquery.easing.min.js"></script>

<script src="js/teamHistoryjs/jquery.jbooklet.js"></script>

<script>
    $(function() {
        var map=${map};
        var list=${list};
        $("#title").text(map.球队名称);
        $("#teamImg").attr('src','img/'+map.球队图片+'.jpg');
//        $("#teamImg").src='img/'+map.球队图片+'.jpg';
        var strList = '<div>\n' +
            '        <h3>Page 1</h3>\n' +
            '        <p><img src="img/dong1.jpg" style="margin-left: 42px;margin-top: 100px"></p>\n' +
            '    </div>';
        $.each(list,function (index,obj) {
            var a=index+2;
            console.log(obj.interval+obj.detail)
            strList += "<div>" +
                       "     <h3>Page"+a+"</h3>"+
                       "        <h3>"+obj.interval+"</h3>" +
                       "       <p>" +
                       obj.detail+
                       "        </p>" +
                       "    </div>";

        })
        $("#mybook").html(strList);
        $('#mybook').booklet();
    });
</script>

</body>
</html>
