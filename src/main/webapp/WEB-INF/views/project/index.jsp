<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
</head>
<body>

<section>
    <jsp:include page="../common/leftmenu.jsp" flush="true">
        <jsp:param name="nav" value="2"/>
    </jsp:include>
    <div class="mainpanel">
        <div class="pageheader">
            <div class="row">
                <div class="col-md-11">
                    <h2>
                        <i class="fa fa-briefcase"></i>项目管理<span>包括:接口;Bug;状态码;文档;成员信息</span>
                    </h2>
                </div>
                <div class="col-md-1">
                    <p>
                        <a class="btn btn-primary" href="create">新增项目 </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="contentpanel">
            <div class="row">
                <div class="people-list">
                    <div class="row">
                        <c:if test="${param.status.equals('true')}">
                            <div class="col-md-12" id="action_alert">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert"
                                            aria-hidden="true">&times;</button>
                                    操作成功!
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${projects.size()==0}">
                            <div class="col-md-12">
                                <div class="alert alert-danger">
                                    <button type="button" class="close" data-dismiss="alert"
                                            aria-hidden="true">&times;</button>
                                    您目前还没有创建项目!
                                </div>
                            </div>
                        </c:if>
                        <c:forEach var="project" items="${projects}">

                            <div class="col-md-6">
                                <div class="people-item">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="person-name">
                                                <a href="view?id=${project.id}">${project.title}</a><span
                                                    class="pull-right badge badge-danger">Version:${project.version}</span>
                                            </h4>
                                            <div class="text-muted">
                                                <i class="fa fa-calendar"></i> ${project.relativedate}
                                            </div>
                                            <div class="text-muted m_textoverflow">
                                                <i class="fa fa-briefcase"></i> ${project.description}
                                            </div>
                                            <ul class="social-list">
                                                <li><a href="view?id=${project.id}"
                                                       class="tooltips" data-toggle="tooltip"
                                                       data-placement="top" title="基础管理"><i
                                                        class="fa fa-gear"></i></a></li>
                                                <li><a
                                                        href="../module/all?proId=${project.id}"
                                                        class="tooltips" data-toggle="tooltip"
                                                        data-placement="top" title="接口管理"><i
                                                        class="fa fa-code-fork"></i></a></li>
                                                <li><a href="../bug/all?proId=${project.id}"
                                                       class="tooltips" data-toggle="tooltip"
                                                       data-placement="top" title="Bug管理"><i
                                                        class="fa fa-bug"></i></a></li>
                                                <li><a href="../code/all?proId=${project.id}"
                                                       class="tooltips" data-toggle="tooltip"
                                                       data-placement="top" title="业务码管理"><i
                                                        class="fa fa-file-code-o"></i></a></li>
                                                <li><a
                                                        href="preview?id=${project.id}" class="tooltips"
                                                        data-toggle="tooltip" data-placement="top" title="预览文档"><i
                                                        class="fa fa-eye"></i></a></li>
                                                <li>
                                                    <a id="share"
                                                       data-content="${host}/${project.sharelink}"
                                                       data-placement="top" data-toggle="popover" data-container="body"
                                                       class="btn btn-default popovers tooltips"
                                                       data-toggle="tooltip" data-placement="top"
                                                       title="🔗  复制链接分享文档"><i
                                                            class="fa fa-external-link"></i></a></li>
                                                    <%--<li><a target="_blank"--%>
                                                    <%--href="../doc/${project.id}" class="tooltips"--%>
                                                    <%--data-toggle="tooltip" data-placement="top" title="成员管理"><i--%>
                                                    <%--class="fa fa-users"></i></a></li>--%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
