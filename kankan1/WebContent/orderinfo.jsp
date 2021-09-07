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

		<title>订单详情</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/orderinfo.css" rel="stylesheet" type="text/css">

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

					<div class="user-orderinfo">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small></div>
						</div>
						<hr/>
						<!--进度条-->
						<div class="m-progress">
							<div class="m-progress-list">
								<span class="step-1 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                   <p class="stage-name">拍下商品</p>
                                </span>
								<span class="step-2 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                   <p class="stage-name">卖家发货</p>
                                </span>
								<span class="step-3 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
                                   <p class="stage-name">确认收货</p>
                                </span>
								<span class="step-4 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">4<em class="bg"></em></i>
                                   <p class="stage-name">交易完成</p>
                                </span>
								<span class="u-progress-placeholder"></span>
							</div>
							<div class="u-progress-bar total-steps-2">
								<div class="u-progress-bar-inner"></div>
							</div>
						</div>
						
						
						<div class="order-infoaside">
							<div class="order-logistics">
								<a href="logistics.html">
									<div class="icon-log">
										<i><img src="images/receive.png"></i>
									</div>
									<div class="latest-logistics">
										<p class="text">已签收,签收人是青年城签收，感谢使用天天快递，期待再次为您服务</p>
										<div class="time-list">
											<span class="date"></span><span class="week"></span><span class="time"></span>
										</div>
										<div class="inquire">
											<span class="package-detail">物流：看看快递</span>
											<span class="package-detail">快递单号: </span>
											<span class="package-number">5211314</span>
											<a href="logistics.html">查看</a>
										</div>
									</div>
									<span class="am-icon-angle-right icon"></span>
								</a>
								<div class="clear"></div>
							</div>
							<%
										List<Information>list2=(List<Information>)request.getAttribute("list");
										shopServise shops = new shopServise();
										shop_style1Servise style1s=new shop_style1Servise();
										shop_style2Servise style2s=new shop_style2Servise();
										shippingaddressServise sas=new shippingaddressServise();
										areaServise as=new areaServise();
										int shop_id=0;
										int shop_price=0;
										int style1=0;
										int style2=0;
										int sa_id=0;
										List<Shop_style1>liststyle1=null;
										List<Shop_style2>liststyle2=null;
										List<Shop>listshop2=null;
										if(list2!=null){
											for(Information information2 :list2){
										%>
							<%
							sa_id=information2.getSa_ID();
							List<Shippingaddress>listshippingaddress=sas.query2(sa_id);
							for(Shippingaddress sa:listshippingaddress){
								List<Area>list1=as.queryArea(sa.getProvince_id());
								String province=null;
								for(Area area:list1){
									province=area.getCname();
								}
								List<Area>list4=as.queryArea(sa.getCity_id());
								String city=null;
								for(Area area:list4){
									city=area.getCname();
								}
								List<Area>list3=as.queryArea(sa.getArea_id());
								String areas=null;
								for(Area area:list3){
									areas=area.getCname();
								}
							%>
							<div class="order-addresslist">
								<div class="order-address">
									<div class="icon-add">
									</div>
									<p class="new-tit new-p-re">
										<span class="new-txt"><%=sa.getSa_name() %></span>
										<span class="new-txt-rd2"><%=sa.getSa_tel() %></span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">收货地址：</span>
											<span class="province"><%=province %></span>省
											<span class="city"><%=city %></span>
											<span class="dist"><%=areas %></span>
											<span class="street"><%=sa.getSa_text() %></span></p>
									</div>
								</div>
							</div>
							<%} %>
						</div>
						<div class="order-infomain">

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

								<div class="order-status3">
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
														退款/退货
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
														<p class="Mystatus">卖家已发货</p>
														<p class="order-info"><a href="logistics.html">查看物流</a></p>
														<p class="order-info"><a href="#">延长收货</a></p>
													</div>
												</li>
												<li class="td td-change">
												
												</li>
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
