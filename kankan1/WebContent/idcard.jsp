<%@page import="com.java.servise.customerServise"%>
<%@page import="com.java.pojo.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>实名认证</title>

<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="css/personal.css" rel="stylesheet" type="text/css">
<link href="css/stepstyle.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>

<!-- 用户信息 -->
<script type="text/javascript" src="basic/js/jquery.cookie.js"></script>
<script type="text/javascript" src="custom/userInfo.js"></script>

</head>

<body>

	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
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
							</div>
						</div>
					</ul>
					<ul class="message-r">
						<div class="topMessage home">
							<div class="menu-hd">
								<a href="index.html" target="_top" class="h">商城首页</a>
							</div>
						</div>
						<!-- <div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="userInfo.html" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="shopcart.html" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="collection.html" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div> -->
					</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logoBig">
						<li><a href="index.html"></a></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form action="search.html" method="post">
							<input id="searchInput" name="keywords" type="text"
								placeholder="搜索" autocomplete="off"> <input
								id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
								type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
			</div>
		</article>
	</header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="index.html">首页</a></li>
				<li class="qc"><a href="javascript:void(0)">闪购</a></li>
				<li class="qc"><a href="javascript:void(0)">限时抢</a></li>
				<li class="qc"><a href="javascript:void(0)">团购</a></li>
				<li class="qc last"><a href="javascript:void(0)">大包装</a></li>
			</ul>
			<div class="nav-extra">我的福利</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">实名认证</strong> / <small>Real&nbsp;authentication</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em></i>
							<p class="stage-name">实名认证</p>
						</span> <span class="step-2 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">2<em class="bg"></em></i>
							<p class="stage-name">完成</p>
						</span> <span class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<form action="idcard.html?item=1" class="am-form am-form-horizontal"
					method="post">
					<%
						List<Customer> list = (List<Customer>) request.getAttribute("list");
						if (list != null) {
							for (Customer customer : list) {
					%>
					<div class="am-form-group bind">
						<label for="user-info" class="am-form-label">账户名</label>

						<div class="am-form-content">
							<span id="user-info"><%=customer.getCustomer_name()%></span>
						</div>

					</div>
					<%
						if(customer.getCustomer_nickname()!=null||customer.getCustomer_sfz()!=null){
					%>
					<div class="am-form-group">
						<label for="user-name" class="am-form-label">真实姓名</label>
						<div class="am-form-content">
							<input type="text" name="name" id="user-name"
								placeholder="请输入您的真实姓名" value="<%=customer.getCustomer_nickname()%>">
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-IDcard" class="am-form-label">身份证号</label>
						<div class="am-form-content">
							<input type="text" name="IDcard" id="user-IDcard"
								placeholder="请输入您的身份证信息" value="<%=customer.getCustomer_sfz()%>">
						</div>
					</div>
					<%	
						}else{
					%>
					<div class="am-form-group">
						<label for="user-name" class="am-form-label">真实姓名</label>
						<div class="am-form-content">
							<input type="text" name="name" id="user-name"
								placeholder="请输入您的真实姓名" value="">
						</div>
					</div>
					<div class="am-form-group">
						<label for="user-IDcard" class="am-form-label">身份证号</label>
						<div class="am-form-content">
							<input type="text" name="IDcard" id="user-IDcard"
								placeholder="请输入您的身份证信息" value="">
						</div>
					</div>
					<%
						}
					%>
					<div class="info-btn">
						<input type="submit" value="保存修改" class="am-btn am-btn-danger">
					</div>
					<%
						}
						}
					%>
				</form>

			</div>
			<!--底部-->
			<div class="footer ">
				<div class="footer-hd ">
					<p>
						<a href="index.html">商城首页</a> <b>|</b> <a
							href="https://www.alipay.com/">支付宝</a> <b>|</b> <a
							href="javascript:void(0)">物流</a>
					</p>
				</div>
				<div class="footer-bd ">
				<p>
					<a href="#">合作伙伴</a> <a href="#">联系我们</a> <a href="#">网站地图</a> <em>2021-2021
							www.www.com 版权所有 TOP工作室</em>
				</p>
			</div>
			</div>
		</div>

		<aside class="menu">
				<ul>
					<li class="person">
						<a href="index.html">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人资料</a>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="safety.html">安全设置</a></li>
							<li class="active"> <a href="address.html">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的资产</a>
						<ul>
							<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>
							<li> <a href="bill.html">账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>
							<li> <a href="comment.html">评价</a></li>
							<li> <a href="news.html">消息</a></li>
						</ul>
					</li>

				</ul>

			</aside>
	</div>

</body>

</html>