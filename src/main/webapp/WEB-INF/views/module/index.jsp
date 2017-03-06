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
            <h2>
                <i class="fa fa-book"></i>${project.title }<span>项目模块及接口</span>
            </h2>
        </div>
        <div class="contentpanel">
            <div class="row">
                <c:if test="${status>0}">
                    <div class="col-md-12" id="action_alert">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">&times;</button>
                            操作成功!
                        </div>
                    </div>
                </c:if>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-sm-3 col-lg-2">
                            <ul class="nav nav-pills nav-stacked nav-email mb20"
                                id="module_nav">
                                <c:forEach var="module" items="${modules}">
                                    <li id="${module.id}" title="${module.title}"
                                        data-url="${module.url}" data-desc="${module.description}"
                                        class="module_nav_row"><a href="#"> <i
                                            class="glyphicon glyphicon-folder-open"></i> ${module.title }<span
                                            class="pull-right badge badge-success">${module.functions }</span>
                                    </a></li>
                                </c:forEach>
                                <li><a href="view.do?proId=${project.id}"> <i
                                        class="glyphicon glyphicon-pencil"></i> 添加模块
                                </a></li>
                            </ul>
                        </div>
                        <div class="col-sm-9 col-lg-10">

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="panel panel-success">
                                        <div class="panel-heading">
                                            <div class="panel-btns">
                                                <a id="panel_module_modify" href="#" title="编辑"><i
                                                        class="fa  fa-cog mr5"></i> </a> <a href=""
                                                                                            class="minimize">&minus;</a>
                                            </div>
                                            <h4 class="panel-title" id="panel_module_url"></h4>
                                        </div>
                                        <div class="panel-body" id="panel_module_desc"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">

                                    <div class="pull-left">
                                        <button class="btn btn-sm btn-white tooltips" type="button"
                                                id="create_function" data-toggle="tooltip" title="新增接口">
                                            <i class="glyphicon glyphicon-edit"></i>
                                        </button>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table table-hover mb30">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>地址</th>
                                                <th>创建时间</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody id="function_row">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p>
                                        <button class="btn btn-danger btn-block" id="module_remove">删除该模块</button>
                                    </p>
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
</body>
</body>
<script type="text/javascript">
    //选中第一个
    var $curModule = $("#module_nav").find("li:first");
    $curModule.addClass("active");
    $("#panel_module_url").text($curModule.data("url"));
    $("#panel_module_desc").text($curModule.data("desc"));
    loadInterfaceByModule($curModule.attr("id"));
    //点击导航
    $(document).on("click", ".module_nav_row", function () {
        $(".module_nav_row").removeClass("active");
        $(this).addClass("active");
        $curModule = $(this);
        $("#panel_module_url").text($curModule.data("url"));
        $("#panel_module_desc").text($curModule.data("desc"));
        loadInterfaceByModule($curModule.attr("id"));
    });

    //删除模块
    $(document).on("click", "#module_remove", function () {
        removeModule();
    });

    //新增接口
    $(document).on("click", "#create_function", function () {

        window.location.href = "../function/view.do?proId=" + ${project.id}+"&mId=" + $curModule.attr("id");
    });

    //
    $(document).on("click", "#panel_module_modify", function () {

        window.location.href = "view?proId=" + ${ project.id}+"&id=" + $curModule.attr("id");
    });

    function removeModule() {

        if (window.confirm('确定删除该模块吗？')) {

            $.ajax({
                type: 'GET',
                url: 'remove',
                data: {
                    id: $curModule.attr("id")
                },
                cache: false,
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    if (data.code == 1000) {
                        $curModule.remove();
                        $("#module_nav").find("li:first").addClass("active")
                                .click();
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


    }

    function loadInterfaceByModule(moduleID) {
        $
                .ajax({
                    type: 'GET',
                    url: '../function/all',
                    data: {
                        mId: moduleID
                    },
                    cache: false,
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        $("#function_row").empty();
                        if (data.code != 1000) {
                        } else {
                            for (loop = 0; loop < data.result.length; loop++) {
                                functionObj = data.result[loop];

                                var flag = "";

                                if (functionObj.status == 2) {
                                    flag = '<span class="pull-left badge badge-success">新增 </span>';
                                } else if (functionObj.status == 3) {
                                    flag = '<span class="pull-left badge badge-danger">变更</span>';
                                } else if (functionObj.status == 4) {
                                    flag = '<span class="pull-left badge badge-warning">异常</span>';
                                }
                                $("#function_row")
                                        .append(
                                                '<tr class="interface_row">'
                                                + '<td><a href="../function/view?id=' + functionObj.id + '&proId=' + ${project.id} +
                                                        '&mId=' + functionObj.mId + '">'
                                                + flag
                                                + '&nbsp;'
                                                + functionObj.title
                                                + '</a></td>'
                                                + '<td>'
                                                + functionObj.url
                                                + '</td>'
                                                + '<td>'
                                                + functionObj.createdate
                                                + '</td>'
                                                + '<td><a target="_blank" href="../function/test?id=' + functionObj.id + '&proId=' + ${project.id} +
                                                        '" title="测试">'
                                                + '<i class="fa fa-paper-plane"></i></a>&nbsp;&nbsp; <a class="interface_delete_row" data-id="' + functionObj.id + '" href="#" class="delete-row" title="删除">'
                                                + '<i class="fa fa-trash-o"></i></a></td>'
                                                + '</tr>'
                                        )
                                ;
                            }
                        }
                    },
                    error: function () {
                        alert("获取数据异常，请重试!");
                    }
                });
    }

    $(document).on("click", ".interface_delete_row", function () {

        var $this = $(this);


        if (window.confirm('确定删除该接口吗？')) {

            $.ajax({
                type: 'GET',
                url: '../function/delete',
                data: {
                    id: $this.data("id")
                },
                cache: false,
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    if (data.code == 1000) {
                        var $parent = $this.parents(".interface_row");
                        $parent.find("td").stop().animate({
                            height: "0px",
                            "padding-top": "0px",
                            "padding-bottom": "0px"
                        }, 200, function () {
                            $parent.remove();
                        });

                    } else {
                        alert('数据提交失败，请重试!');
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
</html>
