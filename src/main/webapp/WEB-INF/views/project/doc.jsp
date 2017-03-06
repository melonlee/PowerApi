<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
    <style type="text/css">
        .table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th {
            background-color: #eee;
        }

        .f_title.on {
            background-color: #e5e5e5;
        }
    </style>
</head>

<body class="horizontal-menu">
<section>
    <div class="mainpanel">
        <div class="contentpanel">
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a href="" class="minimize">&minus;</a>
                            </div>
                            <h4 class="panel-title">${project.title }</h4>
                        </div>
                        <div class="panel-body">
                            <ul>
                                <li id="host_url">${project.hostUrl }</li>
                                <li>${project.createdate }</li>
                                <li>${project.description }</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-sm-2 col-lg-2">
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
                <div class="col-sm-4 col-lg-4">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="" class="minimize">&minus;</a>
                                    </div>
                                    <h4 class="panel-title" id="panel_module_url"></h4>
                                </div>
                                <div class="panel-body" id="panel_module_desc"></div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover mb30">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>地址</th>
                                    </tr>
                                    </thead>
                                    <tbody id="function_row">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-body" id="function_detail">
                            <div class="pull-right">
                                <div class="btn-group mr10">
                                    <button class="btn btn-sm btn-white tooltips" type="button"
                                            id="function_test_btn" data-toggle="tooltip" title="测试接口">
                                        <i class="fa fa-paper-plane"></i>
                                    </button>
                                </div>
                            </div>
                            <blockquote>
                                <i class="fa fa-quote-left"></i>
                                <p id="detail_title"></p>
                            </blockquote>
                            <blockquote>
                                <i class="fa fa-quote-left"></i>
                                <p id="detail_url"></p>
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
                                        <th>是否必填</th>
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
                                <h4 class="panel-title">接口说明</h4>
                                <p id="description"></p>
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
                                <h4 class="panel-title">返回示例</h4>
                                <p id="response_body"></p>
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
<script type="text/javascript">
    //选中第一个
    var $curModule = $("#module_nav").find("li:first");

    var $curFunction;

    var host = $("#host_url").text();

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
                        $("#function_row").empty();
                        console.log(data);
                        if (data.code == 1000) {
                            for (loop = 0; loop < data.result.length; loop++) {
                                var functionObj = data.result[loop];
                                var functionObjStr = JSON
                                        .stringify(functionObj);

                                console.log(functionObjStr);
                                var flag = "";

                                if (functionObj.status == 2) {
                                    flag = '<span class="pull-left badge badge-success">新增 </span>';
                                } else if (functionObj.status == 3) {
                                    flag = '<span class="pull-left badge badge-danger">变更</span>';
                                } else if (functionObj.status == 4) {
                                    flag = '<span class="pull-left badge badge-warning">Bug</span>';
                                }
                                $("#function_row").append(
                                        '<tr class="f_title" data-obj=\'' + functionObjStr + '\' >'
                                        + '<td>' + flag + '&nbsp;'
                                        + functionObj.title + '</td>'
                                        + '<td>' + functionObj.url
                                        + '</td>' + '</tr>');
                            }

                            $("#function_row").on(
                                    "click",
                                    ".f_title",
                                    function () {
                                        $(".f_title").removeClass("on");
                                        $(this).addClass("on");
                                        curFunction = JSON.parse($(this)
                                                .attr("data-obj"));
                                        loaddetail(curFunction);
                                    });

                            $("#function_row").find("tr:first").click();
                        }
                    },
                    error: function () {
                        alert("获取数据异常，请重试!");
                    }
                });
    }

    function loaddetail(curfunction) {

        $("#detail_title").text(curfunction.title);
        $("#detail_url").text(host + $curModule.data("url") + curfunction.url);
        $("#method").text(curfunction.method);
        $("#response_type").text(curfunction.responseType);
        $("#response_body").html("<pre>" + format(curfunction.responseBody) + "</pre>");
        $("#description").text(curfunction.description);
        $("#params").empty();
        //解析参数数组然后加入到table中
        console.log(curfunction.params);
        var paramsAry = JSON.parse(curfunction.params);
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

    }


    $(document).on("click", "#function_test_btn", function () {

        window.open("../function/test?id=" + curFunction.id + "&proId=" +${project.id});

    });


    /* 格式化JSON源码(对象转换为JSON文本) */
    function format(txt, compress/*是否为压缩模式*/) {
        var indentChar = '    ';
        if (/^\s*$/.test(txt)) {
            return "无返回示例";
        }
        try {
            var data = eval('(' + txt + ')');
        }
        catch (e) {
            return "无返回示例";
        }
        ;
        var draw = [], last = false, This = this, line = compress ? '' : '\n', nodeCount = 0, maxDepth = 0;

        var notify = function (name, value, isLast, indent/*缩进*/, formObj) {
            nodeCount++;
            /*节点计数*/
            for (var i = 0, tab = ''; i < indent; i++)tab += indentChar;
            /* 缩进HTML */
            tab = compress ? '' : tab;
            /*压缩模式忽略缩进*/
            maxDepth = ++indent;
            /*缩进递增并记录*/
            if (value && value.constructor == Array) {/*处理数组*/
                draw.push(tab + (formObj ? ('"' + name + '":') : '') + '[' + line);
                /*缩进'[' 然后换行*/
                for (var i = 0; i < value.length; i++)
                    notify(i, value[i], i == value.length - 1, indent, false);
                draw.push(tab + ']' + (isLast ? line : (',' + line)));
                /*缩进']'换行,若非尾元素则添加逗号*/
            } else if (value && typeof value == 'object') {/*处理对象*/
                draw.push(tab + (formObj ? ('"' + name + '":') : '') + '{' + line);
                /*缩进'{' 然后换行*/
                var len = 0, i = 0;
                for (var key in value)len++;
                for (var key in value)notify(key, value[key], ++i == len, indent, true);
                draw.push(tab + '}' + (isLast ? line : (',' + line)));
                /*缩进'}'换行,若非尾元素则添加逗号*/
            } else {
                if (typeof value == 'string')value = '"' + value + '"';
                draw.push(tab + (formObj ? ('"' + name + '":') : '') + value + (isLast ? '' : ',') + line);
            }
            ;
        };
        var isLast = true, indent = 0;

        notify('', data, isLast, indent, false);
        $("#responsebody").html("<pre>" + draw.join('') + "</pre>");
        return draw.join('');
    }

</script>
</html>
