<%@page import="com.java.pojo.CollectionShop"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>我的收藏</title>

<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="css/personal.css" rel="stylesheet" type="text/css">
<link href="css/colstyle.css" rel="stylesheet" type="text/css">



<style type="text/css">
	.s-tp a{
		color:white;
	}
	.s-tp a:hover{
		color:red;
	}
</style>

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
						placeholder="搜索" /> <input id="ai-topsearch"
						class="submit am-btn" value="搜索" index="1" type="submit" />
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

				<div class="user-collection">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">我的收藏</strong> / <small>My&nbsp;Collection</small>
						</div>
					</div>
					<hr />

					<div class="you-like">
						<div class="s-bar">
							我的收藏 <a class="am-badge am-badge-danger am-round">降价</a> <a
								class="am-badge am-badge-danger am-round">下架</a>
						</div>
						<div class="s-content">
							<%
								List<CollectionShop> list = (List<CollectionShop>) request.getAttribute("list");
								for (CollectionShop collection : list) {
							%>
							<div class="s-item-wrap">
								<div class="s-item">
									<div class="s-pic">
										<a href="#" class="s-pic-link"> <img
											src="<%=collection.getShop_img()%>"
											alt="<%=collection.getShop_name()%>"
											title="<%=collection.getShop_name()%>"
											class="s-pic-img s-guess-item-img">
										</a>
									</div>
									<div class="s-info">
										<div class="s-title">
											<a href="#" title="<%=collection.getShop_name()%>"><%=collection.getShop_name()%></a>
										</div>
										<div class="s-price-box">
											<span class="s-price"><em class="s-price-sign">¥</em><em
												class="s-value"><%=collection.getShop_price()%></em></span> <span
												class="s-history-price"><em class="s-price-sign">¥</em><em
												class="s-value"><%=collection.getShop_price()%></em></span>
										</div>
										<div class="s-extra-box">
											<span class="s-sales">月销: <%=collection.getPurchase_num()%></span>
										</div>
									</div>
									
									<div class="s-tp">
										<span class="ui-btn-loading-before"><a href="collection.html?item=1&sid=<%=collection.getCollection_id()%>">删除</a></span> <i
											class="am-icon-shopping-cart"></i> <span
											class="ui-btn-loading-before buy">加入购物车</span>
										<p>
											<a href="javascript:;" class="c-nodo J_delFav_btn">取消收藏</a>
										</p>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>


						<div class="s-more-btn i-load-more-item" data-screen="0">
							<i class="am-icon-refresh am-icon-fw"></i>更多
						</div>

					</div>

				</div>

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