<#import "/spring.ftl" as spring>
<div class="headerbar">
    <div class="header-left">
        <div class="logopanel">
            <h1>
                <span>[</span> Power.API <span>]</span>
            </h1>
        </div>
        <div class="topnav">
            <a class="menutoggle"><i class="fa fa-bars"></i></a>
            <ul class="nav nav-horizontal">
                <li>
                    <a href="../dashboard/console.do"><i class="fa fa-home"></i> <span>总览</span></a></li>
                <li>
                    <a href="../pro/list.do"><i class="fa fa-briefcase"></i> <span>
							项目管理</span> </a>
                <li>
                    <a href="../quick/view.do"><i class="fa fa-send"></i> <span>单元测试</span></a></li>

                <li>
                    <a href="../auto/list.do"><i
                            class="fa fa-truck"></i> <span>自动测试</span><span
                            class="pull-right badge badge-danger">Beta</span></a></li>
                <li>
                    <a href="../monitor/list.do"><i
                            class="fa fa-rocket"></i> <span>自动监控</span><span
                            class="pull-right badge badge-danger">Beta</span></a></li>
            </ul>
        </div>
    </div>
    <div class="header-right">
        <ul class="headermenu">
            <li>
                <div class="btn-group">
                    <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-envelope"></i>
                        <span class="badge">1</span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-head pull-right">
                        <h5 class="title">您有未读消息</h5>
                        <ul class="dropdown-list gen-list">
                            <li class="new">
                                <a href="">
                    <span>
                      <span class="name">项目邀请通知 <span class="badge badge-success">new</span></span>
                      <span class="msg">老夏邀请你加入项目Power.API用户组</span>
                    </span>
                                </a>
                            </li>

                            <li class="new"><a href="">查看所有消息</a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle"
                            data-toggle="dropdown">
                        <img src="<@spring.url '/static/images/logo.jpg'/>" alt=""/> username <span
                            class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                        <li><a href="../dashboard/changepwd.do"><i
                                class="glyphicon glyphicon-cog"></i> 更改密码</a></li>
                        <li><a href="../signout.do"><i
                                class="glyphicon glyphicon-log-out"></i> 退出</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</div>