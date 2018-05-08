<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/3/16 0016
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=q4SvW9b6Z07z2PUMmPq48FHtmkQvqygq"></script>
    <title>所有球队</title>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(-91.8318334,37.9642529), 6);  // 初始化地图,设置中心点坐标和地图级别
    //添加地图类型控件
    map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));
    map.setCurrentCity("密苏里州");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用

    //    左上角控件
    var navigationControl = new BMap.NavigationControl({
        // 靠左上角位置
        anchor: BMAP_ANCHOR_TOP_LEFT,
        // LARGE类型
        type: BMAP_NAVIGATION_CONTROL_LARGE,
        // 启用显示定位
        enableGeolocation: true
    });
    map.addControl(navigationControl);
    // 添加定位控件
    var geolocationControl = new BMap.GeolocationControl();
    geolocationControl.addEventListener("locationSuccess", function(e){
        // 定位成功事件
        var address = '';
        address += e.addressComponent.province;
        address += e.addressComponent.city;
        address += e.addressComponent.district;
        address += e.addressComponent.street;
        address += e.addressComponent.streetNumber;
        alert("当前定位地址为：" + address);
    });
    geolocationControl.addEventListener("locationError",function(e){
        // 定位失败事件
        alert(e.message);
    });
    map.addControl(geolocationControl);





    //创建球队队标
    var list=eval('${list}');
    // 百度地图API功能

    for(var index in list) {
        (function (index) {
            setTimeout(function () {
                var team = list[index];
                var teamPT = new BMap.Point(team["球队经度"], team["球队纬度"]);
                var myIcon = new BMap.Icon("http://localhost:8080/dream/img/"+team["球队英文名称"]+"Logo.jpg", new BMap.Size(30,30));
                var marker2 = new BMap.Marker(teamPT, {icon: myIcon});  // 创建标注
                map.addOverlay(marker2);              // 将标注添加到地图中
                marker2.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
               //文本框
                var sContent =
                    "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+team["球队名称"]+"</h4>" +
                    "<input type='button' value='球队详情' onclick='toTeamDetail("+team["球队ID"]+")'/>"+
                    "<img style='float:right;margin:4px' id='imgDemo' src='http://localhost:8080/dream/img/"+team["球队英文名称"]+"Logo.jpg' width='50' height='50' title='天安门'/>" +
                    "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+team["球队城市信息描述"]+"</p>" +
                    "</div>";
                var infoWindow = new BMap.InfoWindow(sContent);
                marker2.addEventListener("click", function(){
                    this.openInfoWindow(infoWindow);
                    //图片加载完毕重绘infowindow
                });

            }, index * 500);
        })(index);
    }
    function toTeamDetail(i) {
        window.location.href='http://localhost:8080/dream/toTeamDetail?teamId='+i;
    }
</script>
</html>
