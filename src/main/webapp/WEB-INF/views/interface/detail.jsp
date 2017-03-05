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
                <i class="fa fa-book"></i><span>接口详细信息</span>
            </h2>
        </div>

        <div class="contentpanel">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12" id="alert">
                            <c:if test="${status>0}">
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert"
                                            aria-hidden="true">&times;</button>
                                    操作成功!
                                </div>
                            </c:if>
                        </div>
                        <div class="col-sm-3 col-lg-2">
                            <ul class="nav nav-pills nav-stacked nav-email mb20"
                                id="module_nav">

                                <c:forEach var="module" items="${modules}">
                                    <li id="${module.id}" title="${module.title}"
                                        data-url="${module.url}" data-desc="${module.description}"
                                        class="module_nav_row"><a href="#"> <i
                                            class="glyphicon glyphicon-folder-open"></i> ${module.title }
                                    </a></li>
                                </c:forEach>
                                <li><a href="../module/view.do?proID=${project.id}"> <i
                                        class="glyphicon glyphicon-pencil"></i> 添加模块
                                </a></li>
                            </ul>

                        </div>

                        <div class="col-sm-9 col-lg-10">
                            <div class="panel panel-default">
                                <div class="panel-body">

                                    <div class="pull-left" id="tag_div">
                                        <c:choose>
                                            <c:when test="${function.status==1}">
                                                <span class="pull-right badge badge-info">正常</span>
                                            </c:when>
                                            <c:when test="${function.status==2}">
                                                <span class="pull-right badge badge-success">新增</span>
                                            </c:when>
                                            <c:when test="${function.status==3}">
                                                <span class="pull-right badge badge-danger">变更</span>
                                            </c:when>
                                            <c:when test="${function.status==4}">
                                                <span class="pull-right badge badge-warning">异常</span>
                                            </c:when>
                                        </c:choose>

                                    </div>
                                    <div class="pull-right">
                                        <div class="btn-group mr10">
                                            <a class="btn btn-sm btn-white tooltips" type="button"
                                               href="test?proId=${project.id}&id=${function.id}"
                                               target="_blank" data-toggle="tooltip" title="测试接口"> <i
                                                    class="fa fa-paper-plane"></i>
                                            </a>

                                            <button class="btn btn-sm btn-white tooltips" type="button"
                                                    data-toggle="tooltip" title="删除接口">
                                                <i class="glyphicon glyphicon-trash"></i>
                                            </button>
                                        </div>

                                        <div class="btn-group mr10">
                                            <div class="btn-group nomargin">
                                                <button data-toggle="dropdown"
                                                        class="btn btn-sm btn-white dropdown-toggle tooltips"
                                                        type="button" title="标记接口">
                                                    <i class="glyphicon glyphicon-tag mr5"></i> <span
                                                        class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#" class="function_tag" data-status="2"
                                                           data-id="${function.id}"><i class="fa fa-plus mr5"></i>
                                                        新增</a></li>
                                                    <li><a href="#" class="function_tag" data-status="3"
                                                           data-id="${function.id}"><i
                                                            class="fa fa-bullhorn mr5"></i> 变更</a></li>
                                                    <li><a href="#" class="function_tag" data-status="4"
                                                           data-id="${function.id}"><i class="fa fa-bug mr5"></i>
                                                        异常</a></li>
                                                    <li><a href="#" class="function_tag" data-status="1"
                                                           data-id="${function.id}"><i class="fa fa-check mr5"></i>
                                                        正常</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- pull-right -->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-group">

                                                        <input type="hidden" id="id" value="${function.id}"/>

                                                        <div class="col-sm-3">
                                                            <input type="text" id="title" class="form-control"
                                                                   placeholder="名称" value="${function.title}"/>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <input type="text" id="url" class="form-control"
                                                                   placeholder="地址:submit.do" value="${function.url}"/>
                                                        </div>


                                                        <div class="col-sm-3">
                                                            <select class="select2" id="method">
                                                                <option value="GET"
                                                                ${function.method=='GET' ? "selected" :""}>GET
                                                                </option>
                                                                <option value="POST"
                                                                ${function.method=='POST' ? "selected" :""}>POST
                                                                </option>
                                                                <option value="PUT"
                                                                ${function.method=='PUT' ? "selected" :""}>PUT
                                                                </option>
                                                                <option value="DELETE"
                                                                ${function.method=='PUT' ? "selected" :""}>DELETE
                                                                </option>
                                                            </select>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <select class="select2" id="response_type">
                                                                <option value="JSON"
                                                                ${function.method=='JSON' ? "selected" :""}>JSON
                                                                </option>
                                                                <option value="XML"
                                                                ${function.method=='XML' ? "selected" :""}>XML
                                                                </option>
                                                                <option value="HTML"
                                                                ${function.method=='HTML' ? "selected" :""}>HTML
                                                                </option>
                                                                <option value="TEXT"
                                                                ${function.method=='TEXT' ? "selected" :""}>TEXT
                                                                </option>
                                                            </select>
                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-12">
																<textarea class="form-control" id="description" rows="2"
                                                                          placeholder="特别说明">${function.description}</textarea>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">

                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="table-responsive">

                                                                    <div class="col-md-12">
                                                                        <div class="alert alert-info">
                                                                            <button type="button" class="close"
                                                                                    data-dismiss="alert"
                                                                                    aria-hidden="true">&times;</button>
                                                                            点击+参数按钮，在列表中直接输入所需参数!
                                                                        </div>
                                                                    </div>
                                                                    <div style="visibility: hidden;" id="div_params"
                                                                         data-params='${function.params}'></div>
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
                                                                    <!-- table-responsive -->
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-sm-12">
                                                                        <button id="addParam" class="btn btn-success">
                                                                            +参数
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="col-md-12 mb20">
                                                    <!-- Nav tabs -->
                                                    <ul class="nav nav-tabs">
                                                        <li class="active"><a href="#returns"
                                                                              data-toggle="tab"><strong>返回示例</strong></a>
                                                        </li>
                                                    </ul>

                                                    <!-- Tab panes -->
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="returns">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <div class="col-sm-12">
																			<textarea class="form-control"
                                                                                      id="response_body"
                                                                                      placeholder="示例内容"
                                                                                      rows="5">${function.responseBody}</textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>

                                                <!-- panel-body -->
                                                <div class="panel-footer">
                                                    <button id="submit" class="btn btn-primary">提交</button>
                                                    <button class="btn btn-default" type="button"
                                                            onclick="javascript:window.history.back()">返回
                                                    </button>
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
        </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>

<script type="text/javascript">
    "use strict";
    // Select2
    jQuery(".select2").select2({
        width: '100%'
    });

    $(".module_nav_row").removeClass("active");

    $("#" +${param.mId}).addClass("active");


    loadparams();

    function loadparams() {

        var $divparams = $("#div_params");

        console.log($divparams.data("params"));

        var paramsAry = $divparams.data("params");

        if ("" != paramsAry) {
            var typeAry = ["Byte", "Short", "Int", "Boolean", "Flot", "Double", "String",
                "Long", "JSON", "File"];
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
                        str += '<option value="' + typeNow + '" selected>' + typeNow
                                + '</option>';
                    } else {
                        str += '<option value="' + typeNow + '">' + typeNow
                                + '</option>';
                    }
                }
                str += '</select></td>'
                        + '<td  class="m_param_desc" contenteditable style="outline: none;">'
                        + functionDetailObj.desc
                        + '</td>' +
                        '<td><select class="select2 m_param_isneed">';

                if (functionDetailObj.isneed == "1") {
                    str += '<option  value="1" selected>是</option><option  value="0">否</option>';
                } else if (functionDetailObj.isneed == "0") {
                    str += '<option  value="0" selected>否</option><option  value="1">是</option>';
                }
                str += '</select></td>'
                        + '<td class="m_param_value" contenteditable style="outline: none;">' + functionDetailObj.value + '</td>'
                        + '<td class="m_param_defaultvalue" contenteditable style="outline: none;">' + functionDetailObj.defaultvalue + '</td>'
                        + '<td class="table-action"><a href="#" class="m_param_delete delete-row"><i class="fa fa-trash-o"></i></a></td>' +
                        '</tr>';
            }

            $("#params").append(str);
        }

    }

    $("#addParam")
            .click(
                    function () {

                        $("#params")
                                .append(
                                        '<tr class="m_param_row"><td class="m_param_name" contenteditable style="outline: none;"></td>' +
                                        '<td><select class="select2 m_param_type">' +
                                        '<option value="String">String</option>' +
                                        '<option value="Int">Int</option>' +
                                        '<option value="Byte">Byte</option>' +
                                        '<option value="Short">Short</option>' +
                                        '<option value="Boolean">Boolean</option>' +
                                        '<option value="Flat">Flat</option>' +
                                        '<option value="Double">Double</option>' +
                                        '<option value="Long">Long</option>' +
                                        '<option value="JSON">JSON</option>' +
                                        '<option value="File">File</option>' +
                                        '</select></td>' +
                                        '<td class="m_param_desc" contenteditable style="outline: none;"></td>' +
                                        '<td><select class="select2 m_param_isneed">' +
                                        '<option value="1">是</option>' +
                                        '<option value="0">否</option>' +
                                        '</select></td>' +
                                        '<td class="m_param_value" contenteditable style="outline: none;"></td>' +
                                        '<td class="m_param_defaultvalue" contenteditable style="outline: none;"></td>' +
                                        '<td class="table-action"><a href="#"' +
                                        ' class="m_param_delete delete-row"><i class="fa fa-trash-o"></i></a></td>' +
                                        '</tr>');
                    });


    //点击导航
    $(document).on("click", ".module_nav_row", function () {
        window.location.href = "../module/all?proId=" +${project.id};
    });

    $(document).on("click", ".m_param_delete", function () {

        $(this).parents(".m_param_row").remove();
    });


    $(document).on("click", ".function_tag", function () {

        $(this).parents(".m_param_row").remove();

        var $this = $(this);

        //
        if ($this.data("status") == 1) {
            $("#tag_div").empty().append('<span class="pull-right badge badge-info">正常</span>');
        } else if ($this.data("status") == 2) {
            $("#tag_div").empty().append('<span class="pull-right badge badge-success">新增</span>');
        } else if ($this.data("status") == 3) {
            $("#tag_div").empty().append('<span class="pull-right badge badge-danger">变更</span>');
        } else if ($this.data("status") == 4) {
            $("#tag_div").empty().append('<span class="pull-right badge badge-warning">异常</span>');
        }

        $.ajax({
            type: 'POST',
            url: '../function/tag',
            data: {
                id: $this.data("id"),
                status: $this.data("status")
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                /*  data = JSON.parse(data); */
                if (data.code == 1000) {
                    $("#alert").empty().append(' <div class="alert alert-success"><button id="alert_close" type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>标记接口成功! </div>  ');

                    setTimeout(function () {
                        $("#alert_close").click();
                    }, 1500);


                } else {
                    alert("提交数据异常，请重试!");
                }
            },
            error: function () {
                alert("获取数据异常，请重试!");
            }
        });


    });


    //提交
    $("#submit")
            .click(
                    function () {

                        var paramObj = {}, paramsAry = [], $m_param_rows = $(
                                "#params").find(".m_param_row");

                        console.log($m_param_rows);

                        for (var i = 0, len = $m_param_rows.length; i < len; i++) {
                            var $row = $m_param_rows.eq(i), param = {};

                            param.name = $row.find(".m_param_name").text();
                            param.type = $row.find(".m_param_type").val();
                            param.desc = $row.find(".m_param_desc").text();
                            param.isneed = $row.find(".m_param_isneed").val();
                            param.value = $row.find(".m_param_value").text();
                            param.defaultvalue = $row.find(".m_param_defaultvalue").text();
                            paramsAry.push(param);
                        }

                        paramObj.params = paramsAry;

                        var paramStr = JSON.stringify(paramObj);
                        console.log(paramStr);
                        console.log($("#response_body").val());
                        console.log($("#description").val());
                        //提交
                        $.ajax({
                            type: 'POST',
                            url: '../function/modify',
                            data: {
                                mId:${param.mId},
                                id: $("#id").val(),
                                title: $("#title").val(),
                                description: $("#description").val(),
                                responseType: $("#response_type").val(),
                                method: $("#method").val(),
                                url: $("#url").val(),
                                params: paramStr,
                                responseBody: $("#response_body").val()
                            },
                            cache: false,
                            dataType: 'json',
                            success: function (data) {
                                /*  data = JSON.parse(data); */
                                if (data.code == 1000) {
                                    window.location.href = "../module/all.do?proId=" +${project.id};
                                } else {
                                    alert("提交数据异常，请重试!");
                                }

                            },
                            error: function () {
                                alert("获取数据异常，请重试!");
                            }
                        });

                    });
</script>


</body>
</html>
