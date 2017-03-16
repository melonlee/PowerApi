<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"/>
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
            <div class="row">
                <c:if test="${status>0}">
                    <div class="col-md-12" id="action_alert">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">&times;</button>
                            操作成功!
                        </div>
                    </div>
                </c:if>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-sm-3 col-lg-2">
                            <ul class="nav nav-pills nav-stacked nav-email mb20"
                                id="module_nav">
                                <c:forEach var="module" items="${modules}">
                                    <li id="${module.id}" title="${module.title}"
                                        data-url="${module.url}" data-desc="${module.description}"
                                        data-pro="${project.id}"
                                        class="module_nav_row"><a href="#"> <i
                                            class="glyphicon glyphicon-folder-open"></i> ${module.title }<span
                                            class="pull-right badge badge-success">${module.functions }</span>
                                    </a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="col-sm-9 col-lg-10">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="panel panel-success">
                                        <div class="panel-heading">
                                            <div class="panel-btns">
                                                <a id="panel_module_modify" href="#" title="编辑"><i
                                                        class="fa  fa-cog mr5"></i> </a> <a href=""
                                                                                            class="minimize">&minus;</a>
                                            </div>
                                            <h4 class="panel-title" id="panel_module_url"></h4>
                                        </div>
                                        <div class="panel-body" id="panel_module_desc"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="pull-right">
                                        <button class="btn btn-sm btn-primary tooltips" type="button"
                                                id="create_function" data-toggle="tooltip" title="新增接口">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                        <br/> <br/>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover mb30">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>地址</th>
                                                <th>创建时间</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody id="function_row"></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p>
                                        <button class="btn btn-danger btn-block" id="module_remove">删除该模块</button>
                                    </p>
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
<script src="${host}/static/js/service/module.js"></script>
</body>
</html>
