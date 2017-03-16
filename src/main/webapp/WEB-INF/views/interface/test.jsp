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
        <jsp:include page="../common/pageheader.jsp">
            <jsp:param name="entity" value="接口"/>
        </jsp:include>
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
                                    <select class="select2" id="method">
                                        <option
                                        ${function.method=='GET' ?'selected="selected"' :''  }
                                                value="GET">GET
                                        </option>
                                        <option
                                        ${function.method=='POST' ?'selected="selected"' :''  }
                                                value="POST">POST
                                        </option>
                                        <option
                                        ${function.method=='PUT' ?'selected="selected"' :''  }
                                                value="PUT">PUT
                                        </option>
                                        <option
                                        ${function.method=='DELETE' ?'selected="selected"' :''  }
                                                value="DELETE">DELETE
                                        </option>
                                    </select>
                                </div>

                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">接口地址</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="url" class="form-control"
                                                   value="${function.url}"
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

                                    <div style="visibility: hidden;" id="div_params"
                                         data-params='${function.params}'></div>
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
            <div class="col-md-12 mb20">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#returns" data-toggle="tab"><strong>返回结果</strong></a></li>
                    <li><a href="#historys" data-toggle="tab"><strong>历史记录</strong></a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="returns">
                        <div class="col-md-12">
                            <div class="panel-group panel-group-dark" id="accordion2">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion2"
                                               class="collapsed" href="#collapseOne2"> Response Header
                                            </a>
                                        </h4>
                                    </div>

                                    <!--collapse in -->
                                    <div id="collapseOne2"
                                         class="panel-collapse collapse collapse in">
                                        <div class="panel-body">

                                            <div id="responsecode"></div>

                                            <div id="responseheader"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" class="collapsed"
                                               data-parent="#accordion2" href="#collapseTwo2">
                                                Response Body </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo2"
                                         class="panel-collapse collapse collapse in">
                                        <div class="panel-body" id="responsebody"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="historys">
                        <div class="row">

                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-primary">
                                        <thead>
                                        <tr>
                                            <th>接口地址</th>
                                            <th>请求方式</th>
                                            <th>返回码</th>
                                            <th>请求时间</th>
                                            <th>请求耗时</th>
                                            <th>返回内容大小</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody id="history_row">

                                        <c:forEach var="requester" items="${list}">
                                            <tr class="history_row_tr">
                                                <td>${requester.url}</td>
                                                <td>${requester.method}</td>
                                                <td>${requester.responseCode}</td>
                                                <td>${requester.createdate}</td>
                                                <td>${requester.requestTime}毫秒</td>
                                                <td>${requester.responseSize}B</td>
                                                <td class="table-action"><a href="#"
                                                                            data-id="${requester.id}"
                                                                            class="history_modify edit-row"><i
                                                        class="fa fa-pencil"></i></a> &nbsp;<a
                                                        class="history_delete" data-id="${requester.id}" href="#"><i
                                                        class="fa fa-trash-o"></i> </a></td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- table-responsive -->

                                <ul class="pagination pagination-split nomargin">
                                    <li class="disabled"><a href="#"><i
                                            class="fa fa-angle-left"></i></a></li>

                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                </ul>


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

    //解析div_params中的数据

    loadparams();

    function loadparams() {

        var $divparams = $("#div_params");

        console.log($divparams.data("params"));

        if ("" != $divparams.data("params")) {

            var paramsAry = $divparams.data("params");
            var typeAry = ["Byte", "Short", "Int", "Boolean", "Flot",
                "Double", "String", "Long", "JSON", "File"];
            var str = "";
            for (var loop = 0; loop < paramsAry.params.length; loop++) {
                var functionDetailObj = paramsAry.params[loop];

                str += '<tr class="m_param_row">'
                        + '<td class="m_param_name" contenteditable style="outline: none;">'
                        + functionDetailObj.name + '</td>'
                        + '<td><select class="select2 m_param_type">';
                for (var j = 0, len = typeAry.length; j < len; j++) {
                    var typeNow = typeAry[j];
                    if (functionDetailObj.type == typeNow) {
                        str += '<option value="' + typeNow + '" selected>'
                                + typeNow + '</option>';
                    } else {
                        str += '<option value="' + typeNow + '">' + typeNow
                                + '</option>';
                    }
                }
                str += '</select></td>'
                        + '<td class="m_param_value" contenteditable style="outline: none; overflow:hidden;">'
                        + functionDetailObj.value
                        + '</td>'
                        + '<td class="table-action">'
                        + '<a href="#" class="m_param_delete delete-row"><i class="fa fa-trash-o"></i></a></td> </tr>';
            }

            $("#params").append(str);

        }

    }

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
                                        + '<option value="Byte">Byte</option>'
                                        + '<option value="Short">Short</option>'
                                        + '<option value="Boolean">Boolean</option>'
                                        + '<option value="Flat">Flat</option>'
                                        + '<option value="Double">Double</option>'
                                        + '<option value="Long">Long</option>'
                                        + '<option value="JSON">JSON</option>'
                                        + '<option value="File">File</option>'
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
                                    url: '../function/test',
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
                                            //对返回结果进行格式化
                                            format(data.result.responseBody);

                                            $("#history_row")
                                                    .append(
                                                            ' <tr class="history_row_tr">'
                                                            + '<td>'
                                                            + data.result.url
                                                            + '</td>'
                                                            + '<td>'
                                                            + data.result.method
                                                            + '</td>'
                                                            + '<td>'
                                                            + data.result.responseCode
                                                            + '</td>'
                                                            + '<td>'
                                                            + data.result.createdate
                                                            + '</td>'
                                                            + '<td>'
                                                            + data.result.requestTime
                                                            + '毫秒</td>'
                                                            + '<td>'
                                                            + data.result.responseSize
                                                            + '</td>'
                                                            + '<td class="table-action"><a href="#" data-id="' + data.result.id + '" class="history_modify edit-row"><i'
                                                            + '	class="fa fa-pencil"></i></a> &nbsp;<a href="#" data-id="' + data.result.id + '" class="history_delete"><i class="fa fa-trash-o"></i>'
                                                            + '</a></td>'
                                                            + '</tr> ');
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

    //删除历史记录
    $(document).on("click", ".history_delete", function () {
        var $this = $(this);
        $.ajax({
            type: 'POST',
            url: '../quick/remove.do',
            data: {
                id: $this.data("id")
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data.code == 1000) {
                    console.log('ok');
                    var $parent = $this.parents(".history_row_tr");
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
    });

    //点击编辑按钮
    $(document)
            .on(
                    "click",
                    ".history_modify",
                    function () {

                        $("#loading").click();
                        $("#params").empty();
                        var $this = $(this);
                        console.log($this.data("id"));

                        $
                                .ajax({
                                    type: 'POST',
                                    url: '../quick/info.do',
                                    data: {
                                        id: $this.data("id")
                                    },
                                    cache: false,
                                    dataType: 'json',
                                    success: function (data) {
                                        /* 	data = JSON.parse(data); */
                                        console.log(data);
                                        if (data.code == 1000) {
                                            var curObj = data.result;
                                            $("#url").val(curObj.url);
                                            //解析参数数组然后加入到table中
                                            var paramsAry = JSON
                                                    .parse(curObj.params);
                                            var typeAry = ["Byte", "Short",
                                                "Int", "Boolean", "Flot",
                                                "Double", "Long", "JSON",
                                                "String", "File"];
                                            var str = "";
                                            for (var loop = 0; loop < paramsAry.params.length; loop++) {
                                                var functionDetailObj = paramsAry.params[loop];

                                                str += '<tr class="m_param_row">'
                                                        + '<td class="m_param_name" contenteditable style="outline: none;">'
                                                        + functionDetailObj.name
                                                        + '</td>'
                                                        + '<td><select class="select2 m_param_type">';
                                                for (var j = 0, len = typeAry.length; j < len; j++) {
                                                    var typeNow = typeAry[j];
                                                    if (functionDetailObj.type == typeNow) {
                                                        str += '<option value="' + typeNow + '" selected>'
                                                                + typeNow
                                                                + '</option>';
                                                    } else {
                                                        str += '<option value="' + typeNow + '">'
                                                                + typeNow
                                                                + '</option>';
                                                    }
                                                }
                                                str += '</select></td>'
                                                        + '<td class="m_param_value" contenteditable style="outline: none; overflow:hidden;">'
                                                        + functionDetailObj.value
                                                        + '</td>'
                                                        + '<td class="table-action">'
                                                        + '<a href="#" class="m_param_delete delete-row"><i class="fa fa-trash-o"></i></a></td> </tr>';
                                            }

                                            $("#params").append(str);

                                            $("#select2-chosen-1").text(
                                                    curObj.method);

                                            $("#responsecode")
                                                    .html(
                                                            "返回码:"
                                                            + curObj.responseCode
                                                            + "<br/>请求时间:"
                                                            + curObj.createdate
                                                            + "<br/>请求耗时:"
                                                            + curObj.requestTime
                                                            + "毫秒"
                                                            + "<br/>返回内容大小:"
                                                            + curObj.responseSize
                                                            + "B");
                                            $("#responseheader")
                                                    .html(
                                                            "头信息:"
                                                            + curObj.responseHeader);
                                            $("#responsebody").html(
                                                    curObj.responseBody);

                                        } else {
                                            alert('数据提交失败，请重试!');
                                        }
                                    },
                                    error: function () {
                                        alert("获取数据异常，请重试!");
                                    }
                                });

                        $("#loading").click();
                    });

    /* 格式化JSON源码(对象转换为JSON文本) */
    function format(txt, compress/*是否为压缩模式*/) {
        var indentChar = '    ';
        if (/^\s*$/.test(txt)) {
            $("#responsebody").html("<pre>数据为空,无法格式化! </pre>");
            return;
        }
        try {
            var data = eval('(' + txt + ')');
        }
        catch (e) {
            $("#responsebody").html("<pre>数据源语法错误,格式化失败! 错误信息: " + e.description + "</pre>");
            return;
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
    }
</script>
</body>
</html>
