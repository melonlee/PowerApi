<%--
  Created by IntelliJ IDEA.
  User: Melon
  Date: 17/3/21
  Time: 下午5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="host" value="${pageContext.request.contextPath}"></c:set>

<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<div class="leftpanel">

    <div class="logopanel">
        <h1><span>[</span> Power.API <span>]</span></h1>
    </div>

    <div class="leftpanelinner">

        <h5 class="sidebartitle">导航</h5>

        <ul class="nav nav-pills nav-stacked nav-bracket">
            <li ${param.nav==1 ? "class='active'" : "" }><a
                    href="../dashboard/console"><i class="fa fa-home"></i> <span>
                            总览</span></a></li>

            <li ${param.nav==2 ? "class='active'" : "" }><a
                    href="../project/all"><i class="fa fa-briefcase"></i> <span>
							项目管理</span> </a></li>

            <li class="nav-parent ${param.nav==4 ||  param.nav==5 ? "active nav-active" : "" }"><a href=""><i
                    class="fa fa-send"></i>
                <span>测试管理</span></a>
                <ul class="children" ${param.nav==4 ||  param.nav==5  ? "style='display:block;'" : "" }>
                    <li ${param.nav==4 ? "class='active'" : "" } ><a href="../unit/view"><i class="fa fa-send"></i> 单元测试</a>
                    </li>
                    <li  ${param.nav==5 ? "class='active'" : "" } ><a href="../auto/view"><i class="fa fa-truck"></i>
                        自动化测试 <span
                                class="pull-right badge badge-danger">Beta</span></a></li>
                </ul>
            </li>


            <li class="nav-parent ${param.nav==6 ||  param.nav==9 ? "active nav-active" : "" }"><a href=""><i
                    class="fa fa-cubes"></i>
                <span>Mock管理</span></a>
                <ul class="children" ${param.nav==8 ||  param.nav==9  ? "style='display:block;'" : "" }>
                    <li ${param.nav==8 ? "class='active'" : "" } ><a href="../mock/all"><i class="fa fa-users"></i>手动Mock</a>
                    </li>
                    <li  ${param.nav==9 ? "class='active'" : "" } ><a href="../group/members"><i class="fa fa-user"></i>
                        自动Mock <span
                                class="pull-right badge badge-danger">Beta</span></a></li>
                </ul>
            </li>


            <li ${param.nav==7 ? "class='active'" : "" }><a
                    href="../monitor/all"><i class="fa fa-shield"></i> <span>
							监控管理</span> </a></li>

            <li class="nav-parent ${param.nav==8 ||  param.nav==9 ? "active nav-active" : "" }"><a href=""><i
                    class="fa fa-trophy"></i>
                <span>团队管理</span></a>
                <ul class="children" ${param.nav==8 ||  param.nav==9  ? "style='display:block;'" : "" }>
                    <li ${param.nav==8 ? "class='active'" : "" } ><a href="../group/all"><i class="fa fa-users"></i>创建/管理团队</a>
                    </li>
                    <li  ${param.nav==9 ? "class='active'" : "" } ><a href="../group/members"><i class="fa fa-user"></i>
                        成员管理 <span
                                class="pull-right badge badge-danger">Beta</span></a></li>
                </ul>
            </li>

            <li class="nav-parent ${param.nav==10 ||  param.nav==11 ? "active nav-active" : "" }"><a href=""><i
                    class="fa fa-gear"></i>
                <span>系统设置</span></a>
                <ul class="children" ${param.nav==10 ||  param.nav==11  ? "style='display:block;'" : "" }>
                    <li ${param.nav==10 ? "class='active'" : "" } ><a href="../message/all"><i
                            class="fa fa-volume-up"></i>通知设置</a>
                    </li>
                    <li ${param.nav==11 ? "class='active'" : "" } ><a href="../role/all"><i
                            class="fa fa-sitemap"></i>角色管理</a>
                    </li>
                </ul>
            </li>
        </ul>

        <div class="infosummary">
            <h5 class="sidebartitle">服务器状态</h5>
            <ul>
                <li>
                    <div class="datainfo">
                        <span class="text-muted">CPU</span>
                        <h4>66%</h4>
                    </div>
                    <div id="sidebar-chart" class="chart"></div>
                </li>
                <li>
                    <div class="datainfo">
                        <span class="text-muted">CACHE</span>
                        <h4>206M</h4>
                    </div>
                    <div id="sidebar-chart2" class="chart"></div>
                </li>
                <li>
                    <div class="datainfo">
                        <span class="text-muted">DISK</span>
                        <h4>82.2%</h4>
                    </div>
                    <div id="sidebar-chart3" class="chart"></div>
                </li>
                <li>
                    <div class="datainfo">
                        <span class="text-muted">JVM</span>
                        <h4>140.05</h4>
                    </div>
                    <div id="sidebar-chart4" class="chart"></div>
                </li>
                <li>
                    <div class="datainfo">
                        <span class="text-muted">NETWORK</span>
                        <h4>32.2%</h4>
                    </div>
                    <div id="sidebar-chart5" class="chart"></div>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="headerbar">
    <div class="header-right">
        <ul class="headermenu">
            <li>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle"
                            data-toggle="dropdown">
                        <img src="${host}/static/images/logo.jpg"
                             alt=""/><shiro:principal/> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">

                        <li><a href="../dashboard/changepwd"><i
                                class="glyphicon glyphicon-cog"></i> 更改密码</a></li>
                        <li><a href="../dashboard/signout"><i
                                class="glyphicon glyphicon-log-out"></i> 退出</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</div>