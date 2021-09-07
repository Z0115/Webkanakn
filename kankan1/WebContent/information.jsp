<%@page import="com.java.pojo.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>个人资料</title>
<script src="js/jquery-3.3.1.min.js" type="text/javascript"
	charset="utf-8"></script>
<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/personal.css" />
<link rel="stylesheet" type="text/css" href="css/information.css" />
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
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">我的福利</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />
<%
 List<Customer>listCustomer=(List<Customer>)request.getAttribute("listCustomer");
if(request.getAttribute("listCustomer")!=null){
	String grad=(String)request.getAttribute("grad");
	for(Customer customer:listCustomer){
%>
<!--头像 --> <form action="information.html?item=1" method="post" enctype="multipart/form-data">
					<div class="user-infoPic">
                     
						<div class="filePic">
							<input type="file" class="inputPic" onchange="show(this)" name="img"> <img
								class="am-circle am-img-thumbnail" id="showing" src="<%=customer.getCustomer_img() %>"
								alt="" />
						</div>

						<p class="am-form-help">头像</p>

						<div class="info-m">
							<div>
								<b>用户名：<i><%=customer.getCustomer_nickname() %></i></b>
							</div>
							<div class="u-level">
								<span class="rank r2"> <s class="vip1"></s><a
									class="classes" href="#"><%=grad %></a>
								</span>
							</div>
							<div class="u-safety"></div>
						</div>
					</div>

					<!--个人信息 -->
					<div class="info-main">

						<div class="am-form am-form-horizontal">

							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">昵称</label>
								<div class="am-form-content">
									<input type="text" id="user-name2" name="nickname" value="<%=customer.getCustomer_nickname() %>">

								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-form-label">姓名</label>
								<div class="am-form-content">
									<input type="text" id="user-name2" name="name" value="<%=customer.getCustomer_name()%>">

								</div>
							</div>

							<div class="am-form-group">
								<label class="am-form-label">性别</label>
								<div class="am-form-content sex">
									<label class="am-radio-inline"> <input type="radio"
										name="sex" value="男" data-am-ucheck> 男
									</label> <label class="am-radio-inline"> <input type="radio"
										name="sex" value="女" data-am-ucheck> 女
									</label> <label class="am-radio-inline"> <input type="radio"
										name="sex" value="保密" data-am-ucheck> 保密
									</label>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-birth" class="am-form-label">生日</label>
								<div class="am-form-content birth">
									<div class="birth-select">
										<select data-am-selected id="years" name="years">

										</select> <em>年</em>
									</div>
									<div class="birth-select2">
										<select data-am-selected id="mons" onchange="timechange();" name="mons">

											<option value="0">1</option>
											<option value="1">2</option>
											<option value="2">3</option>
											<option value="3">4</option>
											<option value="4">5</option>
											<option value="5">6</option>
											<option value="6">7</option>
											<option value="7">8</option>
											<option value="8">9</option>
											<option value="9">10</option>
											<option value="10">11</option>
											<option value="11">12</option>
										</select> <em>月</em>
									</div>
									<div class="birth-select2">
										<select data-am-selected id="days" name="days">

										</select> <em>日</em>
									</div>
								</div>

							</div>
							<div class="am-form-group">
								<label for="user-phone" class="am-form-label">电话</label>
								<div class="am-form-content">
									<input id="user-phone" name="tel" type="tel" value="<%=customer.getCustomer_tel()%>">

								</div>
							</div>
							<div class="am-form-group">
								<label for="user-email" class="am-form-label">电子邮件</label>
								<div class="am-form-content">
									<input id="user-email" name="Email" type="email" value="<%=customer.getCustomer_emil()%>">

								</div>
							</div>
							<div class="am-form-group address">
								<div class="am-form-content address">
						
								</div>
							</div>
							<div class="am-form-group safety">
								
								<div class="am-form-content safety">

								</div>
							</div>
							<div class="info-btn">
								<input class="am-btn am-btn-danger" type="submit" value="保存修改">
							</div>

						</div>
					</div>
             </form>
<%}} %>
					
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
						<a href="#">合作伙伴</a> <a href="#">联系我们</a> <a href="#">网站地图</a> <em>2021-2021
							www.www.com 版权所有 TOP工作室</em>
					</p>
				</div>
			</div>
		</div>

		<aside class="menu">
			<ul>
				<li class="person"><a href="index.html">个人中心</a></li>
				<li class="person"><a href="#">个人资料</a>
					<ul>
						<li class="active"><a href="information.html">个人信息</a></li>
						<li><a href="safety.html">安全设置</a></li>
						<li><a href="address.html">收货地址</a></li>
					</ul></li>
				<li class="person"><a href="#">我的交易</a>
					<ul>
						<li><a href="order.html">订单管理</a></li>
						<li><a href="change.html">退款售后</a></li>
					</ul></li>
				<li class="person"><a href="#">我的资产</a>
					<ul>
						<li><a href="coupon.html">优惠券 </a></li>
						<li><a href="bonus.html">红包</a></li>
						<li><a href="bill.html">账单明细</a></li>
					</ul></li>

				<li class="person"><a href="#">我的小窝</a>
					<ul>
						<li><a href="collection.html">收藏</a></li>
						<li><a href="foot.html">足迹</a></li>
						<li><a href="comment.html">评价</a></li>
						<li><a href="news.html">消息</a></li>
					</ul></li>

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
			for (var i = 1999; i <= 3000; i++) {
				var op = document.createElement("option");
				op.innerHTML = i;
				op.value = i;
				document.getElementById("years").appendChild(op);
			}
		}

		function timechange() {
			var years = document.getElementById("years").value;
			var mons = document.getElementById("mons").value;
			document.getElementById("days").innerHTML="";
			var datetime = 31;
			var arry = [ "3", "5", "8", "10" ];

			if (arry.indexOf(mons) != -1) {
				datetime = 30;
			}

			if (mons == 1) {
				if (years % 4 == 0 && years % 100 != 0 || years % 400 == 0) {
					datetime = 29;
				} else {
					datetime = 28;
				}
			}

			for (var i = 1; i <= datetime; i++) {
				var op2 = document.createElement("option");
				op2.innerHTML = i;
				op2.value = i;
				document.getElementById("days").appendChild(op2);
			}

		}
	</script>
	<script type="text/javascript">
		function show(f) {
			var reader = new FileReader();//创建文件读取对象
			var files = f.files[0];//获取file组件中的文件
			reader.readAsDataURL(files);//文件读取装换为base64类型
			reader.onloadend = function(e) {
				//加载完毕之后获取结果赋值给img
				document.getElementById("showing").src = this.result;
			}
		}
	</script>
	
</body>

</html>