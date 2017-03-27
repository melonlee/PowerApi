<%@ page import="java.util.List" %>
<%@ page import="powerapi.entity.Module" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>

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

    <script type="text/javascript">
        var map = {};
    </script>
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
        <ul class="nav nav-pills nav-stacked nav-bracket">

            <c:forEach var="module" items="${modules}">
                <li class="nav-parent  active  nav-active"><a href=""></i>
                    <span><i class="fa fa-th-list"></i>${module.title}</span></a>
                    <ul class="children">
                        <c:forEach var="function" items="${module.functions}">
                            <li><a class="function-detail" href="#"
                                   data-title='${function.title}'
                                   data-url="${project.hostUrl}${module.url}${function.url}"
                                   data-description="${function.description}" data-params='${function.params}'
                                   data-method="${function.method}" data-response="${function.responseBody}"
                                   data-type="${function.responseType}"><i
                                    class="fa fa-chevron-right"></i>${function.title}</a></li>

                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="mainpanel">
    <div class="contentpanel">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body" id="function_detail">

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

                    <div class="panel-heading">

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
<script>


    //导航点击事件
    $(document).on("click", ".function-detail", function () {

        var $curFunction = $(this);
        $("#title").html($curFunction.data("title"));
        $("#url").html($curFunction.data("url"));
        $("#method").html($curFunction.data("method"));
        $("#response_type").html($curFunction.data("type"));
        $("#response_body").html('<pre>' + $curFunction.data("response") + '</pre>');
        //format($curFunction.data("response"));
        $("#description").html($curFunction.data("description"));
        $("#params").empty();
        //解析参数数组然后加入到table中
        var paramsAry = $curFunction.data("params");
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
    });


    /**
     *  格式化接口测试返回回来的JSON源码(对象转换为JSON文本)
     *
     */
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

        $("#response_body").html("<pre><code class='language-json'>" + draw.join('') + "</code></pre>");
        Prism.highlightAll();
    }

</script>
</body>
</html>
