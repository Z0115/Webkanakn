<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>

<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport"
		content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/style.css" />
	<link href="assets/css/codemirror.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/ace.min.css" />
	<link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
	<link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
	<link href="Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
	<!-- 引入Angularjs -->
	<script type="text/javascript" src="angularjs/angular.min.js"></script>
	<script type="text/javascript" src="angularjs/base.js"></script>
	<script type="text/javascript" src="angularjs/service/prodCatService.js"></script>
	<script type="text/javascript" src="angularjs/service/prodService.js"></script>
	<script type="text/javascript" src="angularjs/service/brandService.js"></script>
	<script type="text/javascript" src="angularjs/controller/baseController.js"></script>
	<script type="text/javascript" src="angularjs/controller/prodCatController.js"></script>
	<title>新增商品</title>
</head>

<body ng-app="itcast-shop" ng-controller="productController" ng-init="findAllProdCat();findAllBrand()">
	<div class="clearfix" id="add_picture">
		<div id="scrollsidebar" class="left_Treeview">
			<div class="show_btn" id="rightArrow"><span></span></div>
			<div class="widget-box side_content">
				<div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
				<div class="side_list">
					<div class="widget-header header-color-green2">
						<h4 class="lighter smaller">选择产品类型</h4>
					</div>
					<div class="widget-body">
						<div class="widget-main padding-8">
							<div id="treeDemo" class="ztree"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="page_right_style">
			<div class="type_title">添加商品</div>
			<div class="form form-horizontal" id="form-article-add">
				<div class="clearfix cl">
					<label class="form-label col-2"><span class="c-red">*</span>商品名称：</label>
					<div class="formControls col-9"><input type="text" class="input-text" value=""
							ng-model="productInfo.product.productName" placeholder="" id="" name=""></div>
				</div>
				<div class=" clearfix cl">
					<label class="form-label col-2">标题：</label>
					<div class="formControls col-9"><input type="text" class="input-text"
							ng-model="productInfo.product.caption" value="" placeholder="" id="" name=""></div>
				</div>
				<div class=" clearfix cl">

					<div class="Add_p_s">
						<label class="form-label col-2">品&nbsp;&nbsp;&nbsp;&nbsp;牌：</label>
						<select ng-model="productInfo.product.brandId"
							ng-options="brand.id as brand.name for brand in brandList"></select>
					</div>


					<div class="Add_p_s">
						<label class="form-label col-2">价格：</label>
						<div class="formControls col-2"><input type="text" class="input-text"
								ng-model="productInfo.product.price" value="" placeholder="" id="" name="">元</div>
					</div>
				</div>
				<div class="clearfix cl">
					<label class="form-label col-2">内容摘要：</label>
					<div class="formControls col-10">
						<textarea name="" cols="" rows="" ng-model="productInfo.productDesc.introduction"
							class="textarea" placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true"
							nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)"></textarea>
						<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
					</div>
				</div>

				<div class="clearfix cl">
				<!-- 图片上传后返回的图片地址 -->
					<input type="text" hidden="true" value="" id="prodImgs">
					<label class="form-label col-2">图片上传：</label>
					<div class="formControls col-10">
						<div class="uploader-list-container">
							<div class="queueList">
								<div id="dndArea" class="placeholder">
									<div id="filePicker-2"></div>
									<p>或将照片拖到这里，单次最多可选10张</p>
								</div>
							</div>
							<div class="statusBar" style="display:none;">
								<div class="progress"> <span class="text">0%</span> <span class="percentage"></span>
								</div>
								<div class="info"></div>
								<div class="btns">
									<div id="filePicker2"></div>
									<div class="uploadBtn">开始上传</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix cl">
					<label class="form-label col-2">详细内容：</label>
					<div class="formControls col-10">
						<script id="editor" type="text/plain" style="width:100%;height:400px;"></script>
					</div>
				</div>

				<div class="clearfix cl">
					<div class="Button_operation">
						<button ng-click="addProductInfo()" class="btn btn-primary radius">
							<i class="icon-save "></i>保存并提交审核</button>
						<button onClick="article_save();" class="btn btn-secondary  btn-warning" type="button"><i
								class="icon-save"></i>保存草稿</button>
						<button onClick="layer_close();" class="btn btn-default radius"
							type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>
	<script src="assets/layer/layer.js" type="text/javascript"></script>
	<script src="assets/laydate/laydate.js" type="text/javascript"></script>
	<script type="text/javascript" src="Widget/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="Widget/icheck/jquery.icheck.min.js"></script>
	<script type="text/javascript" src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript" src="Widget/Validform/5.3.2/Validform.min.js"></script>
	<script type="text/javascript" src="Widget/webuploader/0.1.5/webuploader.js"></script>
	<script type="text/javascript" src="Widget/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript" src="Widget/ueditor/1.4.3/ueditor.all.min.js"> </script>
	<script type="text/javascript" src="Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<script src="js/lrtk.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
	<script type="text/javascript" src="custom/customWebUpload.js"></script>
	<script>
		$(function () {
			$("#add_picture").fix({
				float: 'left',
				skin: 'green',
				durationTime: false,
				stylewidth: '220',
				spacingw: 0,
				spacingh: 260,
			});
		});
		$(document).ready(function () {
			//初始化宽度、高度

			$(".widget-box").height($(window).height());
			$(".page_right_style").height($(window).height());
			$(".page_right_style").width($(window).width() - 220);
			//当文档窗口发生改变时 触发  
			$(window).resize(function () {

				$(".widget-box").height($(window).height());
				$(".page_right_style").height($(window).height());
				$(".page_right_style").width($(window).width() - 220);
			});
		});
		$(function () {
			var ue = UE.getEditor('editor');
		});



		var code;

		function showCode(str) {
			if (!code) code = $("#code");
			code.empty();
			code.append("<li>" + str + "</li>");
		}
	</script>
</body>

</html>