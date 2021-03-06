<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<htmlhtml xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css" />
<link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript"
	src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="js/lrtk.js" type="text/javascript"></script>
<!-- 引入Angularjs -->
<script type="text/javascript" src="angularjs/angular.min.js"></script>
<script type="text/javascript" src="angularjs/base.js"></script>
<script type="text/javascript" src="angularjs/service/prodCatService.js"></script>
<script type="text/javascript" src="angularjs/service/prodService.js"></script>
<script type="text/javascript" src="angularjs/service/brandService.js"></script>
<script type="text/javascript"
	src="angularjs/controller/baseController.js"></script>
<script type="text/javascript"
	src="angularjs/controller/prodCatController.js"></script>
<!-- 引入jQueryDataTable操作商品列表js -->
<script type="text/javascript" src="custom/productList.js"></script>
<script type="text/javascript" src="custom/operation.js"></script>
<script type="text/javascript" src="custom/customWebUpload.js"></script>

<title>产品列表</title>
</head>

<body ng-app="itcast-shop" ng-controller="productController"
	ng-init="findAllProdCat()">
	<div class=" page-content clearfix">
		<div id="products_style">
			<div class="search_style">
				<div class="title_names">搜索查询</div>
				<ul class="search_content clearfix">
					<li><label class="l_f">产品名称</label><input name="" type="text"
						class="text_add" placeholder="输入品牌名称" style="width: 250px" /></li>
					<li><label class="l_f">添加时间</label><input
						class="inline laydate-icon" id="start" style="margin-left: 10px;"></li>
					<li style="width: 90px;"><button type="button"
							class="btn_search">
							<i class="icon-search"></i>查询
						</button></li>
				</ul>
			</div>
			<div class="border clearfix">
				<span class="l_f"> <a href="addPro.jsp" title="添加商品" 
					class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
					<a href="javascript:ovid()" class="btn btn-danger"><i
						class="icon-trash"></i>批量删除</a>
				</span> <span class="r_f">共：<b>2334</b>件商品
				</span>
			</div>
			<!--产品列表展示-->
			<div class="h_products_list clearfix" id="products_list">
				<div id="scrollsidebar" class="left_Treeview">
					<div class="show_btn" id="rightArrow">
						<span></span>
					</div>
					<div class="widget-box side_content">
						<div class="side_title">
							<a title="隐藏" class="close_btn"><span></span></a>
						</div>
						<div class="side_list">
							<div class="widget-header header-color-green2">
								<h4 class="lighter smaller">产品分类</h4>
							</div>
							<div class="widget-body">
								<div class="widget-main padding-8">
									<div id="treeDemo" class="ztree"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="table_menu_list" id="testIframe">
					<table class="table table-striped table-bordered table-hover"
						id="sample-table">
						<thead>
							<tr>
								<th width="25px"><label><input type="checkbox"
										class="ace"><span class="lbl"></span></label></th>
								<th width="80px">产品编号</th>
								<th width="250px">产品名称 </th>
								<th width="100px">原价格</th>
								<th width="100px">现价</th>
								<th width="100px">所属地区/国家</th>
								<th width="180px">加入时间</th>
								<th width="80px">审核状态</th>
								<th width="70px">状态</th>
								<th width="200px">操作</th>
							</tr>
								<!-- c:forEach:循环标签 -->
							<c:forEach items="${Products}" var="pro">
								<tr>
								<td width="25px"><label><input type="checkbox"
										class="ace"><span class="lbl"></span></label></td>
									<td>${pro.shoppingid }</td>
									<td>${pro.shoppingname }</td>
									<td>${pro.costprice }</td>
									<td>${pro.rulingprice }</td>
									<td>${pro.adress }</td>
									<td>${pro.addtime }</td>
									<td>${pro.shentai }</td>
									<td>${pro.zhuangtai }</td>
									<td><a<%--  href="delPro?id=${pro.id }" --%>>删除</a>
									 <a <%-- href="update.jsp?id=${pro.id }&name=${pro.name }&sex=${pro.sex }&age=${pro.age }&classId=${pro.classId }" --%>>修改</a>
									</td>
								</tr>
							</c:forEach>
						</thead>
	
					
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

</html>