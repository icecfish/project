<%--
  Created by IntelliJ IDEA.
  User: ysj
  Date: 2021/8/1
  Time: 5:08 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            +"://"
            +request.getServerName()
            +":"
            +request.getServerPort()
            +request.getContextPath()
            +"/";
%>
<base href="http://localhost:8080/project/">
<%--<link type="text/css" rel="stylesheet" href="static/css/style.css" >--%>
<%--<script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>--%>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"/>
<script src="bootstrap/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script src="bootstrap/js/jquery-1.11.0.min.js"></script>
<!-- 2.引入validate校验库 -->
<script src="bootstrap/js/jquery.validate.min.js"></script>