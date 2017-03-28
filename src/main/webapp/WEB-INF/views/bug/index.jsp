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
    <jsp:include page="../common/leftmenu.jsp" flush="true">
        <jsp:param name="nav" value="2"/>
    </jsp:include>
    <div class="mainpanel">
        <jsp:include page="../common/pageheader.jsp">
            <jsp:param name="entity" value="Bug"/>
            <jsp:param name="index" value="3"/>
        </jsp:include>

        <div class="tab-content">
            <div class="tab-pane active">
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
                                <table class="table table-success table-buglist">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>#</th>
                                        <th>问题描述</th>
                                        <th>提出时间</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="bug" items="${bugs}">
                                        <tr>
                                            <td><c:if test="${bug.status==0}">
                                                <span class="pull-right badge badge-danger">未解决</span>
                                            </c:if>
                                                <c:if test="${bug.status==1}">
                                                    <span class="pull-right badge badge-success">已解决</span>
                                                </c:if>
                                            </td>
                                            <td>#${bug.id}</td>
                                            <td> ${bug.title} </td>
                                            <td>${bug.relativedate}</td>
                                            <td class="table-action"><a
                                                    href="view?id=${bug.id }&proId=${project.id}"
                                                    class="edit-row"><i class="fa fa-eye"></i></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
