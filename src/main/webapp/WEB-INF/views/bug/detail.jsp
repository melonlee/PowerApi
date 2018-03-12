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
        <jsp:include page="../common/header.jsp">
            <jsp:param name="entity" value="Bug"/>
            <jsp:param name="index" value="3"/>
        </jsp:include>
        <div class="tab-content">
            <div class="tab-pane active">
                <div class="row">
                    <div class="col-md-12">
                        <form id="form1" class="form-horizontal" method="post"
                              action="modify">

                            <input type="hidden" name="pId" value="${project.id}"/>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <c:if test="${not empty bug}">
                                        <input type="hidden" name="id" value="${bug.id}"/>
                                    </c:if>
                                </div>
                                <div class="panel-body">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">标题</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="title" class="form-control"
                                                   value="${bug.title}" placeholder="注册接口返回500..."/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Bug描述</label>
                                        <div class="col-sm-10">
                                             <textarea rows="5" class="form-control"
                                                       placeholder="主要描述在什么状态下出现该Bug"
                                                       name="description">${bug.description}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <button class="btn btn-primary" type="submit">提交</button>
                                    <a class="btn btn-default" type="button"
                                       onclick="javascript:window.history.back()">取消
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
