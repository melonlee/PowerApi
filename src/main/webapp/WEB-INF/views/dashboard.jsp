<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common/style.jsp"></jsp:include>
</head>
<body class="horizontal-menu">
<section>
    <div class="mainpanel">
        <jsp:include page="common/menu.jsp" flush="true">
            <jsp:param name="nav" value="1"/>
        </jsp:include>
        <div class="pageheader">
            <h2>
                <i class="fa fa-home"></i>总览<span>专注API接口服务管理，让您的API接口更稳定，管理更快捷</span>
            </h2>
        </div>
        <div class="contentpanel">

            <div class="row">
                <c:if test="${status>0}">
                    <div class="col-md-12">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert"
                                    aria-hidden="true">&times;</button>
                            更新密码操作成功！
                        </div>
                    </div>
                </c:if>

                <div class="col-sm-6 col-md-3">
                    <div class="panel panel-success panel-stat">
                        <div class="panel-heading">

                            <div class="stat">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <img src=${host}/images/is-user.png" alt=""/>
                                    </div>
                                    <div class="col-xs-8">
                                        <h4>测试记录</h4>

                                        <h1>${testCount }</h1>
                                    </div>
                                </div>
                                <!-- row -->
                            </div>
                            <!-- stat -->

                        </div>
                        <!-- panel-heading -->
                    </div>
                    <!-- panel -->
                </div>
                <!-- col-sm-6 -->

                <div class="col-sm-6 col-md-3">
                    <div class="panel panel-danger panel-stat">
                        <div class="panel-heading">

                            <div class="stat">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <img src="${host}/images/is-document.png" alt=""/>
                                    </div>
                                    <div class="col-xs-8">
                                        <h4>项目</h4>

                                        <h1>${proCount }</h1>
                                    </div>
                                </div>
                                <!-- row -->


                            </div>
                            <!-- stat -->

                        </div>
                        <!-- panel-heading -->
                    </div>
                    <!-- panel -->
                </div>
                <!-- col-sm-6 -->

                <div class="col-sm-6 col-md-3">
                    <div class="panel panel-primary panel-stat">
                        <div class="panel-heading">

                            <div class="stat">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <img src="${host}/images/is-document.png" alt=""/>
                                    </div>
                                    <div class="col-xs-8">
                                        <h4>接口</h4>

                                        <h1>0</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- stat -->

                        </div>
                        <!-- panel-heading -->
                    </div>
                    <!-- panel -->
                </div>
                <!-- col-sm-6 -->

                <div class="col-sm-6 col-md-3">
                    <div class="panel panel-dark panel-stat">
                        <div class="panel-heading">

                            <div class="stat">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <img src="${host}/images/is-money.png" alt=""/>
                                    </div>
                                    <div class="col-xs-8">
                                        <h4>BUG</h4>

                                        <h1>${bugCount}</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default panel-alt">
                        <div class="panel-heading">
                            <h4 class="panel-title">动态</h4>
                        </div>
                        <div class="panel-body">
                            <ul>
                                <c:forEach var="log" items="${list}">
                                    <li><p class="text-danger">
                                        您在${log.createdate }&nbsp;${log.showAction }了名为<a
                                            href="#">${log.showTitle}</a>的${log.showResource}
                                    </p></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="common/scripts.jsp"></jsp:include>
</body>
</html>
