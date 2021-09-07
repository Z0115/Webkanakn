<%@page import="com.java.pojo.*"%>
<%@page import="java.util.List"%>
<%@page import="com.java.servise.*"%>
<%@page import="com.java.servise.areaServise"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>地址管理</title>
		<script src="js/jquery-3.3.1.min.js" type="text/javascript"
	charset="utf-8"></script>
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/personal.css"/>
		<link rel="stylesheet" type="text/css" href="css/address.css"/>
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
						<ul class="message-r">
							
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

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">

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
							<li class="user-addresslist">
								<span class="new-option-r"><i class="am-icon-check-circle"></i>设为默认</span>
								<p class="new-tit new-p-re">
									<span class="new-txt"><%=sa.getSa_name() %></span>
									<span class="new-txt-rd2"><%=sa.getSa_tel() %></span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span>
										<span class="province"><%=province %></span>省
										<span class="city"><%=city %></span>
										<span class="dist"><%=areas %></span>
										<span class="street"><%=sa.getSa_text() %></span></p>
								</div>
								<div class="new-addr-btn">
									<a href="#"><i class="am-icon-edit"></i>编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="address.html?item=1&sa_id=<%=sa.getSa_id() %>"><i class="am-icon-trash"></i>删除</a>
								</div>
							</li>
							<%}} %>
							
						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal" action="address.html?item=2" method="post">

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

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

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

	</body>

</html>