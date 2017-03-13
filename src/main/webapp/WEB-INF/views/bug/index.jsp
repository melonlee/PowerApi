<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
            <jsp:param name="entity" value="Bug"/>
        </jsp:include>

        <div class="contentpanel">

            <ul class="nav nav-tabs nav-dark">
                <li class="active"><a data-toggle="tab" href="#all"><strong>基础管理</strong></a></li>
                <li><a data-toggle="tab" href="#added"><strong>接口管理</strong></a></li>
                <li><a data-toggle="tab" href="#assigned"><strong>Bug管理</strong></a></li>
                <li><a data-toggle="tab" href="#unresolved"><strong>业务码管理</strong></a></li>
                <li><a data-toggle="tab" href="#resolved"><strong>文档预览</strong></a></li>
            </ul>
            <div class="tab-content">
                <div id="all" class="tab-pane active">
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
                        <c:if test="${bugs.size()==0}">
                            <div class="col-md-12">
                                <div class="alert alert-danger">
                                    <button type="button" class="close" data-dismiss="alert"
                                            aria-hidden="true">&times;</button>
                                    您目前还没有Bug清单!
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${bugs.size()>0}">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-danger table-buglist">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th>问题描述</th>
                                            <th>创建者</th>
                                            <th>提出时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="bug" items="${bugs}">
                                            <tr>
                                                <td><c:if test="${bug.status==1}">
                                                    <span class="pull-right badge badge-danger">未解决</span>
                                                </c:if>
                                                    <c:if test="${bug.status==0}">
                                                        <span class="pull-right badge badge-success">已解决</span>
                                                    </c:if>
                                                </td>
                                                <td>#${bug.id}</td>
                                                <td>
                                                    <a href="view?id=${bug.id }&proId=${project.id}"
                                                       class="edit-row">${bug.title}</a>
                                                </td>
                                                <td>${bug.description}</td>
                                                <td>${bug.description}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <ul class="pagination pagination-split nomargin">
                        <li class="disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>
                        <li><a href="#">1</a></li>
                        <li class="active"><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>

                <div id="added" class="tab-pane">
                    <p><strong>Note:</strong> Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                        ad minim veniam, quis nostrud exercitatio.</p>
                </div><!-- tab-pane -->

                <div id="assigned" class="tab-pane">
                    Assigned To Me
                </div><!-- tab-pane -->

                <div id="unresolved" class="tab-pane">
                    Unresolved
                </div><!-- tab-pane -->

                <div id="resolved" class="tab-pane">
                    Resolved Recently
                </div><!-- tab-pane -->

            </div><!-- tab-content -->

        </div><!-- contentpanel -->
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
