<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/semantic.min.css">
    <script src="static/js/jquery.js" charset="UTF-8"></script>
    <script src="static/js/semantic.min.js" charset="UTF-8"></script>
</head>
<body>
<div class="ui grid">

    <!-- 引入导航栏 -->
    <%@ include file="commons/nav.jsp"%>

    <!-- 主体内容 -->
    <div class="row">
        <div class="three wide column"></div>
        <div class="two wide column">
            <!-- 竖直导航 -->
            <div class="ui vertical menu">
                <a target="" class="item">个人档案</a>
                <a target="" class="item">我买过的商品</a>
                <a target="" class="item">修改密码</a>
                <a target="" class="item">我的消息</a>
            </div>
        </div>
        <div class="eight wide column">
            <div id="frame">
            </div>
        </div>
        <div class="three wide column"></div>
    </div>

</div>
<script>
    $(function () {

        /* 菜单栏加载数据 */
        $(".ui.vertical.menu a").click(function () {
            var target = $(this).attr("target");
            $.get(target, function (data) {
                $("#frame").html(data);
            });
        });


    });
</script>
</body>
</html>
