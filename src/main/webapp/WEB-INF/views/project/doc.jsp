<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
    <style type="text/css">
        .table-hover > tbody > tr:hover > td, .table-hover > tbody > tr:hover > th {
            background-color: #eee;
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
                                            id="function_test_btn" data-proId="${project.id}" data-toggle="tooltip"
                                            title="测试接口">
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
<script src="${host}/static/js/service/project.js"></script>
</body>
</html>
