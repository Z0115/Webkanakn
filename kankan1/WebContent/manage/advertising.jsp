<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style.css" />
<link href="assets/css/codemirror.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css" />
<link rel="stylesheet" href="font/css/font-awesome.min.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<script src="js/lrtk.js" type="text/javascript"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="Widget/swfupload/swfupload.js"></script>
<script type="text/javascript" src="Widget/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="Widget/swfupload/swfupload.speed.js"></script>
<script type="text/javascript" src="Widget/swfupload/handlers.js"></script>
<!-- 导入jquery插件 -->
<script type="text/javascript"
	src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>

<!-- 引入Angularjs -->
<script type="text/javascript" src="angularjs/angular.min.js"></script>
<script type="text/javascript" src="angularjs/base.js"></script>
<script type="text/javascript" src="angularjs/service/adService.js"></script>
<script type="text/javascript"
	src="angularjs/controller/adController.js"></script>
<script type="text/javascript"
	src="angularjs/controller/baseController.js"></script>
<!-- <!-- 引入jQueryDataTable广告内容 -->
<script type="text/javascript" src="custom/ad_operation.js"></script>
<script type="text/javascript" src="custom/ad_content.js"></script> -->

<title>广告管理</title>
</head>

<body ng-app="itcast-shop" ng-controller="adController"
	ng-init="findAllAdCat()">
	<div class=" clearfix" id="advertising">
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
						<h4 class="lighter smaller">广告图分类</h4>
					</div>
					<div class="widget-body">
						<div class="widget-main padding-8">
							<div id="treeDemo" class="ztree"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="Ads_list">
			<div class="border clearfix">
				<span class="l_f"> <a href="javascript:ovid()" id="ads_add"
					class="btn btn-warning"><i class="fa fa-plus"></i> 添加广告</a> <a
					href="javascript:ovid()" class="btn btn-danger"><i
						class="fa fa-trash"></i> 批量删除</a>
				</span> <span class="r_f">共：<b>45</b>条广告
				</span>
			</div>
			<div class="Ads_lists">
				<table class="table table-striped table-bordered table-hover"
					id="sample-table">
					<thead>
						<tr>
							<th width="25"><label><input type="checkbox"
									class="ace"><span class="lbl"></span></label></th>
							<th width="80">ID</th>
							<th>排序</th>
							<th width="100">分类</th>
							<th width="240px">图片</th>
							<th width="150px">尺寸（大小）</th>
							<th width="250px">链接地址</th>
							<th width="180">加入时间</th>
							<th width="70">状态</th>
							<th width="250">操作</th>
						</tr>
					</thead>
					<tbody>
						<!-- 展示广告内容位置 -->
						<tr>
							<td><input type="button"/></td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>	
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!--添加广告样式-->
	<div id="add_ads_style" style="display: none">
		<div class="add_adverts">
			<ul>
				<li><label class="label_name">所属分类</label> <span
					class="cont_style"> <select class="form-control"
						id="form-field-select-1">
							<option value="">选择分类</option>
							<option value="AL">首页大幻灯片</option>
							<option value="AK">首页小幻灯片</option>
							<option value="AZ">单广告图</option>
							<option value="AR">其他广告</option>
							<option value="CA">板块栏目广告</option>
					</select></span></li>
				<li><label class="label_name">图片尺寸</label><span
					class="cont_style"> <input name="长" type="text"
						id="form-field-1" placeholder="0" class="col-xs-10 col-sm-5"
						style="width: 80px"> <span class="l_f"
							style="margin-left: 10px;">x</span><input name="宽" type="text"
							id="form-field-1" placeholder="0" class="col-xs-10 col-sm-5"
							style="width: 80px"></span></li>
				<li><label class="label_name">显示排序</label><span
					class="cont_style"><input name="排序" type="text"
						id="form-field-1" placeholder="0" class="col-xs-10 col-sm-5"
						style="width: 50px"></span></li>
				<li><label class="label_name">链接地址</label><span
					class="cont_style"><input name="地址" type="text"
						id="form-field-1" placeholder="地址" class="col-xs-10 col-sm-5"
						style="width: 450px"></span></li>
				<li><label class="label_name">状&nbsp;&nbsp;态：</label> <span
					class="cont_style"> &nbsp;&nbsp;<label><input
							name="form-field-radio1" type="radio" checked="checked"
							class="ace"><span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;
						<label><input name="form-field-radio1" type="radio"
							class="ace"><span class="lbl">隐藏</span></label></span>
					<div class="prompt r_f"></div></li>
				<li><label class="label_name">图片</label><span
					class="cont_style">
						<div class="demo">
							<div class="logobox">
								<div class="resizebox">
									<img src="images/image.png" width="100px" alt="" height="100px" />
								</div>
							</div>
							<div class="logoupload">
								<div class="btnbox">
									<a id="uploadBtnHolder" class="uploadbtn" href="javascript:;">上传替换</a>
								</div>
								<div style="clear: both; height: 0; overflow: hidden;"></div>
								<div class="progress-box" style="display: none;">
									<div class="progress-num">
										上传进度：<b>0%</b>
									</div>
									<div class="progress-bar">
										<div style="width: 0%;" class="bar-line"></div>
									</div>
								</div>
								<div class="prompt">
									<p>图片大小小于5MB,支持.jpg;.gif;.png;.jpeg格式的图片</p>
								</div>
							</div>
						</div>
				</span></li>


			</ul>
		</div>
	</div>
</body>

</html>
<script>
	//初始化宽度、高度  
	$(".widget-box").height($(window).height());
	$(".Ads_list").width($(window).width() - 220);
	//当文档窗口发生改变时 触发  
	$(window).resize(function () {
		$(".widget-box").height($(window).height());
		$(".Ads_list").width($(window).width() - 220);
	});
	/* $(function () {
		$("#advertising").fix({
			float: 'left',
			//minStatue : true,
			skin: 'green',
			durationTime: false,
			stylewidth: '220',
			spacingw: 30, //设置隐藏时的距离
			spacingh: 250, //设置显示时间距
			set_scrollsidebar: '.Ads_style',
			table_menu: '.Ads_list'
		});
	}); */
	
</script>
<script type="text/javascript">
	function updateProgress(file) {
		$('.progress-box .progress-bar > div').css('width', parseInt(file.percentUploaded) + '%');
		$('.progress-box .progress-num > b').html(SWFUpload.speed.formatPercent(file.percentUploaded));
		if (parseInt(file.percentUploaded) == 100) {
			// 如果上传完成了
			$('.progress-box').hide();
		}
	}

	function initProgress() {
		$('.progress-box').show();
		$('.progress-box .progress-bar > div').css('width', '0%');
		$('.progress-box .progress-num > b').html('0%');
	}

	function successAction(fileInfo) {
		var up_path = fileInfo.path;
		var up_width = fileInfo.width;
		var up_height = fileInfo.height;
		var _up_width, _up_height;
		if (up_width > 120) {
			_up_width = 120;
			_up_height = _up_width * up_height / up_width;
		}
		$(".logobox .resizebox").css({
			width: _up_width,
			height: _up_height
		});
		$(".logobox .resizebox > img").attr('src', up_path);
		$(".logobox .resizebox > img").attr('width', _up_width);
		$(".logobox .resizebox > img").attr('height', _up_height);
	}
	
</script>
<script>
	jQuery(function ($) {

		$('table th input:checkbox').on('click', function () {
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function () {
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});

		});
		
	})
</script>