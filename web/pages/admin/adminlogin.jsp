<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<head>
    <title>登录页面</title>
    <%@include file="/pages/common/head.jsp"%>
    <style type="text/css" >
        .bordered{
            position: absolute;
            border-style:none;
            width:370px;
            height:290px;
            margin-left: 90px;
            color:antiquewhite;
            margin-right: 30px;
            margin-top: 120px;
            font-size: 18px ;
            border-radius: 80px;

            background: radial-gradient(#F8EFC0,transparent);
        }


        .f{

            position: absolute;
            top: 68px;
            left: 10px;


        }
        .top{
            width: 430px;
            border:1px solid black;
            height: 50px;
            float: left;
            /*文本内容垂直居中*/
            line-height:50px ;
        }
        .button{
            width: 210px;

            font-size: 18px;

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
        a:hover{
            text-decoration: none;
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
                    <li><a href="pages/user/regist.jsp">注册</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%--<div class="container">--%>
<%--    <div class="row clearfix">--%>
<%--        <div class="col-md-6 column">--%>
<%--            <div class="row clearfix">--%>
<%--                <div class="col-md-6 column">--%>
<%--                    <img alt="140x140" src="bootstrap/img/img/logo.jpg" width="360px" style="margin-left: 50px;"/>--%>
<%--                </div>--%>
<%--                <div class="col-md-6 column">--%>
<%--                    <p>--%>
<%--                        <em></em>--%>
<%--                    </p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="col-md-6 column">--%>
<%--            <div class="row clearfix">--%>
<%--                <div class="col-md-8 column">--%>

<%--                </div>--%>
<%--                <br />--%>
<%--                <h4 style="margin-left: 60px;font-size: 18px;">--%>
<%--                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;--%>
<%--                    <a href="index.jsp">主页</a>--%>
<%--                    &emsp;<a href="pages/user/regist.jsp">注册</a>--%>

<%--                </h4>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-1 column">
        </div>
        <div class="col-md-10 column">
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <div class="f">
                        <img src="bootstrap/img/img/28b12e411f07c010_mh1627835369703.jpg" width="450px" />
                    </div>
                </div>
                <div class="col-md-6 column">
                    <div class="bordered"  >
                        <form id="myform" name="myform" action="userServlet" method="post">
                            <input type="hidden" name="action" value="adminlogin">
                            <p align="left" style="color:#5E5E5E;margin-top: 25px;">
                                &emsp;&emsp;&emsp;&emsp;管理员登录 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 10px;color: red">${msg}</span>
                            </p>
                            <p align="center" style="color: #5E5E5E;margin-top: 28px"style="line-height: 20px;">
                                <strong >管理员</strong>&nbsp;
                                <input  style="height: 27px" style="width: 80px;"  id="yonghuming" name="adname" value="${adname}" placeholder="请输入管理员"/>
                            </p>
                            <p align="center"style="color: #5E5E5E;line-height: 30px;margin-top: 32px;"><STRONG>密&emsp;码</STRONG>&nbsp;
                                <input  style="height: 27px"  type="password" id="mima" name="password" placeholder="请输入密码"/>
                            </p>


                            <div >

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;<button type="submit" class="btn btn-default btn-warning" style="width: 210px; margin-top: 18px; font-size: 18px;margin-right: 65px " >登录</button>
                            </div>
                            <br />
                        </form>
                    </div>
                </div>
            </div>

            </form>

        </div>
    </div>
</div>
<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br><br>
<div>
    <h6  style="margin-left: 40%;bottom: 0px;left:0px">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>
</div>
</body>

</html>