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

    <!-- 主体内容 -->
    <div class="row">
        <div class="four wide column"></div>
        <div class="two wide column">
        </div>
        <div class="three wide column">
            <div class="ui attached message">
                <div style="text-align: center;font-size: large;margin-bottom: 30px;">
                    登录
                </div>
                <form action="/admin/doLogin.action" method="post" class="ui form">
                    <div class="field">
                        <label>用户名</label>
                        <input type="text" placeholder="UserName" name="userName" required="required">
                    </div>
                    <div class="field">
                        <label>密码</label>
                        <input type="password" placeholder="Password" name="password" required="required">
                    </div>
                    <button class="ui primary button fluid" type="submit">登录</button>
                </form>
            </div>
        </div>
        <div class="three wide column"></div>
        <div class="four wide column"></div>
    </div>

</div>
</body>
</html>
