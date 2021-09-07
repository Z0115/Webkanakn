<%@page import="com.java.pojo.Shop"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>搜索页面</title>

<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css" />

<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="css/seastyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
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
				</div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="index.html" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="userinfo.jsp" target="_top"><i
						class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="shopcart.html" target="_top"><i
						class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
						id="J_MiniCartNum" class="h">0</strong></a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a href="collection.html" target="_top"><i
						class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="images/logo.png" />
		</div>
		<div class="logoBig">
			<li><a href="index.html"></a></li>
		</div>

		<div class="search-bar pr">
			<form action="search.html" method="post">
				<input id="searchInput" name="keywords" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>
	<b class="line"></b>
	<div class="search">
		<div class="search-list">
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


			<div class="am-g am-g-fixed">
				<div class="am-u-sm-12 am-u-md-12">
					<div class="theme-popover">
						<ul class="select">
							<div class="clear"></div>
							<li class="select-result">
								<dl>
									<dt>已选</dt>
									<dd class="select-no"></dd>
									<p class="eliminateCriteria">清除</p>
								</dl>
							</li>
							<div class="clear"></div>
							<li class="select-list">
								<dl id="select1">
									<dt class="am-badge am-round">品牌</dt>

									<div class="dd-conent">
										<dd class="select-all selected">
											<a href="javascript:void(0)">全部</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">百草味</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">良品铺子</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">新农哥</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">楼兰蜜语</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">口水娃</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">考拉兄弟</a>
										</dd>
									</div>

								</dl>
							</li>
							<li class="select-list">
								<dl id="select2">
									<dt class="am-badge am-round">种类</dt>
									<div class="dd-conent">
										<dd class="select-all selected">
											<a href="javascript:void(0)">全部</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">东北松子</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">巴西松子</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">夏威夷果</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">松子</a>
										</dd>
									</div>
								</dl>
							</li>
							<li class="select-list">
								<dl id="select3">
									<dt class="am-badge am-round">选购热点</dt>
									<div class="dd-conent">
										<dd class="select-all selected">
											<a href="javascript:void(0)">全部</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">手剥松子</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">薄壳松子</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">进口零食</a>
										</dd>
										<dd>
											<a href="javascript:void(0)">有机零食</a>
										</dd>
									</div>
								</dl>
							</li>

						</ul>
						<div class="clear"></div>
					</div>
					<div class="search-content">
						<div class="sort">
							<li class="first"><a title="综合">综合排序</a></li>
							<li><a title="销量">销量排序</a></li>
							<li><a title="价格">价格优先</a></li>
							<li class="big"><a title="评价" href="#">评价为主</a></li>
						</div>
						<div class="clear"></div>

						<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
							<%
								List<Shop> list = (List<Shop>) request.getAttribute("list");
								for (Shop shop : list) {
							%>
							<li>
								<div class="i-pic limit">
									<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>"><img src="<%=shop.getShop_img() %>" /></a>
									<p class="title fl"><%=shop.getShop_name() %></p>
									<p class="price fl">
										<b>¥</b> <strong><%=shop.getShop_price() %></strong>
									</p>
									<p class="number fl">
										销量<span><%=shop.getPurchase_num() %></span>
									</p>
								</div>
							</li>
							<%
								}
							%>
						</ul>
					</div>
					<div class="clear"></div>
					<!--分页 -->
					<ul class="am-pagination am-pagination-right">
						<li class="am-disabled"><a href="javascript:void(0)">&laquo;</a></li>
						<li class="am-active"><a href="javascript:void(0)">1</a></li>
						<li><a href="javascript:void(0)">&raquo;</a></li>
					</ul>

				</div>
			</div>
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="javascript:void(0)">关于我们</a> <b>|</b> <a
							href="javascript:void(0)">商城首页</a> <b>|</b> <a
							href="javascript:void(0)">支付宝</a> <b>|</b> <a
							href="javascript:void(0)">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于我们</a> <a
							href="javascript:void(0)">合作伙伴</a> <a href="#">联系我们</a>
						<a href="javascript:void(0)">网站地图</a> <em>© 2021-2025
							baijiayi.com 版权所有 TOP工作室</em>
					</p>
				</div>
			</div>
		</div>

	</div>

	<!--引导 -->
	<div class="navCir">
		<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="person/index.html"><i class="am-icon-user"></i>我的</a></li>
	</div>

	<!--菜单 -->
	<div class="tip">
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item ">
					<a href="userInfo.html"> <span class="setting "></span>
					</a>
					<div class="ibar_login_box status_login ">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img src="images/getAvatar.do.jpg" />
							</p>
							<ul class="user_info ">
								<li>Hi,你好</li>
							</ul>
						</div>
					</div>
				</div>

				<div id="shopCart " class="item ">
					<a href="# "> <span class="message "></span>
					</a>
					<div class="mp_tooltip ">
						购物车 <i class="icon_arrow_right_black "></i>
					</div>
				</div>
				<div id="asset " class="item ">
					<a href="# "> <span class="view "></span>
					</a>
					<div class="mp_tooltip ">
						我的资产 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="foot " class="item ">
					<a href="# "> <span class="zuji "></span>
					</a>
					<div class="mp_tooltip ">
						我的足迹 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="brand " class="item ">
					<a href="#"> <span class="wdsc "><img
							src="images/wdsc.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我的收藏 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="broadcast " class="item ">
					<a href="# "> <span class="chongzhi "><img
							src="images/chongzhi.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我要充值 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div class="quick_toggle ">
					<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
						<div class="mp_tooltip ">
							客服中心<i class="icon_arrow_right_black "></i>
						</div></li>
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>
			</div>

		</div>

	<script>
		window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
	</script>
	<script type="text/javascript" src="basic/js/quick_links.js"></script>

	<div class="theme-popover-mask"></div>

</body>

</html>