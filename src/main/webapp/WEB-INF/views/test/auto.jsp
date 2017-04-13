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
            <h2>
                <i class="fa  fa-send"></i>自动化测试<span>对指定项目的接口进行可用性测试(非期望值正确性测试)</span>
            </h2>
        </div>
        <div class="contentpanel">

            <div class="alert alert-warning">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <strong>注意!</strong> 在进行自动化测试前请确保您录入的接口数据中的参数的[示例]值不为空</a>.
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">正在测试中的项目</h4>
                        </div>

                        <div class="panel-body">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="contentpanel">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h4 class="panel-title">已完成测试的项目</h4>
                        </div>
                        <div class="panel-body">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>
</body>
</html>
