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

        <jsp:include page="../common/leftmenu.jsp" flush="true">
            <jsp:param name="nav" value="6"/>
        </jsp:include>

        <div class="pageheader">
            <div class="row">
                <div class="col-md-11">
                    <h2>
                        <i class="fa fa-rocket"></i>自动监控<span>设置项目中接口条目进行可用性监控</span>
                    </h2>
                </div>
                <div class="col-md-1">
                    <p>
                        <button class="btn btn-primary">添加监控条目
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
                            <h5 class="panel-title">接口监控列表</h5>
                        </div>
                        <!-- panel-heading -->
                        <div class="panel-body panel-table">
                            <div class="table-responsive">
                                <table class="table table-buglist">
                                    <thead>
                                    <tr>
                                        <th>状态</th>
                                        <th>项目</th>
                                        <th>接口</th>
                                        <th>可用性</th>
                                        <th>最后监控时间</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>✅❌</td>
                                        <td><a href="#">手纸</a></td>
                                        <td><a href="#">获取模板列表</a></td>
                                        <td>100%</td>
                                        <td>4分钟前</td>
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


            <h4 class="title mb3">最近事件一览（最近2周）</h4>
            <ul class="nav nav-tabs nav-dark">
                <li class="active"><a data-toggle="tab" href="#all"><strong>所有</strong></a></li>
                <li><a data-toggle="tab" href="#added"><strong>警告</strong></a></li>
                <li><a data-toggle="tab" href="#assigned"><strong>严重问题</strong></a></li>
                <li><a data-toggle="tab" href="#unresolved"><strong>报警通知</strong></a></li>
            </ul>
            <div class="tab-content">
                <div id="all" class="tab-pane active">
                    <div class="table-responsive">
                        <table class="table table-primary table-buglist">
                            <thead>
                            <tr>
                                <th></th>
                                <th>项目</th>
                                <th>接口</th>
                                <th>时间</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>✅</td>
                                <td><a href="#">PROJ-007</a></td>
                                <td><a href="#">Responsive not working in 1024x768</a></td>
                                <td>3秒钱</td>
                                <td>
                                    <a href="#"><i class="fa fa-eye"></i></a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- table-responsive -->

                    <ul class="pagination pagination-split nomargin">
                        <li class="disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>
                        <li><a href="#">1</a></li>
                        <li class="active"><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
                <!-- tab-pane -->

                <div id="added" class="tab-pane">
                    <p><strong>Note:</strong> Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                        ad minim veniam, quis nostrud exercitatio.</p>
                </div>
                <!-- tab-pane -->

                <div id="assigned" class="tab-pane">
                    Assigned To Me
                </div>
                <!-- tab-pane -->

                <div id="unresolved" class="tab-pane">
                    Unresolved
                </div>
                <!-- tab-pane -->
            </div>
            <!-- tab-content -->
        </div>
        <!-- contentpanel -->
    </div>
    <!-- contentpanel -->
    <!-- mainpanel -->
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>


</body>
</html>
