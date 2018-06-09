<%-- User: codiibear   Date: 2018/3/13  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--${pageContext.request.contextPath}--%>
    <title>首页</title>
        <script src="js/jquery-3.3.1.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
        <script src="js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/buttonui.css">
        <link rel="stylesheet" href="css/index.css">

</head>
<body>
    <div class=".container-fluid">
        <%--sign up and register button--%>
        <div class="row topbar">
            <div class="col-md-offset-10">
                <a href="${pageContext.request.contextPath}/customer/register" class="button-small button button-raised button-primary button-pill"><i class="glyphicon glyphicon-pencil"></i> 注册</a>
                <a href="${pageContext.request.contextPath}/customer/login" class=" button-small button button-raised button-royal button-pill"><i class="glyphicon glyphicon-user"></i>登录</a>
            </div>
        </div>
        <!-- start header -->
        <div class="row">
            <div class="col-md-12">
                <img src="images/header.jpg" class="img-responsive" alt="Responsive image">
            </div>
        </div>
    </div>
    <div class="container">
        <ul id="myTabs" class="nav nav-pills nav-justified bg-success" role="tablist">
            <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">天马行空</a></li>
            <li role="presentation" class="dropdown">
                <a href="#" id="imagination" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents">创意社区 <span class="caret"></span></a>
                <ul class="dropdown-menu" aria-labelledby="myTabDrop1" id="imagination-contents">
                    <li><a href="#clothes-tab" role="tab" id="clothes" data-toggle="tab" aria-controls="clothes-tab">衣尚</a></li>
                    <li><a href="#foot-tab" role="tab" id="food" data-toggle="tab" aria-controls="food-tab">食趣</a></li>
                    <li><a href="#live-tab" role="tab" id="live" data-toggle="tab" aria-controls="live-tab">住舍</a></li>
                    <li><a href="#movement-tab" role="tab" id="movement" data-toggle="tab" aria-controls="movement-tab">漫行</a></li>
                </ul>
            </li>
            <li role="presentation"><a href="#askfor" role="tab" id="askfor-tab" data-toggle="tab" aria-controls="askfor">创意征询</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/company/all" role="tab" id="presell-tab" data-toggle="tab" aria-controls="askfor">商家预售</a></li>
        </ul>
        <%--imagination-contents--%>
        <div id="myTabContent" class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                <p>天马行空</p>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="thumbnails">
                                <li class="col-md-4">
                                    <div class="thumbnail">
                                        <img alt="300x200" src="images/login/2.jpg" class="img-content"/>
                                        <div class="caption">
                                            <h3>
                                                冯诺尔曼结构
                                            </h3>
                                            <p>
                                                也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
                                            </p>
                                            <p>
                                                <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <div class="thumbnail">
                                        <img alt="300x200" src="images/login/2.jpg" class="img-content"/>
                                        <div class="caption">
                                            <h3>
                                                哈佛结构
                                            </h3>
                                            <p>
                                                哈佛结构是一种将程序指令存储和数据存储分开的存储器结构，它的主要特点是将程序和数据存储在不同的存储空间中，进行独立编址。
                                            </p>
                                            <p>
                                                <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-md-4">
                                    <div class="thumbnail">
                                        <img alt="300x200" src="images/login/2.jpg" class="img-content"/>
                                        <div class="caption">
                                            <h3>
                                                改进型哈佛结构
                                            </h3>
                                            <p>
                                                改进型的哈佛结构具有一条独立的地址总线和一条独立的数据总线，两条总线由程序存储器和数据存储器分时复用，使结构更紧凑。
                                            </p>
                                            <p>
                                                <a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>



            </div>
            <%--imagination four module--%>
            <div role="tabpanel" class="tab-pane fade" id="clothes-tab" aria-labelledby="clothes">
                <p>一</p>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="foot-tab" aria-labelledby="food">
                <p>是</p>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="live-tab" aria-labelledby="live">
                <p>住</p>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="movement-tab" aria-labelledby="movement">
                <p>行</p>
            </div>
            <%--company ask for--%>
            <div role="tabpanel" class="tab-pane fade" id="askfor" aria-labelledby="askfor-tab">
                <p>zhengxun</p>
            </div>
            <%--presell module--%>
            <div role="tabpanel" class="tab-pane fade" id="/company/all" aria-labelledby="askfor-tab">
                <p>presell</p>
            </div>
        </div>
    </div>
</body>
</html>
