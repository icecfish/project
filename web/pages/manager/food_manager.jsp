<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>商品管理</title>
	<%@include file="/pages/common/head.jsp"%>

	<script>
		$(function (){
			$("a.deleteClass").click(function(){
				return confirm("你确定要删除["+$(this).parent().parent().parent().find("td:first").find("span:first").text()+"]吗？")
			})
		})
	</script>


	<style>
		a:hover{
			text-decoration: none;
		}

		/* border-bottom底部边框 ,text-indent：首行缩进*/
		.cart-table{
			width: 100%;
			margin: 0 auto;
			border-color: black;
			font-size: 12px;
			font-family: Verdana,"Microsoft YaHei";
			color: #333333;
		}

		.cart-table th{
			border-bottom: 2px solid #EEA236 ;
			font-weight: normal;height: 60px;
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
			width:400px;
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
				后台管理界面
			</p>
			<div class="container1">
				<ul class="menu">
					<li><a href="userServlet?action=logout">注销</a></li>
					<li ><a href="foodServlet?action=page">菜品管理</a></li>
					<li><a href="orderServlet?action=page">订单管理</a></li>
					<li><a href="userServlet?action=getAll">会员管理</a></li>
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
<%--						管理员界面--%>
<%--					</h4>--%>
<%--				</div>--%>
<%--				<div class="col-md-6 column">--%>
<%--					<ul class="nav nav-tabs" style="font-size: 16px; margin-left: 80px; margin-right: 100px;">--%>

<%--						<li >--%>
<%--							<a href="foodServlet?action=page">菜品管理</a>--%>
<%--						</li>--%>
<%--						<li >--%>
<%--							<a href="orderServlet?action=page">订单管理</a>--%>
<%--						</li>--%>
<%--						<li >--%>
<%--							<a href="userServlet?action=logout">注销</a>--%>
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
			<table class="cart-table" style="margin-top: 20px;">
				<tr>
					<th width="140px"><span class="cart-all" style="font-size: 16px;font-weight: bolder">&nbsp;菜品名称</span></th>
					<th style="font-size: 16px;font-weight: bolder">菜品简介</th>
					<th style="font-size: 16px;font-weight: bolder">&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片</th>
					<th width="120"style="font-size: 16px;font-weight: bolder">&emsp;&emsp;&emsp;单价</th>

					<th width="120" style="font-size: 16px;font-weight: bolder">菜品种类</th>
					<th width="120" style="font-size: 16px;font-weight: bolder">&emsp;&emsp;&nbsp;&nbsp;操作</th>
				</tr>

				<c:forEach items="${requestScope.page.items}" var="food">
					<tr class="cart-item">

						<td class="cart-txt-left"><span class="cart-name">${food.foodname}</span></td>
						<td class="cart-txt-left"><span class="cart-intro">${food.foodinfo}</span></td>
						<td><span><img src="${food.imgPath}" width="55px"></span>
						</td>
						<td><span class="cart-price">${food.price}</span></td>

					<c:forEach items="${sessionScope.catelog}" var="catelog">
													<c:if test="${catelog.id==food.catelogId}">
														<td class="cart-txt-left"><span class="cart-name">${catelog.catelogName}</span></td>
													</c:if>
												</c:forEach>
<%--						<td class="cart-txt-left"><span class="cart-name">${food.catelogId}</span></td>--%>
						<td><span class="cart-del"><a href="foodServlet?action=getFood&id=${food.id}&pageNo=${requestScope.page.pageNo}" style="color:  #000000;">修改</a></span>
							<span class="cart-del "><a href="foodServlet?action=delete&id=${food.id}&pageNo=${requestScope.page.pageNo}" class="deleteClass" style="color: #000000;">删除</a></span>
						</td>
					</tr>
				</c:forEach>



				<tr class="cart-bottom">
					<td colspan="6">

						<span class="cart-add-1"><a href="pages/manager/food_edit.jsp?pageNo=${requestScope.page.pageTotal}" style="color: #000000;">添加菜品</a></span>&emsp;&nbsp;&nbsp;


					</td>
				</tr>
			</table>



		</div>
		<div class="col-md-1 column">
		</div>
	</div>
</div>
<div>

		<div style="margin-left: 550px">
			<div id="page_nav">
						<c:if test="${requestScope.page.pageNo > 1}">
							<a href="foodServlet?action=page&pageNo=1">首页</a>
							<a href="foodServlet?action=page&pageNo=${requestScope.page.pageNo-1}">上一页</a>
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
								<a href="foodServlet?action=page&pageNo=${i}">${i}</a>
							</c:if>
						</c:forEach>

						<c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
							<a href="foodServlet?action=page&pageNo=${requestScope.page.pageNo+1}">下一页</a>
							<a href="foodServlet?action=page&pageNo=${requestScope.page.pageTotal}">末页</a>
						</c:if>

						共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录 到第<input style="width: 25px;" value="${requestScope.page.pageNo}" name="pn" id="pn_input"/>页
						<input  id="searchPageBtn" style="width: 40px;" type="button" value="确定">
						<script>
							$(function (){
								$("#searchPageBtn").click(function (){
									var pageNo=$("#pn_input").val();
									if(pageNo > ${requestScope.page.pageTotal}){
										location.href="http://zcb1111.free.idcfengye.com/project/foodServlet?action=page&pageNo=${requestScope.page.pageTotal}";
									}else if(pageNo< 1){
										location.href="http://zcb1111.free.idcfengye.com/project/foodServlet?action=page&pageNo=1";
									}else
										location.href="http://zcb1111.free.idcfengye.com/project/foodServlet?action=page&pageNo="+pageNo;
								})
							})
						</script>
					</div>
		</div>
<div>
	<h6  style="margin-left: 40%;bottom: 0px;left:0px">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>
</div>
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

<%--		<script>--%>
<%--			$(function (){--%>
<%--				$("a.deleteClass").click(function(){--%>
<%--					return confirm("你确定要删除["+$(this).parent().parent().parent().find("td:first").find("span:first").text()+"]吗？")--%>
<%--				})--%>
<%--			})--%>
<%--		</script>--%>


<%--		<style>--%>
<%--		--%>
<%--			--%>
<%--			/* border-bottom底部边框 ,text-indent：首行缩进*/--%>
<%--			.cart-table{--%>
<%--				width: 100%;--%>
<%--				margin: 0 auto;--%>
<%--				border-color: black;--%>
<%--				font-size: 12px;--%>
<%--				font-family: Verdana,"Microsoft YaHei";--%>
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
<%--								欢迎光临--%>
<%--							</h4>--%>
<%--						</div>--%>
<%--						<div class="col-md-6 column">--%>
<%--							<ul class="nav nav-tabs" style="font-size: 16px; margin-left: 80px; margin-right: 100px;">--%>
<%--								--%>
<%--								<li >--%>
<%--									 <a href="index.jsp">返回</a>--%>
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
<%--			<table class="cart-table" style="margin-top: 60px;">--%>
<%--				<tr>--%>
<%--					<th width="140px"><span class="cart-all" style="font-size: 16px;">&nbsp;菜品名称</span></th>--%>
<%--					<th style="font-size: 16px;">菜品简介</th>--%>
<%--					<th width="120"style="font-size: 16px;">&emsp;&emsp;&emsp;单价</th>--%>
<%--					--%>
<%--					<th width="120" style="font-size: 16px;">菜品种类</th>--%>
<%--					<th width="120" style="font-size: 16px;">&emsp;&emsp;&nbsp;&nbsp;操作</th>--%>
<%--				</tr>--%>

<%--				<c:forEach items="${requestScope.page.items}" var="food">--%>
<%--					<tr class="cart-item">--%>
<%--						<td class="cart-txt-left"><span class="cart-name">${food.foodname}</span></td>--%>
<%--						<td class="cart-txt-left"><span class="cart-intro">${food.foodinfo}</span></td>--%>
<%--						<td><span class="cart-price">${food.price}</span></td>--%>
<%--						<c:forEach items="${sessionScope.catelog}" var="catelog">--%>
<%--							<c:if test="${catelog.id==food.catelogId}">--%>
<%--								<td class="cart-txt-left"><span class="cart-name">${catelog.catelogName}</span></td>--%>
<%--							</c:if>--%>
<%--						</c:forEach>--%>
<%--						<td><span class="cart-del"><a href="foodServlet?action=getFood&id=${food.id}&pageNo=${requestScope.page.pageNo}" style="color:  #000000;">修改</a></span>--%>
<%--							<span class="cart-del "><a href="foodServlet?action=delete&id=${food.id}&pageNo=${requestScope.page.pageNo}" class="deleteClass" style="color: #000000;">删除</a></span>--%>
<%--						</td>--%>
<%--					</tr>--%>
<%--				</c:forEach>--%>



<%--				<tr class="cart-bottom">--%>
<%--					<td colspan="6">--%>
<%--						--%>
<%--						<span class="cart-add-1"><a href="pages/manager/food_edit.jsp?pageNo=${requestScope.page.pageTotal}" style="color: #000000;">添加菜品</a></span>&emsp;&nbsp;&nbsp;--%>
<%--						--%>
<%--						--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--			</table>--%>



<%--		</div>--%>
<%--		<div class="col-md-1 column">--%>
<%--		</div>--%>

<%--		<div class="container">--%>
<%--			<div class="row clearfix">--%>
<%--				<div class="col-md-4 column">--%>
<%--				</div>--%>
<%--				<div class="col-md-4 column">--%>
<%--					<div id="page_nav">--%>
<%--						<c:if test="${requestScope.page.pageNo > 1}">--%>
<%--							<a href="foodServlet?action=page&pageNo=1">首页</a>--%>
<%--							<a href="foodServlet?action=page&pageNo=${requestScope.page.pageNo-1}">上一页</a>--%>
<%--						</c:if>--%>


<%--						<c:choose>--%>
<%--							<c:when test="${requestScope.page.pageTotal<=5}">--%>
<%--								<c:set var="begin" value="1"/>--%>
<%--								<c:set var="end" value="${requestScope.page.pageTotal}"/>--%>
<%--							</c:when>--%>

<%--							<c:when test="${requestScope.page.pageTotal>5}">--%>
<%--								<c:choose>--%>
<%--									<c:when test="${requestScope.page.pageNo<=3 }">--%>
<%--										<c:set var="begin" value="1"/>--%>
<%--										<c:set var="end" value="5"/>--%>
<%--									</c:when>--%>

<%--									<c:when test="${requestScope.page.pageNo>=requestScope.page.pageTotal-3}">--%>
<%--										<c:set var="begin" value="${requestScope.page.pageTotal-4}"/>--%>
<%--										<c:set var="end" value="${requestScope.page.pageTotal}"/>--%>
<%--									</c:when>--%>
<%--									<c:otherwise>--%>
<%--										<c:set var="begin" value="${requestScope.page.pageNo-2}"/>--%>
<%--										<c:set var="end" value="${requestScope.page.pageNo+2}"/>--%>

<%--									</c:otherwise>--%>
<%--								</c:choose>--%>
<%--							</c:when>--%>
<%--						</c:choose>--%>
<%--						<c:forEach begin="${begin}" end="${end}" var="i">--%>
<%--							<c:if test="${i==requestScope.page.pageNo}">--%>
<%--								【${i}】--%>
<%--							</c:if>--%>
<%--							<c:if test="${i!=requestScope.page.pageNo}">--%>
<%--								<a href="foodServlet?action=page&pageNo=${i}">${i}</a>--%>
<%--							</c:if>--%>

<%--						</c:forEach>--%>

<%--						<c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">--%>
<%--							<a href="foodServlet?action=page&pageNo=${requestScope.page.pageNo+1}">下一页</a>--%>
<%--							<a href="foodServlet?action=page&pageNo=${requestScope.page.pageTotal}">末页</a>--%>
<%--						</c:if>--%>

<%--						共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录 到第<input style="width: 30px;" value="${requestScope.page.pageNo}" name="pn" id="pn_input"/>页--%>
<%--						<input  id="searchPageBtn"  type="button" value="确定">--%>
<%--						<script>--%>
<%--							$(function (){--%>
<%--								$("#searchPageBtn").click(function (){--%>
<%--									var pageNo=$("#pn_input").val();--%>
<%--									if(pageNo > ${requestScope.page.pageTotal}){--%>
<%--										location.href="http://zcb1111.free.idcfengye.com/project/foodServlet?action=page&pageNo=${requestScope.page.pageTotal}";--%>
<%--									}else if(pageNo< 1){--%>
<%--										location.href="http://zcb1111.free.idcfengye.com/project/foodServlet?action=page&pageNo=1";--%>
<%--									}else--%>
<%--										location.href="http://zcb1111.free.idcfengye.com/project/foodServlet?action=page&pageNo="+pageNo;--%>
<%--								})--%>
<%--							})--%>
<%--						</script>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<div class="col-md-4 column">--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

<%--	</div>--%>
<%--</div>--%>

<%--	</body>--%>
<%--</html>--%>
