<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/8/5
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品管理</title>
    <%@include file="/pages/common/head.jsp"%>

    <style>
        a:hover{
            text-decoration: none;
        }

        /* border-bottom底部边框 ,text-indent：首行缩进*/
        .cart-table{
            width:600px ;
            margin: 0 auto;
            border-color: #9E792E;
            font-size: 12px;font-family: Verdana,"Microsoft YaHei";
            color: #333333;
            margin-right: 12px;
        }

        .cart-table th{
            border-bottom: 2px solid #EEA236 ;
            font-weight: normal;height: 35px;
            line-height:1.4375rem ;
        }
        .cart-item{
            background-color: floralwhite;
            border-bottom: 1px dotted  #E38D13;
        }
        .cart-item td{
            height:55px;
            text-align: center;
        }
        .cart-item .cart-txt-left{
            text-align:left;
        }
        .cart-name{
            color: #D58512;
            font-weight: bold;
            font-size: 16px;
        }

        .cart-raduce:hover,.cart-add:hover{
            background-color: #FF9900;
        }
        .cart-num{
            color: #FF3334;
            font-weight: bold;

        }
        .cart-del,.cart-all{
            font-size: 15px;
            color:  #000000;

        }
        .cart-del:hover,.cart-all:hover{
            text-decoration: underline;
            cursor: pointer;
        }
        .cart-bottom{
            height: 55px;
            text-align: right;
        }
        .cart-bottom .cart-all{
            position:relative;

            top:1px;}


        .cart-all-del{
            color:  #000000;
            font-size: 18px;
        }
        .cart-all-del:hover{
            text-decoration: underline;
            cursor: pointer;
        }
        .cart-intro{
            font-size: 15px;
        }

        .cart-add-1{
            color:  #000000;
            font-size: 18px;
        }
        .cart-add-1:hover{
            text-decoration: underline;
            cursor: pointer;
        }
        .cart-price{
            font-size: 15px;
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
            min-width: 85px;
            background:transparent;
            border-radius: 5px 5px 5px 5px;
        }
        .container .menu a{
            display: block;
            text-decoration: none;
            text-align: center;
            border-radius: 10px 10px 10px 10px;
            color: chocolate;
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
        .font1{font-weight: bold;

            float: left;
            font-family: "arial narrow";
            font-size: 17px;
            color: chocolate;
            margin-top: 41px;

        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-6 column">
            <img src="bootstrap/img/img/logo.jpg"width="370px"style="margin: 10px;" />
        </div>
        <div class="col-md-6 column">
            <p class="font1">
                欢迎 ${sessionScope.user.nickname} 光临
            </p>
            <div class="container1">
                <ul class="menu">
                    <li><a href="index.jsp">返回</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%--<div class="container-fluid">--%>
<%--    <div class="row clearfix">--%>
<%--        <div class="col-md-6 column">--%>
<%--            <div class="row clearfix">--%>
<%--                <div class="col-md-6 column">--%>
<%--                    <img alt="140x140" src="bootstrap/img/img/logo.jpg" width="330px" style="margin-left: 50px;"/>--%>
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
<%--                <div class="col-md-6 column">--%>
<%--                    <br />--%>
<%--                    <h4 style="margin-left: 60px;font-size: 25px;">--%>
<%--                        欢迎 ${sessionScope.user.nickname} 光临！--%>
<%--                    </h4>--%>
<%--                </div>--%>
<%--                <div class="col-md-6 column">--%>
<%--                    <br />--%>
<%--                    <ul class="nav nav-tabs" style="font-size: 16px; margin-left: 80px; margin-right: 100px;">--%>

<%--                        <li >--%>
<%--                            <a href="index.jsp">返回</a>--%>
<%--                        </li>--%>

<%--                    </ul>--%>
<%--                    </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<div class="container">
    <div class="row clearfix">
        <div class="col-md-2 column">
            <img src="bootstrap/img/img/saying.jpg"width="250px" style="margin-top: 35px;" />
        </div>
        <div class="col-md-7 column">
            <table class="cart-table" style="margin-top: 55px;">
                <tr>

                    <th width="150px"><span class="cart-all" style="font-size: 18px;">&nbsp;&emsp;&emsp;订单号</span></th>
                    <th width="130"style="font-size: 18px;">&emsp;&emsp;价格</th>
                    <th width="160"style="font-size: 18px;">&emsp;&emsp;创建时间</th>
                    <th width="145"style="font-size: 18px;">&emsp;&emsp;状态</th>
                    <th width="145"style="font-size: 18px;">&emsp;&emsp;操作</th>

                </tr>
                    <c:if test="${empty requestScope.page.items}">
                        <td colspan="5" style="font-size: 20px; text-align: center">
                            您的订单为空!<a href="index.jsp" style="color: #0e9aef">浏览商品</a>
                        </td>
                    </c:if>
                    <c:forEach items="${requestScope.page.items}" var="page">
                        <tr class="cart-item">
                            <td ><span class="cart-price">${page.orderId}</span></td>
                            <td><span class="cart-name">${page.price}</span></td>
                            <td><span class="cart-name">${page.createtime}</span></td>
                            <c:if test="${page.status=='已付款'}">
                                <td><span class="cart-name"style="text-align: center;color: greenyellow">${page.status}</span></td>
                            </c:if>
                            <c:if test="${page.status=='未付款'}">
                                <td><span class="cart-name"style="text-align: center;color: red">${page.status}</span></td>
                            </c:if>
                            <c:if test="${page.status=='已取消'}">
                                <td><span class="cart-name"style="text-align: center;color: gainsboro">${page.status}</span></td>
                            </c:if>
                            <td><a href="orderServlet?action=scanOrderItem&orderid=${page.orderId}&pageNo=${requestScope.page.pageNo}"><span class="cart-name">查看详情</span></a></td>
                        </tr>
                    </c:forEach>


            </table>
        </div>
        <div class="col-md-3 column">
            <img src="bootstrap/img/img/loveandfood.jpg" width="330px" style="margin-top: 45px;margin-left: 0px;"/>
        </div>

    </div>
    <div style="margin-left: 370px">
    <div id="page_nav">
        <c:if test="${requestScope.page.pageNo > 1}">
            <a href="orderServlet?action=pageForUser&pageNo=1">首页</a>
            <a href="orderServlet?action=pageForUser&pageNo=${requestScope.page.pageNo-1}">上一页</a>
        </c:if>


        <c:choose>
            <c:when test="${requestScope.page.pageTotal<=5}">
                <c:set var="begin" value="1"/>
                <c:set var="end" value="${requestScope.page.pageTotal}"/>
            </c:when>

            <c:when test="${requestScope.page.pageTotal>5}">
                <c:choose>
                    <c:when test="${requestScope.page.pageNo<=3 }">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="5"/>
                    </c:when>

                    <c:when test="${requestScope.page.pageNo>=requestScope.page.pageTotal-3}">
                        <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                        <c:set var="end" value="${requestScope.page.pageTotal}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                        <c:set var="end" value="${requestScope.page.pageNo+2}"/>

                    </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
        <c:forEach begin="${begin}" end="${end}" var="i">
            <c:if test="${i==requestScope.page.pageNo}">
                【${i}】
            </c:if>
            <c:if test="${i!=requestScope.page.pageNo}">
                <a href="orderServlet?action=pageForUser&pageNo=${i}">${i}</a>
            </c:if>

        </c:forEach>

        <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
            <a href="orderServlet?action=pageForUser&pageNo=${requestScope.page.pageNo+1}">下一页</a>
            <a href="orderServlet?action=pageForUser&pageNo=${requestScope.page.pageTotal}">末页</a>
        </c:if>

        共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录 到第<input style="width: 30px" value="${requestScope.page.pageNo}" name="pn" id="pn_input"/>页
        <input id="searchPageBtn"  type="button" value="确定">
        <script>
            $(function (){
                $("#searchPageBtn").click(function (){
                    var pageNo=$("#pn_input").val();
                    if(pageNo > ${requestScope.page.pageTotal}){
                        location.href="zcb1111.free.idcfengye.com/project/orderServlet?action=pageForUser&pageNo=${requestScope.page.pageTotal}";
                    }else if(pageNo< 1){
                        location.href="zcb1111.free.idcfengye.com/project/orderServlet?action=pageForUser&pageNo=1";
                    }else
                        location.href="zcb1111.free.idcfengye.com/project/orderServlet?action=pageForUser&pageNo="+pageNo;
                })
            })
        </script>
    </div>
</div>
</div>
<div>
    <h6  style="margin-left: 40%;bottom: 0px;left:0px">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>
</div>
</body>
</html>
