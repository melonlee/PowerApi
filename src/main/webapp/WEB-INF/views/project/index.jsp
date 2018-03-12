<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"></c:set>
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
    <div class="pageheader">
        <div class="row">
            <div class="col-md-11">
                <h2>
                    <i class="fa fa-briefcase"></i>项目管理<span>包括:接口;Bug;状态码;文档;成员信息</span>
                </h2>
            </div>
            <div class="col-md-1">
                <p>
                    <a class="btn btn-primary" href="create">新增项目 </a>
                </p>
            </div>
        </div>
    </div>
    <div class="contentpanel">
        <div class="row">
            <div class="people-list">
                <div class="row" id="project-area">
                    <div id="projects">
                    </div>
                </div>
            </div>
        </div>
        <button id="loading" class="btn btn-primary" data-toggle="modal"
                style="display: none;" data-target=".bs-example-modal-sm">loading
        </button>
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

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header"></div>
            <div class="modal-body">
                <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-primary" role="progressbar"
                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
                         style="width: 100%"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/scripts.jsp"></jsp:include>
<jsp:include page="../common/sharejs.jsp"></jsp:include>
<script type="text/javascript">
    $("#loading").click();

    $(document).ready(function () {

        $.ajax({
            type: 'POST',
            url: '../project/all',
            data: {},
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data.code == 1000) {
                    $("#projects").empty();
                    console.log(data.result);
                    var project_html = "";
                    for (var loop = 0; loop < data.result.length; loop++) {
                        var project = data.result[loop];
                        project_html += '<div class="col-md-6">' +
                            ' <div class="people-item"> ' +
                            '<div class="media"> ' +
                            '<div class="media-body"> ' +
                            '<h4 class="person-name">' +
                            ' <a href="view?id=' + project.id + '">' + project.title + '</a>' +
                            '<span class="pull-right badge badge-danger">Version:' + project.version + '</span> </h4>' +
                            ' <div class="text-muted"> ' +
                            '<i class="fa fa-calendar"></i> ' + project.relativedate + '</div>' +
                            ' <div class="text-muted m_textoverflow"> ' +
                            '<i class="fa fa-briefcase"></i> ' + project.description + ' </div> ' +
                            '<ul class="social-list"> ' +
                            '<li><a href="view?id=' + project.id + '" class="tooltips" data-toggle="tooltip" data-placement="top" title="基础管理"><i class="fa fa-gear"></i></a></li>  ' +
                            '<li><a href="../module/all?proId=' + project.id + '" class="tooltips" data-toggle="tooltip" data-placement="top" title="接口管理"><i class="fa fa-code-fork"></i></a></li> ' +
                            '<li><a href="../bug/all?proId=' + project.id + '" class="tooltips" data-toggle="tooltip" data-placement="top" title="Bug管理"><i class="fa fa-bug"></i></a></li>' +
                            '<li><a href="../code/all?proId=' + project.id + '" class="tooltips" data-toggle="tooltip" data-placement="top" title="业务码管理"><i class="fa fa-file-code-o"></i></a></li> ' +
                            '<li><a href="preview?id=' + project.id + '" class="tooltips" data-toggle="tooltip" data-placement="top" title="预览文档"><i class="fa fa-eye"></i></a></li> ' +
                            '<li> <a href="#" data-toggle="modal" id="share" data-target=".bs-example-modal-static" data-content="${host}/' + project.sharelink + '" class="tooltips" data-toggle="tooltip" data-placement="top" title="分享文档"><i class="fa fa-external-link"></i></a></li> </ul>  </div> </div> </div> </div>';

                    }

                    $("#projects").append(project_html);
                    $("#loading").click();
                } else {
                    $("#project-area").prepend(' <div class="col-md-12"> <div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>  暂无更多数据! </div> </div>');
                }
            },
            error: function () {
                $("#project-area").prepend(' <div class="col-md-12"> <div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>  您目前还没有创建项目! </div> </div>');
            }
        });
    });
</script>
</body>
</html>
