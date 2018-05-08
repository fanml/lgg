<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12 0012
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>playerAssess</title>
    <script type="text/javascript"src="js/zxt.js"></script>
    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
    <link rel="stylesheet"type="text/css" href="css/playerAssess.css" />
    <link rel="stylesheet"type="text/css" href="css/all.css" />
    <style>


        /*#all{*/
            /*width: 1210px;*/
            /*margin: auto;*/
            /*position: relative;*/
        /*}*/
        .container,#chartSalary,#chartAccount {
            /*margin: 30px auto;*/
            width: 600px;
            height: 300px;
            border: 1px solid #000;
        }
        polyline {
            fill: none;
            stroke: #000000;
            stroke-width: 2px;
            stroke-dasharray: 5px;
        }
        .textTipNum{
            fill:#000;
            font-size:12px;
        }
        #chartAccount svg{
            width: 600px;
            height:400px;
        }
        #chartSalary svg{
            width: 600px;
            height:400px;
        }
        #playerImg{
            width: 600px;
            height:800px;
            position: absolute;
            left: 650px;
            top:50px;
            z-index:9;

        }
        #playerModel{
            width: 300px;
            height:400px;
            position: absolute;
            left: 950px;
            top:450px;
            z-index:10;
        }
        #injuryDiv{
            width: 300px;
            height:100px;
            position: absolute;
            left: 650px;
            top:50px;
            z-index:10;
        }
        #injuryULDiv{
            position: absolute;
            left:150px;
            top: 0px;
            z-index:11;
        }
        #seasonULDiv{
            position: absolute;
            left:10px;
            top: 0px;
            z-index:11;
        }
        #seasonULDiv,#injuryULDiv li{
            color: #f59d1f;
        }
        #injuryDiv,#playerModel {
            display: none;
        }

        #search_box{
            position: absolute;
            top: 0px;
            left: 1050px;
        }
    </style>
    <link rel="stylesheet"type="text/css" href="css/serch.css" />
</head>
<body>
<div id="all">
    <%--<div class="seasonSelect">--%>
        <%--<select  class="select" id="select" name="q1"><option value="0">请选择赛季</option></select>--%>
    <%--</div>--%>
        <div id="search_box">
            <form id="search_form" method="get" action="http://localhost:8080/dream/playerAssess">
                <input type="text" id="s"  class="swap_value" name="playerName"/>
                <input type="image" src="img/btn_search_box.gif" width="27" height="24" id="go" alt="Search" title="Search" />
            </form>
        </div>
        <div id="injuryDiv">
            <div id="seasonULDiv">
            <ul id="seasonUL">
                <li>赛季</li>
            </ul>
            </div>
            <div id="injuryULDiv">
            <ul id="injuryUL">
                <li>伤病</li>
            </ul>
            </div>
        </div>
    <div id="chartAccount">
    </div>
    <div id="chartSalary">
    </div>
    <div class="container">
        <svg width="600" height="400"></svg>
    </div>
    <div id="playerImg">
        <img src="img/playerImg/player_model.png" alt="" width="600" height="800" id="bigImg"/>
    </div>
    <div id="playerModel">
        <img src="img/playerImg/player_model.png" alt=""width="300" height="400">
    </div>
</div>
<%--<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>--%>
<script>

    <%--设置模糊效果--%>
    var css1={
        "-webkit-filter": "blur(10px)",
        "-moz-filter": "blur(10px)",
        "-ms-filter": "blur(10px)",
        "filter":"blur(10px)"
    }
    var css2={
        "-webkit-filter": "blur(0px)",
        "-moz-filter": "blur(0px)",
        "-ms-filter": "blur(0px)",
        "filter":"blur(0px)"
    };
    $("#playerImg").on('mouseover',function () {
//        console.log("aaa")
        $("#injuryDiv").css('display','block');
        $("#playerModel").css('display','block');
        $("#playerImg").css(css1);
    })
    $("#playerImg").mouseout(function () {
//        console.log("bbb")
        $("#injuryDiv").css({"display":"none"});
        $("#playerModel").css({"display":"none"});
        $("#playerImg").css(css2);
    })
    var map1=${map};
    var playerId;
    $(function () {
        $.each(map1,function (key,values) {
            if(key=="playerImg"){
                var src="img/playerImg/"+values+".jpg";
                $("#bigImg").attr('src',src);
            }
        })
        $.each(map1,function (key,values) {
            if(key=="playerId"){
                 playerId=values;
            }
        })
        var bodyPartsList;
        var sList;
        $.each(map1,function (key,values) {
            if(key=="bodyPartsList"){
                bodyPartsList = values;
                li(bodyPartsList,"injuryUL");
            }
        })
        $.each(map1,function (key,values) {
            if(key=="injurySeasonList"){
//                console.log(values)
                sList=values;
                li(sList,"seasonUL");
            }
        })

    })
//    页面跳转
    $("#playerImg").click(function () {
        window.location.href="http://localhost:8080/dream/playerGrade?playerId="+playerId;
    })
    function li(list,ulId) {
//        console.log(list)
//        console.log(ulId)
        $.each(list,function (index,value) {
            if(value!=0&&value!="") {
                $("#" + ulId).append("<li>" + value + "</li>");
            }
        })
    }
    var dataset1;
    $.each(map1,function (key,values) {
        if(key=="cakeList"){
            dataset1 = values;
        }
    })
    window.onload = function() {
        var width = 600, height = 300;
        // 创建一个分组用来组合要画的图表元素
        var main = d3.select('.container svg').append('g')
            .classed('main', true)
            .attr('transform', "translate(" + width/2 + ',' + height/2 + ')');
        // 模拟数据
//        var dataset = [
//            {name: '购物', value: 98},
//            {name: '日常饮食', value: 300},
//            {name: '医药', value: 1400},
//            {name: '交通', value: 402},
//            {name: '杂费', value: 134}
//        ];
        var dataset=dataset1;
        // 转换原始数据为能用于绘图的数据
        var pie = d3.layout.pie()
            .sort(null)
            .value(function(d) {
                return d.value;
            });
        // pie是一个函数
        var pieData = pie(dataset);
        // 创建计算弧形路径的函数
        var radius = 100;
        var arc = d3.svg.arc()
            .innerRadius(0)
            .outerRadius(radius);
        var outerArc = d3.svg.arc()
            .innerRadius(1.2 * radius)
            .outerRadius(1.2 * radius);
        var oArc = d3.svg.arc()
            .innerRadius(1.1 * radius)
            .outerRadius(1.1 * radius);
        var slices = main.append('g').attr('class', 'slices');
        var lines = main.append('g').attr('class', 'lines');
        var labels = main.append('g').attr('class', 'labels');
        var place = main.append('g').attr('class', 'place');
        // 添加弧形元素（g中的path）
        var arcs = slices.selectAll('g')
            .data(pieData)
            .enter()
            .append('path')
            .attr('fill', function(d, i) {
                return getColor(i);
            })
            .attr('d', function(d){
                return arc(d);
            });
        //添加数字
        slices.selectAll("g")
            .data(pieData)
            .enter()
            .append("text")
            .attr("transform",function(d){
                return "translate(" + arc.centroid(d) + ")";
            })
            .attr("text-anchor","middle")
            .attr("class","textTipNum")
            .text(function(d){
                return d.data.value+"年";
            });

        // 添加文字标签
        var texts = labels.selectAll('.ss')
            .data(pieData)
            .enter()
            .append('text')
            .attr("class","ss")
            .attr('dy', '0.35em')
            .attr('fill', function(d, i) {
                return getColor(i);
            })
            .text(function(d, i) {
                return d.data.name;
            })
            .style('text-anchor', function(d, i) {
                return midAngel(d)<Math.PI ? 'start' : 'end';
            })
            .attr('transform', function(d, i) {
                // 找出外弧形的中心点
                var pos = outerArc.centroid(d);
                // 改变文字标识的x坐标
                pos[0] = radius * (midAngel(d)<Math.PI ? 1.5 : -1.5);

                return 'translate(' + pos + ')';
            })
            .style('opacity', 1);

        var polylines = lines.selectAll('polyline')
            .data(pieData)
            .enter()
            .append('polyline')
            .attr('points', function(d) {
                return [arc.centroid(d), arc.centroid(d), arc.centroid(d)];
            })
            .attr('points', function(d) {
                var pos = outerArc.centroid(d);
                pos[0] = radius * (midAngel(d)<Math.PI ? 1.5 : -1.5);
                return [oArc.centroid(d), outerArc.centroid(d), pos];
            })
            .style('opacity', 0.5);
    };
    function midAngel(d) {
        return d.startAngle + (d.endAngle - d.startAngle)/2;
    }
    function getColor(idx) {
        var palette = [
            '#2ec7c9', '#b6a2de', '#5ab1ef', '#ffb980', '#d87a80',
            '#8d98b3', '#e5cf0d', '#97b552', '#95706d', '#dc69aa',
            '#07a2a4', '#9a7fd1', '#588dd5', '#f5994e', '#c05050',
            '#59678c', '#c9ab00', '#7eb00a', '#6f5553', '#c14089'
        ]
        return palette[idx % palette.length];
    }
</script>
<%--折线图--%>
<script type="text/javascript">
    $(function() {

        <%--console.log(${map})--%>
        var map=${map};
        var xMarks;
        var title;
        $.each(map,function (key,values) {
           if(key=="seasonList"){
//                console.log(values)
                xMarks=values;
           }
        })
        $.each(map,function (key,values) {
            if(key=="playerName"){
                  title = values;
//                console.log(values)
            }
        })
        $.each(map,function (key,values) {
            if(key=="accountList"){
                var subTitle = "场均得分";
                var dataset=values;
//                console.log(values)
//                console.log(values)
                chart(dataset, xMarks, title, subTitle, "chartAccount");
            }
        })
        $.each(map,function (key,values) {
            if(key=="salaryList"){
                var subTitle = "薪资";
                var dataset=values;
//                console.log(values)
                chart(dataset, xMarks, title, subTitle, "chartSalary");
            }
        })
//        var dataset = [50, 30, 10, 50, 20, 40, 20];
//        var xMarks = ['Mon', 'Tues', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
//        var title = "Beijing";
//        var subTitle = "temperature";
//        chart(dataset, xMarks, title, subTitle, "test");
    });
function chart(dataset,xMarks,title,subTitle,div) {
    var w=600;
    var h=400;

//定义画布
    var svg=d3.select("#"+div)
        .append("svg")
        .attr("width",w)
        .attr("height",h);

//添加标题
    svg.append("g")
        .append("text")
        .text(title)
        .attr("class","title")
        .attr("x",220)
        .attr("y",20);

//添加副标题

    svg.append("g")
        .append("text")
        .text(subTitle)
        .attr("class","subTitle")
        .attr("x",220)
        .attr("y",40);

//横坐标轴比例尺

    var xScale = d3.scale.linear()
        .domain([0,dataset.length-1])
        .range([60,400]);//这个range相当于横轴的左右平移

//纵坐标轴比例尺

    var yScale = d3.scale.linear()
        .domain([0,d3.max(dataset)])
        .range([220,60]);

//定义横轴网格线

    var xInner = d3.svg.axis()
        .scale(xScale)
        .tickSize(-160,0,0)//调整网格线长度
        .orient("bottom")
        .ticks(dataset.length);

//添加横轴网格线

    svg.append("g")
        .attr("class","inner_line")
        .attr("transform","translate(0," + 220 + ")")

        //用来把纵的网格线上移的

        .call(xInner)
        .selectAll("text")
        .text("");

//定义纵轴网格线

    var yInner = d3.svg.axis()
        .scale(yScale)
        .tickSize(-340,0,0)
        .tickFormat("")
        .orient("left")
        .ticks(5);

//添加纵轴网格线

    var yBar=svg.append("g")
        .attr("class","inner_line")
        .attr("transform","translate("+60+",0)")
        .call(yInner);

//定义横轴

    var xAxis = d3.svg.axis()
        .scale(xScale)
        .orient("bottom")
        .ticks(dataset.length);

//添加横坐标轴并通过编号获取对应的横轴标签

    var xBar=svg.append("g")
        .attr("class","axis")
        .attr("transform","translate(0," + 220 + ")")//用来上下平移横轴位置
        .call(xAxis)
        .selectAll("text")
        .text(function(d,i){return xMarks[d];});

//定义纵轴

    var yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left")
        .ticks(5);//这个是细分度

//添加纵轴

    var yBar=svg.append("g")
        .attr("class", "axis")
        .attr("transform","translate("+60+",0)")
        .call(yAxis);

//添加折线

    var line = d3.svg.line()
        .x(function(d,i){return xScale(i);})
        .y(function(d){return yScale(d);});
    var path=svg.append("path")
        .attr("d", line(dataset))
        .style("fill","#F00")
        .style("fill","none")
        .style("stroke-width",1)
        .style("stroke","#09F")
        .style("stroke-opacity",0.9);

//添加系列的小圆点

    svg.selectAll("circle")
        .data(dataset)
        .enter()
        .append("circle")
        .attr("cx", function(d,i) {
            return xScale(i);
        })

        .attr("cy", function(d) {
            return yScale(d);
        })
        .attr("r",5)
        .attr("fill","#09F");
}

</script>
</body>
</html>
