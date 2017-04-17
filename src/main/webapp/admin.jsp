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

<div class="grid content">
    <div class="grid-cell-full breadcrumb" style="text-align: center;">
        <span style="font-size: xx-large;">旅游管理系统后台管理界面</span>
    </div>
    <div class="grid-cell-full">
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li>添加公告</li>
                <li class="layui-this">公告管理</li>
                <li>添加景点</li>
                <li>景点管理</li>
                <li>验码 - 景点</li>
                <li>添加酒店</li>
                <li>酒店管理</li>
                <li>验码 - 酒店</li>
                <li>留言管理</li>
            </ul>
            <div class="layui-tab-content" style="height: 600px;">
                <div class="layui-tab-item">
                    <!-- 添加公告 -->
                    <form class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">标题</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" class="layui-input">
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
                                <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="noticeForm">立即公告
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-tab-item layui-show">
                    <!-- 公告管理 -->
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col>
                            <col width="200">
                            <col width="200">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>内容</th>
                            <th>发表时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${notices}" var="item">
                            <tr>
                                <td>${item.title}</td>
                                <td>${item.content}</td>
                                <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd" /></td>
                                <td>
                                    <button tag="noticeDeleteBtn" class="layui-btn layui-btn-primary">
                                        <i class="layui-icon">&#xe640;</i>
                                    </button>
                                    <input type="hidden" value="${item.id}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <!-- 添加景点 -->
                    <form class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">景点名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">价格</label>
                            <div class="layui-input-block">
                                <input type="text" name="price" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开放时间</label>
                            <div class="layui-input-block">
                                <input type="text" name="openTime" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="address" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">联系电话</label>
                            <div class="layui-input-block">
                                <input type="text" name="mobile" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="scenicForm">立即添加</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-tab-item">
                    <!-- 景点管理 -->
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>景点名称</th>
                            <th>价格</th>
                            <th>开放时间</th>
                            <th>地址</th>
                            <th>联系电话</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${scenics}" var="item">
                            <tr>
                                <td>${item.name}</td>
                                <td>${item.price} RMB</td>
                                <td>${item.openTime}</td>
                                <td>${item.address}</td>
                                <td>${item.mobile}</td>
                                <td>
                                    <button tag="scenicDeleteBtn" class="layui-btn layui-btn-primary">
                                        <i class="layui-icon">&#xe640;</i>
                                    </button>
                                    <input type="hidden" value="${item.id}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <!-- 验码 - 景点 -->
                    <form class="lay-form layui-form-pane">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">订单码</label>
                                <div class="layui-input-inline" style="width: 300px;">
                                    <input type="text" id="scenicOrderCode" name="uuid" placeholder="输入景点订单的订单码" class="layui-input">
                                </div>
                                <div class="layui-input-inline">
                                    <button id="selectScenicOrder" class="layui-btn layui-btn-primary">查询</button>
                                    <button id="useScenicOrderCode" class="layui-btn layui-btn-primary">确认使用</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>订单信息</legend>
                        <div class="layui-field-box">
                            <div class="layui-form layui-form-pane">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">景点名称</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="scenicName" class="layui-input" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">购买时间</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="scenicCreateTime" class="layui-input" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">购买者</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="scenicUser" class="layui-input" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="layui-tab-item">
                    <!-- 添加酒店 -->
                    <form class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label class="layui-form-label">酒店名称</label>
                            <div class="layui-input-block">
                                <input type="text" name="name" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">价格</label>
                            <div class="layui-input-block">
                                <input type="text" name="price" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">服务</label>
                            <div class="layui-input-block">
                                <input type="text" name="service" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="address" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">联系电话</label>
                            <div class="layui-input-block">
                                <input type="text" name="hotLine" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="hotelForm">立即添加</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-tab-item">
                    <!-- 酒店管理 -->
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="200">
                            <col>
                            <col width="200">
                            <col width="200">
                            <col width="200">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>酒店名称</th>
                            <th>价格</th>
                            <th>服务</th>
                            <th>地址</th>
                            <th>联系电话</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${hotels}" var="item">
                            <tr>
                                <td>${item.name}</td>
                                <td>${item.price} RMB</td>
                                <td>${item.service}</td>
                                <td>${item.address}</td>
                                <td>${item.hotLine}</td>
                                <td>
                                    <button tag="hotelDeleteBtn" class="layui-btn layui-btn-primary">
                                        <i class="layui-icon">&#xe640;</i>
                                    </button>
                                    <input type="hidden" value="${item.id}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <!-- 验码 - 酒店 -->
                    <form class="lay-form layui-form-pane">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">订单码</label>
                                <div class="layui-input-inline" style="width: 300px;">
                                    <input type="text" id="hotelCode" name="uuid" placeholder="输入酒店订单的订单码" class="layui-input">
                                </div>
                                <div class="layui-input-inline">
                                    <button id="selectHotelOrder" class="layui-btn layui-btn-primary">查询</button>
                                    <button id="useHotelOrderCode" class="layui-btn layui-btn-primary">确认使用</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>酒店信息</legend>
                        <div class="layui-field-box">
                            <div class="layui-form layui-form-pane">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">酒店名称</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="hotelName" class="layui-input" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">购买时间</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="hotelCreateTime" class="layui-input" disabled>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">购买者</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="hotelUser" class="layui-input" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="layui-tab-item">
                    <!-- 留言管理 -->
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="200">
                            <col>
                            <col width="200">
                            <col width="200">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>内容</th>
                            <th>留言时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${leaveMsgs}" var="item">
                            <tr>
                                <td>${item.username}</td>
                                <td>${item.email}</td>
                                <td>${item.content}</td>
                                <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd" /></td>
                                <td>
                                    <button tag="leaveMsgDeleteBtn" class="layui-btn layui-btn-primary">
                                        <i class="layui-icon">&#xe640;</i>
                                    </button>
                                    <input type="hidden" value="${item.id}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'element'], function () {
        var form = layui.form();
        var element = layui.element();
        var $ = layui.jquery;
        var layer = layui.layer;

        /* 保存公告 */
        form.on('submit(noticeForm)', function (data) {
            var urlVal = "/admin/addNotice.action";
            var dataVal = data.field;
            $.post(urlVal, dataVal, function (result) {
                layer.alert(result.message);
                window.location.reload();
            });
            return false;
        });

        /* 删除公告 */
        $("button[tag='noticeDeleteBtn']").click(function () {
            var idVal = $(this).next().val();
            var url = "/admin/deleteNotice.action";
            var data = {"id":idVal};
            $.post(url, data, function (result) {
                layer.alert(result.message);
            });
            $(this).parent().parent().hide();
        });

        /* 添加景点 */
        form.on('submit(scenicForm)', function (data) {
            var urlVal = "/admin/addScenic.action";
            var dataVal = data.field;
            $.post(urlVal, dataVal, function (result) {
                layer.alert(result.message);
                window.location.reload();
            });
            return false;
        });

        /* 删除景点 */
        $("button[tag='scenicDeleteBtn']").click(function () {
            var idVal = $(this).next().val();
            var url = "/admin/deleteScenic.action";
            var data = {"id":idVal};
            $.post(url, data, function (result) {
                layer.alert(result.message);
            });
            $(this).parent().parent().hide();
        });
        
        /* 查询景点订单 */
        $("#selectScenicOrder").click(function () {
            var scenicCode = $("#scenicOrderCode").val();
            var url = "/admin/selectScenicOrder.action";
            var data = {"uuid": scenicCode};
            $.post(url, data, function (result) {
                if (result.type == "error") {
                    layer.alert(result.message);
                } else {
                    // 显示订单信息
                    $("#scenicName").val(result.scenic.name);
                    $("#scenicUser").val(result.user.username);
                    $("#scenicCreateTime").val(result.createTime);
                }
            });
        });

        /* 确认使用订单 */
        $("#useScenicOrderCode").click(function () {
            var scenicCode = $("#scenicOrderCode").val();
            var url = "/admin/useScenicOrder.action";
            var data = {"uuid": scenicCode};
            $.post(url, data, function (result) {
                layer.alert(result.message);
            });
        });

        /* 添加酒店 */
        form.on('submit(hotelForm)', function (data) {
            var urlVal = "/admin/addHotel.action";
            var dataVal = data.field;
            $.post(urlVal, dataVal, function (result) {
                layer.alert(result.message);
            });
            return false;
        });

        /* 删除酒店 */
        $("button[tag='hotelDeleteBtn']").click(function () {
            var idVal = $(this).next().val();
            var url = "/admin/deleteHotel.action";
            var data = {"id":idVal};
            $.post(url, data, function (result) {
                layer.alert(result.message);
            });
            $(this).parent().parent().hide();
        });

        /* 查询酒店订单 */
        $("#selectHotelOrder").click(function () {
            var hotelCode = $("#hotelCode").val();
            var url = "/admin/selectHotelOrder.action";
            var data = {"uuid": hotelCode};
            $.post(url, data, function (result) {
                if (result.type == "error") {
                    layer.alert(result.message);
                } else {
                    // 显示订单信息
                    $("#hotelName").val(result.hotel.name);
                    $("#hotelUser").val(result.user.username);
                    $("#hotelCreateTime").val(result.createTime);
                }
            });
        });

        /* 确认使用订单 */
        $("#useHotelOrderCode").click(function () {
            var hotelCode = $("#hotelCode").val();
            var url = "/admin/useHotelOrder.action";
            var data = {"uuid": hotelCode};
            $.post(url, data, function (result) {
                layer.alert(result.message);
            });
        });

        /* 删除留言 */
        $("button[tag='leaveMsgDeleteBtn']").click(function () {
            var idVal = $(this).next().val();
            var url = "/admin/deleteLeaveMsg.action";
            var data = {"id":idVal};
            $.post(url, data, function (result) {
                layer.alert(result.message);
            });
            $(this).parent().parent().hide();
        });

    });
</script>
</body>
</html>
