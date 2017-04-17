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
<%@ include file="header.jsp"%>

<div class="grid content">
    <div class="grid-cell-full breadcrumb">
        <span class="layui-breadcrumb">
            <a><cite>首页</cite></a>
            <a><cite>浏览酒店</cite></a>
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
                    <button class="layui-btn add-cart" style="margin-top: 10px;">加入购物车</button>
                    <input type="hidden" value="${item.id}">
                    <a href="/hotel/hotelDetail.action?id=${item.id}" class="layui-btn">查看详情</a>
                </div>
            </fieldset>
        </div>
    </c:forEach>
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
