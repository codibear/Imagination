<%-- User: codiibear   Date: 2018/4/20  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>登录页面</title>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <%--表单验证--%>
    <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
    <%--登录--%>
    <link rel="stylesheet" href="../css/login.css">
    <%--表单验证--%>
    <script src="../js/validator.js"></script>


</head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-signin-heading">登录</h3>
            <div class="col-md-9">
                <form class="form-signin" id="LoginG">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="email" placeholder="Email" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" id="password" name="userpwd" maxlength="8"/>
                </div>
                <div class="form-group">
                    <label class="checkbox">
                        <input type="checkbox" name="remember" value="1"/>记住我
                    </label>
                </div>
                <div class="form-group col-md-offset-9">
                    <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>

</div>
<script type="text/javascript">

        /*$("button[type=button]").click(function () {
            alert("dsafsad");
        })*/


    /*bootstrapValidator表单验证*/
    $(function () {
        $('#LoginG').bootstrapValidator({
            //message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                username: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        /*stringLength: {
                            min: 6,
                            max: 18,
                            message: '用户名长度必须在6到18位之间'
                        },*/
                        regexp: {
                            regexp: /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,
                            message: '请输入正确的邮箱格式'
                        }
                    }
                },
                userpwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }
            }
        }).on('success.form.bv', function(e) {//点击提交之后

            var username = $("#username").val();
            var userpwd = $("#password").val();
            $.post("${pageContext.request.contextPath}/customer/checknaccount",{"username":username, "userpwd":userpwd},function (data) {
                if(data.username!=null){
                    window.location.href="/customer/index"
                }else {
                    alert("您的账号密码有误，请重新输入");
                }
                return ;
            })


            //alert("验证成功登陆跳转。。。");
//            return;

            // Use Ajax to submit form data 提交至form标签中的action，result自定义
            $.post("", "", function(result) {
                //do something...
            });
        });
    });

    $(function () {
        $("button[type=submit]").click(function(){

        });
    });
</script>
</body>
</html>
