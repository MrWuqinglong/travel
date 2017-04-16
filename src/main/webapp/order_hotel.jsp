<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" charset="UTF-8">
    <link rel="stylesheet" href="/static/css/layout.css" charset="UTF-8">
    <script src="/static/layui/layui.js" charset="UTF-8"></script>
</head>
<body>

<!-- 导航栏 -->
<div>
    <ul class="layui-nav">
        <li class="layui-nav-item layui-this">
            <a href="/" class="item">首页</a>
        </li>
        <li class="layui-nav-item">
            <a href="/" class="item">预定景点</a>
        </li>
        <li class="layui-nav-item">
            <a href="/" class="item">预定酒店</a>
        </li>
        <li class="layui-nav-item">
            <a href="/" class="item">联系我们</a>
        </li>
    </ul>
</div>

<div class="grid content">
    <div class="grid-cell-full breadcrumb">
        <span class="layui-breadcrumb">
            <a><cite>首页</cite></a>
            <a><cite>购买票</cite></a>
        </span>
    </div>
    <c:forEach items="${hotels}" var="item">
        <div class="grid-cell-1of5">
            <fieldset class="layui-elem-field loop notice">
                <legend>${item.name}</legend>
                <div class="layui-field-box">
                    <img src="static/img/dog.jpg" alt="景点图片" style="width: 225px;">
                    <p style="font-size: medium;">价格: ${item.price} RMB</p>
                    <p style="font-size: medium;">地点: ${item.address}</p>
                    <p style="font-size: medium;">服务: ${item.service}</p>
                    <p style="font-size: medium;">电话: ${item.hotLine}</p>
                    <button class="layui-btn add-cart" style="margin-top: 10px;">加入购物车</button>
                    <input type="hidden" value="${item.id}">
                </div>
            </fieldset>
        </div>
    </c:forEach>

    <%--<div class="grid-cell-1of5">
        <fieldset class="layui-elem-field loop notice">
            <legend>景点名称</legend>
            <div class="layui-field-box">
                <img src="static/img/dog.jpg" alt="景点图片" style="width: 225px;">
                <p style="font-size: medium;">价格: 88 RMB</p>
                <p style="font-size: medium;">地点: 北京市朝阳区</p>
                <p style="font-size: medium;">开放时间: 08:00-17:00</p>
                <button class="layui-btn" style="margin-top: 10px;">加入购物车</button>
            </div>
        </fieldset>
    </div>--%>

</div>
<script>
    layui.use(['form', 'element'], function () {
        var form = layui.form();
        var element = layui.element();
        var $ = layui.jquery;
        var layer = layui.layer;

        $(".layui-btn.add-cart").click(function () {
            var idVal = $(this).next().val();
            var url = "/cart/addCart.action";
            var data = {"id":idVal, "type":"hotel"};
            $.post(url, data, function (result) {
                layer.alert(result.message);
            })
        });
    });
</script>
</body>
</html>
