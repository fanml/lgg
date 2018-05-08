<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/3/23 0023
  Time: 9:39
  To change this template use File | Settings | File Templates.
  Detail:球队详情页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <link rel="stylesheet" href="css/teamDetail.css">
    <style>
        p{
            color:#fff;
            font-size:15px;
            text-shadow: 0 0 10px #529DFF;
        }
        .playInforUl{
            width: 1210px; //设置足够的宽度
        }
        .playInforLi{
            text-align: center;
            list-style: none;
            float: left; //向左排列
            margin-left: 15px;
            width: 130px;
            height: 100px;
            font-size: 20px;
            color:#E7E7E7 ;
        }
        .right_li{
            width: 300px;
        }

    </style>
    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
//            function getQueryString(name){
//                var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
//                var r = window.location.search.substr(1).match(reg);
//                if(r!=null)return  unescape(r[2]); return null;
//            }
        <%--var map=JSON.parse(${map});--%>
        //    window.onload=function () {
        //        var i;
        //    $.each(map,function (key,values) {
        //        if (key == "球队冠军赛季") {
        //            $.each(values, function (index, item) {
        //                $.each(item, function (key1, values1) {
        //                    i++;
        //                    var param = getQueryString("teamId");
        //                    var season = $("#seasonVal" +i).html();
        //                    alert(season)
        //                    $("#seasonhref" +i).attr("href", "http://localhost:8080/dream/toTeamDetail?teamId=" + param + "season=" + season);
        //
        //                })
        //            })
        //        }
        //    })
        //    }
    </script>
</head>
<body>
<div class="wrap about_page" id="wrap">
    <div class="wrapper">
        <div class="header">
            <div class="head">

                <div class="nav_box">
                    <ul class="nav_list" id="nav_list">
                        <li><a href="http://localhost:8080/dream/toAllPlayer">所有球员</a></li>
                        <li><a href="http://localhost:8080/dream/toAllTeamGis">所有球队</a></li>
                        <li><a href="http://localhost:8080/dream/toTeamSchedule?teamId=${teamId}">赛季赛程</a></li>
                    </ul>
                    <span class="ic_line" id="h_line"></span>
                </div>
            </div>
        </div>
        <div class="events_sec" id="events_sec">
            <div class="content">
                <div class="teamInfor">
                <h3 class="hide_txt png">sc.chinaz.com</h3>
                 <c:forEach items="${map}" var="entity">
                  <c:if test="${entity.key eq '球队信息'}">
                      <c:forEach items="${entity.value}" var="championList">
                      <c:forEach items="${championList}" var="championMap">
                          <c:if test="${championMap.key eq'球队名称'}">
                              <h1>${championMap.value}</h1>
                          </c:if>
                          <c:if test="${championMap.key eq'球队英文名称'}">
                             <img src="img/${championMap.value}.jpg" width="100">
                          </c:if>
                      </c:forEach>
                      </c:forEach>
                  </c:if>
               </c:forEach>
                </div>
                <div class="playerInfor">
                    <ul class="playInforUl" style="z-index:10;">
                        <li class="playInforLi">编号</li>
                        <li class="playInforLi">图片</li>
                        <li class="playInforLi">姓名</li>
                        <li class="playInforLi">英文名</li>
                        <li class="playInforLi">职位</li>
                        <li class="playInforLi">身高</li>
                        <li class="playInforLi">体重</li>
                        <li class="playInforLi">国籍</li>
                        <li class="playInforLi">经验</li>
                        <c:forEach items="${map}" var="player">
                            <c:if test="${player.key eq '球员信息'}">
                                <c:forEach items="${player.value}" var="playerList">
                                    <c:forEach items="${playerList}" var="playerMap">
                                        <c:if test="${playerMap.key  eq '球员ID'}">
                                            <li class="playInforLi">
                                                <a href="http://localhost:8080/dream/playerAssess?playerId=${playerMap.value}">${playerMap.value}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${playerMap.key  eq '球员图片'}">
                                            <li class="playInforLi">
                                                   <img src="img/playerImg/${playerMap.value}.png" style="width: 80px;">
                                            </li>
                                        </c:if>
                                        <c:if test="${playerMap.key  eq '球员姓名'}">
                                        <li class="playInforLi">
                                         ${playerMap.value}
                                        </li>
                                        </c:if>
                                        <c:if test="${playerMap.key  eq '球员英文名'}">
                                            <li class="playInforLi">
                                                    ${playerMap.value}
                                            </li>
                                        </c:if>
                                        <c:if test="${playerMap.key  eq '球员国籍'}">
                                            <li class="playInforLi">
                                                    ${playerMap.value}
                                            </li>
                                        </c:if>
                                        <c:if test="${playerMap.key  eq '球员身高'}">
                                            <li class="playInforLi">
                                                    ${playerMap.value}米
                                            </li>
                                        </c:if>
                                        <c:if test="${playerMap.key  eq '球员体重'}">
                                            <li class="playInforLi">
                                                    ${playerMap.value}公斤
                                            </li>
                                        </c:if>
                                        <c:if test="${playerMap.key  eq '球员职位'}">
                                            <li class="playInforLi">
                                                    ${playerMap.value}
                                            </li>
                                        </c:if>
                                        <c:if test="${playerMap.key  eq '球员经验'}">
                                            <li class="playInforLi">
                                                    ${playerMap.value}
                                            </li>
                                        </c:if>
                                    </c:forEach>

                                </c:forEach>
                            </c:if>
                        </c:forEach>

                    </ul>
                </div>
                <div class="events_list" style="width: 600px; position: absolute;left: 800px;transform:rotate(90deg)">
                    <span class="ic_time png"></span>
                    <ul style="z-index: 1">
                        <% int i=0;%>
                        <c:forEach items="${map}" var="entity">
                         <c:if test="${entity.key eq '球队冠军赛季'}">
                           <c:forEach items="${entity.value}" var="championList">
                               <c:forEach items="${championList}" var="championMap">
                                   <% i++;%>
                                   <li class="right_li">
                                       <span class="ic_events png"></span>
                                       <p class="txt_events"><a id="seasonhref<%=i%>" href="http://localhost:8080/dream/toTeamDetail?teamId=${teamId}&season=${championMap.value}" ><strong id="seasonVal<%=i%>">${championMap.value}</strong></a></p>
                                   </li>
                               </c:forEach>
                           </c:forEach>
                         </c:if>
                        </c:forEach>
                    </ul>
                    <span class="ic_arr png"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<audio id="audios" controls="true" autoplay="autoplay" class="audio" style="display:none;"></audio>
<script>
    var url=["",""];
    var num = GetRandomNum(0,url.length-1);
    document.getElementById("audios").src="http://"+url[num];
    function GetRandomNum(Min,Max)
    {
        var Range = Max - Min;
        var Rand = Math.random();
        return(Min + Math.round(Rand * Range));
    }

    function play(){
        var div = document.getElementById('playbtn');
        var obj=document.getElementById("audios");
        if(obj.paused){
            obj.play();
            div.setAttribute("class", "btn_sound");
        }else{
            obj.pause();
            div.setAttribute("class", "btn_sound btn_no_sound");
        }

    }
</script>
<script src="js/canvas-nest.min.js"></script>
</body>
</html>
