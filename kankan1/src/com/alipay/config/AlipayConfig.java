package com.alipay.config;

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

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id ="2021000117615532";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCyc+tBaB85p2i054u2SnWCG1m19uJMTW5cg/vO3Kqrv+RALF7At4yCjEZruMHgJxesMD3t9m0flbSHfL3fEyhkpI+g1zCD9TQkv7Q45bixPcMiIvdUrMxGLqI3tucGQHsWjv6P2AvecsgWjaErV2o0lqpXDT9o6WWQNEyCU6BhNSW2EmUWnn2osefnxKgJEjJs3UYDBosS7xw6glivRZ0gGQV+kO4CAaHCrNF/PVxGDV+Bkz/PYwXFdcqiFOxB8hbQTglRBrN8986MEy+qS+S4JXO+wFsVHfzIt0DT6MvO5MsAt0S/Iga5w+LqiyUtyl96n040529FiIIOvPeHcf0hAgMBAAECggEAOGno3z55UJKZyUbBphkX2M+oppuroo9/6gNXYWflFHKPR7I/KhFcfBC4WmmH8MKq+yYtDcMvcCK1dXd71r+Jr3dOaHxeu/iSSWPJJ4uHvZBW1b3UDpKp6S3o3lAV7KYJw3HlC7gy2FnU4zxWzQrPalyO8QIhH5tZHiNKZJDnTJMltSmh8oHYYD+uckoFWpUsjO+/nIRhl4kLEqJ3zhgJ7dZY+66ABXhHeWjZpzdM3vzKoK4aZARMX/lfA+Dr4Jp+Mrj3afa4q0CTp8v/QI/glueXETq4sEjCybfmQYVdFQYJSDWcZOQx5vXnQpkl4QWUTqLjjy8WJGxgLomfi72MuQKBgQD7SkZRMhSXALk96htE8ow88AWuckX9+vKEYK5pfX4/yv1r1BDq76gQ34Yvfa1sOKBHxMeG+XxloImSsC/TNSRuWPXCrd5/sk85F9otTDCs9FDqHbXnxd1T7XU2fItbn3a3ZLXiZv6asHl0cDfZg3QsokavoTOGDzSrAHiuN1+ZdwKBgQC1zCkbk6Gp74Oj6XDZO4MHYN0ST4j+0rV2UdBxxR5UJAyp4JP7znXGvYi0cOgJrRM3jKVtu1nOoCssr2S+FokemmXdxPZl7ysuBrl6al/nvDdp9jp+PrOo5mUbsmMQtwPuaeB1kIzpRDuzMq2KdWJESiiZm9mbOYJRP9F+jVJEJwKBgGjPrwqYz9u30ovPhHY6kGGuX0BGq4jmzZaHWNfpHupuuUrrVe8X7Mq04JwYWGhGKhwlKG/UyZz928PSNvBqPvrDoiYELUSn08FlgHvaRoctFD7CC6hTcCBcb8I9KkcZ+QM/P1niSZmtt8roL3NLD/655K/Gld35o6cbeDp6ICa7AoGAZq2r3hZw7YEI0dAsW5VAOS+dTRU84+fwc6Zb25YgvhcqS9w62LLQVHKCPp+yfpyRSQOX/7UcURanq/JYLQCfa3h65lmzbPk7YyCLK7fe+QyWI7Pdb6ZMZK3UF2OWjj8/6i1EiEIfRDS0n06VM6l+2eEkszWSHxjJIMixsw9wkmsCgYEAj06Wpw5U5zM8PODO61FmnXnX3CX3DthhM4Zk+Ff0I/atrGrF8gWv28JRJ3bFOu/z1M5RrbcDaNXaqmS6TuDrt051qwsCZkIpxs2F/lAnVS+JIk1OyHAJGEh83Bzaf25XDR+rtSnPRFOhXd2/Mz14ZRw4aE0TttBsAWRdoQIuG5U=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhysirvNoY+AslE1UwHHvlyK1VmHuV+ROsp3ozXspq7DRHTVDTod6k9EAHEhkJ/EyCOvtsoJiYUyJHJJRpQn79/S8T+QLj26GhjcBJ0QCaYo7T2ZOwjlFR6BPab5F8E7qPMp8GoJumVsDwMsVvmT2rrJ5Zgr1IEjzjAhH0NUfoGcZAkeVB0ODaiNz0mCbX1wBr5R5F+Wd2QLlXoNpkASTg9rJoKT1FfWUKV4WFsRtmTfmXAaO7pndkKiRAcy/EUeo8M5pRaXUaC7PUAipd4D0yLny1OCP4ZFSZZX1YoYS9eBtiTtt1Rr2c3MBvbFktnvcXgD6/jairdwsqdgc7cZj5wIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://127.0.0.1:8080/kankanjavaweb/success.html";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://127.0.0.1:8080/kankanjavaweb/success.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
	
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

