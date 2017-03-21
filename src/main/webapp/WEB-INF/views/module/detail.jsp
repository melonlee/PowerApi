<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <jsp:param name="entity" value="模块"/>
            <jsp:param name="index" value="2"/>
        </jsp:include>
        <div class="tab-content">
            <div class="tab-pane active">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <h4>编辑模块信息</h4>
                                        <form id="form1" class="form-horizontal" method="post"
                                              action="modify">
                                            <input type="hidden" name="pId" value="${project.id}"/>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <c:if test="${not empty module}">
                                                        <input type="hidden" name="id" value="${module.id}"/>
                                                    </c:if>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">模块名称</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name=title class="form-control"
                                                                   value="${module.title}" placeholder="用户模块"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">模块路由</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="url" class="form-control"
                                                                   value="${module.url}" placeholder="/user  or /book"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">模块描述</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="description"
                                                                   class="form-control" value="${module.description}"
                                                                   placeholder="主要描述模块基本信息"/>
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
                                                    <c:if test="${not empty module}">
                                                        <div class="pull-right">
                                                            <a class="btn btn-danger btn-block" id="remove_module"
                                                               data-id="${module.id}">
                                                                删除该模块
                                                            </a>
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
            </div>
        </div>
    </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
<script type="text/javascript">

    $(document).on("click", "#remove_module", function () {
        if (window.confirm('确定删除该模块吗? 删除后该模块下的所有内容将被删除!')) {
            $.ajax({
                type: 'GET',
                url: '../module/delete',
                data: {
                    id: ${module.id}
                },
                cache: false,
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    if (data.code == 1000) {
                        window.location.href = "../module/all?proId=" +${project.id};
                    } else {
                        alert('删除失败请重试!');
                    }
                },
                error: function () {
                    alert("获取数据异常，请重试!");
                }
            });
            return true;
        } else {
            return false;
        }
    });
</script>
</body>
</html>
