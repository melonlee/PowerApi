<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
</head>
<body>
<section>
    <jsp:include page="../common/leftmenu.jsp" flush="true">
        <jsp:param name="nav" value="4"/>
    </jsp:include>
    <div class="mainpanel">
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
                                <div class="col-sm-4">
                                    <div class="form-group">
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
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <input type="text" id="url" class="form-control"
                                                   placeholder="接口地址:http://api.xxx.com/resource/action"/>
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
                                            点击[+Header信息]按钮在列表中直接输入所需Header信息
                                        </div>
                                    </div>

                                    <div style="visibility: hidden;" id="div_headers">
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="table-responsive">
                                            <table class="table mb30 table-primary">
                                                <thead>
                                                <tr>
                                                    <th>Header名称</th>
                                                    <th>Header值</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody id="headers">
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <button id="addHeader" class="btn btn-success">+Header信息</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br/><br/>
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
                            <button id="submit" class="btn btn-primary">提交测试</button>
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
<script src="${host}/static/js/service/format.js"></script>
<script>

    $(document).ready(function () {
        "use strict";
        // Select2
        jQuery(".select2").select2({
            width: '100%'
        });

        $("#returns").hide();

        $("#addHeader")
                .click(
                        function () {

                            $("#headers")
                                    .append(
                                            '<tr class="m_header_row">'
                                            + '<td class="m_header_name" contenteditable style="outline: none;"></td>'
                                            + '<td class="m_header_value" contenteditable style="outline: none; overflow:hidden;"></td>'
                                            + '<td class="table-action">'
                                            + '<a href="#" class="m_header_delete delete-row"><i class="fa fa-trash-o"></i></a></td> </tr>');
                        });


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


                            //解析headers

                            var headerObj = {}, headersAry = [], $m_header_rows = $(
                                    "#headers").find(".m_header_row");

                            for (var loop = 0, header_len = $m_header_rows.length; loop < header_len; loop++) {
                                var $header_row = $m_header_rows.eq(loop), header = {};

                                header.name = $header_row.find(".m_header_name").text();
                                header.value = $header_row.find(".m_header_value").text();

                                headersAry.push(header);
                            }

                            headerObj.headers = headersAry;

                            var headerStr = JSON.stringify(headerObj);
                            console.log(headerStr);

                            //解析参数
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

                            //提交

                            $
                                    .ajax({
                                        type: 'POST',
                                        url: '../unit/test',
                                        data: {
                                            method: $("#method").val(),
                                            url: $("#url").val(),
                                            params: paramStr,
                                            headers: headerStr
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

                                                $("#responsebody").html("<pre><code class='language-json'>" + format(data.result.responseBody) + "</code></pre>");
                                                Prism.highlightAll();

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

        $(document).on("click", ".m_header_delete", function () {
            $(this).parents(".m_header_row").remove();
        });
    })
</script>
</body>
</html>
