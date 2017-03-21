<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"/>
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
        <div class="contentpanel">
            <div class="row">
                <div class="col-md-12">
                    <form id="form1" class="form-horizontal" method="post"
                          action="modify">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="title" class="form-control" placeholder="项目名称"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目版本</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="version" class="form-control" placeholder="默认1.0"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">接口后缀</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="pattern" class="form-control"
                                               placeholder="例如:.do .action 默认/"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">接口根地址</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="hostUrl" class="form-control"
                                               placeholder="http://api.xxx.com"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目描述</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="5"
                                                  name="description"></textarea>
                                    </div>
                                </div>

                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-primary" type="submit">提交项目信息</button>
                                <button class="btn btn-default" type="button"
                                        onclick="javascript:window.history.back()">返回
                                </button>
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
