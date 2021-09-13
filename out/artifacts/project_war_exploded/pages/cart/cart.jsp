<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<head>
		<title>购物车</title>
		<%@include file="/pages/common/head.jsp"%>

		<script>
			$(function (){
				$("a.getorder").click(function (){
					if(${sessionScope.cart.totalPrice==0}){
						alert("您的购物车还没有物品！");
						return false;
					}
				})
				$("button.plusbtn").click(function (){
					var id=$(this).attr("foodId");
					var count = this.value;
					count++;
					location.href="http://localhost:8080/project/cartServlet?action=updateCount&count="+count+"&id="+id;
				})
				$("button.redbtn").click(function (){
					var id=$(this).attr("foodId");
					var count = this.value;
					count--;
					location.href="http://localhost:8080/project/cartServlet?action=updateCount&count="+count+"&id="+id;
				})



				$("a.deleteItem").click(function (){
					if(!confirm("你确定要删除【"+$(this).parent().parent().parent().find("td:first").find("span:first").text()+"】吗？")){
						return false;
					}
				})
				$("#clearCart").click(function (){
					if(!confirm("你确定要清空购物车吗？")){
						return false;
					}

				})
				$(".updateCount").change(function(){
					var name=$(this).parent().parent().find("td:first").text();
					var id=$(this).attr("foodId");
					var count = this.value;
					if(confirm("你确定要修改【" +name + "】数量为：" + count + "吗？")){
						location.href="http://localhost:8080/project/cartServlet?action=updateCount&count="+count+"&id="+id;
					}else{
						this.value=this.defaultValue;
					}
				})
			})
		</script>


		 <style type="text/css">
			 a:hover{
				 text-decoration: none;
			 }
			.cart{
				margin-top: 60px;
				margin-left: 8%;
				width: 800px;
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
				/*font-weight: 600px;*/
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
		<body bgcolor="#FAF2CC">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-6 column">
					<img src="bootstrap/img/img/logo.jpg"width="370px"style="margin: 10px;" />
				</div>
				<div class="col-md-6 column">
					<p class="font1">
						欢迎 <span style="color: tomato;font-weight: bold">${sessionScope.user.nickname}</span> 光临
					</p>
					<div class="container1">
						<ul class="menu">
							<li><a href="index.jsp">返回</a></li>
							<li><a href="userServlet?action=logout">注销</a></li>
							<li><a href="orderServlet?action=pageForUser">订单</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<div class="container">
			<div class="col-md-1 column">
			</div>
			<div class="col-md-10 column">
					<div class="cart" >
			<div class="cart-title" style="margin-top: 5px;">我的购物车</div>
			
			<table class="cart-table">
				<tr>
					<th style="font-size: 16px;">&emsp;商品名</th>
					<th style="font-size: 16px;">商品信息</th>
					<th width="120" style="font-size: 16px;">&emsp;&emsp;&emsp;单价</th>
					<th width="100" style="font-size: 16px;">&emsp;&emsp;数量</th>
					<th width="120" style="font-size: 16px;">&emsp;&emsp;&emsp;小计</th>
					<th width="80" style="font-size: 16px;">&emsp;&nbsp;操作</th>
				</tr>

				<c:if test="${empty sessionScope.cart||sessionScope.cart.totalPrice==0}">
				<tr class="cart-item">
					<td colspan="6">
						您的购物车为空!<a href="index.jsp" style="color: #0e9aef">浏览商品</a>
					</td>
				</tr>
				</c:if>
				<c:if test="${not empty sessionScope.cart&&sessionScope.cart.totalPrice>0}">
					<c:forEach items="${sessionScope.cart.items}" var="entry">
						<tr class="cart-item">
							<td class="cart-txt-left"><span class="cart-name">&emsp;${entry.value.foodname}</span></td>
							<td class="cart-txt-left"><span style="font-size:15px ;">${entry.value.foodinfo}</span></td>
							<td><span class="cart-price" style="font-size: 15px;">${entry.value.price}</span></td>
							<td><button foodId="${entry.value.id}" value="${entry.value.count}"  class="redbtn">-</button>
								<input class="updateCount"
									   foodId="${entry.value.id}"
									   type="text" value="${entry.value.count}" style="width: 30px; align-content: center"/>
								<button foodId="${entry.value.id}" value="${entry.value.count}"  class="plusbtn">+</button></td>
							<td><span class="cart-subtotal" style="font-size: 15px;">${entry.value.totalPrice}</span></td>
							<td><span class="cart-del"><a href="cartServlet?action=deleteItem&id=${entry.value.id}" class="deleteItem"style="color:black; text-decoration: none; ">删除</a></span></td>
						</tr>
					</c:forEach>

					<tr class="cart-bottom">
						<td colspan="6">
							<span class="cart-bottom-span">已选择<span class="cart-total-num">${sessionScope.cart.totalCount}</span>件商品</span>
							<span class="cart-bottom-span">总计：<span class="cart-total-price">${sessionScope.cart.totalPrice}</span></span>
							&emsp;<span class="cart-all-del"><a id="clearCart" href="cartServlet?action=clear" style="color: #000000;">清空购物车</a></span>
							<span class="cart-bottom-btn"><a href="orderServlet?action=createOrder" class="getorder"style="color: white">提交订单</a></span>

						</td>
					</tr>
				</c:if>
         </table>
		</div>
	</div>
			<div class="col-md-1 column">
			</div>
</div>
		<div>
			<h6  style="margin-left: 40%;bottom: 0px;left:0px">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>
		</div>
	</body>
</html>
