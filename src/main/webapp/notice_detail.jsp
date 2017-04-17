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
            <a><cite>公告详情</cite></a>
        </span>
    </div>
    <div class="grid-cell-full">
        <fieldset class="layui-elem-field">
            <legend>公告详情</legend>
            <div class="layui-field-box">
                <div class="layui-form layui-form-pane">
                    <div class="layui-form-item">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" value="${notice.title}" class="layui-input" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">内容</label>
                        <div class="layui-input-block">
                            <textarea class="layui-textarea" disabled>${notice.content}</textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">发表时间</label>
                        <div class="layui-input-block">
                            <input type="text" value="<fmt:formatDate value="${notice.createTime}" pattern="yyyy-MM-dd"/>" class="layui-input" disabled>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </div>
</div>
<script>
    layui.use(['form', 'element'], function () {
        var form = layui.form();
        var element = layui.element();
    });
</script>
</body>
</html>
