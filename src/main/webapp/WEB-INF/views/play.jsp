<%--
  Created by IntelliJ IDEA.
  User: fml
  Date: 2018/3/9 0009
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>dreamMusic</title>
    <link rel="stylesheet" href="css/mplayer.css">
    <style>
        .info {
            font-family: "Microsoft Yahei";
            text-align: center;
        }
        .info h1 {
            font-weight: 400;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/mplayer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/mplayer-list.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/mplayer-functions.js" type="text/javascript"></script>
    <%--<script src="${pageContext.request.contextPath}/jquery.nstSlider.min.js"></script>--%>
    <script>
        var modeText = ['顺序播放','单曲循环','随机播放','列表循环'];
        var player = new MPlayer({
            // 容器选择器名称
            containerSelector: '.mp',
            // 播放列表
            songList: mplayer_song,
            // 专辑图片错误时显示的图片
            defaultImg: '${pageContext.request.contextPath}/img/mplayer_error.png',
            // 自动播放
            autoPlay: true,
            // 播放模式(0->顺序播放,1->单曲循环,2->随机播放,3->列表循环(默认))
            playMode:0,
            playList:0,
            playSong:0,
            // 当前歌词距离顶部的距离
            lrcTopPos: 34,
            // 列表模板，用${变量名}$插入模板变量
            listFormat: '<tr><td>${name}$</td><td>${singer}$</td><td>${time}$</td></tr>',
            // 音量滑块改变事件名称
            volSlideEventName:'change',
            // 初始音量
            defaultVolume:80
        }, function () {
            // 绑定事件
            this.on('afterInit', function () {
                console.log('播放器初始化完成，正在准备播放');
            }).on('beforePlay', function () {
                var $this = this;
                var song = $this.getCurrentSong(true);
                var songName = song.name + ' - ' + song.singer;
                console.log('即将播放'+songName+'，return false;可以取消播放');
            }).on('timeUpdate', function () {
                var $this = this;
                console.log('当前歌词：' + $this.getLrc());
            }).on('end', function () {
                var $this = this;
                var song = $this.getCurrentSong(true);
                var songName = song.name + ' - ' + song.singer;
                console.log(songName+'播放完毕，return false;可以取消播放下一曲');
            }).on('mute', function () {
                var status = this.getIsMuted() ? '已静音' : '未静音';
                console.log('当前静音状态：' + status);
            }).on('changeMode', function () {
                var $this = this;
                var mode = modeText[$this.getPlayMode()];
                $this.dom.container.find('.mp-mode').attr('title',mode);
                console.log('播放模式已切换为：' + mode);
            });
        });


        $(document.body).append(player.audio); // 测试用

        setEffects(player);


    </script>
</head>
<body>

<div class="info">
    <h1>MPlayer音乐播放器演示页面</h1>
    <p>请按F12打开控制台查看回调事件效果</p>
</div>
<div class="mp">
    <div class="mp-box">
        <img src="img/mplayer_error.png" alt="music cover" class="mp-cover">
        <div class="mp-info">
            <p class="mp-name">燕归巢</p>
            <p class="mp-singer">许嵩</p>
            <p><span class="mp-time-current">00:00</span>/<span class="mp-time-all">00:00</span></p>
        </div>
        <div class="mp-btn">
            <button class="mp-prev" title="上一首"></button>
            <button class="mp-pause" title="播放"></button>
            <button class="mp-next" title="下一首"></button>
            <button class="mp-mode" title="播放模式"></button>
            <div class="mp-vol">
                <button class="mp-vol-img" title="静音"></button>
                <div class="mp-vol-range" data-range_min="0" data-range_max="100" data-cur_min="80">
                    <div class="mp-vol-current"></div>
                    <div class="mp-vol-circle"></div>
                </div>
            </div>
        </div>
        <div class="mp-pro">
            <div class="mp-pro-current"></div>
        </div>
        <div class="mp-menu">
            <button class="mp-list-toggle"></button>
            <button class="mp-lrc-toggle"></button>
        </div>
    </div>
    <button class="mp-toggle">
        <span class="mp-toggle-img"></span>
    </button>
    <div class="mp-lrc-box">
        <ul class="mp-lrc"></ul>
    </div>
    <button class="mp-lrc-close"></button>
    <div class="mp-list-box">
        <ul class="mp-list-title"></ul>
        <table class="mp-list-table">
            <thead>
            <tr>
                <th>歌名</th>
                <th>歌手</th>
                <th>时长</th>
            </tr>
            </thead>
            <tbody class="mp-list"></tbody>
        </table>
    </div>
</div>

</body>
</html>