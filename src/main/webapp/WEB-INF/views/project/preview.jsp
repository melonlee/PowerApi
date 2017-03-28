<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
    <style type="text/css">
        .table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th {
            background-color: #bbbbbb;
            cursor: hand;
        }
    </style>
</head>
<body>
<jsp:include page="../common/leftmenu.jsp" flush="true">
    <jsp:param name="nav" value="2"/>
</jsp:include>
<section>
    <div class="mainpanel">

        <jsp:include page="../common/pageheader.jsp">
            <jsp:param name="index" value="5"/>
        </jsp:include>
        <div class="tab-content">
            <div class="tab-pane active">
                <div class="row">

                    <c:if test="${modules.size()==0}">
                        <div class="col-md-12">
                            <div class="alert alert-danger">
                                <button type="button" class="close" data-dismiss="alert"
                                        aria-hidden="true">&times;</button>
                                您目前还没有文档可以预览!
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${modules.size()>0}">
                        <div class="col-md-12">
                            <div class="col-sm-2 col-lg-2">
                                <br/>
                                <ul class="nav nav-pills nav-stacked nav-email mb20"
                                    id="module_nav">
                                    <c:forEach var="module" items="${modules}">
                                        <li id="${module.id}" title="${module.title}"
                                            data-url="${module.url}" data-desc="${module.description}"
                                            class="module_nav_row"><a href="#"> <i
                                                class="glyphicon glyphicon-folder-open"></i> ${module.title } <span
                                                class="pull-right badge badge-success">${module.functions }</span>
                                        </a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="col-sm-3 col-lg-3">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover mb30 table-success">
                                                <thead>
                                                <tr>
                                                    <th>#名称</th>
                                                </tr>
                                                </thead>
                                                <tbody id="function_row">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-7 col-lg-7">
                                <div class="panel panel-default">
                                    <div class="panel-body" id="function_detail">
                                        <blockquote>
                                            <i class="fa fa-quote-left"></i>
                                            <p id="detail_url" data-projecthost="${project.hostUrl }"></p>
                                        </blockquote>

                                        <div class="panel-heading">
                                            <h4 class="panel-title">接口参数</h4>
                                            <p>
                                            <table class="table mb30 table-primary">
                                                <thead>
                                                <tr>
                                                    <th>名称</th>
                                                    <th>类型</th>
                                                    <th>说明</th>
                                                    <th>必填</th>
                                                    <th>示例</th>
                                                    <th>默认值</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody id="params">
                                                </tbody>
                                            </table>
                                            </p>
                                        </div>
                                        <div class="panel-heading">
                                            <h4 class="panel-title">返回示例</h4>
                                            <p id="response_body"></p>
                                        </div>
                                        <div class="panel-heading">
                                            <h4 class="panel-title">请求方式</h4>
                                            <p id="method"></p>
                                        </div>
                                        <div class="panel-heading">
                                            <h4 class="panel-title">返回类型</h4>
                                            <p id="response_type"></p>
                                        </div>
                                        <div class="panel-heading">
                                            <h4 class="panel-title">接口说明</h4>
                                            <p id="description"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade bs-example-modal-static" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     data-backdrop="static" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
                <h4 class="modal-title">复制下面链接分享该项目文档</h4>
            </div>
            <div class="modal-body">
                <input id="link" type="text" class="form-control">

            </div>

            <div class="modal-footer">
                <a class="share pull-right btn btn-success" data-clipboard-target="#link">点我复制</a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/scripts.jsp"></jsp:include>
<script src="${host}/static/js/service/project.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.6.0/clipboard.min.js"></script>
<script type="text/javascript">
    /**
     *
     * 设置分享链接复制分享
     *
     * @type {Clipboard}
     */
    var clipboard = new Clipboard('.share');

    clipboard.on('success', function (e) {
        //to do
    });

    clipboard.on('error', function (e) {
        alert('此功能不支持该浏览器，请手工复制文本框中内容');
    });

    $(document).on("click", "#share", function () {
        $("#link").val($(this).data("content"));
    });

</script>
</body>
</html>
