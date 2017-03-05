<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="common/style.jsp"></jsp:include>
</head>

<body class="signin">

	<section>
	<div class="signuppanel">

		<div class="row">

			<div class="col-md-6">

				<div class="signup-info">
					<div class="logopanel">
						<h1>
							<span>[</span> Power.API <span>]</span>
						</h1>
					</div>
					<!-- logopanel -->

					<div class="mb20"></div>

					<h5>
						<strong>欢迎来到Power.API!</strong>
					</h5>
					<p>移动互联网时代，Power.API是一个为您提供API协同管理、API测试、API文档生成的综合性服务平台。
						你还在用Word管理接口文档吗？你还在使用拼接URL测试吗？你OUT了！</p>
					<div class="mb20"></div>

					<div class="feat-list">
						<i class="fa fa-wrench"></i>
						<h4 class="text-success">在线管理，接口实时更新</h4>
						<p>在线添加，编辑接口，接口内容实时更新， 保证团队成员始终浏览到文档的最新状态， 告别Word文档传阅版本混乱</p>
					</div>

					<div class="feat-list">
						<i class="fa fa-compress"></i>
						<h4 class="text-success">测试工具，告别拼接URL参数</h4>
						<p>接口测试一键生成，通过测试记录可分析接口的可用性</p>
					</div>

					<div class="feat-list mb20">
						<i class="fa fa-search-plus"></i>
						<h4 class="text-success">细分权限，保障接口数据安全</h4>
						<p>对不同项目内容和人员分配具体权限，确保您的数据操作安全</p>
					</div>

				</div>
				<!-- signup-info -->

			</div>
			<!-- col-sm-6 -->

			<div class="col-md-6">

				<c:if test="${param.status==0}">
					<div class="alert alert-danger">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">&times;</button>
						注册失败!请检查您输入的信息!
					</div>
				</c:if>


				<form method="post" action="signup.do" id="basicForm2">

					<div class="error"></div>

					<h3 class="nomargin">免费注册</h3>
					<p class="mt5 mb20">
						已经是会员? <a href="signin_view.do"><strong>登录</strong></a>
					</p>

					<div class="mb10">
						<label class="control-label">邮箱地址</label> <input type="email"
							name="email" class="form-control" title="您输入的邮箱格式不正确!"
							placeholder="请输入您的邮箱" required />
					</div>

					<div class="mb10">
						<label class="control-label">用户名</label><input type="text"
							name="username" class="form-control" placeholder="您的账户名和登录名"
							required />
					</div>

					<div class="mb10">
						<label class="control-label">密码</label> <input type="password"
							name="passwd" class="form-control" placeholder="建议至少使用两种字符组合"
							required />
					</div>
					<br />
					<button class="btn btn-success btn-block" type="submit">注册</button>
				</form>
			</div>
			<!-- col-sm-6 -->

		</div>
		<!-- row -->

		<div class="signup-footer">
			<div class="pull-left">
				&copy;2016 <a href="http://www.melonlee.com">Melon</a>@www.powerapi.cn
				All Rights Reserved.京ICP备:15006746
			</div>
		</div>

	</div>
	<!-- signuppanel --> </section>


	<jsp:include page="common/scripts.jsp"></jsp:include>
	<script>
		jQuery("#basicForm2").validate({
			errorLabelContainer : jQuery("#basicForm2 div.error")
		});

		jQuery(".select2").select2({
			width : '100%',
			minimumResultsForSearch : -1
		});

		jQuery(".select2-2").select2({
			width : '100%'
		});

		// Please do not use the code below
		// This is for demo purposes only
		var c = jQuery.cookie('change-skin');
		if (c && c == 'greyjoy') {
			jQuery('.btn-success').addClass('btn-orange').removeClass(
					'btn-success');
		} else if (c && c == 'dodgerblue') {
			jQuery('.btn-success').addClass('btn-primary').removeClass(
					'btn-success');
		} else if (c && c == 'katniss') {
			jQuery('.btn-success').addClass('btn-primary').removeClass(
					'btn-success');
		}
	</script>

</body>
</html>
