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
            <jsp:param name="entity" value="项目"/>
            <jsp:param name="index" value="1"/>
        </jsp:include>
        <div class="tab-content">
            <div class="tab-pane active">
                <div class="row">
                    <div class="col-md-12">
                        <form id="form1" class="form-horizontal" method="post"
                              action="modify">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <c:if test="${not empty project}">
                                        <input type="hidden" name="id" value="${project.id}"/>
                                    </c:if>
                                </div>
                                <div class="panel-body">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="title" class="form-control"
                                                   value="${project.title}" placeholder="项目名称"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目版本</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="version" class="form-control"
                                                   value="${project.version}" placeholder="默认1.0"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">接口后缀</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="pattern" class="form-control"
                                                   value="${project.pattern}" placeholder="例如:.do .action 默认/"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">接口根地址</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="hostUrl" class="form-control"
                                                   value="${project.hostUrl}" placeholder="http://api.xxx.com"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">项目描述</label>
                                        <div class="col-sm-10">
                                        <textarea class="form-control" rows="5"
                                                  name="description">${project.description} </textarea>
                                        </div>
                                    </div>

                                </div>
                                <div class="panel-footer">
                                    <div class="pull-left">
                                        <button class="btn btn-primary" type="submit">保存更改</button>
                                        <button class="btn btn-default" type="button"
                                                onclick="javascript:window.history.back()">返回
                                        </button>
                                    </div>
                                    <c:if test="${not empty project}">
                                        <div class="pull-right">
                                            <button class="btn btn-danger btn-block" id="module_remove"
                                                    data-id="${project.id}">
                                                删除该项目
                                            </button>
                                        </div>
                                    </c:if>
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
<script type="text/javascript">
    /**
     *
     * 删除项目
     *
     */
    $(document).on("click", "#remove_pro", function () {
        var $this = $(this);
        if (window.confirm('确定删除该项目吗? 删除后该项目下的所有内容将被删除!')) {
            window.location.href = 'delete?id=' + $this.data("id");
            return true;
        } else {
            return false;
        }
    });
</script>
</body>
</html>
