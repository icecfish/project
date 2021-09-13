<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商品详情</title>
		<%@include file="/pages/common/head.jsp"%>

		<script>
			$(function (){

				$("button.addToCart").click(function (){
					if(${not empty sessionScope.user}) {
						var foodId = $(this).attr("foodId");
						// location.href = "cartServlet?action=addItem&id=" + foodId;
						$.getJSON("http://localhost:8080/project/cartServlet","action=ajaxAddItem&id="+foodId,function (data) {
							$("#cartTotalCount").html("你的购物车里有 "+data.totalCount+" 件商品");
							$("#wnzb").html("你刚刚将")
							$("#cartLastName").html(data.lastName+" 加入了购物车");
							$("#totalCountPrice").html("当前总计 "+ data.totalCountPrice +" 元");
						})
					}
					if(${empty sessionScope.user}) {
						var foodId = $(this).attr("foodId");
						location.href = "pages/user/login.jsp" ;
					}
				})
			})

		</script>

		<style>
		body{
		    font-family: 'Microsoft YaHei';
		    color:#666;
		    font-size:12px;
		}
		.sticky{

			font-weight:550;
			font-size: 16px;
			color: #D58512;
			line-height: 50px;
			z-index: 9999;
		}
		.center_con{
			width: 1200px;
			height: 350px;
			margin: 0 auto;
			/*background: yellow;*/
		}
		.center_con .main_menu{
			width:400px;
		    height:400px;
		    overflow:hidden;
		}
		.goods_detail_list{
			margin-right: 250px;
		    width:500px;
		    height:350px;
			margin-top: 0px;
		}
		.goods_detail_list h3{
		    font-size:27px;
		    line-height:40px;
		    color: #FF6600;
		    font-weight:  300;
		}
		.goods_detail_list p{
			font-size: 16px;
		    color:#666;
		    line-height:30px;
		}
		.prize_bar{
			width: 500px;
		    height:72px;
		    background-color:#fff5f5;
		    line-height:72px;
		}
		.prize_bar .show_prize{
		    font-size:20px;
		    color:#FE8502;
		    padding-left:20px
		}
		.prize_bar .show_pirze em{
		    font-style:normal;
		    font-size:36px;
		    padding-left:10px
		}
		.prize_bar .show_unit{
		    padding-left: 150px;
		}
		
		.total{
		    height: 35px;
		    line-height: 35px;
		    margin-top: 25px;
		    /*background: yellow;*/
		}
		.total em{
		    font-style:normal;
		    color:#ff3e3e;
		    font-size:18px
		}
		.operate_btn{
		    height:40px;
		    margin-top:35px;
		    font-size:0;
		    position:relative;
		}
		.operate_btn .operate_btn .add_cart{
		    display:inline-block;
		    width:178px;
		    height:38px;
		    border:1px solid #c40000;
		    font-size:14px;
		    color:#c40000;
		    line-height:38px;
		    text-align:center;
		    background-color:#ffeded;
		}
		.operate_btn .add_cart{
		    background-color:#c40000;
		    color:#fff;
		    margin-left:10px;
		    position:relative;
		    z-index:10;
		}
		.cart-bottom-btn{
				color: #FFF;
				font-size: 18px;
				font-weight: bold;
				cursor: pointer;
				background: #FE8502;
			    border: 1px solid #FF6633;
			    border-radius: 5px 5px 5px 5px;/*圆角*/
			    padding: 10px;
			    }
	    body,p,h1,h2,h3,h4,h5,h6,ul,dl,dt,form,input{
		  margin:0;
		  padding:0;
		}
		
		ul{
		  list-style:none;
		}
		a{
		  text-decoration:none;
		}
		
		em{
		  font-style:normal;
		}
		
		img{
		  border:0px;
		}
		
		h1,h2,h3,h4,h5,h6{
		  font-size:100%;
		}
		.clearfix:before,.clearfix:after{
		  content:"";
		  display:table;
		}
		.clearfix:after{
		  clear:both;
		}
		.clearfix{
		  zoom:1;
		}
		
		
		.fl{
		  float:left;
		}
		.fr{
		  float:right;
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
		.box1{
			text-align: center ;
			height: 300px;
			width: 200px;
			background-color:white;
			position: fixed;
			top: 190px;
			z-index: 9998;
			overflow: auto;
			margin-left: 0px;
			border: #bfa solid 1px;
		}
</style>
	</head>
<body>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-6 column">
			<img src="bootstrap/img/img/logo1.jpg"width="370px"style="margin: 10px;" />
		</div>
		<div class="col-md-6 column">
			<p class="font1">

			</p>
			<div class="container1">
				<ul class="menu">
					<li><a href="pages/cart/cart.jsp">购物车</a></li>
					<li><a href="userServlet?action=logout">注销</a></li>
					<li><a href="clientServlet?action=page&pageNo=${requestScope.pageNo}">返回</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div style="margin-left: 10px;" class="box1">
	<c:if test="${empty sessionScope.user}">
		<p class="sticky">你还没有登录</p>
		<p class="sticky">点击下方登录</p>
		<p style="font-size: 24px;font-weight: bold;color:  darkred;"><a href="pages/user/login.jsp">登录</a></p>
	</c:if>
	<c:if test="${not empty sessionScope.user}">
		<p style="font-size: 24px;font-weight: bold;color:  darkred;">欢迎 ${sessionScope.user.nickname} 光临</p>
		<c:if test="${empty sessionScope.cart}">
			<p class="sticky" id="cartTotalCount"> </p>
			<p class="sticky" id="wnzb"> </p>
			<p class="sticky" id="cartLastName">你的购物车空无一物！</p>
			<p class="sticky" id="totalCountPrice">美食在等你！</p>
		</c:if>
		<c:if test="${not empty sessionScope.cart}">
			<p class="sticky"  id="cartTotalCount"> 你的购物车里有 ${sessionScope.cart.totalCount} 件商品 </p>
			<c:if test="${sessionScope.cart.totalPrice==0}">
				<p class="sticky" id="wnzb"> </p>
				<p class="sticky" id="cartLastName">你的购物车空无一物！</p>
			</c:if>
			<c:if test="${sessionScope.cart.totalPrice>0}">
				<p class="sticky"  id="wnzb">你刚刚将</p>
				<p class="sticky" id="cartLastName">${sessionScope.lastName} 加入了购物车</p>
			</c:if>
			<p class="sticky" id="totalCountPrice">当前总计 ${sessionScope.cart.totalPrice} 元</p>
		</c:if>

	</c:if>

</div>


	<!-- 商品信息栏 -->
	<br /><br /><br /><br />
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-10 column">
		  <div class="center_con clearfix">
		  <div class="main_menu fl"><img src="${requestScope.food.imgPath}" width="330px" ></div>
		      <div class="goods_detail_list fr" style="margin-left: 20px;">
		      	<br /><br />
			           <h3>${requestScope.food.foodname}</h3>
				  		<c:forEach items="${sessionScope.catelog}" var="catelog">
					  <c:if test="${catelog.id==requestScope.food.catelogId}">
						  <p >菜类： ${catelog.catelogName}</p>
						  <p >菜类信息： ${catelog.catelogInfo}</p>
					  </c:if>
				  		</c:forEach>
			           <p >菜品信息： ${requestScope.food.foodinfo}</p>
			           <div class="prize_bar">
				  <div class="show_prize fl">优惠价 <em>${requestScope.food.price} ￥</em></div>
			        </div>
			<br /><br /><br />
			<button type="button" foodId="${food.id}" class="addToCart " style="background: transparent ;border: 0px solid transparent;"><div class="cart-bottom-btn">加入购物车</div></button>
		</div>
		</div>

	</div>
	</div>
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

	</body>
</html>
