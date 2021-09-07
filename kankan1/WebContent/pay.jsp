<%@page import="com.java.pojo.*"%>
<%@page import="java.util.List"%>
<%@page import="com.java.servise.*"%>
<%@page import="com.java.servise.areaServise"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>结算页面</title>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="css/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="js/address.js"></script>
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
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
						</div>
						<div class="clear"></div>
						<ul>
						<%
						List<Shippingaddress>list=(List<Shippingaddress>)request.getAttribute("list");
						areaServise as=new areaServise();
						if(list!=null){
							for(Shippingaddress sa:list){
								List<Area>list1=as.queryArea(sa.getProvince_id());
								String province=null;
								for(Area area:list1){
									province=area.getCname();
								}
								List<Area>list2=as.queryArea(sa.getCity_id());
								String city=null;
								for(Area area:list2){
									city=area.getCname();
								}
								List<Area>list3=as.queryArea(sa.getArea_id());
								String areas=null;
								for(Area area:list3){
									areas=area.getCname();
								}
						%>
							<div class="per-border"></div>
							<li class="user-addresslist defaultAddr">

								<div class="address-left">
									<div class="user">

										<span class="buy-address-detail">   
                                        <span class="buy-user"><%=sa.getSa_name() %></span>
										<span class="buy-phone"><%=sa.getSa_tel() %></span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
								   <span class="province"><%=province %></span>省
										<span class="city"><%=city %></span>
										<span class="dist"><%=areas %></span>
										<span class="street"><%=sa.getSa_text() %></span>
										</span>

										</span>
										<span class="address_id" style="display:none;"><%=sa.getSa_id() %></span>
									</div>
									<ins class="deftip">默认地址</ins>
								</div>
								<div class="address-right">
									<a href="person/address.html">
										<span class="am-icon-angle-right am-icon-lg"></span></a>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									<a href="#" class="hidden">设为默认</a>
									<span class="new-addr-bar hidden">|</span>
									<a href="#">编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="pay.html?item=1&sa_id=<%=sa.getSa_id() %>">删除</a>
								</div>

							</li>
							
                       <%}} %>
						</ul>

						<div class="clear"></div>
					</div>
					<!--物流 -->
					<div class="logistics">
						<h3>选择物流方式</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
							<li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
							<li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
							<li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
							<li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--支付方式-->
					<div class="logistics">
						<h3>选择支付方式</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="images/wangyin.jpg" />银联<span></span></li>
							<li class="pay qq"><img src="images/weizhifu.jpg" />微信<span></span></li>
							<li class="pay taobao"><img src="images/zhifubao.jpg" />支付宝<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">

									<div class="th th-item">
										<div class="td-inner">商品信息</div>
									</div>
									<div class="th th-price">
										<div class="td-inner">单价</div>
									</div>
									<div class="th th-amount">
										<div class="td-inner">数量</div>
									</div>
									<div class="th th-sum">
										<div class="td-inner">金额</div>
									</div>
									<div class="th th-oplist">
										<div class="td-inner">配送方式</div>
									</div>

								</div>
							</div>
							<div class="clear"></div>
                            <%
                            
                            List<Shop>shopList=(List<Shop>)request.getAttribute("listShop");
            				if(shopList!=null){
            					for(Shop shop:shopList){
                            %>
							<tr class="item-list">
								<div class="bundle  bundle-last">

									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="<%=shop.getShop_img() %>" class="itempic J_ItemImg"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11"><%=shop.getShop_name() %></a>
														</div>
													</div>
												</li>
												<li class="td td-info">
													<div class="item-props">
														<span class="sku-line"><%String style1_name=(String)request.getAttribute("style1_name"); %>><%=style1_name %></span>
														<span class="sku-line"><%String style2_name=(String)request.getAttribute("style2_name"); %>><%=style2_name %></span>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<p class="J_Price price-now" id="danprice"><%=shop.getShop_price() %></p>
														</div>
													</div>
												</li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">购买数量</span>
														<div class="sl">
															<input class="min am-btn" name="" type="button" value="-"  onclick=" jiage2();"/>
															<input class="text_box" id="pricenum" name="" type="text" value="1" style="width:30px;" />
															<input class="add am-btn" name="" type="button" value="+" onclick=" jiage();"/>
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number" id="pricesumss"><%=shop.getShop_price() %></em>
												</div>
											</li>
											<li class="td td-oplist">
												<div class="td-inner">
													<span class="phone-title">配送方式</span>
													<div class="pay-logis">
														快递<b class="sys_item_freprice">10</b>元
													</div>
												</div>
											</li>

										</ul>
										<div class="clear"></div>

									</div>
							</tr>
							<div class="clear"></div>
							</div>
                           <%}} %>
							</div>
							<div class="clear"></div>
							<div class="pay-total">
						<!--留言-->
							<div class="order-extra">
								<div class="order-user-info">
									<div id="holyshit257" class="memo">
										<label>买家留言：</label>
										<input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
										<div class="msg hidden J-msg">
											<p class="error">最多输入500个字符</p>
										</div>
									</div>
								</div>

							</div>
							<!--优惠券 -->
							<div class="buy-agio">
								<li class="td td-coupon">

									<span class="coupon-title">优惠券</span>
									<select data-am-selected>
									<%
									List<Coupon>listcoupon=(List<Coupon>)request.getAttribute("listcoupon");
									if(listcoupon!=null){
										for(Coupon coupon:listcoupon){
									%>
										<option value="a">
											<div class="c-price">
												<strong>￥<%=coupon.getCoupon_price() %></strong>
											</div>
											<div class="c-limit">
												【<%=coupon.getCoupon_text() %>】
											</div>
										</option>
									<%}} %>
									</select>
								</li>

								<li class="td td-bonus">

									<span class="bonus-title">红包</span>
									<select data-am-selected>
									<%
									List<Redpacket>listredpacket=(List<Redpacket>)request.getAttribute("listredpacket");
									if(listcoupon!=null){
										for(Redpacket redpacket:listredpacket){
									%>
										<option value="a">
											<div class="item-info">
												¥<%=redpacket.getRedpacket_price() %><span>元</span>
											</div>
										</option>
									<%}} %>
									</select>

								</li>

							</div>
							<div class="clear"></div>
							</div>
							<!--含运费小计 -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计（含运费） <span>¥</span><em class="pay-sum" id="pricesumss2">0</em>
								</p>
							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">0</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail">
								                <span class="province"></span>省
												<span class="city"></span>市
												<span class="dist"></span>区
												<span class="street"></span>
												</span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                         <span class="buy-user"></span>
												<span class="buy-phone"></span>
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go" href="javascript:fukuan();" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
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
			</div>
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal" action="pay.html?item=2" method="post">

										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" id="user-name" placeholder="收货人" name="sa_name">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="user-phone" placeholder="手机号必填" type="text" name="sa_tel">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地</label>
											<div class="am-form-content address">
												<select data-am-selected="{maxHeight:200,btnWidth:'120px'}" name="province" id="province" onchange="jiacity();">
													
												</select>
												<select data-am-selected="{maxHeight:200,btnWidth:'120px'}" name="city" id="city"  onchange="jiaareas();">
													
												</select>
												<select data-am-selected="{maxHeight:200,btnWidth:'120px'}" name="areas" id="areasw">
													
												</select>
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址" name="sa_text"></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<input type="submit" class="am-btn am-btn-danger" value="保存">
												<a href="#" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											</div>
										</div>
									</form>
				</div>

			</div>

			<div class="clear"></div>
		
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
<script>
var num;
var sp;
var sa_id;
    function jiage(){
    	num=parseInt(document.getElementById("pricenum").value)+1;
    	var price=document.getElementById("danprice").innerHTML;
    	sp=num*price;
    	var price1=document.getElementById("pricesumss");
    	var price2=document.getElementById("pricesumss2");
    	var price3=document.getElementById("J_ActualFee");
    	price1.innerHTML=sp;
    	price2.innerHTML=sp+10;
    	price3.innerHTML=sp+10;
    	
    }
    
    function jiage2(){
    	num=parseInt(document.getElementById("pricenum").value)-1;
    	var price=document.getElementById("danprice").innerHTML;
    	sp=num*price;
    	var price1=document.getElementById("pricesumss");
    	var price2=document.getElementById("pricesumss2");
    	var price3=document.getElementById("J_ActualFee");
    	price1.innerHTML=sp;
    	price2.innerHTML=sp+10;
    	price3.innerHTML=sp+10;
    	
    }

    $(".user-addresslist").click(function(){
    	sa_id=$(this).find(".address_id").text();
		var name=$(this).find(".buy-user").text();
		var phone=$(this).find(".buy-phone").text();
		var province=$(this).find(".province").text();
		var city=$(this).find(".city").text();
		var dist=$(this).find(".dist").text();
		var street=$(this).find(".street").text();

		$(".box").find(".province").text(province);
		$(".box").find(".city").text(city);
		$(".box").find(".dist").text(dist);
		$(".box").find(".street").text(street);
		$(".box").find(".buy-user").text(name);
		$(".box").find(".buy-phone").text(phone);
		
	})

  function fukuan(){
    	window.location.href="pay.html?item=4&shop_num="+num+"&sumprice="+sp+"&sa_id="+sa_id;
    }

</script>	
			
	</body>

</html>
