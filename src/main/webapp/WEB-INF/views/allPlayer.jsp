<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/8 0008
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>qq空间遮罩层jQuery相册切换 - 站长素材</title>
    <style>
        *{padding:0; margin:0; list-style:none;}
        .center{ width:450px; height:450px; background:#999; margin:40px auto 0 auto;}
        .center img{ float:left; width:150px; height:150px; cursor:pointer;}
        .popup{ position:fixed; background:rgba(0,0,0,0.4); bottom:0; top:0;left:0;right:0; display:none;}
        .show{ position:absolute; top:50px; left:50%; margin-left:-150px; margin-top:75px; display:none;}
        .big{ width:300px; height:300px;}
        .left{ position:absolute; top:125px; left:-50px; cursor:pointer;}
        .right{ position:absolute; top:125px; right:-50px; cursor:pointer;}
    </style>
</head>
<body>

<div class="center">
    <img src="images/big_2.jpg"/>
    <img src="images/big_2.jpg"/>
    <img src="images/big_3.jpg"/>
    <img src="images/big_4.jpg"/>
    <img src="images/big_5.jpg"/>
    <img src="images/big_6.jpg"/>
    <img src="images/big_7.jpg"/>
    <img src="images/big_8.jpg"/>
    <img src="images/big_9.jpg"/>
    <img src="images/big_2.jpg"/>
    <img src="images/big_2.jpg"/>
    <img src="images/big_3.jpg"/>
</div>

<div class="popup"></div>

<div class="show">
    <img class="big" src="images/big_1.jpg"/>
    <div>哈哈哈哈</div>
    <img class="left" src="images/left.png"/>
    <img class="right" src="images/right.png"/>
</div>

<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function(){
        var list=${list};
        console.log(list)
        <%--切换图片--%>
        var bigImg='';
        var _index=0;
        $(".popup").click(function(){
            $(".show").hide();
            $(this).hide();
        });
        $(".center img").click(function(){
            $(".popup").show();
            $(".show").show();
            bigImg=$(this).attr("src");//获取点击图片的地址
            //alert(bigImg);
            $(".show img.big").attr("src",bigImg); //更换大图的图片地址
            _index=$(this).index();//保存图片的序列号
            //alert(_index);
        });
        $(".right").click(function(){
            _index++; //序列号加1 _index+1
            if(_index>8){_index=0};
            bigImg=$(".center img").eq(_index).attr("src");
            $(".show img.big").attr("src",bigImg);
        });
        $(".left").click(function(){
            _index--; //序列号加1 _index+1
            if(_index<-1){_index=8};
            bigImg=$(".center img").eq(_index).attr("src");
            $(".show img.big").attr("src",bigImg);
        });
    })
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
    <p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
</div>
</body>
</html>
