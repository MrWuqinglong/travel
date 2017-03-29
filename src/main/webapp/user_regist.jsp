<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/semantic.min.css">
    <script src="static/js/jquery.js" charset="UTF-8"></script>
    <script src="static/js/semantic.min.js" charset="UTF-8"></script>
</head>
<body>
<div class="ui grid">

    <%-- 导入导航栏 --%>
    <%@ include file="commons/nav.jsp"%>

    <!-- 主体内容 -->
    <div class="row">
        <div class="four wide column"></div>
        <div class="two wide column">
        </div>
        <div class="three wide column">
            <div class="ui attached message">
                <div style="text-align: center;font-size: large;margin-bottom: 30px;">
                    注册新账号
                </div>
                <form action="" method="post" class="ui form" >
                    <div class="field">
                        <label>真实姓名或昵称</label>
                        <input type="text" placeholder="Name Or NickName" name="user.nickName" required="required">
                    </div>
                    <div class="field">
                        <label>邮箱</label>
                        <input type="email" placeholder="Email" name="email" required="required">
                    </div>
                    <div class="field">
                        <label>密码</label>
                        <input type="password" placeholder="Password" name="password" required="required" minlength="6">
                    </div>
                    <div class="inline field">
                        <div class="ui toggle checkbox">
                            <input type="checkbox" tabindex="1" class="hidden">
                            <label>同意相关协议</label>
                        </div>
                    </div>
                    <button class="ui primary button fluid" type="submit">注册</button>
                </form>
            </div>
        </div>
        <div class="three wide column"></div>
        <div class="four wide column"></div>
    </div>

</div>
</body>
</html>
