<%@page import="com.java.pojo.*"%>
<%@page import="java.util.List"%>
<%@page import="com.java.servise.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>评价管理</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/cmstyle.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/comment.css"/>
		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		


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
								<div class="menu-hd"><a href="index.html" target="_top" class="h">商城首页</a></div>
							</div>
							
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
			<div class="long-title"><span class="all-goods">全部分类</span></div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="index.html">首页</a></li>
					<li class="qc"><a href="#">闪购</a></li>
					<li class="qc"><a href="#">限时抢</a></li>
					<li class="qc"><a href="#">团购</a></li>
					<li class="qc last"><a href="#">大包装</a></li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有评价</a></li>
								

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">

									<div class="comment-main">
										<div class="comment-list">
										<%
										List<Comment>listcomment=(List<Comment>)request.getAttribute("listcomment");
										shopServise shops = new shopServise();
										int i=0;
										int shop_ID=0;
										List<Shop>listshop=null;
										if(listcomment!=null){
											for(Comment comment : listcomment){
												shop_ID=comment.getShop_ID();
												listshop=shops.query4(shop_ID);
												for(Shop shop:listshop){
										%>
											<ul class="item-list">
												<div class="comment-top">
													<div class="th th-price">
														
													</div>
													<div class="th th-item">
														
													</div>													
												</div>
											
												<li class="td td-item">
													<div class="item-pic">
														<a href="introduction.html?shop_ID=<%=shop.getShop_id() %>" class="J_MakePoint">
															<img src="<%=shop.getShop_img() %>" class="itempic">
														</a>
													</div>
												</li>

												<li class="td td-comment">
													<div class="item-title">
														<div class="item-opinion">好评</div>
														<div class="item-name">
															<a href="javascript:void(0)">
																<p class="item-basic-info"><%=shop.getShop_name() %></p>
															</a>
														</div>
													</div>
													<div class="item-comment">
														<%=comment.getComment_text() %>
													</div>

													<div class="item-info">
														<div>
															<p class="info-little"><span></span> <span></span> </p>
															<p class="info-time"></p>

														</div>
													</div>
												</li>
         
											</ul>
                                            <%}}} %>
										</div>
									</div>

								</div>
								
							</div>
						</div>

					</div>

				</div>
				<!--底部-->
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
			</div>
<aside class="menu">
				<ul>
					<li class="person active">
						<a href="userInfo.html">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人资料</a>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="safety.html">安全设置</a></li>
							<li> <a href="address.html">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							<li> <a href="#">退款售后</a></li>
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
							<li> <a href="#">足迹</a></li>
							<li> <a href="comment.html">评价</a></li>
							<li> <a href="#">消息</a></li>
						</ul>
					</li>

				</ul>

			</aside>
		</div>
<script type="text/javascript">
		$(function() {
	<%if (request.getAttribute("msg") != null) {%>
		var flag=confirm("<%=request.getAttribute("msg")%>");
	<%}%>
		});
	</script>
	</body>

</html>