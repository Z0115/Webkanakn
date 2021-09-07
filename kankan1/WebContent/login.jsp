<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>商城登录</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<script src="js/jquery-3.3.1.min.js" type="text/javascript"
	charset="utf-8"></script>
	
	 
</head>

<body bgcolor="#457ebc">
	<div id="title">
		
	</div>

	<div id="content">
		<div class="content-img content-left">
			<img src="images/big.jpg" />
		</div>

		<div class="login content-left">
			<div class="login-title">
				<div class="login-titles">TOP商城</div>
				<div class="zhuche">
					<a href="register.jsp">注册</a>
				</div>
			</div>
			<form action="login.do" method="post">
				<table class="tables"
					style="border-collapse: separate; border-spacing: 0px 30px;">
					<tr>
						<td colspan="2"><input class="username" type="text"
							name="username" value="" placeholder="邮箱/手机/用户名" /></td>
					</tr>
					<tr>
						<td colspan="2"><input class="userpwd" type="password"
							name="userpwd" value="" placeholder="请输入密码" /></td>
					</tr>
					<tr>
						<td><input type="checkbox" />记住密码</td>
						<td><a href="#">忘记密码</a></td>
					</tr>
					<tr>
						<td colspan="2"><input class="login-button" type="submit"
							value="登录" /></td>
					</tr>


				</table>


			</form>
			
		</div>
		
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