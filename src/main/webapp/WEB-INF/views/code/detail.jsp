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
            <jsp:param name="entity" value="业务码"/>
            <jsp:param name="index" value="4"/>
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
                                    <c:if test="${not empty code}">
                                        <input type="hidden" name="id" value="${code.id}"/>
                                    </c:if>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">业务码</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="code" class="form-control"
                                                   value="${code.code}" placeholder="200"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">业务码描述</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="description" class="form-control"
                                                   value="${code.description}" placeholder="主要描述在什么状态下出现该业务码"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">标记变更</label>
                                        <div class="col-sm-10">
                                            <div class="ckbox ckbox-danger">
                                                <input type="checkbox" id="checkbox1" name="isUpdate"
                                                ${code.isUpdate==1 ? "checked='checked'" : '' } value=1>
                                                <label for="checkbox1" class="m_checkbox_top"></label>

                                            </div>
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
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
