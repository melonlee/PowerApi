<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
</head>
<body class="horizontal-menu">
<section>
    <div class="mainpanel">
        <jsp:include page="../common/menu.jsp" flush="true">
            <jsp:param name="nav" value="2"/>
        </jsp:include>
        <jsp:include page="../common/pageheader.jsp">
            <jsp:param name="entity" value="模块"/>
            <jsp:param name="index" value="2"/>
        </jsp:include>
        <div class="tab-content">
            <div class="tab-pane active">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <h4>模块信息编辑</h4>
                                        <form id="form1" class="form-horizontal" method="post"
                                              action="modify">
                                            <input type="hidden" name="pId" value="${project.id}"/>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <c:if test="${not empty module}">
                                                        <input type="hidden" name="id" value="${module.id}"/>
                                                    </c:if>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">模块名称</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name=title class="form-control"
                                                                   value="${module.title}" placeholder="用户模块"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">模块路由</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="url" class="form-control"
                                                                   value="${module.url}" placeholder="/user  or /book"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">模块描述</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="description"
                                                                   class="form-control" value="${module.description}"
                                                                   placeholder="主要描述模块基本信息"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    <button class="btn btn-primary" type="submit">提交</button>
                                                    <button class="btn btn-default" type="button"
                                                            onclick="javascript:window.history.back()">取消
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
