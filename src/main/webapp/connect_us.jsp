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
        fieldset {
            width: 500px;
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
            <a><cite>联系我们</cite></a>
        </span>
    </div>
    <div class="grid-cell-full">
        <fieldset class="layui-elem-field">
            <legend>填写相关信息提供给我们</legend>
            <div class="layui-field-box">
                <form class="layui-form layui-form-pane">
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input type="text" name="email" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">内容</label>
                        <div class="layui-input-block">
                            <textarea name="content" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="formDemo">立即反馈</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
    </div>
</div>
<script>
    layui.use(['form', 'element'], function () {
        var form = layui.form();
        var element = layui.element();
        var $ = layui.jquery;
        var layer = layui.layer;
        
        form.on('submit(formDemo)', function (data) {
            var urlVal = "/leaveMsg/leaveMsg.action";
            var dataVal = data.field;
            $.post(urlVal, dataVal, function (result) {
                layer.alert(result.message);
            });
        });
    });
</script>
</body>
</html>
