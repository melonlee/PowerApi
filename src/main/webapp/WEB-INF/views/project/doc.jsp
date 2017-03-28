<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Power.API</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="shortcut icon" href="${host}/static/images/logo.jpg" type="image/jpg">
    <link href="${host}/static/css/style.default.css" rel="stylesheet">
    <link href="${host}/static/css/prism.css" rel="stylesheet">
    <style type="text/css">

        .mainpanel {
            background-color: #1D2939;
        !important;
        }

        .nav-bracket .children {
            display: block;
        !important;
        }

        body {
            line-height: 32px;
        !important;
        }

        blockquote p {
            color: #ccc;
        !important;
        }

        .panel {
            background: #1D2939;
        !important;
        }

        .panel-heading {
            background: #1D2939;
        !important;
            border-color: #1D2939;
        !important;
        }

        .panel-title {
            color: #ccc;
        !important;
        }

        .logopanel h1 {
            font-size: 39px;
        !important;
            color: #ccc;
        !important;
        }

        .logopanel {
            background: #1d2939;
        !important;
        }

        .panel-heading p {
            font-size: 18px;
        !important;
            color: #999;
        !important;
        }

        .table > tbody > tr > td {
            border-top: 0px solid #999;
        !important;
        }

        .table {
            background-color: #1d2939;
        !important;
        }

    </style>
</head>
<body>
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>
<div class="leftpanel">

    <br/>
    <div class="logopanel">
        <h1><a href="${host}"><span>[</span> Power.API <span>]</span></a></h1>
    </div>

    <div class="leftpanelinner">
        <br/>
        <ul class="nav nav-pills nav-stacked nav-bracket" id="module-list">
        </ul>
    </div>
</div>

<div class="mainpanel">
    <div class="contentpanel">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">

                    <blockquote>
                        <i class="fa fa-quote-left"></i>
                        <p>${project.title}<span
                                class="pull-right badge badge-danger">Version:${project.version}</span><span
                                class="pull-right badge badge-primary">${project.relativedate} </span></p>
                        <p>${project.description}</p>
                    </blockquote>

                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <i class="fa   fa-share-alt"></i> 接口名称</h4>
                        <p id="title"></p>
                    </div>

                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <i class="fa  fa-chain"></i> URL</h4>
                        <p id="url"></p>
                    </div>

                    <div class="panel-heading">
                        <h4 class="panel-title"><i class="fa fa-file-text-o"></i> 接口说明</h4>
                        <p id="description"></p>
                    </div>

                    <div class="panel-heading param-table">

                        <h4 class="panel-title"><i class="fa fa-cogs"></i> 接口参数</h4>
                        <p>
                        <table class="table mb30 table-success">
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
                        <h4 class="panel-title"><i class="fa fa-code"></i> 返回示例</h4>
                        <p id="response_body"></p>
                    </div>
                    <div class="panel-heading">
                        <h4 class="panel-title"><i class="fa fa-upload"></i> 请求方式</h4>
                        <p id="method"></p>
                    </div>
                    <div class="panel-heading">
                        <h4 class="panel-title"><i class="fa fa-cloud-download"></i> 返回类型</h4>
                        <p id="response_type"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/scripts.jsp"></jsp:include>
<script src="${host}/static/js/service/format.js"></script>
<script>
    $(document).ready(function () {
        //用来缓存接口
        var function_map = {};

        $.ajax({
            type: 'POST',
            url: '../' + window.location.pathname,
            data: {},
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data.code == 1000) {
                    $(".panel-body").show();
                    var module_html = "";
                    for (var module_count = 0; module_count < data.result.length; module_count++) {
                        var moduleObj = data.result[module_count];
                        var function_html = "";
                        for (var function_count = 0; function_count < moduleObj.functions.length; function_count++) {
                            var functionObj = moduleObj.functions[function_count];
                            function_html += '<ul class="children"> ' +
                                    '<li><a class="function-detail" href="#" ><i class="fa fa-chevron-right"></i>' + functionObj.title + '</a></li> ' +
                                    '</ul>';
                            functionObj.url = "${project.hostUrl}" + moduleObj.url + functionObj.url;
                            function_map[functionObj.title] = functionObj;
                        }
                        module_html += '<li class="nav-parent  active  nav-active"><a href="">' +
                                '<span><i class="fa fa-th-list"></i>' + moduleObj.title + '</span></a> ' + function_html + ' </li>';
                    }
                    $("#module-list").append(module_html);
                    //获取第一个模块导航条
                    var $first_function = $("#module-list").find("li:first").find("ul:first").find("li:first");
                    $first_function.find("a:first").click()
                    $first_function.addClass("active");
                } else {
                    $(".panel-body").hide();
                    alert("您目前还没有接口数据,请前往添加!");
                }
            },
            error: function () {
                alert("获取数据异常，请重试!");
            }
        });

        //左侧导航点击事件
        $(document).on("click", ".function-detail", function () {

            //设置第一个节点的点击样式
            $(".function-detail").parent().removeClass("active");
            $(this).parent().addClass("active");

            //解析对象内容
            var $curFunction = function_map[$(this).text()];
            $("#title").html($curFunction.title);
            $("#url").html($curFunction.url);
            $("#method").html($curFunction.method);
            $("#response_type").html($curFunction.responseType);
            $("#description").html($curFunction.description);

            //设置代码高亮显示
            $("#response_body").html("<pre><code class='language-json'>" + format($curFunction.responseBody) + "</code></pre>");
            Prism.highlightAll();

            //设置参数内容填充到表格
            $("#params").empty();
            var paramsAry = JSON.parse($curFunction.params);
            if (paramsAry.params.length > 0) {
                for (var loop = 0; loop < paramsAry.params.length; loop++) {
                    var functionDetailObj = paramsAry.params[loop];
                    var isneedstr = functionDetailObj.isneed == 1 ? "是" : "否";
                    $("#params").append(
                            '<tr><td>' + functionDetailObj.name + '</td>' + '<td>'
                            + functionDetailObj.type + '</td>' + '<td>'
                            + functionDetailObj.desc + '</td>' + '<td>'
                            + isneedstr + '</td>' + '<td>'
                            + functionDetailObj.value + '</td>' + '<td>'
                            + functionDetailObj.defaultvalue + '</td>' + '<td>'
                            + '</tr>');
                }
                $(".param-table").show();
            } else {
                //隐藏表格
                $(".param-table").hide();
            }
        });
    });
</script>
</body>
</html>
