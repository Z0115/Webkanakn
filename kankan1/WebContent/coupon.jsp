<%@page import="com.java.pojo.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>优惠券</title>
		<script src="js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
        <<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="css/personal.css"/>
		<link rel="stylesheet" type="text/css" href="css/coupon.css"/>
		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
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
						
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><a href="#"></a></li>
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
					我的福利
					
				</div>
			</div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-coupon">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">优惠券</strong> / <small>Coupon</small></div>
						</div>
						<hr/>

						<div class="am-tabs-d2 am-tabs  am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">可用优惠券</a></li>
								<li><a href="#tab2">已用/过期优惠券</a></li>

							</ul>

							<div class="am-tabs-bd">
								<!-- 可用优惠卷 -->
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="coupon-items">
										<%
										List<Coupon>list1=(List<Coupon>)request.getAttribute("list1");
										if(list1!=null){
										for(Coupon coupon:list1){
										%>
									<div class="coupon-item coupon-item-d">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>购物券</strong>
													</div>
													<div class="c-price">
														<strong>￥<%=coupon.getCoupon_price() %></strong>
													</div>
													<div class="c-limit">
														【<%=coupon.getCoupon_text() %>】
													</div>
													<div class="c-time"><span>使用期限</span><%=coupon.getCoupon_begin_time() %>--<%=coupon.getCoupon_end_time() %></div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">券&nbsp;编&nbsp;号：</span>
																<span class="txt"><%=coupon.getCoupon_id() %></span>
															</div>
														</div>
													</div>
													<div class="op-btns">
														<a href="#" class="btn"><span class="txt">立即使用</span><b></b></a>
													</div>
												</div>
											</div>
										</div>
										<%} }%>
										
									</div>

								</div>
								<!-- 过期优惠券 -->
								<div class="am-tab-panel am-fade" id="tab2">
									<div class="coupon-items">
										<%
										List<Coupon>list2=(List<Coupon>)request.getAttribute("list2");
										if(list2!=null){
										for(Coupon coupon:list2){
										%>
										<div class="coupon-item coupon-item-d">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>购物券</strong>
														<span class="am-icon-trash"></span>
													</div>
													<div class="c-price">
														<strong>￥<%=coupon.getCoupon_price() %></strong>
													</div>
													<div class="c-limit">
														【<%=coupon.getCoupon_text() %>】
													</div>
													<div class="c-time"><span>使用期限</span><%=coupon.getCoupon_begin_time() %>--<%=coupon.getCoupon_end_time() %></div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">券&nbsp;编&nbsp;号：</span>
																<span class="txt"><%=coupon.getCoupon_id() %></span>
															</div>
														</div>
													</div>
													<div class="op-btns c-del">
														<a href="coupon.html?coupon_id=<%=coupon.getCoupon_id()%>&item=1" class="btn"><span class="txt">删除</span><b></b></a>
													</div>
												</div>
												
												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<span><img src="images/gift_stamp_31.png"/></span>
													</div>
												</li>												
											</div>
										</div>
										<%}} %>
										<%
										List<Coupon>list3=(List<Coupon>)request.getAttribute("list3"); 
										if(list3!=null){
										for(Coupon coupon:list3){
										%>
										<div class="coupon-item coupon-item-d">
											<div class="coupon-list">
												<div class="c-type">
													<div class="c-class">
														<strong>购物券</strong>
														<span class="am-icon-trash"></span>
													</div>
													<div class="c-price">
														<strong>￥<%=coupon.getCoupon_price() %></strong>
													</div>
													<div class="c-limit">
														【<%=coupon.getCoupon_text() %>】
													</div>
													<div class="c-time"><span>使用期限</span><%=coupon.getCoupon_begin_time() %>--<%=coupon.getCoupon_end_time() %></div>
													<div class="c-type-top"></div>

													<div class="c-type-bottom"></div>
												</div>

												<div class="c-msg">
													<div class="c-range">
														<div class="range-all">
															<div class="range-item">
																<span class="label">券&nbsp;编&nbsp;号：</span>
																<span class="txt"><%=coupon.getCoupon_id() %></span>
															</div>
														</div>
													</div>
													<div class="op-btns c-del">
														<a href="coupon.html?coupon_id=<%=coupon.getCoupon_id()%>&item=1"  class="btn"><span class="txt">删除</span><b></b></a>
													</div>
												</div>
												
												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<span><img src="images/gift_stamp_21.png"/></span>
													</div>
												</li>												
											</div>
										</div>
										<%}} %>
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
					<a href="index.html">商城首页</a>
					<b>|</b>
					<a href="#">支付宝</a>
					<b>|</b>
					<a href="">物流</a>
				</p>
			</div>
			<div class="footer-bd ">
				<p>
					<a href="#">合作伙伴</a>
					<a href="#">联系我们</a>
					<a href="#">网站地图</a>
					<em>2021-2021 www.www.com 版权所有 TOP工作室</em>
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