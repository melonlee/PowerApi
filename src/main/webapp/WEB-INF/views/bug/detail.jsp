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
        <div class="pageheader">
            <div class="row">
                <div class="col-md-11">
                    <h2>
                        <i class="fa fa-file-code-o"></i>${project.title}<span>Bug清单</span>
                    </h2>
                </div>

            </div>
        </div>

        <div class="contentpanel">
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
                                    <label class="col-sm-2 control-label">代号</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="sign" class="form-control"
                                               value="${bug.sign}" placeholder="200"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Bug描述</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="description" class="form-control"
                                               value="${bug.description}" placeholder="主要描述在什么状态下出现该Bug"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">标记变更</label>
                                    <div class="col-sm-10">
                                        <div class="ckbox ckbox-danger">
                                            <input type="checkbox" id="checkbox1" name="isUpdate"
                                            ${bug.isUpdate==1 ? "checked='checked'" : '' } value=1>
                                            <label for="checkbox1" class="m_checkbox_top"></label>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">标记解决</label>
                                    <div class="col-sm-10">
                                        <div class="ckbox ckbox-success">
                                            <input type="checkbox" id="checkbox2" name="status"
                                            ${bug.status==1 ? "checked='checked'" : '' }> <label for="checkbox2"
                                                                                                 class="m_checkbox_top"></label>

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <button class="btn btn-default" type="button"
                                        onclick="javascript:window.history.back()">取消
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
<script type="text/javascript">
    $('#checkbox2').click(function () {
        if ($(this).attr('checked')) {
            $('#checkbox2').val(1);
            $(this).atttr('checked', false);
        } else {
            $('#checkbox2').val(0);
        }
    });
</script>
</html>
