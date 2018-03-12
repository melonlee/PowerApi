<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
    <style type="text/css">

        .modal-sm {
            width: 80%;
        !important;
        }
    </style>
</head>
<body>
<section>
    <div id="preloader">
        <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
    </div>
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
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="unittest" items="${testList}">
                            <tr>
                                <td><c:choose>
                                    <c:when test="${unittest.responseCode!=200}">
                                                 <span
                                                         class="pull-right badge badge-danger">${unittest.responseCode}</span>
                                    </c:when>
                                    <c:otherwise>
                                                 <span
                                                         class="pull-right badge badge-success">${unittest.responseCode}</span>
                                    </c:otherwise>
                                </c:choose>
                                    <div class="text-primary"><a data-toggle="modal" style="cursor:pointer"
                                                                 class="test-item"
                                                                 data-content='${unittest.responseBody}'
                                                                 data-target=".bs-example-modal-sm"><strong>${unittest.functionTitle}
                                    </strong></a>
                                    </div>
                                    <small>${unittest.url}
                                    </small>
                                </td>
                                <td>${unittest.method}</td>
                                <td>${unittest.requestTime}</td>
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
</section>
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
     aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
                <h4 class="modal-title">返回结果</h4></div>
            <div class="modal-body">


            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/scripts.jsp"></jsp:include>
<script src="${host}/static/js/service/format.js"></script>
<script>
    jQuery(document).ready(function () {

        $(document).on("click", ".test-item", function () {
            $(".modal-body").html("<pre><code class='language-json'>" + format(JSON.stringify($(this).data("content"))) + "</code></pre>");
            Prism.highlightAll();
        });

    });
</script>

</body>
</html>
