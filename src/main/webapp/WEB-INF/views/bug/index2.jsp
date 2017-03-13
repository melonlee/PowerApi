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
                                    <th>代&nbsp;号&nbsp;</th>
                                    <th>描&nbsp;述&nbsp;</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="bug" items="${bugs}">
                                    <tr>
                                        <td><c:if test="${bug.isUpdate==1}">
                                            <span class="pull-right badge badge-danger">更新</span>
                                        </c:if></td>
                                        <td><c:if test="${bug.status==1}">
                                            <span class="pull-right badge badge-success">已解决</span>
                                        </c:if></td>
                                        <td>${bug.sign}</td>
                                        <td>${bug.description}</td>
                                        <td class="table-action"><a
                                                href="view?id=${bug.id }&proId=${project.id}"
                                                class="edit-row"><i class="fa fa-pencil"></i></a>&nbsp;<a
                                                href="delete?id=${bug.id }" class="delete-row"><i
                                                class="fa fa-trash-o"></i></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <ul class="pagination pagination-split nomargin">
                            <li class="disabled"><a href="#"><i
                                    class="fa fa-angle-left"></i></a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
