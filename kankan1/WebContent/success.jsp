<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet"  type="text/css" href="AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/success.css"/>
<script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>



</head>

<body>


<!--顶部导航条 -->
<div class="am-container header">
  <ul class="message-l">
    <div class="topMessage">
     <div class="menu-hd">
      <%
									if (session.getAttribute("id") != null) {
								%>
								<span target="_top" class="h">欢迎来到TOP商城</span>
								<%
									} else {
								%>

								<a href="login.jsp" target="_top" class="h">亲，请登录</a> <a
									href="register.jsp" target="_top">免费注册</a>
								<%
									}
								%>
     </div></div>
  </ul>
  <ul class="message-r">
    <div class="topMessage home"><div class="menu-hd"><a href="index.html" target="_top" class="h">商城首页</a></div></div>
   
  </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
	<div class="logo"></div>
    <div class="logoBig">
      <li><a href="index.html"></a></li>
    </div>
    
    <div class="search-bar pr">
        <a name="index_none_header_sysc" href="#"></a>       
        <form action="search.html" method="post">
					<input id="searchInput" name="keywords" type="text"
						placeholder="搜索" /> <input id="ai-topsearch"
						class="submit am-btn" value="搜索" index="1" type="submit" />
				</form>
    </div>     
</div>

<div class="clear"></div>



<div class="take-delivery">
 <div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em>¥179</em></li>
      
             请认真核对您的收货信息，如有错误请联系客服
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
  </div>
</div>


	<div class="footer ">
				<div class="footer-hd ">
					<p>
						<a href="index.html">商城首页</a> <b>|</b> <a href="#">支付宝</a> <b>|</b>
						<a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd ">
					<p>
						<a href="#">合作伙伴</a> <a href="#">联系我们</a> <a href="#">网站地图</a> <em>©
							2021-2021 www.www.com 版权所有 TOP工作室</em>
					</p>
				</div>
			</div>


</body>
</html>

