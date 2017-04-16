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
    <style type="text/css">
        .notice {
            height: 200px;
        }
        .loop.notice {
            height: 400px;
        }
    </style>
</head>
<body>

<!-- 导航栏 -->
<div>
    <ul class="layui-nav">
        <li class="layui-nav-item layui-this">
            <a href="/" class="item">首页</a>
        </li>
        <li class="layui-nav-item">
            <a href="/scenic/listAll.action" class="item">预定景点</a>
        </li>
        <li class="layui-nav-item">
            <a href="/hotel/listAll.action" class="item">预定酒店</a>
        </li>
        <li class="layui-nav-item">
            <a href="/leaveMsg/connectUs.action" class="item">联系我们</a>
        </li>
    </ul>
</div>

<div class="grid content">
    <div class="grid-cell-2of3">
        <div class="grid">
            <div class="grid-cell-1of2">
                <fieldset class="layui-elem-field loop notice">
                    <legend>推荐 - 景点</legend>
                    <div class="layui-field-box">
                        <dl>
                            <dd><a href="">你可以在这里放任何内容</a></dd>
                            <dd><a href="">你可以在这里放任何内容</a></dd>
                            <dd><a href="">你可以在这里放任何内容</a></dd>
                        </dl>
                    </div>
                </fieldset>
            </div>
            <div class="grid-cell-1of2">
                <fieldset class="layui-elem-field loop notice">
                    <legend>推荐 - 酒店</legend>
                    <div class="layui-field-box">
                        <dl>
                            <dd><a href="">你可以在这里放任何内容</a></dd>
                            <dd><a href="">你可以在这里放任何内容</a></dd>
                            <dd><a href="">你可以在这里放任何内容</a></dd>
                        </dl>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="grid">
            <div class="grid-cell-1of3">
                <fieldset class="layui-elem-field notice">
                    <legend>整站动态</legend>
                    <div class="layui-field-box">
                        <dl id="notices"></dl>
                    </div>
                </fieldset>
            </div>
            <div class="grid-cell-1of3">
                <fieldset class="layui-elem-field notice">
                    <legend>最新入驻 - 酒店</legend>
                    <div class="layui-field-box">
                        <dl id="hotels"></dl>
                    </div>
                </fieldset>
            </div>
            <div class="grid-cell-1of3">
                <fieldset class="layui-elem-field notice">
                    <legend>最新入驻 - 景点</legend>
                    <div class="layui-field-box">
                        <dl id="scenics"></dl>
                    </div>
                </fieldset>
            </div>
        </div>

    </div>
    <div class="grid-cell-1of3">
        <c:if test="${empty(sessionScope.user)}">
            <!-- 登录/注册 -->
            <fieldset class="layui-elem-field" style="height: auto;">
                <legend>登录账号</legend>
                <div class="layui-field-box">
                    <form class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="text" name="password" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="formDemo">立即提交</button>
                                <a href="/site/register.action" class="layui-btn layui-btn-primary">注册新用户</a>
                            </div>
                        </div>
                    </form>
                    <div style="text-align: center;">
                        <a href="javascript:alert('该功能暂未实现');">忘记密码？</a>
                    </div>
                </div>
            </fieldset>
        </c:if>
        <c:if test="${not empty(sessionScope.user)}">
            <!-- 登录之后 -->
            <fieldset class="layui-elem-field" style="height: auto;">
                <legend>个人信息</legend>
                <div class="layui-field-box">
                    <div class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" value="${sessionScope.user.username}" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input type="text" value="${sessionScope.user.gender}" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">现居地</label>
                            <div class="layui-input-block">
                                <input type="text" value="${sessionScope.user.address}" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <a href="" class="layui-btn layui-btn-primary layui-btn-radius">进入个人中心</a>
                                <a href="" class="layui-btn layui-btn-primary layui-btn-radius">退出当前账号</a>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <a href="/cart/listShoppingCart.action" class="layui-btn layui-btn-primary layui-btn-radius">查看我的购物车</a>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </c:if>
    </div>
</div>

<script>
    layui.use('element', function () {
        var element = layui.element();
        var form = layui.form();
        var $ = layui.jquery;
        var layer = layui.layer;

        /* 登录监听 */
        form.on('submit(formDemo)', function (data) {
            var dataVal = data.field;
            var url = "/user/doLogin.action";
            $.post(url, dataVal, function (result) {
                layer.alert(result.message);
            })
        });

        /* 获取最热的景点 */


        /* 获取最热的酒店 */


        /* 获取最新公告 */
        $.ajax({
            url: "/notice/listLastNotice.action",
            type: "post",
            success: function (data) {
                var dataStr = "";
                for (var i=0; i<data.length; i++) {
                    dataStr += "<dd><a href=''>"+data[i].title+"</a></dd>";
                }
                $("#notices").append(dataStr);
            }
        });


        /* 获取最新入住的景点 */
        $.ajax({
            url: "/scenic/listLastScenic.action",
            type: "post",
            success: function (data) {
                var dataStr = "";
                for (var i=0; i<data.length; i++) {
                    dataStr += "<dd><a href=''>"+data[i].name+"</a></dd>";
                }
                $("#scenics").append(dataStr);
            }
        });

        /* 获取最新入住的酒店 */
        $.ajax({
            url: "/hotel/listLastHotel.action",
            type: "post",
            success: function (data) {
                var dataStr = "";
                for (var i=0; i<data.length; i++) {
                    dataStr += "<dd><a href=''>"+data[i].name+"</a></dd>";
                }
                $("#hotels").append(dataStr);
            }
        });

    });
</script>
</body>
</html>
