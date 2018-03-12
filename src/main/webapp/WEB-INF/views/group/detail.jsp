<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
</head>
<body>
<section>
    <div id="preloader">
        <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
    </div>
    <div class="contentpanel">
        <div class="pageheader">
            <div class="row">
                <div class="col-md-11">
                    <h2>
                        <i class="fa  fa-sitemap"></i>团队管理<span>管理团队成员的操作权限内容</span>
                    </h2>
                </div>
                <div class="col-md-1">
                    <p>
                        <a class="btn btn-primary" href="create">新增团队</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="tab-contentpanel">
            <div class="row">
                <div class="col-md-12">
                    <form id="form1" class="form-horizontal" method="post"
                          action="modify">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <c:if test="${not empty group}">
                                    <input type="hidden" name="id" value="${group.id}"/>
                                </c:if>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">团队名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="name" class="form-control"
                                               value="${group.name}" placeholder="200"/>
                                    </div>
                                </div>

                                <div class="panel-footer">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                    <a class="btn btn-default" type="button"
                                       onclick="javascript:window.history.back()">取消
                                    </a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
