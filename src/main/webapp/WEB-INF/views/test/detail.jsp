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
            </div>
        </div>

        <div class="contentpanel">

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-6 text-left">
                            <h3 class="text-primary">${autoTest.title}</h3>
                            <p><strong>接口总数:</strong> ${autoTest.totalcount}</p>
                            <p><strong>测试错误数:</strong> ${autoTest.errorcount}</p>
                            <p><strong>测试总耗时:</strong> ${autotest.totaltime/1000}秒</p>
                            <p><strong>测试时间:</strong> ${autoTest.createdate}</p>

                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-invoice">
                            <thead>
                            <tr>
                                <th>测试项</th>
                                <th>请求方式</th>
                                <th>请求耗时</th>
                                <th>返回状态码</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="unittest" items="${testList}">
                                <tr>
                                    <td>
                                        <div class="text-primary"><strong>${unittest.url}
                                        </strong>
                                        </div>
                                        <small>${unittest.url}
                                        </small>
                                    </td>
                                    <td>${unittest.method}</td>
                                    <td>${unittest.requestTime}</td>
                                    <td>

                                        <c:choose>

                                            <c:when test="${unittest.responseCode!=200}">
                                                 <span
                                                         class="pull-right badge badge-danger">${unittest.responseCode}</span>
                                            </c:when>

                                            <c:otherwise>
                                                 <span
                                                         class="pull-right badge badge-success">${unittest.responseCode}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-right btn-invoice">
                        <a class="btn btn-primary mr5"> 导出测试结果</a>
                        <a class="btn btn-white"
                           onclick="javascript:window.history.back()"> 返回测试列表</a>
                    </div>
                    <div class="mb40"></div>
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
            $.ajax({
                type: 'GET',
                url: '../auto/delete',
                data: {
                    id: $(this).data("aid")
                },
                cache: false,
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    if (data.code == 1000) {
                        $(this).parents(".autotest-row").remove();
                    }
                },
                error: function () {
                    alert("删除失败,请重试!");
                }
            });
        });

    });
</script>

</body>
</html>
