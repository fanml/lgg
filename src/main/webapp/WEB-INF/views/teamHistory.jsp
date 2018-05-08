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
    <title>jQuery翻页插件jbooklet - 站长素材</title>

    <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->

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
    </style>
    <script>
//        $(function () {
//            $.get("teamHistory",{});
//        })
        
    </script>
</head>
<body>
<header>
    <h1>jBooklet Demo</h1>
</header>

<div id="mybook">
    <div>
        <h3>Page 1</h3>
        <p>
            Aliquam eget hendrerit augue, quis ultricies risus. Donec lobortis, erat eget convallis elementum, nunc turpis consectetur ipsum, non vehicula velit neque quis libero. Vestibulum ullamcorper augue nulla, sed vehicula neque fermentum eu. Morbi egestas dignissim urna, ut gravida ligula bibendum eu. Etiam rhoncus, justo vel ultricies dictum, elit felis ornare erat, vitae accumsan neque massa eu quam. Sed facilisis mauris ut diam elementum, quis pulvinar eros molestie. Duis lobortis ullamcorper consequat. Donec tellus lectus, blandit eu ultrices nec, feugiat ac tellus. Mauris eleifend dolor a arcu sodales porta. Proin pharetra posuere volutpat.
        </p>
    </div>
    <div>
        <h3>Page 2</h3>
        <p>
            Ut rutrum ligula in dolor adipiscing sollicitudin eget vel erat. Vivamus luctus at enim a tempus. Pellentesque mollis vitae sapien eget bibendum. Quisque sodales, libero et sodales rhoncus, felis nisl aliquet magna, in tempor felis arcu sed metus. Aenean suscipit varius tortor, id faucibus neque tempus eget. Sed et nibh tellus. Mauris lectus ante, facilisis et dapibus eu, euismod quis nisl. Cras gravida felis vitae fermentum egestas. Duis in diam ante. Mauris a velit fermentum, interdum arcu non, placerat ante. In viverra turpis id nisi tincidunt feugiat. Suspendisse sed diam urna. Cras libero quam, ultricies non ligula consectetur, hendrerit laoreet risus.
        </p>
    </div>
    <div>
        <h3>Page 3</h3>
        <p>
            Ut vulputate leo at eros bibendum fringilla. Proin eu lacus ac ipsum suscipit volutpat. Phasellus nec enim felis. Morbi porttitor interdum interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam non bibendum dolor. Curabitur sodales tincidunt quam, ut suscipit leo aliquet et. Donec porta sed neque nec rutrum. Nullam dapibus, ante nec rutrum elementum, mi arcu blandit mi, ac ullamcorper massa eros in felis. Proin a nibh nec mi hendrerit consequat. Vestibulum hendrerit sapien non fermentum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet egestas mi. Integer feugiat ipsum erat, non blandit dolor gravida nec. Pellentesque sit amet quam ligula. Nulla urna nisi, auctor et turpis in, tristique vehicula nibh.
        </p>
    </div>
    <div>
        <h3>Page 4</h3>
        <p>
            Donec sed varius tortor, a facilisis diam. Praesent in felis ac nibh congue blandit ac in mi. Vestibulum aliquam nunc a turpis dignissim molestie. Duis sed lacus quis massa cursus condimentum. Praesent lacinia dictum massa, quis pretium mi ullamcorper sed. Vivamus quam magna, eleifend eu pellentesque ut, aliquam eu nibh. In porta, leo semper porta porta, velit tellus tincidunt mauris, non venenatis urna mauris eget tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean ut massa nisl. Vestibulum facilisis, nulla in molestie mollis, velit nibh tempor est, ut volutpat mauris arcu at turpis. In sem massa, posuere quis blandit non, ultrices at odio. Ut sed magna lobortis, cursus dolor id, fringilla tortor. Nunc sagittis augue non fermentum sagittis.
        </p>
    </div>
    <div>
        <h3>Page 5</h3>
        <p>
            Aliquam eget hendrerit augue, quis ultricies risus. Donec lobortis, erat eget convallis elementum, nunc turpis consectetur ipsum, non vehicula velit neque quis libero. Vestibulum ullamcorper augue nulla, sed vehicula neque fermentum eu. Morbi egestas dignissim urna, ut gravida ligula bibendum eu. Etiam rhoncus, justo vel ultricies dictum, elit felis ornare erat, vitae accumsan neque massa eu quam. Sed facilisis mauris ut diam elementum, quis pulvinar eros molestie. Duis lobortis ullamcorper consequat. Donec tellus lectus, blandit eu ultrices nec, feugiat ac tellus. Mauris eleifend dolor a arcu sodales porta. Proin pharetra posuere volutpat.
        </p>
    </div>
    <div>
        <h3>Page 6</h3>
        <p>
            Aliquam eget hendrerit augue, quis ultricies risus. Donec lobortis, erat eget convallis elementum, nunc turpis consectetur ipsum, non vehicula velit neque quis libero. Vestibulum ullamcorper augue nulla, sed vehicula neque fermentum eu. Morbi egestas dignissim urna, ut gravida ligula bibendum eu. Etiam rhoncus, justo vel ultricies dictum, elit felis ornare erat, vitae accumsan neque massa eu quam. Sed facilisis mauris ut diam elementum, quis pulvinar eros molestie. Duis lobortis ullamcorper consequat. Donec tellus lectus, blandit eu ultrices nec, feugiat ac tellus. Mauris eleifend dolor a arcu sodales porta. Proin pharetra posuere volutpat.
        </p>
    </div>
    <div>
        <h3>Page 7</h3>
        <p>
            Ut vulputate leo at eros bibendum fringilla. Proin eu lacus ac ipsum suscipit volutpat. Phasellus nec enim felis. Morbi porttitor interdum interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam non bibendum dolor. Curabitur sodales tincidunt quam, ut suscipit leo aliquet et. Donec porta sed neque nec rutrum. Nullam dapibus, ante nec rutrum elementum, mi arcu blandit mi, ac ullamcorper massa eros in felis. Proin a nibh nec mi hendrerit consequat. Vestibulum hendrerit sapien non fermentum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet egestas mi. Integer feugiat ipsum erat, non blandit dolor gravida nec. Pellentesque sit amet quam ligula. Nulla urna nisi, auctor et turpis in, tristique vehicula nibh.
        </p>
    </div>
    <div>
        <h3>Page 8</h3>
        <p>
            Aliquam eget hendrerit augue, quis ultricies risus. Donec lobortis, erat eget convallis elementum, nunc turpis consectetur ipsum, non vehicula velit neque quis libero. Vestibulum ullamcorper augue nulla, sed vehicula neque fermentum eu. Morbi egestas dignissim urna, ut gravida ligula bibendum eu. Etiam rhoncus, justo vel ultricies dictum, elit felis ornare erat, vitae accumsan neque massa eu quam. Sed facilisis mauris ut diam elementum, quis pulvinar eros molestie. Duis lobortis ullamcorper consequat. Donec tellus lectus, blandit eu ultrices nec, feugiat ac tellus. Mauris eleifend dolor a arcu sodales porta. Proin pharetra posuere volutpat.
        </p>
    </div>
</div>

<script src="js/teamHistoryjs/jquery.min.js"></script>
<script src="js/teamHistoryjs/jquery-ui.min.js"></script>
<script src="js/teamHistoryjs/jquery.easing.min.js"></script>

<script src="js/teamHistoryjs/jquery.jbooklet.js"></script>
<script>
    $(function() {
        $('#mybook').booklet();
    });
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
    <p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
</div>
</body>
</html>
