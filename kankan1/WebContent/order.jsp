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

		<title>订单管理</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/order.css" rel="stylesheet" type="text/css">

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
                                <li class="qc"><a href="javascript:void(0)">闪购</a></li>
                                <li class="qc"><a href="javascript:void(0)">限时抢</a></li>
                                <li class="qc"><a href="javascript:void(0)">团购</a></li>
                                <li class="qc last"><a href="javascript:void(0)">大包装</a></li>
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

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab3">待发货</a></li>
								<li><a href="#tab4">待收货</a></li>
								<li><a href="#tab5">待评价</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<%
										List<Information>list1=(List<Information>)request.getAttribute("list1");
										shopServise shops5 = new shopServise();
										shop_style1Servise style1s5=new shop_style1Servise();
										shop_style2Servise style2s5=new shop_style2Servise();
										int shop_id5=0;
										int shop_price5=0;
										int style15=0;
										int style25=0;
										List<Shop_style1>liststyle15=null;
										List<Shop_style2>liststyle25=null;
										List<Shop>listshop5=null;
										if(list1!=null){
											for(Information information5 :list1){
										%>
											<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="#"><%=information5.getInformation_id() %></a></div>
													<span>成交时间：<%=information5.getInformation_time() %></span>
												</div>
												<%
												shop_id5=information5.getShop_ID();
												listshop5=shops5.query4(shop_id5);
												for(Shop shop:listshop5){
												%>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>" class="J_MakePoint">
																		<img src="<%=shop.getShop_img() %>" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>">
																			<p><%=shop.getShop_name() %></p>
																			<p class="info-little">
																			<%
																			style15=information5.getStyle1_ID();
																			liststyle15=style1s5.query2(style15);
																			for(Shop_style1 shop_style1:liststyle15){
																			%>
																			<%=shop_style1.getStyle1_text() %>
																			<%} %>
																			<%
																			style25=information5.getStyle2_ID();
																			liststyle25=style2s5.query2(style25);
																			for(Shop_style2 shop_style2:liststyle25){
																			%>
																				<br/><%=shop_style2.getStyle2_text() %>< </p>
																			<%} %>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<%=shop.getShop_price() %>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><%=information5.getShop_num() %>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款</a>
																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<%=information5.getShop_num()*shop.getShop_price()+10 %>
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														
													</div>
												</div>
											</div>
											<%} %>
											<%}} %>
											
										</div>

									</div>

								</div>
								
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<%
										List<Information>list2=(List<Information>)request.getAttribute("list2");
										shopServise shops = new shopServise();
										shop_style1Servise style1s=new shop_style1Servise();
										shop_style2Servise style2s=new shop_style2Servise();
										int shop_id=0;
										int shop_price=0;
										int style1=0;
										int style2=0;
										List<Shop_style1>liststyle1=null;
										List<Shop_style2>liststyle2=null;
										List<Shop>listshop2=null;
										if(list2!=null){
											for(Information information2 :list2){
										%>
											<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="#"><%=information2.getInformation_id() %></a></div>
													<span>成交时间：<%=information2.getInformation_time() %></span>
												</div>
												<%
												shop_id=information2.getShop_ID();
												listshop2=shops.query4(shop_id);
												for(Shop shop:listshop2){
												%>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>" class="J_MakePoint">
																		<img src="<%=shop.getShop_img() %>" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>">
																			<p><%=shop.getShop_name() %></p>
																			<p class="info-little">
																			<%
																			style1=information2.getStyle1_ID();
																			liststyle1=style1s.query2(style1);
																			for(Shop_style1 shop_style1:liststyle1){
																			%>
																			<%=shop_style1.getStyle1_text() %>
																			<%} %>
																			<%
																			style2=information2.getStyle2_ID();
																			liststyle2=style2s.query2(style2);
																			for(Shop_style2 shop_style2:liststyle2){
																			%>
																				<br/><%=shop_style2.getStyle2_text() %>< </p>
																			<%} %>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<%=shop.getShop_price() %>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><%=information2.getShop_num() %>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款</a>
																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<%=information2.getShop_num()*shop.getShop_price()+10 %>
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																	<p class="order-info"><a href="order.html?item=2&information_id=<%=information2.getInformation_id() %>">订单详情</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	提醒发货</div>
															</li>
														</div>
													</div>
												</div>
											</div>
											<%} %>
											<%}} %>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<%
										List<Information>list3=(List<Information>)request.getAttribute("list3");
										shopServise shops2 = new shopServise();
										shop_style1Servise style1s2=new shop_style1Servise();
										shop_style2Servise style2s2=new shop_style2Servise();
										int shop_id2=0;
										int shop_price2=0;
										int style12=0;
										int style22=0;
										List<Shop_style1>liststyle12=null;
										List<Shop_style2>liststyle22=null;
										List<Shop>listshop22=null;
										if(list2!=null){
											for(Information information3 :list3){
										%>
										
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><%=information3.getInformation_id() %></a></div>
													<span>成交时间：<%=information3.getInformation_time() %></span>
												</div>
												<%
												shop_id=information3.getShop_ID();
												listshop2=shops.query4(shop_id);
												for(Shop shop:listshop2){
												%>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>" class="J_MakePoint">
																		<img src="<%=shop.getShop_img() %>" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>">
																			<p><%=shop.getShop_name() %> </p>
																			<p class="info-little">
																			<%
																			style12=information3.getStyle1_ID();
																			liststyle12=style1s2.query2(style12);
																			for(Shop_style1 shop_style1:liststyle12){
																			%>
																			<%=shop_style1.getStyle1_text() %>
																			<%} %>
																			<%
																			style22=information3.getStyle2_ID();
																			liststyle22=style2s2.query2(style22);
																			for(Shop_style2 shop_style2:liststyle22){
																			%>
																				<br/><%=shop_style2.getStyle2_text() %>< </p>
																			<%} %>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<%=shop.getShop_price() %>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><%=information3.getShop_num() %>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="#">退款/退货</a>
																</div>
															</li>
														</ul>

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<%=information3.getShop_num()*shop.getShop_price()+10 %>
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="order-info"><a href="order.html?item=2&information_id=<%=information3.getInformation_id() %>">订单详情</a></p>
																	<p class="order-info"><a href="logistics.html">查看物流</a></p>
																	<p class="order-info"><a href="javascript:void(0)">延长收货</a></p>
																</div>
															</li>
															<li class="td td-change">
																<a class="am-btn am-btn-danger anniu" href="order.html?item=1&information_id=<%=information3.getInformation_id() %>">
																	确认收货</a>
															</li>
														</div>
													</div>
												</div>
											</div>
										
										<%} %>
										<%}} %>
										</div>
									</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<%
										List<Information>list4=(List<Information>)request.getAttribute("list4");
										shopServise shops3 = new shopServise();
										shop_style1Servise style1s3=new shop_style1Servise();
										shop_style2Servise style2s3=new shop_style2Servise();
										int shop_id3=0;
										int shop_price3=0;
										int style13=0;
										int style23=0;
										List<Shop_style1>liststyle13=null;
										List<Shop_style2>liststyle23=null;
										List<Shop>listshop3=null;
										if(list2!=null){
											for(Information information4 :list4){
										%>
										<div class="order-status4">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><%=information4.getInformation_id() %></a></div>
													<span>成交时间：<%=information4.getInformation_time() %></span>

												</div>
												<%
												shop_id3=information4.getShop_ID();
												listshop3=shops.query4(shop_id3);
												for(Shop shop:listshop3){
												%>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>" class="J_MakePoint">
																		<img src="<%=shop.getShop_img() %>" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="introduction.html?shop_ID=<%=shop.getShop_id()%>">
																			<p><%=shop.getShop_name() %> </p>
																			<p class="info-little">
																			<%
																			style13=information4.getStyle1_ID();
																			liststyle13=style1s3.query2(style13);
																			for(Shop_style1 shop_style1:liststyle12){
																			%>
																			<%=shop_style1.getStyle1_text() %>
																			<%} %>
																			<%
																			style23=information4.getStyle2_ID();
																			liststyle22=style2s2.query2(style22);
																			for(Shop_style2 shop_style2:liststyle22){
																			%>
																				<br/><%=shop_style2.getStyle2_text() %>< </p>
																			<%} %>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	<%=shop.getShop_price() %>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span><%=information4.getShop_num() %>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="#">退款/退货</a>
																</div>
															</li>
														</ul>

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：<%=information4.getShop_num()*shop.getShop_price()+10 %>
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																	<p class="order-info"><a href="order.html?item=2&information_id=<%=information4.getInformation_id() %>">订单详情</a></p>
																	<p class="order-info"><a href="logistics.html">查看物流</a></p>
																</div>
															</li>
															<li class="td td-change">
																<a href="order.html?item=3&information_id=<%=information4.getInformation_id() %>">
																	<div class="am-btn am-btn-danger anniu">
																		评价商品</div>
																</a>
															</li>
														</div>
													</div>
												</div>
											</div>

										<%} %>
										<%}} %>
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