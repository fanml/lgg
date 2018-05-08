<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/2 0002
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>综合评分</title>
    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript"src="js/echarts.min.js"></script>
    <script type="text/javascript" src="js/startScore.js"></script>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>--%>
    <%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>--%>
    <%--<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>--%>
    <link rel="stylesheet"type="text/css" href="css/all.css" />
    <link rel="stylesheet"type="text/css" href="css/serch.css" />
    <style>
        #search_box{
            position: absolute;
            top: 40px;
            left: 260px;
        }
        #img{
            width: 300px;
            height: 300px;
            position: absolute;
            top: 100px;
            left: 230px;
        }
        #meter{
            position: absolute;
            top: -30px;
            left: 700px;
        }
        #explainTable{
            position: absolute;
            top: 400px;
            left: 150px;
            margin-left: 120px;
        }
        #histogram{
            position: absolute;
            top: 500px;
            left: 180px;
        }
        /*星星评分*/
        body,li,p,ul {
            margin: 0;
            padding: 0;
            font: 12px/1 Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
        }
        ul, li, ol { list-style: none; }
        /* 重置文本格式元素 */
        a{ text-decoration: none; cursor: pointer; color:#333333; font-size:14px;}
        #btn{BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7b9ebd 1px solid; BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid}
        a:hover { text-decoration: none; }
        .clearfix::after{ display:block; content:''; height:0; overflow:hidden; clear:both;}
        /*星星样式*/
        .content{ width:600px; margin:0 auto; padding-top:20px;}
        .title{ font-size:14px; background:#dfdfdf; padding:10px; margin-bottom:10px;}
        .block{ width:100%; margin:0 0 20px 0; padding-top:10px; padding-left:50px; line-height:21px;}
        .block .star_score{ float:left;}
        .star_list{height:21px;margin:50px; line-height:21px;}
        .block p,.block .attitude{ padding-left:20px; line-height:21px; display:inline-block;}
        .block p span{ color:#C00; font-size:16px; font-family:Georgia, "Times New Roman", Times, serif;}
        .star_score { background:url(images/stark2.png); width:160px; height:21px;  position:relative; }
        .star_score a{ height:21px; display:block; text-indent:-999em; position:absolute;left:0;}
        .star_score a:hover{ background:url(images/stars2.png);left:0;}
        .star_score a.clibg{ background:url(images/stars2.png);left:0;}
        #starttwo .star_score { background:url(images/starky.png);}
        #starttwo .star_score a:hover{ background:url(images/starsy.png);left:0;}
        #starttwo .star_score a.clibg{ background:url(images/starsy.png);left:0;}
        .content{
            position: absolute;
            top: 300px;
            left:200px;
        }
    </style>
</head>
<body style="height: 100%; margin: 0 ;">
<div>
    <div id="search_box">
        <form id="search_form" method="get" action="http://localhost:8080/dream/playerGrade">
            <input type="text" id="s"  class="swap_value" name="playerName"/>
            <input type="image" src="img/btn_search_box.gif" width="27" height="24" id="go" alt="Search" title="Search" />
        </form>
    </div>
    <div id="img"><img id="ii"src=""></div>
    <div id="meter" style="height: 500px;width:500px"></div>
    <div id="explainTable">
    <table>
        <th>计算方式说明</th>
        <tr>
            <td>平均X：</td>
            <td>球员各个赛季平均X总和/生涯总赛季数</td>
        </tr>
        <tr>
            <td>忠诚度：</td>
            <td>1)球员效力统一球队大于3年（含3年）小于5年 +50 2)大于5年 +80 3)每换一次球队 -10 4)1,2,3相加</td>
        </tr>
        <tr>
            <td>伤病程度：</td>
            <td>（球员受伤部位*受伤数）的总和</td>
        </tr>
        <tr>
            <td>综合得分：</td>
            <td>(salaryAvg*fireAvg*hitRateAvg/(accountAvg+blockShotAvg)-(injuryLevel-loyalty)/10)/1000</td>
        </tr>
    </table>
    </div>
    <div id="histogram" style="height: 500px;width:900px"></div>
    <div class="content">
        <div id="starttwo" class="block clearfix">
            <div  class="star_score"></div>
            <p style="float:left;">您的评分：<span class="fenshu"></span> 分</p>
            &nbsp;&nbsp;<button id="btn" onclick="setGrade()">确定</button>
        </div>
        <script>
            scoreFun($("#startone"))
            scoreFun($("#starttwo"),{
                fen_d:22,//每一个a的宽度
                ScoreGrade:5//a的个数 10或者
            })
        </script>
    </div>
</div>
<script type="text/javascript">

    var map=${map};
    var list;
    var endGrade;
    var playerId;
        $.each(map,function (key,values) {
            if(key=="endGrade"){
                endGrade=values;
            }
        })
        $.each(map,function (key,values) {
            if(key=="list"){
                list=values;
            }
        })
       $.each(map,function (key,values) {
        if(key=="playerId"){
            playerId=values;
        }
        })

    $("#ii").attr("src","img/playerImg/"+playerId+".png");
    function setGrade() {
        var grade=$(".fenshu").text();
        $.get("http://localhost:8080/dream/setGrade",{ grade: grade, playerId:playerId },
            function(data){
                alert("评分结果: " + data);
            });
    }

    var dom = document.getElementById("histogram");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    var option = {
        dataset: {
            source:list
        },
        grid: {containLabel: true},
        xAxis: {name: 'amount'},
        yAxis: {type: 'category'},
        visualMap: {
            orient: 'horizontal',
            left: 'center',
            min: 0,
            max: 100,
            text: ['100', '0'],
            // Map the score column to color
            dimension: 0,
            inRange: {
                color: ['#D7DA8B', '#E15457']
            }
        },
        series: [
            {
                type: 'bar',
                encode: {
                    // Map the "amount" column to X axis.
                    x: 'amount',
                    // Map the "product" column to Y axis
                    y: 'product'
                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
    <script type="text/javascript">
    <%--仪表盘--%>
    var dom = document.getElementById("meter");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        tooltip : {
            formatter: "{a} <br/>{b} : {c}%"
        },
        toolbox: {
            feature: {
                restore: {},
                saveAsImage: {}
            }
        },
        series: [
            {
                name: '球员评分',
                type: 'gauge',
                detail: {formatter:'{value}'},
                data: [{value: 0, name: '分值'}]
            }
        ]
    };

    setInterval(function () {
        option.series[0].data[0].value = (endGrade).toFixed(2) - 0;
        myChart.setOption(option, true);
    },2000);
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</body>
</html>
