<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Power.API</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="shortcut icon" href="${host}/static/images/logo.jpg" type="image/jpg">
    <link href="${host}/static/css/style.default.css" rel="stylesheet">
    <link href="${host}/static/css/prism.css" rel="stylesheet">
    <link href="${host}/static/css/project-doc.css" rel="stylesheet">
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
        <ul class="nav nav-pills nav-stacked nav-bracket" id="module-list">
        </ul>
    </div>
</div>

<div class="mainpanel">
    <div class="contentpanel">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-body">

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
                        <h4 class="panel-title"><i class="fa fa-file-text-o"></i> 接口说明</h4>
                        <p id="description"></p>
                    </div>

                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <i class="fa  fa-chain"></i> URL</h4>
                        <p id="url"></p>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="panel-heading">
                                <h4 class="panel-title"><i class="fa fa-upload"></i> 请求方式</h4>
                                <p id="method"></p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="panel-heading">
                                <h4 class="panel-title"><i class="fa fa-cloud-download"></i> 返回类型</h4>
                                <p id="response_type"></p>
                            </div>
                        </div>
                    </div>

                    <div class="panel-heading param-table">

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
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/scripts.jsp"></jsp:include>
<script src="${host}/static/js/service/format.js"></script>
<script src="${host}/static/js/service/project-doc.js"></script>
</body>
</html>
