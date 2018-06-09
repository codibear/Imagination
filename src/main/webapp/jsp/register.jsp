<%-- User: codiibear   Date: 2018/4/20  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
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
    <link rel="stylesheet" href="../css/register.css">
    <%--表单验证--%>
    <script src="../js/validator.js"></script>
    <style type="text/css">


    </style>
</head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal"  id="register-div">
            <h3 class="text-center">注册</h3>
            <div class="col-md-12">
                <form class="form-register" id="RegisteR" method="post">
                    <div class="form-group">
                        <label for="username" class="col-sm-4 control-label">邮箱</label>
                        <div class="col-sm-7">
                            <input type="email" class="form-control required" name="username" id="username" autofocus="autofocus" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-4 control-label">密码</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control required" id="password" name="password" placeholder="密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="repassword" class="col-sm-4 control-label">确认密码</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control required" id="repassword" name="repassword" placeholder="再次确认密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="usercerti" class="col-sm-4 control-label">身份证</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="usercerti" id="usercerti" placeholder="身份证">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nickname" class="col-sm-4 control-label">昵称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" maxlength="10"
                                   minlength="1" id="nickname" name="nickname" placeholder="昵称" data-fv-stringlength-message="最少输入1个字最多10个字"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="usermotto" class="col-sm-4 control-label">座右铭</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="usermotto" id="usermotto" placeholder="座右铭">
                        </div>
                    </div>
                    <%--验证码--%>
                    <div class="form-group">
                        <label for="captcha" class="col-sm-4 control-label" id="captchaOperation"></label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="captcha" name="captcha" />
                        </div>
                    </div>
                    <%--协议--%>
                    <div class="form-group">
                        <div class="col-xs-6 col-xs-offset-3">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="agree" value="agree" />我遵从本协议的一切内容
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-5 col-sm-10">
                            <address>
                                <a href="#" data-toggle="modal" data-target="#myModal">这是协议</a>
                            </address>
                        </div>
                        <%--模态框--%>
                        <!-- Modal -->
                        <div class="modeldiv">
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title text-center" id="myModalLabel">协议</h4>
                                        </div>
                                        <div class="modal-body">
                                            这是协议的主要内容
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">我了解</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-3 ">
                            <button type="submit" class="btn btn-primary">注册</button>
                        </div>
                        <div class="col-sm-offset-3 col-sm-3 ">
                            <button type="submit" class="btn btn-primary">我是商家</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    /*生成验证码*/
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    /*bootstrapValidator表单验证*/
    $(function () {
        $('#RegisteR').bootstrapValidator({
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
                        regexp: {
                            regexp: /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/,
                            message: '请输入正确的邮箱格式'
                        },
                        threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            url: '${pageContext.request.contextPath}/customer/checkregister',//验证地址
                            message: '用户已存在',//提示消息
                            delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'POST',//请求方式
                            data:{
                                username:function () {
                                    return $("#username").val();
                                }
                            }
                        },
                    },

                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {     //输入　长度限制　　校验
                            min: 6,
                            max: 20,
                            message: '密码必须在6-20位之间'
                        }
                    }
                },
                repassword:{
                    validators:{
                        notEmpty:{
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'password',
                            message: '两次密码必须输入一致'
                        },
                        different: {
                            field: 'username',
                            message: '用户名和密码不能相同'
                        }
                    }
                },
                nickname:{
                    validators:{
                        notEmpty:{
                            message: '确认密码不能为空'
                        },
                        stringLength: {
                            max: 10,
                            message: '用户名长度必须在1到10个字'
                        }
                    }
                },
                usercerti:{
                    validators:{
                        notEmpty:{
                            message: '身份证号码必填'
                        },
                        regexp:{
                            regexp:/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/,
                            message:'请输入正确的身份证号码'
                        }
                    }
                },
                usermotto:{
                    validators:{
                        notEmpty:{
                            message: '咸鱼也要有理想'
                        }
                    }
                },
                captcha: {
                    validators: {
                        callback: {
                            message: '答案错误',
                            callback: function(value, validator, $field) {
                                var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                                return value == sum;
                            }
                        }
                    }
                },
                agree: {
                    validators: {
                        notEmpty: {
                            message: '您必须遵从本协议才能注册'
                        }
                    }
                }
            }
        }).on('success.form.bv', function(e) {//点击提交之后
            var username = $("#username").val();
            var userpwd = $("#password").val();
            var nickname = $("#nickname").val();
            var usercerti = $("#usercerti").val();
            var usermotto = $("#usermotto").val();
            /*检测是否重复*/
            $.post("${pageContext.request.contextPath}/customer/userregister",
                {"username":username,"userpwd":userpwd,"nickname":nickname,"usercerti":usercerti,"usermotto":usermotto},
                function (data) {
                    //alert(data) ;
                })

            /*var username = $("#username").val();
            var userpwd = $("#password").val();
            $.post("${pageContext.request.contextPath}/customer/checknaccount",{"username":username, "userpwd":userpwd},function (data) {
                alert(data.userpwd);
                if(data.username!=null){
                    window.location.href="/customer/index"
                }else {
                    alert("您的账号密码有误，请重新输入");
                }
                return ;
            })*/
            // Use Ajax to submit form data 提交至form标签中的action，result自定义
            $.post("", "", function(result) {
                //do something...
            });
        });
    });
</script>
</body>
</html>
