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
            <a><cite>注册</cite></a>
        </span>
    </div>
    <div class="grid-cell-full">
        <div class="layui-form layui-form-pane">
            <div class="layui-form-item" style="width: 400px;">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 400px;">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="text" name="password" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 400px;">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="gender" value="男" title="男">
                    <input type="radio" name="gender" value="女" title="女">
                </div>
            </div>
            <div class="layui-form-item" style="width: 400px;">
                <label class="layui-form-label">现居地</label>
                <div class="layui-input-block">
                    <input type="text" name="address" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 400px;">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input type="text" name="mobile" lay-verify="required|phone|number" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="formDemo">立即注册</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'element'], function () {
        var form = layui.form();
        var element = layui.element();
        var layer = layui.layer;
        var $ = layui.jquery;

        form.on('submit(formDemo)', function (data) {
            var dataVal = data.field;
            var url = "/site/doRegister.action";
            $.post(url, dataVal, function (result) {
                layer.alert(result.message);
                if (result.type == "success") {
                    window.location = "/user/index.action";
                }
            });
        });
    });
</script>
</body>
</html>
