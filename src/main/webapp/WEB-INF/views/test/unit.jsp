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
            <jsp:param name="nav" value="4"/>
        </jsp:include>
        <div class="pageheader">
            <h2>
                <i class="fa  fa-send"></i>单元测试<span>录入接口地址以及接口所需参数进行单个功能的可用性测试</span>
            </h2>
        </div>
        <div class="contentpanel">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">添加参数以进行测试</h4>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">请求方式:</label>
                                        <div class="col-sm-8">
                                            <select class="select2" id="method">
                                                <option value="GET">GET</option>
                                                <option value="POST">POST</option>
                                                <option value="PUT">PUT</option>
                                                <option value="DELETE">DELETE
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">接口地址:</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="url" class="form-control"
                                                   placeholder="http://api.xxx.com/resource/action"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="form-group">

                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="alert alert-info">
                                            <button type="button" class="close" data-dismiss="alert"
                                                    aria-hidden="true">&times;</button>
                                            点击[+参数]按钮在列表中直接输入所需参数
                                        </div>
                                    </div>

                                    <div style="visibility: hidden;" id="div_params">
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="table-responsive">
                                            <table class="table mb30 table-primary">
                                                <thead>
                                                <tr>
                                                    <th>参数名称</th>
                                                    <th>参数类型</th>
                                                    <th>参数值</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody id="params">
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <button id="addParam" class="btn btn-success">+参数</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <button id="submit" class="btn btn-primary">发送</button>
                            <button id="loading" class="btn btn-primary" data-toggle="modal"
                                    style="display: none;" data-target=".bs-example-modal-sm">loading
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mb20" id="returns">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#returns" data-toggle="tab"><strong>返回结果</strong></a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active">
                        <div class="col-md-12">
                            <div class="panel-group panel-group-dark" id="accordion2">
                                <div class="panel panel-default">
                                    <div id="collapseOne2">
                                        <div class="panel-body">

                                            <div id="responsecode"></div>

                                            <div id="responseheader"></div>

                                            <div id="responsebody"></div>
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
<script>
    "use strict";
    // Select2
    jQuery(".select2").select2({
        width: '100%'
    });

    $("#returns").hide();

    $("#addParam")
            .click(
                    function () {

                        $("#params")
                                .append(
                                        '<tr class="m_param_row">'
                                        + '<td class="m_param_name" contenteditable style="outline: none;"></td>'
                                        + '<td><select class="select2 m_param_type">'
                                        + '<option value="String">String</option>'
                                        + '<option value="Int">Int</option>'
                                        + '</select></td>'
                                        + '<td class="m_param_value" contenteditable style="outline: none; overflow:hidden;"></td>'
                                        + '<td class="table-action">'
                                        + '<a href="#" class="m_param_delete delete-row"><i class="fa fa-trash-o"></i></a></td> </tr>');
                    });

    $("#submit")
            .click(
                    function () {

                        $("#loading").click();

                        var paramObj = {}, paramsAry = [], $m_param_rows = $(
                                "#params").find(".m_param_row");

                        console.log($m_param_rows);

                        for (var i = 0, len = $m_param_rows.length; i < len; i++) {
                            var $row = $m_param_rows.eq(i), param = {};

                            param.name = $row.find(".m_param_name").text();
                            param.type = $row.find(".m_param_type").val();
                            param.value = $row.find(".m_param_value").text();

                            paramsAry.push(param);
                        }

                        paramObj.params = paramsAry;

                        var paramStr = JSON.stringify(paramObj);
                        console.log(paramStr);
                        console.log($("#method").val());
                        console.log($("#url").val());


                        //提交

                        $
                                .ajax({
                                    type: 'POST',
                                    url: '../unit/test',
                                    data: {
                                        method: $("#method").val(),
                                        url: $("#url").val(),
                                        params: paramStr
                                    },
                                    cache: false,
                                    dataType: 'json',
                                    success: function (data) {
                                        $("#loading").click();
                                        /* 	data = JSON.parse(data); */
                                        if (data.code == 1000) {
                                            $("#responsecode")
                                                    .html(
                                                            "返回码:"
                                                            + data.result.responseCode
                                                            + "<br/>请求时间:"
                                                            + data.result.createdate
                                                            + "<br/>请求耗时:"
                                                            + data.result.requestTime
                                                            + "毫秒"
                                                            + "<br/>返回内容大小:"
                                                            + data.result.responseSize
                                                            + "B");
                                            $("#responseheader")
                                                    .html(
                                                            "头信息:"
                                                            + data.result.responseHeader);

                                            format(data.result.responseBody);
                                            $("#returns").show();
                                        } else {
                                            alert('数据提交失败，请重试!');
                                        }
                                    },
                                    error: function () {
                                        $("#loading").click();
                                        alert("获取数据异常，请重试!");
                                    }
                                });

                    });

    $(document).on("click", ".m_param_delete", function () {
        $(this).parents(".m_param_row").remove();
    });

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
        $("#responsebody").html("<pre><code class='language-json'>" + draw.join('') + "</code></pre>");
        Prism.highlightAll();
    }

</script>
</body>
</html>
