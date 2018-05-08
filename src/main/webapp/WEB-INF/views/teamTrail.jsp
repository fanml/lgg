<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/3/10 0010
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=q4SvW9b6Z07z2PUMmPq48FHtmkQvqygq"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
    <title>地图展示</title>
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


//弧线

    var list = eval('${list}');
    //创建小狐狸
    var myIcon = new BMap.Icon("http://localhost:8080/dream/img/fly.png", new BMap.Size(70,70));
    for(var map1 in list){
        (function(map1){
            setTimeout(function(){
        var res1 = list[map1];
        var teamStartPosition= new BMap.Point(res1["开始球队经度"],res1["开始球队纬度"]),
            teamEndPosition= new BMap.Point(res1["结束球队经度"],res1["结束球队纬度"]);
        var teamPoints=[teamStartPosition,teamEndPosition];
        var teamCurve = new BMapLib.CurveLine(teamPoints, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
        map.addOverlay(teamCurve); //弧线添加到地图中
         var cons=new Array();
         cons=getCurveByTwoPoints(teamStartPosition,teamEndPosition);//动起来分解弧线
         console.log("2222");
        for(var foxPointIndex in cons){
            (function(foxPointIndex){
                setTimeout(function(){
                    var foxPoint=cons[foxPointIndex];
                    var lays = map.getOverlays();
                    console.log(lays)
                    for(var t = 0;t<lays.length;t++){
                        if(lays[t].hasOwnProperty("name")&& lays[t].name == "fox"){
                            console.log("1111");
                            console.log(lays.length);
                            map.removeOverlay(lays[t]);
                        }
                    }
                    var markerTeam2 = new BMap.Marker(foxPoint,{icon:myIcon});  // 创建标注
                    markerTeam2.name = "fox";
                    map.addOverlay(markerTeam2);              // 将标注添加到地图中
                },foxPointIndex*200);
            })(foxPointIndex);
        }
            },map1*200);
        })(map1);
    }


    function getCurveByTwoPoints(obj1, obj2) {
        if (!obj1 || !obj2 || !(obj1 instanceof BMap.Point) || !(obj2 instanceof BMap.Point)) {
            return null;
        }

        var B1 = function(x) {
            return 1 - 2 * x + x * x;
        };
        var B2 = function(x) {
            return 2 * x - 2 * x * x;
        };
        var B3 = function(x) {
            return x * x;
        };

        curveCoordinates = [];

        var count=30; // 鏇茬嚎鏄敱涓€浜涘皬鐨勭嚎娈电粍鎴愮殑锛岃繖涓〃绀鸿繖涓洸绾挎墍鏈夊埌鐨勬姌绾跨殑涓暟
        var isFuture=false;
        var t, h, h2, lat3, lng3, j, t2;
        var LnArray = [];
        var i = 0;
        var inc = 0;

        if (typeof(obj2) == "undefined") {
            if (typeof(curveCoordinates) != "undefined") {
                curveCoordinates = [];
            }
            return;
        }

        var lat1 = parseFloat(obj1.lat);
        var lat2 = parseFloat(obj2.lat);
        var lng1 = parseFloat(obj1.lng);
        var lng2 = parseFloat(obj2.lng);

        // 璁＄畻鏇茬嚎瑙掑害鐨勬柟娉�
        if (lng2 > lng1) {
            if (parseFloat(lng2-lng1) > 180) {
                if (lng1 < 0) {
                    lng1 = parseFloat(180 + 180 + lng1);
                }
            }
        }

        if (lng1 > lng2) {
            if (parseFloat(lng1-lng2) > 180) {
                if (lng2 < 0) {
                    lng2 = parseFloat(180 + 180 + lng2);
                }
            }
        }
        j = 0;
        t2 = 0;
        if (lat2 == lat1) {
            t = 0;
            h = lng1 - lng2;
        } else if (lng2 == lng1) {
            t = Math.PI / 2;
            h = lat1 - lat2;
        } else {
            t = Math.atan((lat2 - lat1) / (lng2 - lng1));
            h = (lat2 - lat1) / Math.sin(t);
        }
        if (t2 == 0) {
            t2 = (t + (Math.PI / 5));
        }
        h2 = h / 2;
        lng3 = h2 * Math.cos(t2) + lng1;
        lat3 = h2 * Math.sin(t2) + lat1;

        for (i = 0; i < count + 1; i++) {
            curveCoordinates.push(new BMap.Point(
                (lng1 * B1(inc) + lng3 * B2(inc)) + lng2 * B3(inc),
                (lat1 * B1(inc) + lat3 * B2(inc) + lat2 * B3(inc))
            ));
            inc = inc + (1 / count);
        }
        return curveCoordinates;
    }
</script>
</html>
