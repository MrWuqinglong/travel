<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<div class="row orange">
    <div class="three wide column"></div>
    <div class="ten wide column">
        <div class="ui secondary menu">
            <a href="/" class="item">
                <h1 style="color: white;">旅游&nbsp;&nbsp;</h1>
            </a>
            <a href="/" class="item">
                <span style="font-size: large;color: white;">首页</span>
            </a>
            <a href="/" class="item">
                <span style="font-size: large;color: white;">预定景点</span>
            </a>
            <a href="/" class="item">
                <span style="font-size: large;color: white;">预定酒店</span>
            </a>
            <a href="/" class="item">
                <span style="font-size: large;color: white;">联系我们</span>
            </a>

            <div class="right menu">

                <!-- 为登录显示 -->
                <div class="item">
                    <div class="ui medium buttons">
                        <a href="" class="ui inverted orange button">
                            <span style="color: white;">注册</span>
                        </a>
                        <div class="or"></div>
                        <a href="" class="ui inverted orange button">
                            <span style="color: white;">登录</span>
                        </a>
                    </div>
                </div>

                <!-- 登录之后显示 -->
                <%--<div class="item">
                    <a href="" style="color: white;">我的购物车</a>
                </div>
                <div class="item">
                    <a href="" style="color: white;">我的站内信</a>
                </div>
                <div class="item">
                    <img class="ui avatar image" src="image/user.png">
                    <a href="" style="color: white;">Tom猫</a>
                    <a class="ui label" href="" style="color: white;">退出</a>
                </div>--%>

                <c:if test="${empty(sessionScope.user)}">
                    <div class="item">
                        <div class="ui medium buttons">
                            <a href="" class="ui button">注册</a>
                            <div class="or"></div>
                            <a href="" class="ui button">登录</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty(sessionScope.user)}">
                    <div class="item">
                        <div class="ui medium buttons">
                            <a href="" class="ui button" id="headAskQuestion">提问题</a>
                            <div class="or"></div>
                            <a href="" class="ui button" id="headSendHeadLine">发头条</a>
                        </div>
                    </div>
                    <div class="item">
                        <img class="ui avatar image" src="static/img/user.png">
                        <a href="">${sessionScope.user.nickName}</a>
                        <a class="ui label" href="">退出</a>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <div class="three wide column"></div>
</div>
<div class="ui divider" style="margin: 0px;"></div>
