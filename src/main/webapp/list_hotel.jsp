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
    
    <!-- 酒店查询条件 -->
    <div class="row">
        <div class="three wide column"></div>
        <div class="ten wide column">
            <div class="ui segment">
                <span>位置：</span>
                <div class="ui horizontal list">
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                </div>
                <div class="ui divider"></div>
                <span>价格：</span>
                <div class="ui horizontal list">
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                    <div class="item">ABC</div>
                </div>
                <div class="ui divider"></div>
                <span>共找到 3 家符合条件的酒店</span>
            </div>
        </div>
        <div class="three wide column"></div>
    </div>

    <!-- 搜索结果 -->
    <div class="row">
        <div class="three wide column"></div>
        <div class="eight wide column">
            <table class="ui table">
                <thead>
                <tr>
                    <th>照片</th>
                    <th>名字/介绍</th>
                    <th>价格</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><img class="ui small image" src="image/hotel.jpg"></td>
                    <td>
                        <h3>十渡龙山旅店</h3>
                        <p>周边景区：东湖港,十渡,西湖港</p>
                        <p>地址：北京市房山区十渡景区十渡民俗村</p>
                    </td>
                    <td>999 RMB</td>
                    <td>
                        <a href="" class="ui primary button">加入购物车</a>
                    </td>
                </tr>
                <tr>
                    <td><img class="ui small image" src="image/hotel.jpg"></td>
                    <td>
                        <h3>十渡龙山旅店</h3>
                        <p>周边景区：东湖港,十渡,西湖港</p>
                        <p>地址：北京市房山区十渡景区十渡民俗村</p>
                    </td>
                    <td>999 RMB</td>
                    <td>
                        <a href="" class="ui primary button">加入购物车</a>
                    </td>
                </tr>
                <tr>
                    <td><img class="ui small image" src="image/hotel.jpg"></td>
                    <td>
                        <h3>十渡龙山旅店</h3>
                        <p>周边景区：东湖港,十渡,西湖港</p>
                        <p>地址：北京市房山区十渡景区十渡民俗村</p>
                    </td>
                    <td>999 RMB</td>
                    <td>
                        <a href="" class="ui primary button">加入购物车</a>
                    </td>
                </tr>
                <tr>
                    <td><img class="ui small image" src="image/hotel.jpg"></td>
                    <td>
                        <h3>十渡龙山旅店</h3>
                        <p>周边景区：东湖港,十渡,西湖港</p>
                        <p>地址：北京市房山区十渡景区十渡民俗村</p>
                    </td>
                    <td>999 RMB</td>
                    <td>
                        <a href="" class="ui primary button">加入购物车</a>
                    </td>
                </tr>
                <tr>
                    <td><img class="ui small image" src="image/hotel.jpg"></td>
                    <td>
                        <h3>十渡龙山旅店</h3>
                        <p>周边景区：东湖港,十渡,西湖港</p>
                        <p>地址：北京市房山区十渡景区十渡民俗村</p>
                    </td>
                    <td>999 RMB</td>
                    <td>
                        <a href="" class="ui primary button">加入购物车</a>
                    </td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <th colspan="4">
                        <div class="ui right floated pagination menu">
                            <a class="icon item">
                                <i class="left chevron icon"></i>
                            </a>
                            <a class="item">1</a>
                            <a class="item">2</a>
                            <a class="item">3</a>
                            <a class="item">4</a>
                            <a class="icon item">
                                <i class="right chevron icon"></i>
                            </a>
                        </div>
                    </th>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="two wide column">
            <div class="ui segment">
                <div class="header">帮助信息</div>
                <ul class="list">
                    <li>独立思考、自由探索</li>
                    <li>发布的内容和互联网、编程开发、产品设计有关</li>
                    <li>标题能准确描述的内容，不要发重复的内容</li>
                    <li>客观投票，确保你看过这篇内容</li>
                    <li>如果你遇到了具体的编程难题，请到 问答平台 提问</li>
                    <li>保持友善，禁止任何形式的广告、SEO 推广</li>
                    <li>遵循 用户服务条款</li>
                </ul>
            </div>
        </div>
        <div class="three wide column"></div>
    </div>

</div>
</body>
</html>
