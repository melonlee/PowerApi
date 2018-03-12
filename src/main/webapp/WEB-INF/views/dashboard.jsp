<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="host" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common/style.jsp"></jsp:include>
</head>

<body>
<section>

    <div class="pageheader">
        <h2>
            <i class="fa fa-home"></i>控制台<span>专注API接口服务管理，让您的API接口更稳定，管理更快捷</span>
        </h2>
    </div>
    <div class="contentpanel">
        <div class="row">
            <div class="col-sm-6 col-md-3">
                <div class="panel panel-danger panel-stat">
                    <div class="panel-heading">

                        <div class="stat">
                            <div class="row">
                                <div class="col-xs-4">
                                    <i class="fa fa-briefcase"></i>
                                </div>
                                <div class="col-xs-8">
                                    <h4>项目</h4>
                                    <h1>${dashboard.projectCount}</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="panel panel-success panel-stat">
                    <div class="panel-heading">

                        <div class="stat">
                            <div class="row">
                                <div class="col-xs-4">
                                    <i class="fa fa-rocket"></i>
                                </div>
                                <div class="col-xs-8">
                                    <h4>接口</h4>
                                    <h1>${dashboard.interfaceCount }</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="panel panel-primary panel-stat">
                    <div class="panel-heading">

                        <div class="stat">
                            <div class="row">
                                <div class="col-xs-4">
                                    <i class="fa  fa-dashboard"></i>
                                </div>
                                <div class="col-xs-8">
                                    <h4>业务码</h4>
                                    <h1>${dashboard.codeCount }</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="panel panel-dark panel-stat">
                    <div class="panel-heading">
                        <div class="stat">
                            <div class="row">
                                <div class="col-xs-4">
                                    <i class="fa fa-bug"></i>
                                </div>
                                <div class="col-xs-8">
                                    <h4>BUG</h4>
                                    <h1>${dashboard.bugCount}</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default panel-alt">
                    <div class="panel-heading">
                        <h3 class="panel-title">动态</h3>
                    </div>
                    <div class="panel-body">
                        <div class="activity-list">
                        </div>
                        <button class="btn btn-white btn-block" id="more_log">查看更多</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<jsp:include page="common/scripts.jsp"></jsp:include>
<script type="text/javascript">


    $(document).ready(function () {

        var page = 1;
        var username = "<shiro:principal/>";

        loadLogs();

        function loadLogs() {
            console.log(page);
            $.ajax({
                type: 'GET',
                url: '../dashboard/logs',
                data: {
                    page: page
                },
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 1000) {
                        page++;

                        for (loop = 0; loop < data.result.length; loop++) {
                            var logObj = data.result[loop];

                            $(".activity-list").append('' +
                                '<div class="media act-media">' +
                                '<a class="pull-left" href="#"> ' +
                                '<img class="media-object act-thumb" src="${host}/static/images/logo.jpg" alt=""/>' +
                                '</a>' +
                                '<div class="media-body act-media-body">' +
                                ' <strong>' + username + '</strong>' + logObj.action + '<strong> ' +
                                '<a href="#">' + logObj.resource + '</a></strong>. <br/> <small class="text-muted">' + logObj.relativedate + '</small> </div> </div>'
                            );
                        }

                    } else {
                        $("#more_log").text("暂无更多数据")
                    }
                },
                error: function () {
                    alert("获取数据异常，请重试!");
                }
            });
        }

        $(document).on("click", "#more_log", function () {
            loadLogs();
        });
    });


</script>
</body>
</html>
