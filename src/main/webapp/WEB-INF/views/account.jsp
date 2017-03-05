<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="common/style.jsp"></jsp:include>
</head>
<body class="horizontal-menu">
	<section>
		<div class="mainpanel">
			<jsp:include page="common/menu.jsp" flush="true">
				<jsp:param name="nav" value="1" /></jsp:include>
			<div class="pageheader">
				<h2>
					<i class="glyphicon glyphicon-cog"></i>账户<span>更改密码</span>
				</h2>
			</div>
			<div class="contentpanel">
				<div class="row">
					<div class="col-md-12">
						<form id="form1" class="form-horizontal"
							action="../dashboard/change.do" method="post">
							<div class="panel panel-default">
								<div class="panel-body">

									<div class="form-group">
										<label class="col-sm-2 control-label">用户名</label>
										<div class="col-sm-10">
											<input type="text" name="username" class="form-control"
												value="${user.username }" readonly="readonly" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">现密码</label>
										<div class="col-sm-10">
											<input type="password" name="passwd" class="form-control"
												placeholder="请输入您目前使用的密码" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">新密码</label>
										<div class="col-sm-10">
											<input type="password" name="passwdnew" class="form-control"
												placeholder="请输入您要更改的新密码" />
										</div>
									</div>
								</div>
								<div class="panel-footer">
									<button class="btn btn-primary" type="submit">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="common/scripts.jsp"></jsp:include></body>
</html>
