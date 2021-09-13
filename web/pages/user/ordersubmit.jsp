<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<head>
		<title>订单详情</title>
		<%@include file="/pages/common/head.jsp"%>

		 <style type="text/css">
			 a:hover{
				 text-decoration: none;
			 }
			.cart{
				margin-top: 50px;
				margin-left: 60px;
				width: 600px;
			    padding: 0 10px 10px;
			    border: 1px solid #EEA236;
			}
			.cart-title{
				margin-bottom: 10px;
				font-size: 16px;
				border-bottom: 1px solid  #EB9316;
				line-height: 30px;
				height: 40px;
				font-weight:600;
				text-indent: 10px;
				color:#333;
				font-family:'Microsoft YaHei' ;
				}
			/* border-bottom底部边框 ,text-indent：首行缩进*/
			.cart-table{
				width: 100%;
				margin: 0 auto;
				border-color: collapse;
				font-size: 12px;font-family: Verdana,"Microsoft YaHei";
				color: #333333;
				}
			
			.cart-table th{
				border-bottom: 2px solid #EEA236 ;
				font-weight: normal;height: 35px;
				line-height:1.4375rem ;}
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
				font-size: 15px;
				}
			.cart-subtotal{
				color: #FF3334;
				font-weight: bold;}
			.cart-raduce:hover,.cart-add:hover
			{background-color: #FF9900;
			}
			.cart-num
			{color: #FF3334;
				font-weight: bold;
				
			}
			.cart-del,.cart-all{
				color:  #000000;
				font-size: 15px;
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
			.cart-total-price{
				color: #FF3334;
				font-weight: bold;
				font-size: 16px;
				}
			.cart-bottom-btn{
				color: #FFF;
				font-size: 14px;
				font-weight: bold;
				cursor: pointer;
				margin: 0 20px;
				background: #FE8502;
			    border: 1px solid #FF6633;
			    border-radius: 5px 5px 5px 5px;padding: 6px 12px;
			    }
			.cart-all-del{
				color:  #000000;
				font-size: 16px;
				}
			   .cart-all-del:hover{
				text-decoration: underline;
				cursor: pointer;
				}
			.cart-bottom-btn:hover{
				background: #FF6600;
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

		<div bgcolor="#FAF2CC">
<%--		<div class="container">--%>
<%--			  <div class="row clearfix">--%>
<%--				<div class="col-md-6 column">--%>
<%--					<div class="row clearfix">--%>
<%--						<div class="col-md-6 column">--%>
<%--							<img alt="140x140" src="img/img/logo.jpg" width="330px" style="margin-left: 50px;"/>--%>
<%--						</div>--%>
<%--						<div class="col-md-6 column">--%>
<%--							<p>--%>
<%--								 <em></em> --%>
<%--							</p>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="col-md-6 column">--%>
<%--					<div class="row clearfix">--%>
<%--						<div class="col-md-6 column">--%>
<%--							<h4 style="margin-left: 60px;font-size: 25px;">--%>
<%--								欢迎XXX光临--%>
<%--							</h4>--%>
<%--						</div>--%>
<%--						<div class="col-md-6 column">--%>
<%--							<ul class="nav nav-tabs" style="font-size: 16px; margin-right: 40px;">--%>
<%--								<li >--%>
<%--									 <a href="#">订单</a>--%>
<%--								</li >--%>
<%--								--%>
<%--								<li>--%>
<%--									 <a href="#">注销</a>--%>
<%--								</li>--%>
<%--								<li >--%>
<%--									 <a href="#">返回</a>--%>
<%--								</li>--%>
<%--								--%>
<%--									</ul>--%>
<%--								</li>--%>
<%--							</ul>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		--%>
<%--	</div>--%>
<%--</div>--%>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<img src="bootstrap/img/img/logo.jpg"width="370px"style="margin: 10px;" />
		</div>
		<div class="col-md-6 column">
			<p class="font1">

			</p>
			<div class="container1">
				<ul class="menu">
					<li><a href="orderServlet?action=pageForUser&pageNo=${requestScope.pageNo}">返回</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="container">
			<div class="row clearfix">
				<div class="col-md-2 column">
					<img src="bootstrap/img/img/saying.jpg"width="250px"style="margin-top: 35px;margin-left: 15px;" />
				</div>
				<div class="col-md-7 column">
					<div class="cart" >
			<div class="cart-title" style="margin-top: 5px;">订单号：${requestScope.orderid}</div>
			
			<table class="cart-table">
				<tr>
					<th style="font-size: 16px;">&emsp;商品名</th>
					<th width="120" style="font-size: 16px;">&emsp;&emsp;&emsp;单价</th>
					<th width="100" style="font-size: 16px;">&emsp;&emsp;数量</th>
					<th width="120" style="font-size: 16px;">&emsp;&emsp;&emsp;小计</th>
				</tr>

				<c:forEach items="${requestScope.orderitems}" var="orderitem">
				<tr class="cart-item">
					<td class="cart-txt-left"><span class="cart-name">&emsp;${orderitem.name}</span></td>
					<td><span class="cart-price" style="font-size: 15px;">${orderitem.price}</span></td>
					<td><span class="cart-price" style="font-size: 15px;">${orderitem.count}</span></td>
					<td><span class="cart-subtotal" style="font-size: 15px;">${orderitem.totalPrice}</span></td>
				</tr>
				</c:forEach>

				<tr class="cart-bottom">
					<td colspan="6">
						<span class="cart-bottom-span"><span class="cart-total-num"></span></span>
						<span class="cart-bottom-span">总计：<span class="cart-total-price">${requestScope.totalPrice}</span></span>
					</td>
				</tr>
			</table>
		</div>
			</div>


<div class="col-md-3 column">
	<img src="bootstrap/img/img/loveandfood.jpg"width="330px"style="margin-top: 40px;margin-left: 0px;" />
</div>
	</div>
	</div>
</div>

<div>
	<h6  style="margin-left: 40%;bottom: 0px;left:0px">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>
</div>
	</body>
</html>
