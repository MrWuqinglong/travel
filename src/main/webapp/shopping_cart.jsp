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
            <a><cite>购物车</cite></a>
        </span>
    </div>
    <div class="grid-cell-full">
        <div class="layui-form">
            <table class="layui-table">
                <colgroup>
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>物品名称</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${scenics}" var="item">
                    <tr>
                        <td>${item.name}</td>
                        <td><span>${item.price}</span> RMB</td>
                        <td>1</td>
                        <td>
                            <button class="layui-btn layui-btn-primary layui-btn-small">
                                <i class="layui-icon">&#xe640;</i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${hotels}" var="item">
                    <tr>
                        <td>${item.name}</td>
                        <td><span>${item.price}</span> RMB</td>
                        <td>1</td>
                        <td>
                            <button class="layui-btn layui-btn-primary layui-btn-small">
                                <i class="layui-icon">&#xe640;</i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                <%--<tr>
                    <td>酒店</td>
                    <td>99 RMB</td>
                    <td>
                        <div class="layui-btn-group">
                            <button class="layui-btn layui-btn-primary layui-btn-small">
                                <i class="layui-icon">&#xe61a;</i>
                            </button>
                            <button class="layui-btn layui-btn-primary layui-btn-small">
                                <i class="layui-icon">&#xe619;</i>
                            </button>
                            <button class="layui-btn layui-btn-primary layui-btn-small">
                                <i class="layui-icon">&#xe640;</i>
                            </button>
                        </div>
                    </td>
                </tr>--%>
                </tbody>
                <tfoot>
                <tr>
                    <td>汇总</td>
                    <td><span>${totalPrice}</span> RMB</td>
                    <td>${totalNum}</td>
                    <td>
                        <button id="cash" class="layui-btn layui-btn-radius layui-btn-normal">结算</button>
                        <input type="hidden" value="${totalPrice}" />
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'element'], function () {
        var form = layui.form();
        var element = layui.element();
        var $ = layui.jquery;
        var layer = layui.layer;

        $("#cash").click(function () {
            var totalPrice = $(this).next().val();
            var url = "/user/cashShoppingCart.action";
            var data = {"totalPrice": totalPrice};
            $.post(url, data, function (result) {
                layer.alert(result.message);
            });
        });
    });
</script>
</body>
</html>
