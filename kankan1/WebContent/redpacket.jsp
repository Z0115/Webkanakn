<%@page import="com.java.pojo.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的红包</title>
		<script src="js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
        <link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="css/personal.css"/>
		<link rel="stylesheet" type="text/css" href="css/redpacket.css"/>
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/amazeui.js" type="text/javascript" charset="utf-8"></script>
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

					<div class="user-bonus">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">红包</strong> / <small>Bonus</small></div>
						</div>
						<hr/>

						<div class="am-tabs-d2 am-tabs  am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">可用红包</a></li>
								<li><a href="#tab2">已用/过期红包</a></li>

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">

									<div class="cart-table-th">
										<div class="order-top">
											<div class="th th-from">
												来源
											</div>
										
											<div class="th th-term">
												有效期
											</div>
											<div class="th th-usestatus">
												使用状态
											</div>
										</div>
										<div class="clear"></div>
										<div class="order-main">
											<%
											List<Redpacket>list1=(List<Redpacket>)request.getAttribute("list1");
											if(list1!=null){
											for(Redpacket redpacket:list1){
											%>
											<ul class="item-list">
												<li class="td td-from">
													<div class="item-img">
														<img src="images/566fda5cN4b8a1675.gif">
													</div>

													<div class="item-info">

														<a href="javascript:void(0)">
															<p><%=redpacket.getRedpacket_name() %></p>
															<p class="info-little "><span>红包初始面额：</span>¥<%=redpacket.getRedpacket_price() %><span>元</span></p>
														</a>

													</div>
												</li>
											

												<li class="td td-term ">
													<div class="item-term">
														<span>有效期</span> <%=redpacket.getRedpacket_begin_time() %>-<%=redpacket.getRedpacket_end_time() %>
													</div>
												</li>

												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<p><%=redpacket.getRedpacket_state() %></p><span><img src="images/gift_stamp_1.png"/></span>
													</div>
												</li>
											</ul>
											<%} }%>

										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="cart-table-th">
										<div class="order-top">
											<div class="th th-from">
												来源
											</div>
											
											<div class="th th-term">
												有效期
											</div>
											<div class="th th-usestatus">
												使用状态
											</div>
										</div>
										<div class="clear"></div>
										<div class="order-main">

											<%
											List<Redpacket>list2=(List<Redpacket>)request.getAttribute("list2");
											if(list2!=null){
											for(Redpacket redpacket:list2){
											%>
											<ul class="item-list">
												<li class="td td-from">
													<div class="item-img">
														<img src="images/566fda5cN4b8a1675.gif">
													</div>

													<div class="item-info">

														<a href="javascript:void(0)">
															<p><%=redpacket.getRedpacket_name() %></p>
															<p class="info-little "><span>红包初始面额：</span>¥<%=redpacket.getRedpacket_price() %><span>元</span></p>
														</a>

													</div>
												</li>
											

												<li class="td td-term ">
													<div class="item-term">
														<span>有效期</span> <%=redpacket.getRedpacket_begin_time() %>-<%=redpacket.getRedpacket_end_time() %>
													</div>
												</li>

												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<p><%=redpacket.getRedpacket_state() %></p><span><img src="images/gift_stamp_2.png"/></span>
													</div>
												</li>
											</ul>
											<%}} %>

<!--已过期-->
                                            <%
											List<Redpacket>list3=(List<Redpacket>)request.getAttribute("list3");
                                            if(list3!=null){
											for(Redpacket redpacket:list3){
											%>
											<ul class="item-list">
												
												<li class="td td-from">
													<div class="item-img">
														<img src="images/566fda5cN4b8a1675.gif">
													</div>

													<div class="item-info">

														<a href="javascript:void(0)">
															<p><%=redpacket.getRedpacket_name() %></p>
															<p class="info-little "><span>红包初始面额：</span>¥<%=redpacket.getRedpacket_price() %><span>元</span></p>
														</a>

													</div>
												</li>
											

												<li class="td td-term ">
													<div class="item-term">
														<span>有效期</span> <%=redpacket.getRedpacket_begin_time() %>-<%=redpacket.getRedpacket_end_time() %>
													</div>
												</li>

												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<p><%=redpacket.getRedpacket_state() %></p><span><img src="images/gift_stamp_3.png"/></span>
													</div>
												</li>
											</ul>
											<%} }%>
										
										
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
					<a href="index.html">商城首页</a>
					<b>|</b>
					<a href="#">支付宝</a>
					<b>|</b>
					<a href="#">物流</a>
				</p>
			</div>
			<div class="footer-bd ">
				<p>
					<a href="javascript:void(0)">合作伙伴</a>
					<a href="javascript:void(0)">联系我们</a>
					<a href="javascript:void(0)">网站地图</a>
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