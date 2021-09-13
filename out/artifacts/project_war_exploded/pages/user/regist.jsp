<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <%--静态包含下的base标签 css样式 jQuery--%>
    <%@include file="/pages/common/head.jsp"%>

    <script>

        // 页面加载完成之后
        $(function () {
            //给验证码绑定点击时间
            $("#code_img").click(function (){
                this.src = "${basePath}KaptchaServlet.jpg?d="+new Date();
            })
        })

        $(function () {


            $("#user").blur(function (){
                var username = this.value;
                $.getJSON("http://localhost:8080/project/userServlet","action=ajaxExistsUsername&username="+username,function (data){
                    if(data.existUsername){
                        $("span.errorMsg").text("用户名已存在！")
                    }else{
                        $("span.errorMsg").text("             ")
                    }
                })

            })

            //给指定的表单添加校验事件
            $("#registForm").validate({

                //规则
                rules: {
                    user: {
                        required: true  //非空校验
                    },
                    password: {
                        required: true,
                        minlength: 6   //minlength最小值   maxlength最大值
                    },
                    repassword: {
                        required: true,
                        minlength: 6,
                        equalTo: "#password"  //必须与指定的元素值相同  "#id选择器"
                    },
                    email: {
                        required: true,
                        email: true    //邮箱格式校验器
                    },
                    birthday: {
                        required: true,
                        dateISO: true  //日期格式校验器
                    }
                },

                //提示信息
                messages: {
                    user: {
                        required: "姓名必填"
                    },
                    password: {
                        required: "密码必填",
                        minlength:"密码长度最少为6位"
                    },
                    repassword: {
                        required: "密码必填",
                        minlength: "密码长度最少为6位",
                        equalTo: "两次密码输入要一致"
                    },
                    email: {
                        required: "邮箱必填",
                        email: "邮箱格式必须正确"
                    },
                    telephone: {
                        required: "电话必填",
                        telephone: "电话格式必须正确"
                    },
                    username: {
                        required: "昵称必填",
                        username: "昵称不合法"
                    }
                },

                //     //成功
                //     success:bootstrap(label){
                //     $(label).addClass("success");
                // }


            })
        })


    </script>
    <style>
        a:hover{
            text-decoration: none;
        }
        #father{
            border: 0px solid white;
            padding-left: 0px;
        }

        #form2{
            margin-left: 15px;
            border: 5px solid gray;
            border-color:  #EEA236;
            width: 500px;
            height: 450px;
        }
        *{
            list-style: none;
        }

        .container1{
            float:right ;

            margin: 20px;
            width:300px;
            margin-top: 30px;
        }
        .container .menu>li{
            float: right;
            margin-left: 0px;
            position: relative;
        }

        .container .menu li{
            min-width: 86px;
            background:transparent;
            border-radius: 5px 5px 5px 5px;
        }
        .container .menu a{
            display: block;
            text-decoration: none;
            text-align: center;
            border-radius: 10px 10px 10px 10px;
            color:chocolate;
            font-size: 18px;
            line-height: 43px;

            text-transform: uppercase;
        }
        .menu li:hover{
            background:  #F7E1B5;
        }
        .menu li:hover>a{
            color: white;

        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-6 column">
            <img src="bootstrap/img/img/logo.jpg"width="370px"style="margin: 10px;margin-left: 20px;" />
        </div>
        <div class="col-md-6 column">
            <div class="container1">
                <ul class="menu">
                        <li><a href="index.jsp">主页</a></li>
                        <li><a href="pages/user/login.jsp">登录</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-6 column">

            <img alt="140x140" src="bootstrap/img/img/28b12e411f07c010_mh1627835369703.jpg" class="img-rounded" style="margin-top: 88px;margin-left: 40px" width="450px" />
        </div>
        <div class="col-md-6 column">
            <br /><br /><br />
            <div id="form">
                <form action="userServlet" method="post" id="registForm">
                    <input type="hidden" name="action" value="regist">
                    <div id="father">
                        <div id="form2">
                            <table border="0px" width="100%" height=100% align="center" cellpadding="0px" cellspacing="0px" bgcolor="white"  style="color: #5E5E5E;">
                                <tr>
                                    <td colspan="2" >
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <font size="5">会员注册</font>&nbsp;&nbsp;&nbsp;USER REGISTER
                                        <span class="errorMsg" style="color: red">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    ${msg}
                                </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        用户名
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="username" width="200px" id="user"
                                                                                               value="${requestScope.username}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        密码
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"  name="password" width="200px"id="password" />
                                    </td>
                                </tr>
                                <tr >
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        确认密码
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="repassword" width="200px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        Email
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" width="200px" id="email"
                                                                                               value="${requestScope.email}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        电话
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="phone" width="200px"
                                                                                               value="${requestScope.phone}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        昵称
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="nickname" width="200px"
                                                                                               value="${requestScope.nickname}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        验证码
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="code" size="15px"/>
                                        <img id="code_img" alt="" src="KaptchaServlet.jpg" style="float: right; margin-right: 70px; width: 110px;height: 30px ">
                                    </td>
                                    <%--                            <span>--%>
                                    <%--                                ${empty requsetScope.msg2 ? "验证码不正确":requestScope.msg2}--%>
                                    <%--                            </span>--%>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                        <input type="submit" class="btn btn-default btn-warning" value="注册" style="width:220px; height:32px;color:white;" />

                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
<div>
    <h6  style="margin-left: 40%;bottom: 0px;left:0px">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>

</div>
</body>


</html>