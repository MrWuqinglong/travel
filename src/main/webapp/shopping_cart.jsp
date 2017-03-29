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

    <%@ include file="commons/nav.jsp"%>

    <!-- 主体内容 -->
    <div class="row">
        <div class="three wide column"></div>
        <div class="eight wide column">
            <table class="ui table">
                <thead>
                <tr>
                    <th>商品</th>
                    <th>数量</th>
                    <th>价格</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>十渡龙山旅店</td>
                    <td>1</td>
                    <td>999 RMB</td>
                </tr>
                <tr>
                    <td>十渡龙山旅店</td>
                    <td>1</td>
                    <td>999 RMB</td>
                </tr>
                <tr>
                    <td>十渡龙山旅店</td>
                    <td>1</td>
                    <td>999 RMB</td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <th colspan="3">
                        <div class="ui right floated pagination menu">
                            <a href="" class="ui primary button">结算</a>
                        </div>
                    </th>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="two wide column"></div>
        <div class="three wide column"></div>
    </div>

</div>
</body>
</html>
