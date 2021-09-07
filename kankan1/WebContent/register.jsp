<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>看看商城账号注册</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="css/register.css" />
<script src="js/jquery-3.3.1.min.js" type="text/javascript"
	charset="utf-8"></script>
</head>

<body>
	<div id="title">
		<img src="" />
	</div>

	<div id="content">
		<div class="content-img content-left">
			<img src="images/big.jpg" />
		</div>

		<div class="login content-left">
			<div class="login-title">
				<div class="login-titles">商城账号注册</div>
			</div>
			<form action="register.do" method="post">
				<table class="tables"
					style="border-collapse: separate; border-spacing: 0px 20px;">
					<tr>
						<td colspan="2"><input class="username" type="text"
							name="username" value="" placeholder="请输入账号" /></td>
					</tr>
					<tr>
						<td colspan="2"><input class="userpwd" type="password"
							name="userpwd" value="" placeholder="设置密码" /></td>
					</tr>
					<tr>
						<td colspan="2"><input class="userpwd" type="password"
							name="pwdOk" value="" placeholder="确认密码" /></td>
					</tr>
					<tr>
						<td><input type="checkbox" />点击表示您同意商城《服务协议》</td>

					</tr>
					<tr>
						<td colspan="2"><input class="login-button" type="submit"
							value="注册" /></td>
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
