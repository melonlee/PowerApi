<%--
  Created by IntelliJ IDEA.
  User: Melon
  Date: 16/12/13
  Time: 下午5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
    <link href="<%=request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/"%>css/morris.css" rel="stylesheet">
</head>

<body class="horizontal-menu">

<section>


    <div class="mainpanel">

        <jsp:include page="../common/menu.jsp" flush="true">
            <jsp:param name="nav" value="5"/>
        </jsp:include>

        <div class="pageheader">
            <div class="row">
                <div class="col-md-11">
                    <h2>
                        <i class="fa fa-truck"></i>自动测试<span>设置项目进行自动化测试</span>
                    </h2>
                </div>
                <div class="col-md-1">
                    <p>
                        <button class="btn btn-primary">添加测试项目
                        </button>
                    </p>
                </div>
            </div>
        </div>


        <div class="contentpanel">

            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-dark panel-alt">
                        <div class="panel-heading">
                            <div class="panel-btns">
                                <a href="" class="panel-close">&times;</a>
                                <a href="" class="minimize">&minus;</a>
                            </div>
                            <!-- panel-btns -->
                            <h5 class="panel-title">测试内容</h5>
                        </div>
                        <!-- panel-heading -->
                        <div class="panel-body panel-table">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr class="table-head-alt">
                                        <th>项目</th>
                                        <th>接口数</th>
                                        <th>开始时间</th>
                                        <th>进度</th>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><a href="">Critical</a></td>
                                        <td>1</td>
                                        <td>3分钟前</td>
                                        <td>
                                            <div class="progress progress-striped active">
                                                <div style="width: 20%" aria-valuemax="100" aria-valuemin="0"
                                                     aria-valuenow="20" role="progressbar"
                                                     class="progress-bar progress-bar-warning">
                                                </div>
                                            </div>
                                        </td>
                                        <td>20%</td>
                                        <td>
                                            <div class="btn-group">
                                                <a data-toggle="dropdown" class="dropdown-toggle">
                                                    <i class="fa fa-cog"></i>
                                                </a>
                                                <ul role="menu" class="dropdown-menu pull-right">
                                                    <li><a href="#"><i class="fa fa-eye"></i> 查看监控详情</a></li>
                                                    <li><a href="#"><i class="fa fa-cog"></i> 设置监控参数</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="#"><i class="fa fa-trash-o"></i> 撤销监控</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><a href="">Trivial</a></td>
                                        <td>9</td>
                                        <td>2小时前</td>
                                        <td>
                                            <div class="progress progress-striped active">
                                                <div style="width: 100%" aria-valuemax="100" aria-valuemin="0"
                                                     aria-valuenow="20" role="progressbar"
                                                     class="progress-bar progress-bar-success">
                                                </div>
                                            </div>
                                        </td>
                                        <td>100%</td>
                                        <td>
                                            <div class="btn-group">
                                                <a data-toggle="dropdown" class="dropdown-toggle">
                                                    <i class="fa fa-cog"></i>
                                                </a>
                                                <ul role="menu" class="dropdown-menu pull-right">
                                                    <li><a href="#"><i class="fa fa-eye"></i> 查看监控详情</a></li>
                                                    <li><a href="#"><i class="fa fa-cog"></i> 设置监控参数</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="#"><i class="fa fa-trash-o"></i> 撤销监控</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                            <!-- table-responsive -->
                        </div>
                        <!-- panel-body -->
                    </div>
                    <!-- panel -->

                </div>
                <!-- col-md-6 -->
            </div>


            <h4 class="title mb3">自动化测试进度一览</h4>
            <div class="row">
                <div class="col-md-12 mb30">
                    <div id="stacked-chart" class="body-chart"></div>
                </div>

            </div>

        </div>
        <!-- contentpanel -->
    </div>
    <!-- contentpanel -->
    <!-- mainpanel -->
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
<script src="<%=request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/"%>js/charts.js"></script>
<script src="<%=request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/"%>js/flot/jquery.flot.symbol.min.js"></script>
<script src="<%=request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/"%>js/flot/jquery.flot.crosshair.min.js"></script>
<script src="<%=request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/"%>js/flot/jquery.flot.categories.min.js"></script>
<script src="<%=request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/"%>js/flot/jquery.flot.pie.min.js"></script>
</body>

</html>
