<%@page import="com.java.pojo.*"%>
<%@page import="java.util.List"%>
<%@page import="com.java.servise.*"%>
<%@page import="com.java.servise.areaServise"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品页面</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css"/>
		<link rel="stylesheet" type="text/css" href="css/optstyle.css"/>
		<link rel="stylesheet" type="text/css" href="css/shop.css"/>

		<script src="js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="basic/js/quick_links.js"></script>

		<script type="text/javascript" src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="js/imagezoom.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/flexs.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/list.js" type="text/javascript" charset="utf-8"></script>


		<script type="text/javascript" src="angularjs/angular.min.js"></script>
		<script type="text/javascript" src="angularjs/base.js"></script>
		
		<script type="text/javascript" src="angularjs/service/searchService.js"></script>
		<script type="text/javascript" src="angularjs/service/productService.js"></script>
	    <script type="text/javascript" src="angularjs/controller/searchController.js"></script>
	
	</head>

	<body ng-app="itcast-shop" ng-controller="productController" ng-init="findProductById()">


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
            <b class="line"></b>
			<div class="listMain">

				<!--分类-->
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
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="#">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				
				<%
				List<Shop>shopList=(List<Shop>)request.getAttribute("listShop");
				if(shopList!=null){
					for(Shop shop:shopList){
				%>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="<%=shop.getShop_img() %>"/>
								</li>
							</ul>
						</div>
					</section>
				</div>

				<!--放大镜-->

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
								<a href="#"><img src="<%=shop.getShop_img() %>" alt="细节展示放大镜特效" rel="<%=shop.getShop_img() %>" class="jqzoom" /></a>
							</div>
							<ul class="tb-thumb" id="thumblist">
								<li class="{{$index==0?'tb-selected':'tb-pic tb-s40'}}tb-selected" ng-repeat="img in prodImgs" >
									<div class="tb-pic tb-s40" >
										<a href="#"><img src="<%=shop.getShop_img() %>" mid="<%=shop.getShop_img() %>" big="<%=shop.getShop_img() %>"></a>
									</div>
								</li>
							</ul>
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">

						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>	
								<%=shop.getShop_name() %>
	         				 </h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">

								<li class="price iteminfo_mktprice">
									<dt>价格</dt>
									<dd><em>¥</em><b class="sys_item_mktprice"><%=shop.getShop_price() %></b></dd>									
								</li>
								<div class="clear"></div>
							</div>

							<!--地址-->
							<dl class="iteminfo_parameter freight">
								<dt>配送至</dt>
								<div class="iteminfo_freprice">
									<div class="am-form-content address">
										<select data-am-selected="{maxHeight:200,btnWidth:'80px'}" name="province" id="province" onchange="jiacity();">
													
												</select>
												<select data-am-selected="{maxHeight:200,btnWidth:'80px'}" name="city" id="city"  onchange="jiaareas();">
													
												</select>
												<select data-am-selected="{maxHeight:200,btnWidth:'80px'}" name="areas" id="areasw">
													
												</select>
									</div>
									<div class="pay-logis">
										快递<b class="sys_item_freprice">10</b>元
									</div>
								</div>
							</dl>
							<div class="clear"></div>

							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count"><%=shop.getPurchase_num() %></span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count"><%int comment=(int)request.getAttribute("comment"); %><%=comment %></span></div>
								</li>
							</ul>
							<div class="clear"></div>

							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="" method="post">

												<div class="theme-signin-left">

													<div class="theme-options">
														<div class="cart-title">样式</div>
														<ul>
															<%
														List<Shop_style1>s1List=(List<Shop_style1>)request.getAttribute("style1List");
														if(s1List!=null){
															for(Shop_style1 style1:s1List){
														%>
														<li class="sku-line style1" value="<%=style1.getStyle1_id() %>" onclick="style1(this);"><%=style1.getStyle1_text() %><i></i></li>
														<%}} %>
														</ul>
													</div>
													<div class="theme-options">
														<div class="cart-title">样式</div>
														<ul>
															<%
														List<Shop_style2>s2List=(List<Shop_style2>)request.getAttribute("style2List");
														if(s2List!=null){
															for(Shop_style2 style2:s2List){
														%>
														<li class="sku-line style2" value="<%=style2.getStyle2_id() %>" onclick="style2(this);"><%=style2.getStyle2_text() %><i></i></li>
														<%}} %>
														</ul>
													</div>
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input id="text_box" name="" type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<span id="Stock" class="tb-hidden">库存<span class="stock"><%=shop.getNum() %></span>件</span>
														</dd>

													</div>
													<div class="clear"></div>

													<div class="btn-op">
														<div class="btn am-btn am-btn-warning">确认</div>
														<div class="btn close am-btn am-btn-warning">取消</div>
													</div>
												</div>
												<div class="theme-signin-right">
													<div class="img-info">
														<img src="images/songzi.jpg" />
													</div>
													<div class="text-info">
														<span class="J_Price price-now">¥<%=shop.getShop_price() %></span>
														<span id="Stock" class="tb-hidden">库存<span class="stock"><%=shop.getNum() %></span>件</span>
													</div>
												</div>

											</form>
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
							
							<!--活动	-->
							<div class="shopPromotion gold">
								<div class="hot">
									<dt class="tb-metatit">店铺优惠</dt>
									<div class="gold-list">
										<p><%=shop.getShop_text() %><span>点击领券<i class="am-icon-sort-down"></i></span></p>
									</div>
								</div>
								<div class="clear"></div>
								<div class="coupon">
									<dt class="tb-metatit">优惠券</dt>
									<div class="gold-list">
										<ul>
										<%
										List<Coupon>couponList=(List<Coupon>)request.getAttribute("couponList");
										if(couponList!=null){
											for(Coupon coupon:couponList){
										%>
											<a href="introduction.html?coupon_id=<%=coupon.getCoupon_id() %>&item=1&shop_ID=<%=shop.getShop_id() %>"><li><%=coupon.getCoupon_price() %>元   <%=coupon.getCoupon_text() %></li></a>
										<%}} %>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="pay">
							<div class="pay-opt">
							<a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
							<a><span class="am-icon-heart am-icon-fw">收藏</span></a>
							
							</div>
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="LikBuy" title="点此按钮到下一步确认购买信息" href="javascript:goumai(<%=shop.getShop_id() %>);">立即购买</a>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket" title="加入购物车" href="javascript:shopcar(<%=shop.getShop_id() %>);"><i></i>加入购物车</a>
								</div>
							</li>
							<li style="margin-left:20px;">
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket" title="加入收藏" href="introduction.html?shop_ID=<%=shop.getShop_id() %>&item=2"><i></i>收藏</a>
								</div>
							</li>
						</div>

					</div>

					<div class="clear"></div>

				</div>

				<!--优惠套装-->
				<div class="match">
					<div class="match-title"></div>
					<div class="match-comment">
					</div>
				</div>
				<div class="clear"></div>
				<%	break;}	} %>
							
				<!-- introduce-->

				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2>看了又看</h2>        
					            </div>
						     	
						     	<%
						     	List<Shop>listtype=(List<Shop>)request.getAttribute("listtype");
						     	int types=0;
						     	if(listtype!=null){
						     		for(Shop s:listtype){
						     		    types++;
						     		    if(types==5){
						     		    	break;
						     		    }
						     	%>
						     	<li class="first">
							      	<div class="p-img">                    
							      		<a  href="introduction.html?shop_ID=<%=s.getShop_id() %>"> <img class="" src="<%=s.getShop_img() %>"> </a>               
							      	</div>
							      	<div class="p-name"><a href="introduction.html?shop_ID=<%=s.getShop_id() %>">
							      		【<%=s.getShop_text() %>】
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥<%=s.getShop_price() %></strong></div>
							      </li>
						     	<%}} %>
						     	
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="javascript:void(0)">

										<span class="index-needs-dt-txt">宝贝详情</span></a>

								</li>

								<li>
									<a href="javascript:void(0)">

										<span class="index-needs-dt-txt">全部评价</span></a>

								</li>
							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<!-- <div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>产品参数：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
											<li title="">产品类型:&nbsp;烘炒类</li>
											<li title="">原料产地:&nbsp;巴基斯坦</li>
											<li title="">产地:&nbsp;湖北省武汉市</li>
											<li title="">配料表:&nbsp;进口松子、食用盐</li>
											<li title="">产品规格:&nbsp;210g</li>
											<li title="">保质期:&nbsp;180天</li>
											<li title="">产品标准号:&nbsp;GB/T 22165</li>
											<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
											<li title="">储存方法：&nbsp;请放置于常温、阴凉、通风、干燥处保存 </li>
											<li title="">食用方法：&nbsp;开袋去壳即食</li>
										</ul>
										<div class="clear"></div>
									</div> -->

									<div class="details">
										<div class="attr-list-hd after-market-hd">
											<h4>商品說明</h4>
										</div>
										<div class="twlistNews">
											<img src="images/tw1.jpg" />
										</div>
									</div>
									<div class="clear"></div>

								</div>

								<div class="am-tab-panel am-fade">
									
                                    <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong>100<span>%</span></strong><br> <span>好评度</span>            
                                    	</div>
                                        <dl>                    
                                            <dt>买家印象</dt>                    
                                            <dd class="p-bfc">
                                            			<q class="comm-tags"><span>宝贝非常好</span><em>(2177)</em></q>
                                            			<q class="comm-tags"><span>物有所值</span><em>(1860)</em></q>
                                            			<q class="comm-tags"><span>下次还买</span><em>(1823)</em></q>
                                            			<q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                            			<q class="comm-tags"><span>服务到位</span><em>(1488)</em></q>
                                            			<q class="comm-tags"><span>发货速度</span><em>(1392)</em></q>
                                            			<q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                            			<q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                        
                                            </dd>                                           
                                         </dl> 
                                    </div>	
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<ul class="am-comments-list am-comments-list-flip">
										
									<%
									List<Comment>listcomment=(List<Comment>)request.getAttribute("commentList");
									if(listcomment!=null){
										for(Comment comment :listcomment){
									%>
									<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															<%=comment.getComment_text() %>
														</div>

													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
									<%}} %>
										

									</ul>

									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="javascript:void(0)">&laquo;</a></li>
										<li class="am-active"><a href="javascript:void(0)">1</a></li>
										<li><a href="javascript:void(0)">2</a></li>
										<li><a href="javascript:void(0)">3</a></li>
										<li><a href="javascript:void(0)">4</a></li>
										<li><a href="javascript:void(0)">5</a></li>
										<li><a href="javascript:void(0)">&raquo;</a></li>
									</ul>
									<div class="clear"></div>

									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div>

								</div>

								
							</div>

						</div>

						<div class="clear"></div>


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
					<a href="#">合作伙伴</a> <a href="#">联系我们</a> <a href="#">网站地图</a> <em>2021-2021
							www.www.com 版权所有 TOP工作室</em>
				</p>
			</div>
		</div>
					</div>

				</div>
			</div>
			<!--菜单 -->
			<div class=tip>
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


	<script type="text/javascript">
		$(function() {
	<%if (request.getAttribute("msg") != null) {%>
		var flag=confirm("<%=request.getAttribute("msg")%>");
	<%}%>
		});
</script>
<script type="text/javascript">
window.onload = function() {
   <%
   areaServise s=new areaServise();
   int id=1;
   List<Area>listArea=s.queryID(id);
   List<Area>listArea2=null;
   for(Area area:listArea){
   %>
	var op = document.createElement("option");
	op.innerHTML = "<%=area.getCname() %>";
	op.value = <%=area.getArea_id() %>;
	document.getElementById("province").appendChild(op);
   <%}%>
}
</script>
<script type="text/javascript">
function jiacity(){
	document.getElementById("city").innerHTML=" ";
	var ids=document.getElementById("province").value;
		<%
		for(Area area:listArea){
		%>
		if(ids==<%=area.getArea_id()%>){
			  <%
               id=area.getArea_id();
			  listArea2 =s.queryID(id);
			   for(Area area2:listArea2){
			  %>
				var op = document.createElement("option");
				op.innerHTML = "<%=area2.getCname() %>";
				op.value = <%=area2.getArea_id() %>;
				document.getElementById("city").appendChild(op);
			   <%}%>
		}
		<%}%>
}

function jiaareas(){
	document.getElementById("areasw").innerHTML=" ";
	var ids2=document.getElementById("city").value;
	console.log(ids2);
	<%
	for(int i=0;i<388;i++){	
	%>
	if(ids2==<%=i %>){
		 <%
		   areaServise ds=new areaServise();
		   List<Area>listnum=ds.queryID(i);
		   for(Area area:listnum){
	       %>
			var op2 = document.createElement("option");
			op2.innerHTML = "<%=area.getCname() %>";
			op2.value = <%=area.getArea_id() %>;
			document.getElementById("areasw").appendChild(op2);
		   <%}%>
	}
	<%}%>
			 
}


</script>
<script type="text/javascript">
var style1_id;
var style2_id;
	function style1(obj){
		style1_id=obj.value;
	}
	function style2(obj){
		style2_id=obj.value;
	}
	
	function shopcar(shop_ID){
		window.location.href="introduction.html?item=3&shop_ID="+shop_ID+"&style1_id="+style1_id+"&style2_id="+style2_id;
	}
	
	function goumai(shop_ID){
		window.location.href="pay.html?item=3&shop_ID="+shop_ID+"&style1_id="+style1_id+"&style2_id="+style2_id;
	}
	</script>
	</body>
	
</html>