package com.igeek.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
//83e54aa844e43323  隧道ID
public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000117699722";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDHeNQWpJlzW/p15dqDlnGtsblO5ZIUY8hN/Wy95pLD8kv05EG8jZDHOdwlOwHN2WLUHxcr4oRly0fanb1s3LZAe4d+1l9BebnV2O9D5Z7uis1/Z23Y2M5a84CkfDyD6EspJ/pAFaUv99yDrvLZJN6wowZ2Gknfh0gukDmmcN0DgBA+iijUZ8GAFXj7ejQyVauy1s9v+LILHKKJWa4VJwgCRwbRgKlkyLAfhInc7YesHebfLUACG2FH0TNwIRRzQE2MfjsFVxdJDZc5bp+eHXHeM0kTVoYMCaUJy+bsmWrJlcJq8flkna2luZfhMvD6tLKbLkiEu++ll67mCpiYfp4lAgMBAAECggEBAIXqKojhDFwUHfvUynSZJcx0inHbUcz6iFlDkCOVjmaaXkAUlcVeTRpTT+Z2zOlDzkOWc9n0gupMJPsx9yAEtR5pUDfo955feFGHCGrO13pSGVA1QdvZAgCxhWXoOkBcTUleG3W2kmW3w4VsiIEbbZ2sdQQI9htpGR6ZmPqSvu4/djyBJJs+IJjsULj+w4b1PeGfGaU9RJ0zYr48IirAOaNn/TcMt1Adwy+m9DApvGFLHhLa8r6+l7BvHaUE4xO5CHnGRluTjbV4rTXceqdfvF9kg6ABqonXXg5iTUllg79hf9jbuV9oPf8mUahzvJ2Xo24HuXaH3qLVRjfn0EWSMEECgYEA4rjH/Q7F8C1fKYGL1A3injRad/bCZrfuFIn5zi6Xv6UqDmcNAtCTVbyqfJqv2LInsbFE4g6q/qgTmztOlk9f4pivXr5D8ob5+dDqcfnbCMGRfrwHVhyqnilm4e8Dm/z79qGCq47aDWUl5tx3JVaCnLXXXIyBeUs9gMxYcuCbggkCgYEA4TsxYNh6xt33LTKxbhu3n8DPbvFwa97fAVU/6tiF+IxlYhWbijQO4rRAQnHKLCv36RAEqJp3mPxOscuKSQab9PAdYqxIBpnYe94b4q15O8SX/3LklBi9q5kjy+/Hd6gugiWCJJBjIuc3I3l3fgnyeOqF2zYGLr8+oSLFwSTsEj0CgYEAi3Xwhsgkl7XBGK34TitwX7KCh9KBCGBRkc7Bm8NrUtaNBSj8huO4DYAtOtKIInqMEjCh15AAPP80eENF9w3CRId5MIVHFJNUhwesfwmbY0p2bgfJV33wsbNz9rxocvZuIup8j30iwiSa6ORqYcxSMYVlgSdoqSzQGz8XlSp2XckCgYAHqtMwf84WLQI4GKyvmePzXUXyeeeg1HJ1Aijt3rcY0fa1kxS7bLBBCW/SkzsVq92Bopj2AGQn4hbvuIUZnU771Jy7ei/tgZk8BkCew9cHsNaXzJp5bCowyELOs3fv29rRdWNryTqGuqZG3+Cwerg1Y45w+vLU7o+8PonK3G3o5QKBgQDZpzG2nPKD2ivVIt1ArdHBqJL0cHR1ysgmXB+8QsGHmrPnG8cwQOUtOdq7vZN8+x1tj2LkD002wfjurEkm9nmIn1ulsDcGKmaki37yI5gmXoTWW5XiXADfwXT6p/8n9OkK3OtLyz48NiTRdovuwaAQBL7J9PTKJ6iMQn/hy7Qxrg==";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAm/+MDnKm5K+OEzjPKlXAUFDoyzZbziXvvEm2i23215WHyDpXdSDcTGdtkplIazRA2pPVx8RPs7kyldR+T/O6cuPjPk7OcstkDi1BlKJcHV8azuHig9RqLgiH7h2ibdBywSpUtpt7BdRooHET8ONoP4Fz/J7cgr0cjvUyXAIXurg1Uw70s4vqGLMLTVSQ+K+9HRUUO2PUy80GTqNfryDYGxUZUhhVchr39k9Z+N7R495vuR7NJWfgLEUAXj5wk7I5BrOgK6fKHGp5TOoWZZHtmJQPUmmDfT2Qc2VOcAS11scApd30q3Kwjh96ImwPSnV3F5LIRH4jSws6uqhJ2rMhgQIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://zcb1111.free.idcfengye.com/project/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://zcb1111.free.idcfengye.com/project/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https:/openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

