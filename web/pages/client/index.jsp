<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/8/2
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <!-- 声明文档的编码集 -->
  <meta charset="utf-8">
  <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

  <title>点餐首页</title>
  <%@include file="/pages/common/head.jsp"%>
  <script>


      $(function (){
      $("button.addToCart").click(function (){
        if(${not empty sessionScope.user}) {
          var foodId = $(this).attr("foodId");
          // location.href = "cartServlet?action=addItem&id=" + foodId;
          $.getJSON("http://localhost:8080/project/cartServlet","action=ajaxAddItem&id="+foodId,function (data) {
            $("#cartTotalCount").text("你的购物车里有 "+data.totalCount+" 件商品");
            $("#wnzb").text("你刚刚将")
            $("#cartLastName").text(data.lastName+" 加入了购物车");
            $("#totalCountPrice").text("当前总计 "+ data.totalCountPrice +" 元");
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
      border:#FAF2CC solid 2px ;
    }
    .sticky{

      font-weight:550;
      font-size: 16px;
      color: #D58512;
      line-height: 50px;
      z-index: 9999;
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
    .cart-bottom-btn{
      color: #FFF;
      font-size: 14px;
      /*font-weight: 600px;*/
      font-weight: normal;
      cursor: pointer;
      margin: 0 20px;
      background: #ecba52;
      border: 1px solid  white;
      border-radius: 5px 5px 5px 5px;padding: 6px 12px;
    }
  </style>


</head>

<body>


<!-- logo -->
<!--
    1.lg 超大屏 4/4/4
    2.md 中屏   5/4/3
    3.sm 小屏幕 6/6    hidden-sm hidden-xs 只显示logo和超链接
    4.xs 超小屏 12/12  hidden-sm hidden-xs 只显示logo和超链接
-->
<%--<div class="container">--%>
<%--  <div class="row clearfix">--%>
<%--    <div class="col-md-6 column">--%>
<%--      <div class="row clearfix">--%>
<%--        <div class="col-md-6 column">--%>
<%--          <img alt="140x140" src="bootstrap/img/img/logo.jpg" width="330px" style="margin-left: 50px;"/>--%>
<%--        </div>--%>
<%--        <div class="col-md-6 column">--%>
<%--          <p>--%>
<%--            <em></em>--%>
<%--          </p>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>



<%--    <div class="col-md-6 column">--%>
<%--      <div class="row clearfix">--%>
<%--        <div class="col-md-6 column">--%>

<%--        </div>--%>
<%--        <br/>--%>
<%--        <c:if test="${not empty sessionScope.user}">--%>
<%--          <br />--%>
<%--          <h4 style="margin-left: 60px;font-size: 25px;">--%>
<%--            欢迎 ${sessionScope.user.nickname} 光临 &emsp;&emsp;&emsp;--%>
<%--            <a href="userServlet?action=logout">注销</a>&emsp;--%>
<%--            <a href="pages/cart/cart.jsp">购物车</a>&emsp;--%>
<%--            <a href="userServlet?action=logout">订单</a>--%>
<%--          </h4>--%>
<%--        </c:if>--%>
<%--          <c:if test="${empty sessionScope.user}">--%>
<%--            <div class="col-md-6 column">--%>
<%--           <ul class="nav nav-tabs" style="font-size: 16px; margin-right: 40px;">--%>
<%--             <li >--%>
<%--               <a href="pages/user/login.jsp">登录</a>--%>
<%--             </li >--%>
<%--             <li>--%>
<%--               <a href="pages/user/regist.jsp">注册</a>--%>
<%--             </li>--%>
<%--             <li >--%>
<%--               <a href="pages/admin/adminlogin.jsp">后台</a>--%>
<%--             </li>--%>
<%--           </ul>--%>
<%--         </div>--%>
<%--          </c:if>--%>

<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>


<div class="container">
  <div class="row clearfix">
    <div class="col-md-6 column">
      <img src="bootstrap/img/img/logo.jpg"width="370px"style="margin: 10px;margin-left: 20px;" />
    </div>
    <div class="col-md-6 column">
      <div class="container1">
        <ul class="menu">
          <c:if test="${not empty sessionScope.user}">
            <li><a href="userServlet?action=logout">注销</a></li>
            <li><a href="orderServlet?action=pageForUser">订单</a></li>
            <li><a href="pages/cart/cart.jsp">购物车</a></li>
          </c:if>
          <c:if test="${empty sessionScope.user}">
            <li><a href="pages/admin/adminlogin.jsp">后台</a></li>
            <li><a href="pages/user/regist.jsp">注册</a></li>
            <li><a href="pages/user/login.jsp">登录</a></li>
          </c:if>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- 导航条 -->

<br />
<br />

<div class="container">
  <div class="row clearfix">
    <div class="col-md-1 column">

    </div>
    <div class="col-md-10 column">
      <ul class="nav nav-tabs" style="background-color:  #FAF2CC;">
        <li class="active" >
          <a href="index.jsp" style="color: #000000; font-size: 16px;" >首页</a>
        </li>
        <li class="active" >
          <form action="clientServlet?action=pageForSearch" method="post">
            <input style="margin-left: 615px;height:29px;margin-top: 8px; border-radius: 5px 5px 5px 5px;border:solid  1px #ecba52; " type="text" name="search" placeholder="请输入菜品名" value="${requestScope.search}">
            &nbsp;&nbsp;<input  style="float: right;margin-top:8px;background-color: #ecba52;height:29px;width: 60px;color: white;border:solid 0px;  border-radius: 5px 5px 5px 5px; " type="submit" value="搜索">
          </form>
        </li>
      </ul>
    </div>
    <div class="col-md-1 column">
    </div>
  </div>
</div>
</div><br />

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

&emsp;<div class="container">
  <div class="row clearfix">
    <div class="col-md-1 column">
    </div>
    <div class="col-md-10 column">
      <div class="row clearfix">


        <c:forEach items="${requestScope.page.items}" var="food">
          <div class="col-md-3 column">
            <div style="border: lightyellow solid 10px">
              <a href="foodServlet?action=getFood1&id=${food.id}&pageNo=${requestScope.page.pageNo}">
              <img width="194px" src="${food.imgPath}" style="height: 250px;"/>
              <br /><br />
              <p align="center">菜名：${food.foodname}</p>
              <p align="center">原价：${food.price}元</p>
              <p align="center">${food.foodinfo}</p>
              </a>
              <p align="center">
                <button type="button" foodId="${food.id}" class="addToCart" style="background: transparent ;border: 0px solid transparent;"><div class="cart-bottom-btn">加入购物车</div></button>
              </p>

            </div>

          </div>

        </c:forEach>

      </div>
    </div>
    <div class="col-md-1 column">
      <img src="bootstrap/img/img/IMG_20210805_194132.jpg"width="180px">
    </div>
  </div>
</div>

<div class="container">
  <div class="row clearfix">

  </div>
</div>

<div class="row clearfix">
  <div class="col-md-4 column">
  </div>
  <div class="col-md-4 column">
    <c:if test="${(empty requestScope.search)}">
      <div id="page_nav">
        <c:if test="${requestScope.page.pageNo > 1}">
          <a href="clientServlet?action=page&pageNo=1">首页</a>
          <a href="clientServlet?action=page&pageNo=${requestScope.page.pageNo-1}">上一页</a>
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
            <a href="clientServlet?action=page&pageNo=${i}">${i}</a>
          </c:if>

        </c:forEach>

        <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
          <a href="clientServlet?action=page&pageNo=${requestScope.page.pageNo+1}">下一页</a>
          <a href="clientServlet?action=page&pageNo=${requestScope.page.pageTotal}">末页</a>
        </c:if>

        共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录 到第<input style="width: 30px" value="${requestScope.page.pageNo}" name="pn" id="pn_input"/>页
        <input id="searchPageBtn"  type="button" value="确定">
        <script>
          $(function (){
            $("#searchPageBtn").click(function (){
              var pageNo=$("#pn_input").val();
              if(pageNo > ${requestScope.page.pageTotal}){
                location.href="http://localhost:8080/project/clientServlet?action=page&pageNo=${requestScope.page.pageTotal}";
              }else if(pageNo< 1){
                location.href="http://localhost:8080/project/clientServlet?action=page&pageNo=1";
              }else
                location.href="http://localhost:8080/project/clientServlet?action=page&pageNo="+pageNo;
            })
          })
        </script>
      </div>
    </c:if>
    <c:if test="${not empty requestScope.search}">
      <div id="page_nav">
        <c:if test="${requestScope.page.pageNo > 1}">
          <a href="clientServlet?action=pageForSearch&pageNo=1&search=${requestScope.search}">首页</a>
          <a href="clientServlet?action=pageForSearch&pageNo=${requestScope.page.pageNo-1}&search=${requestScope.search}">上一页</a>
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
            <a href="clientServlet?action=pageForSearch&pageNo=${i}&search=${requestScope.search}">${i}</a>
          </c:if>

        </c:forEach>

        <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
          <a href="clientServlet?action=pageForSearch&pageNo=${requestScope.page.pageNo+1}&search=${requestScope.search}">下一页</a>
          <a href="clientServlet?action=pageForSearch&pageNo=${requestScope.page.pageTotal}&search=${requestScope.search}">末页</a>
        </c:if>

        共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录 到第<input style="width: 30px" value="${requestScope.page.pageNo}" name="pn" id="pn_input"/>页
        <input id="searchPageBtn"  type="button" value="确定">
        <script>
          $(function (){
            $("#searchPageBtn").click(function (){
              var pageNo=$("#pn_input").val();
              if(pageNo > ${requestScope.page.pageTotal}){
                location.href="http://localhost:8080/project/clientServlet?action=pageForSearch&pageNo=${requestScope.page.pageTotal}&search=${requestScope.search}";
              }else if(pageNo< 1){
                location.href="http://localhost:8080/project/clientServlet?action=pageForSearch&pageNo=1&search=${requestScope.search}";
              }else
                location.href="http://localhost:8080/project/clientServlet?action=pageForSearch&search=${requestScope.search}&pageNo="+pageNo;
            })
          })
        </script>
      </div>
    </c:if>
  </div>
  <div class="col-md-4 column">
  </div>
</div>


<div>
  <hr />
</div>
<div>
  <h6  style="margin-left: 40%;bottom: 0px;left:0px">Copyright © 2020-2021 饿了吧餐厅 版权所有</h6>
</div>

</body>

</html>