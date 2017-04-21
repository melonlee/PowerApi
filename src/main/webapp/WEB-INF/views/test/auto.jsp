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
        <jsp:param name="nav" value="5"/>
    </jsp:include>
    <div class="mainpanel">
        <div class="pageheader">
            <div class="row">
                <div class="col-md-11">
                    <h2>
                        <i class="fa  fa-send"></i>自动化测试<span>对指定项目的接口进行可用性测试(非期望值正确性测试)</span>
                    </h2>
                </div>
                <div class="col-md-1">
                    <p>
                        <a class="btn btn-primary" id="create">新增测试 </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="contentpanel">
            <!--设置测试-->
            <div class="row" id="settings">
                <div class="col-md-12">

                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <strong>注意!
                            在进行自动化测试前请确保您录入的接口数据中的参数的[示例]值不为空!</strong>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-btns">
                            </div>
                            <h4 class="panel-title">设置自动化测试项目</h4>
                            <p>您可以默认整个项目进行测试或者勾选出不进行测试的接口</p>
                        </div>
                        <div class="panel-body panel-body-nopadding">

                            <div id="progressWizard" class="basic-wizard">
                                <ul class="nav nav-pills nav-justified">
                                    <li><a href="#ptab1" data-toggle="tab"><span>Step 1:</span>基本设置</a></li>
                                    <li><a href="#ptab2" data-toggle="tab"><span>Step 2:</span>通用参数设置</a></li>
                                    <%--<li><a href="#ptab3" data-toggle="tab"><span>Step 3:</span>选择接口</a></li>--%>
                                </ul>

                                <div class="tab-content">
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="50"
                                             aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                    <div class="tab-pane" id="ptab1">
                                        <div class="form-group">
                                            <label class="col-sm-4">本次测试标题</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="title" class="form-control"
                                                       placeholder="例如:1.0上线前本地第2次测试"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4">本次要测试的项目</label>
                                            <div class="col-sm-4">
                                                <select class="select2" id="projects">
                                                    <option value="0">选择项目</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="ptab2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="alert alert-info">
                                                    <button type="button" class="close" data-dismiss="alert"
                                                            aria-hidden="true">&times;</button>
                                                    例如对userId,page等通用类型的参数内容进行设置.
                                                </div>
                                            </div>

                                            <div style="visibility: hidden;" id="div_headers">
                                            </div>

                                            <div class="col-sm-12">
                                                <div class="table-responsive">
                                                    <table class="table mb30 table-primary">
                                                        <thead>
                                                        <tr>
                                                            <th>参数名</th>
                                                            <th>参数值</th>
                                                            <th></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="headers">
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <button id="addHeader" class="btn btn-success">+参数信息
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="pager wizard">
                                    <a class="btn btn-primary pull-right" id="submit" type="button">提交测试 </a>
                                    <button id="loading" data-toggle="modal"
                                            style="display: none;" data-target=".bs-example-modal-sm">loading
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h4 class="panel-title">测试记录</h4>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr class="table-head-alt">
                                        <th>#记录</th>
                                        <th>接口总数</th>
                                        <th>测试失败数</th>
                                        <th>测试时间</th>
                                        <th>总耗时</th>
                                        <th>正确率</th>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="autotest" items="${finished}">
                                        <tr class="autotest-row">
                                            <td>${autotest.title}</td>
                                            <td>${autotest.totalcount}</td>
                                            <td>${autotest.errorcount}</td>
                                            <td>${autotest.relativedate}</td>
                                            <td>${autotest.totaltime/1000}秒</td>
                                            <td>
                                                <div class="progress progress-success active">
                                                    <div style="width: ${((autotest.totalcount-autotest.errorcount)/autotest.totalcount)*100}%"
                                                         aria-valuemax="100" aria-valuemin="0"
                                                         aria-valuenow="${((autotest.totalcount-autotest.errorcount)/autotest.totalcount)*100}"
                                                         role="progressbar"
                                                         class="progress-bar progress-bar-success">
                                                    </div>
                                                </div>
                                            </td>
                                            <td>${((autotest.totalcount-autotest.errorcount)/autotest.totalcount)*100}%</td>
                                            <td>
                                                <div class="btn-group">
                                                    <a data-toggle="dropdown" class="dropdown-toggle">
                                                        <i class="fa fa-cog"></i>
                                                    </a>
                                                    <ul role="menu" class="dropdown-menu pull-right">
                                                        <li><a href="#"><i class="fa fa-eye"></i> 查看测试记录</a></li>
                                                        <li><a href="#"><i class="fa fa-rocket"></i> 再次进行测试</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#" data-aid="${autotest.id}"
                                                               class="delete-autotest"><i
                                                                class="fa fa-trash-o"></i> 删除测试记录</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="contentpanel">
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
    jQuery(document).ready(function () {

        "use strict";

        $("#settings").hide();

        // Progress Wizard
        $('#progressWizard').bootstrapWizard({
            'nextSelector': '.next',
            'previousSelector': '.previous',
            onNext: function (tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index + 1;
                var $percent = ($current / $total) * 100;
                jQuery('#progressWizard').find('.progress-bar').css('width', $percent + '%');
            },
            onPrevious: function (tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index + 1;
                var $percent = ($current / $total) * 100;
                jQuery('#progressWizard').find('.progress-bar').css('width', $percent + '%');
            },
            onTabShow: function (tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index + 1;
                var $percent = ($current / $total) * 100;
                jQuery('#progressWizard').find('.progress-bar').css('width', $percent + '%');
            }
        });

        jQuery(".select2").select2({
            width: '100%',
            minimumResultsForSearch: -1
        });

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

        $(document).on("click", ".m_header_delete", function () {
            $(this).parents(".m_header_row").remove();
        });
        $(document).on("click", "#create", function () {

            //获取项目数据

            $.ajax({
                type: 'POST',
                url: '../project/all',
                data: {},
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 1000) {
                        $("#projects").empty();
                        console.log(data.result);
                        var project_html = "";
                        for (var loop = 0; loop < data.result.length; loop++) {
                            var project = data.result[loop];
                            project_html += ' <option value="' + project.id + '">' + project.title + '</option>';
                        }
                        $("#projects").append(project_html);
                        $("#settings").slideDown("slow");
                        $("#create").hide();
                    }
                },
                error: function () {
                    alert('项目数据获取失败');
                }
            });
        });

        $(document).on("click", "#submit", function () {

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

            $.ajax({
                type: 'POST',
                url: '../auto/test',
                data: {
                    title: $("#title").val(),
                    pId: $("#projects").val(),
                    headers: headerStr
                },
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data.code == 1000) {
                        $("#settings").hide();
                        $("#create").show();
                        $("#loading").click();
                    }
                },
                error: function () {
                    $("#loading").click();
                    alert("提交测试失败,请重试!");
                }
            });
        });


        function loadtesting() {

            $.ajax({
                type: 'GET',
                url: '../auto/testing',
                data: {},
                cache: false,
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    if (data.code == 1000) {
                        $("#testing-data").empty();
                        var testing_tbody = "";
                        for (var loop = 0; loop < data.result.length; loop++) {
                            var test_data = data.result[loop];
                            testing_tbody += ' <tr>  <td>' + test_data.title + '</td>  <td>' + test_data.title + '</td> <td>3分钟前</td> </tr>';

                        }
                        $("#testing-data").append(testing_tbody);
                    }
                },
                error: function () {

                }
            });
        }

        $(document).on("click", ".delete-autotest", function () {
            console.log($(this).data("aid"));
            $(this).parents(".autotest-row").remove();
//            $.ajax({
//                type: 'GET',
//                url: '../auto/delete',
//                data: {
//                    id: $(this).data("aid")
//                },
//                cache: false,
//                dataType: 'json',
//                success: function (data) {
//                    console.log(data);
//                    if (data.code == 1000) {
//                        $(this).parents(".autotest-row").remove();
//                    }
//                },
//                error: function () {
//                    alert("删除失败,请重试!");
//                }
//            });
        });

    });
</script>

</body>
</html>
