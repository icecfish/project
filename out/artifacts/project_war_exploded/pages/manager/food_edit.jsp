<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商品管理</title>
	<%@include file="/pages/common/head.jsp"%>

	<style>
		a:hover{
			text-decoration: none;
		}

		/* border-bottom底部边框 ,text-indent：首行缩进*/
		.cart-table{
			width: 100%;
			margin: 0 auto;
			border-color: #9E792E;
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

		.cart-raduce:hover,.cart-add:hover{
			background-color: #FF9900;
		}
		.cart-num
		{color: #FF3334;
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

		.cart-bottom-btn{
			width: 100px;
			color: #FFF;
			font-size: 16px;
			font-weight:600;
			cursor: pointer;
			margin: 0 20px;
			background: #FE8502;
			border: 1px solid #FF6633;
			border-radius: 5px 5px 5px 5px;padding: 6px 12px;
		}
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
					<li><a href="foodServlet?action=page&pageNo=${requestScope.page.pageNo}">返回</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<%--<div class="container">--%>
<%--	<div class="row clearfix">--%>
<%--		<div class="col-md-6 column">--%>
<%--			<div class="row clearfix">--%>
<%--				<div class="col-md-6 column">--%>
<%--					<img alt="140x140" src="bootstrap/img/img/logo.jpg" width="330px" style="margin-left: 50px;"/>--%>
<%--				</div>--%>
<%--				<div class="col-md-6 column">--%>
<%--					<p>--%>
<%--						<em></em>--%>
<%--					</p>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="col-md-6 column">--%>
<%--			<div class="row clearfix">--%>
<%--				<div class="col-md-6 column">--%>
<%--					<h4 style="margin-left: 60px;font-size: 25px;">--%>
<%--						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;--%>
<%--					</h4>--%>
<%--				</div>--%>
<%--				<div class="col-md-6 column">--%>
<%--					<ul class="nav nav-tabs" style="font-size: 16px; margin-left: 80px; margin-right: 100px;">--%>

<%--						<li >--%>
<%--							<a href="pages/manager/food_manager.jsp">返回</a>--%>
<%--						</li>--%>

<%--					</ul>--%>
<%--					</li>--%>
<%--					</ul>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-1 column">
			&emsp;
		</div>
		<div class="col-md-10 column">
			<form action="foodServlet" method="post" enctype="multipart/form-data" >
				<input type="hidden" name="pageNo" value="${param.pageNo}"/>
				<input type="hidden" name="action" value="${empty requestScope.food?"add":"update"}" />
				<input type="hidden" name="id" value="${requestScope.food.id}" />

				<table class="cart-table" style="margin-top: 60px;">
					<tr>
						<th width="140px"><span class="cart-all" style="font-size: 16px;">&nbsp;菜品名称</span></th>
						<th style="font-size: 16px;">&emsp;&emsp;&emsp;&emsp;&emsp;菜品简介</th>
						<th width="120"style="font-size: 16px;">&emsp;&emsp;&nbsp;&nbsp;单价</th>

						<th width="120" style="font-size: 16px;">&nbsp;菜品类</th>
						<th width="120" style="font-size: 16px;">&emsp;&emsp;&nbsp;&nbsp;上传图片</th>
					</tr>
					<tr class="cart-item">
						<td class="cart-txt-left">
							<input  class="cart-name" style="width: 130px;" name="foodname" value="${food.foodname}"/>
						</td>
						<td style="margin-left: 20px;">
							<input class="cart-intro" style="width: 250px;" name="foodinfo" value="${food.foodinfo}"/>
						</td>
						<td >
							<input class="cart-price" style="width: 50px;"  name="price" value="${food.price}"/>
						</td>
						<td class="cart-txt-left">
							<div class="btn-group">
								<select name="catelog">
										<c:forEach items="${sessionScope.catelog}" var="catelog">
											<option>${catelog.catelogName}</option>
										</c:forEach>
								</select>
							</div>
						</td>
						<td align="right" >
							<input class="cart-name"  type="file" name="imgpath"/>
						</td>
					</tr>
					<tr class="cart-bottom">
						<td colspan="5">
                             <span ><input type="submit"class="cart-bottom-btn"></span>
                     	</td>
					</tr>
				</table>

			</form>

		</div>
		<div class="col-md-1 column">
		</div>
	</div>
</div>

<div>
	<h6  style="margin-left: 40%;position:fixed;bottom: 0px;left:0px">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>
</div>
</body>
</html>






<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--	<head>--%>
<%--		<meta charset="UTF-8">--%>
<%--		<title>商品管理</title>--%>
<%--		<%@include file="/pages/common/head.jsp"%>--%>

<%--		<style>--%>
<%--		--%>
<%--			--%>
<%--			/* border-bottom底部边框 ,text-indent：首行缩进*/--%>
<%--			.cart-table{--%>
<%--				width: 100%;--%>
<%--				margin: 0 auto;--%>
<%--				border-color: collapse;--%>
<%--				font-size: 12px;font-family: Verdana,"Microsoft YaHei";--%>
<%--				color: #333333;--%>
<%--				}--%>
<%--			--%>
<%--			.cart-table th{--%>
<%--				border-bottom: 2px solid #EEA236 ;--%>
<%--				font-weight: normal;height: 35px;--%>
<%--				line-height:1.4375rem ;}--%>
<%--			.cart-item{--%>
<%--				background-color: floralwhite;--%>
<%--				border-bottom: 1px dotted  #E38D13;--%>
<%--				}--%>
<%--			.cart-item td{--%>
<%--				height:55px;--%>
<%--				text-align: center;--%>
<%--				 }--%>
<%--			.cart-item .cart-txt-left{--%>
<%--				text-align:left;--%>
<%--				}--%>
<%--			.cart-name{--%>
<%--				color: #D58512;--%>
<%--				font-weight: bold;--%>
<%--				font-size: 15px;--%>
<%--				}--%>
<%--			--%>
<%--			.cart-raduce:hover,.cart-add:hover{--%>
<%--				background-color: #FF9900;--%>
<%--			}--%>
<%--			.cart-num--%>
<%--			{color: #FF3334;--%>
<%--				font-weight: bold;--%>
<%--				--%>
<%--			}--%>
<%--			.cart-del,.cart-all{--%>
<%--				font-size: 15px;--%>
<%--				color:  #000000;--%>
<%--				--%>
<%--				}--%>
<%--			.cart-del:hover,.cart-all:hover{--%>
<%--				text-decoration: underline;--%>
<%--				cursor: pointer;--%>
<%--				}--%>
<%--			.cart-bottom{--%>
<%--				height: 55px;--%>
<%--				text-align: right;--%>
<%--				}--%>
<%--			.cart-bottom .cart-all{--%>
<%--				position:relative;--%>
<%--			--%>
<%--				top:1px;}--%>
<%--			--%>
<%--			--%>
<%--			.cart-all-del{--%>
<%--				color:  #000000;--%>
<%--				font-size: 18px;--%>
<%--				}--%>
<%--			   .cart-all-del:hover{--%>
<%--				text-decoration: underline;--%>
<%--				cursor: pointer;--%>
<%--				}--%>
<%--			.cart-intro{--%>
<%--				font-size: 15px;--%>
<%--			}--%>
<%--			--%>
<%--			.cart-add-1{--%>
<%--				color:  #000000;--%>
<%--				font-size: 18px;--%>
<%--			}--%>
<%--			.cart-add-1:hover{--%>
<%--				text-decoration: underline;--%>
<%--				cursor: pointer;--%>
<%--				}--%>
<%--			--%>
<%--		</style>--%>
<%--	</head>--%>
<%--	<body>--%>
<%--		<div class="container">--%>
<%--		 <div class="row clearfix">--%>
<%--				<div class="col-md-6 column">--%>
<%--					<div class="row clearfix">--%>
<%--						<div class="col-md-6 column">--%>
<%--							<img alt="140x140" src="bootstrap/img/img/logo.jpg" width="330px" style="margin-left: 50px;"/>--%>
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
<%--							<ul class="nav nav-tabs" style="font-size: 16px; margin-left: 80px; margin-right: 100px;">--%>
<%--								--%>
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

<%--<div class="container">--%>
<%--	<div class="row clearfix">--%>
<%--		<div class="col-md-1 column">--%>
<%--			&emsp;--%>
<%--		</div>--%>
<%--		<div class="col-md-10 column">--%>
<%--			<form action="foodServlet" method="get">--%>
<%--				<input type="hidden" name="pageNo" value="${param.pageNo}">--%>
<%--				<input type="hidden" name="action" value="${empty requestScope.food?"add":"update"}" />--%>
<%--				<input type="hidden" name="id" value="${requestScope.food.id}" />--%>

<%--				<table class="cart-table" style="margin-top: 60px;">--%>
<%--					<tr>--%>
<%--						<th width="140px"><span class="cart-all" style="font-size: 16px;">&nbsp;菜品名称</span></th>--%>
<%--						<th style="font-size: 16px;">&emsp;&emsp;&emsp;&emsp;&emsp;菜品简介</th>--%>
<%--						<th width="120"style="font-size: 16px;">&emsp;&emsp;&nbsp;&nbsp;单价</th>--%>

<%--						<th width="120" style="font-size: 16px;">&nbsp;菜品类</th>--%>
<%--						<th width="120" style="font-size: 16px;">&emsp;&emsp;&nbsp;&nbsp;上传图片</th>--%>
<%--					</tr>--%>
<%--					<tr class="cart-item">--%>
<%--						<td class="cart-txt-left">--%>
<%--							<input  class="cart-name" style="width: 130px;" name="foodname" value="${food.foodname}"/>--%>
<%--						</td>--%>
<%--						<td style="margin-left: 20px;">--%>
<%--							<input class="cart-intro" style="width: 300px;" name="foodinfo" value="${food.foodinfo}"/>--%>
<%--						</td>--%>
<%--						<td >--%>
<%--							<input class="cart-price" style="width: 50px;"  name="price" value="${food.price}"/>--%>
<%--						</td>--%>
<%--						<td class="cart-txt-left">--%>
<%--							<div class="btn-group">--%>
<%--								<select name="catelog">--%>
<%--									<c:forEach items="${sessionScope.catelog}" var="catelog">--%>
<%--										<option>${catelog.catelogName}</option>--%>
<%--									</c:forEach>--%>
<%--								</select>--%>
<%--							</div>--%>

<%--						<td align="right">--%>
<%--							<input class="cart-name"  type="file" id="imgpatn" />--%>
<%--						</td>--%>
<%--						<td align="right">--%>
<%--							<input type="submit" value="提交">--%>
<%--						</td>--%>
<%--					</tr>--%>

<%--				</table>--%>

<%--			</form>--%>

<%--		</div>--%>
<%--		<div class="col-md-1 column">--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>
<%--<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />--%>
<%--<div>--%>
<%--  	<h6 align="center">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>--%>
<%--  </div>--%>
<%--	</body>--%>
<%--</html>--%>
