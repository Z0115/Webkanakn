<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/style.css" />
		<link href="assets/css/codemirror.css" rel="stylesheet"/>
			<link rel="stylesheet" href="assets/css/ace.min.css" />
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
			<!-- 广告分类js -->
			<script type="text/javascript" src="custom/ad_category.js"></script>
			<script type="text/javascript" src="custom/adCat_operation.js"></script>
			<title>分类管理</title>
</head>

<body>
	<div class="page-content clearfix">
		<div class="sort_style">
			<div class="border clearfix">
				<span class="l_f"> <a href="javascript:ovid()" id="sort_add"
					class="btn btn-warning"><i class="fa fa-plus"></i> 添加分类</a> <a
					href="javascript:ovid()" class="btn btn-danger"><i
						class="fa fa-trash"></i> 批量删除</a>
				</span> <span class="r_f">共：<b>5</b>类
				</span>
			</div>
			<div class="sort_list">
				<table class="table table-striped table-bordered table-hover"
					id="sample-table">
					<thead>
						<tr>
							<th width="25px"><label><input type="checkbox"
									class="ace"><span class="lbl"></span></label></th>
							<th width="50px">ID</th>
							<th width="100px">分类名称</th>
							<th width="50px">数量</th>
							<th width="350px">描述</th>
							<th width="180px">加入时间</th>
							<th width="70px">状态</th>
							<th width="250px">操作</th>
						</tr>
					</thead>
					<tbody>
						<!-- 广告分类列表 -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!--添加分类-->
	<div class="sort_style_add margin" id="sort_style_add"
		style="display: none">
		<div class="">
			<ul>
				<li><label class="label_name">分类名称</label>
				<div class="col-sm-9">
						<input name="分类名称" type="text" id="form-field-1" placeholder=""
							class="col-xs-10 col-sm-5">
					</div></li>
				<li><label class="label_name">分类说明</label>
				<div class="col-sm-9">
						<textarea name="分类说明" class="form-control" id="form-field-8"
							placeholder="" onkeyup="checkLength(this);"></textarea>
						<span class="wordage">剩余字数：<span id="sy"
							style="color: Red;">200</span>字
						</span>
					</div></li>
				<li><label class="label_name">分类状态</label> <span
					class="add_content"> &nbsp;&nbsp;<label><input
							name="form-field-radio1" type="radio" checked="checked"
							class="ace"><span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;
						<label><input name="form-field-radio1" type="radio"
							class="ace"><span class="lbl">隐藏</span></label></span></li>
			</ul>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$('#sort_add').on(
			'click',
			function() {
				layer.open({
					type : 1,
					title : '添加分类',
					maxmin : true,
					shadeClose : false, //点击遮罩关闭层
					area : [ '750px', '' ],
					content : $('#sort_style_add'),
					btn : [ '提交', '取消' ],
					yes : function(index, layero) {
						var num = 0;
						var str = "";
						$(".sort_style_add input[type$='text']").each(
								function(n) {
									if ($(this).val() == "") {

										layer.alert(str += ""
												+ $(this).attr("name")
												+ "不能为空！\r\n", {
											title : '提示框',
											icon : 0,
										});
										num++;
										return false;
									}
								});
						if (num > 0) {
							return false;
						} else {
							layer.alert('添加成功！', {
								title : '提示框',
								icon : 1,
							});
							layer.close(index);
						}
					}
				});
			})

	function checkLength(which) {
		var maxChars = 200; //
		if (which.value.length > maxChars) {
			layer.open({
				icon : 2,
				title : '提示框',
				content : '您出入的字数超多限制!',
			});
			// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
			which.value = which.value.substring(0, maxChars);
			return false;
		} else {
			var curr = maxChars - which.value.length; //250 减去 当前输入的
			document.getElementById("sy").innerHTML = curr.toString();
			return true;
		}
	};

	//面包屑返回值
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.iframeAuto(index);
	$('.Order_form ,.ads_link').on('click', function() {
		var cname = $(this).attr("title");
		var cnames = parent.$('.Current_page').html();
		var herf = parent.$("#iframe").attr("src");
		parent.$('#parentIframe span').html(cname);
		parent.$('#parentIframe').css("display", "inline-block");
		parent.$('.Current_page').attr("name", herf).css({
			"color" : "#4c8fbd",
			"cursor" : "pointer"
		});
		//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
		parent.layer.close(index);

	});
	function AdlistOrders(id) {
		window.location.href = "Ads_list.html#?cid=" + id;
	};
</script>
<script type="text/javascript">
	jQuery(function($) {
		$('table th input:checkbox').on(
				'click',
				function() {
					var that = this;
					$(this).closest('table').find(
							'tr > td:first-child input:checkbox').each(
							function() {
								this.checked = that.checked;
								$(this).closest('tr').toggleClass('selected');
							});

				});

	})
</script>