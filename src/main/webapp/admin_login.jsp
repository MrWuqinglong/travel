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
<fieldset class="layui-elem-field" style="margin: 100px 500px;">
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
                    <input type="password" name="password" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="formDemo">登录系统后台</button>
                </div>
            </div>
        </form>

    </div>
</fieldset>
<script>
    layui.use(['form'], function () {
        var form = layui.form();
        var $ = layui.jquery;
        var layer = layui.layer;
        form.on('submit(formDemo)', function (data) {
            var urlVal = "/admin/doLogin.action";
            var dataVal = data.field;
            $.post(urlVal, dataVal, function (result) {
                if (result.type == "error") {
                    layer.alert(result.message);
                } else {
                    window.location = "/admin/index.action";
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
