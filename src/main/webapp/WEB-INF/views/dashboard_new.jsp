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
    <div id="preloader">
        <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
    </div>

    <div class="leftpanel">

        <div class="logopanel">
            <h1><span>[</span> Power.API <span>]</span></h1>
        </div>

        <div class="leftpanelinner">

            <h5 class="sidebartitle">导航</h5>

            <ul class="nav nav-pills nav-stacked nav-bracket">
                <li><a
                        href="../dashboard/content" target="content"><i class="fa fa-home"></i> <span>
                            总览</span></a></li>

                <li><a
                        href="../project/all" target="content"><i class="fa fa-briefcase"></i> <span>
							项目管理</span> </a></li>

                <li class="nav-parent"><a href="#"><i
                        class="fa fa-send"></i>
                    <span>测试管理</span></a>
                    <ul class="children">
                        <li target="content"><a href="../unit/view" target="content"><i class="fa fa-send"></i>
                            单元测试</a>
                        </li>
                        <li target="content"><a href="../auto/view" target="content"><i
                                class="fa fa-truck"></i>
                            自动化测试 <span
                                    class="pull-right badge badge-danger">Beta</span></a></li>
                    </ul>
                </li>


                <li class="nav-parent"><a href="#"><i
                        class="fa fa-cubes"></i>
                    <span>Mock管理</span></a>
                    <ul class="children">
                        <li><a href="../mock/all" target="content"><i class="fa fa-users"></i>手动Mock</a>
                        </li>
                        <li><a href="../group/members" target="content"><i
                                class="fa fa-user"></i>
                            自动Mock <span
                                    class="pull-right badge badge-danger">Beta</span></a></li>
                    </ul>
                </li>


                <li><a
                        href="../monitor/all" target="content"><i class="fa fa-shield"></i> <span>
							监控管理</span> </a></li>
                <li class="nav-parent"><a href="#"><i
                        class="fa fa-trophy"></i>
                    <span>团队管理</span></a>
                    <ul class="children">
                        <li><a href="../group/all" target="content"><i class="fa fa-users"></i>创建/管理团队</a>
                        </li>
                        <li><a href="../group/members" target="content"><i
                                class="fa fa-user"></i>
                            成员管理 <span
                                    class="pull-right badge badge-danger">Beta</span></a></li>
                    </ul>
                </li>

                <li class="nav-parent"><a href="#"><i
                        class="fa fa-gear"></i>
                    <span>系统设置</span></a>
                    <ul class="children" }>
                        <li><a href="../message/all" target="content"><i
                                class="fa fa-volume-up"></i>通知设置</a>
                        </li>
                        <li><a href="../role/all" target="content"><i
                                class="fa fa-sitemap"></i>角色管理</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <div class="infosummary">
                <h5 class="sidebartitle">服务器状态</h5>
                <ul>
                    <li>
                        <div class="datainfo">
                            <span class="text-muted">CPU</span>
                            <h4>66%</h4>
                        </div>
                        <div id="sidebar-chart" class="chart"></div>
                    </li>
                    <li>
                        <div class="datainfo">
                            <span class="text-muted">CACHE</span>
                            <h4>206M</h4>
                        </div>
                        <div id="sidebar-chart2" class="chart"></div>
                    </li>
                    <li>
                        <div class="datainfo">
                            <span class="text-muted">DISK</span>
                            <h4>82.2%</h4>
                        </div>
                        <div id="sidebar-chart3" class="chart"></div>
                    </li>
                    <li>
                        <div class="datainfo">
                            <span class="text-muted">JVM</span>
                            <h4>140.05</h4>
                        </div>
                        <div id="sidebar-chart4" class="chart"></div>
                    </li>
                    <li>
                        <div class="datainfo">
                            <span class="text-muted">NETWORK</span>
                            <h4>32.2%</h4>
                        </div>
                        <div id="sidebar-chart5" class="chart"></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="headerbar">
        <div class="header-right">
            <ul class="headermenu">
                <li>
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle"
                                data-toggle="dropdown">
                            <img src="${host}/static/images/logo.jpg"
                                 alt=""/><shiro:principal/> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">

                            <li><a href="../dashboard/changepwd"><i
                                    class="glyphicon glyphicon-cog" target="content"></i> 更改密码</a></li>
                            <li><a href="../dashboard/signout"><i
                                    class="glyphicon glyphicon-log-out"></i> 退出</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="mainpanel">

        <iframe name="content" id="content" src="content" frameborder="0" scrolling="no" width="100%"
                height="900px"></iframe>
    </div>
</section>
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
