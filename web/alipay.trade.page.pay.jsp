<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.alipay.api.AlipayClient" %>
<%@ page import="com.alipay.api.DefaultAlipayClient" %>
<%@ page import="com.alipay.api.request.AlipayTradePagePayRequest" %>
<%@ page import="com.igeek.config.AlipayConfig" %>
<%@ page import="com.igeek.pojo.Order" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>付款</title>
</head>
<%
	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	
	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	//请求完成后，执行的回调
	alipayRequest.setReturnUrl(AlipayConfig.return_url);
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
	Order order=(Order)session.getAttribute("order");
	//商户订单号，商户网站订单系统中唯一订单号，必填
	String out_trade_no = order.getOrderId();
	//付款金额，必填
	String total_amount =order.getPrice() +"";
	//订单名称，必填
	String subject = "这是我的订单";
	//商品描述，可空
	//String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");

	///*+ "\"body\":\""+ body +"\"," */
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"total_amount\":\""+ total_amount +"\"," 
			+ "\"subject\":\""+ subject +"\","
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	
	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
	//		+ "\"total_amount\":\""+ total_amount +"\"," 
	//		+ "\"subject\":\""+ subject +"\"," 
	//		+ "\"body\":\""+ body +"\"," 
	//		+ "\"timeout_express\":\"10m\"," 
	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
	
	//请求
	String result = alipayClient.pageExecute(alipayRequest).getBody();
	
	//输出
	out.println(result);
%>
<body>
</body>
</html>