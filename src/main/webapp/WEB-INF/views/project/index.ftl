<#import "/spring.ftl" as spring>
<!DOCTYPE html>
<html>
<head>
<#include "../common/style.ftl">
</head>
<body class="horizontal-menu">
<section>
    <div class="mainpanel">
    <#include "../common/top.ftl">
        <div class="pageheader">

            <div class="row">
                <div class="col-md-11">
                    <h2>
                        <i class="fa fa-briefcase"></i>项目<span>对创建的项目进行管理</span>
                    </h2>
                </div>
                <div class="col-md-1">
                    <p>
                        <a class="btn btn-primary btn-block" href="create">创建项目</a>
                    </p>
                </div>
            </div>

        </div>

        <div class="contentpanel">
            <div class="row">
                <div class="people-list">
                    <div class="row">
                        <div class="col-md-12" id="action_alert">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert"
                                        aria-hidden="true">&times;</button>
                                操作成功!
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="alert alert-danger">
                                <button type="button" class="close" data-dismiss="alert"
                                        aria-hidden="true">&times;</button>
                                您目前还没有创建项目!
                            </div>
                        </div>
                    <#list projects as project>
                        <div class="col-md-6">
                            <div class="people-item">
                                <div class="media">
                                    <a target="_blank" href="../preview/${project.id}.do"
                                       class="pull-left"> <img alt=""
                                                               src="<@spring.url '/userdata/${project.icon}'/>"
                                                               class="thumbnail media-object">
                                    </a>

                                    <div class="media-body">
                                        <h4 class="person-name">
                                            <a target="_blank"
                                               href="../preview/${project.id}.do">${project.title}</a><span
                                                class="pull-right badge badge-danger">version:${project.version}</span>
                                        </h4>

                                        <div class="text-muted">
                                        <#--<i class="fa fa-calendar"></i> ${project.relativedate}-->
                                        </div>
                                        <div class="text-muted m_textoverflow">
                                            <i class="fa fa-briefcase"></i> ${project.description}
                                        </div>
                                        <ul class="social-list">
                                            <li><a href="${project.id}"
                                                   class="tooltips" data-toggle="tooltip"
                                                   data-placement="top" title="基础管理"><i
                                                    class="fa fa-gear"></i></a></li>
                                            <li><a
                                                    href="../module/interfaces.do?proID=${project.id}"
                                                    class="tooltips" data-toggle="tooltip"
                                                    data-placement="top" title="接口管理"><i
                                                    class="fa fa-code-fork"></i></a></li>
                                            <li><a href="../bug/list.do?proID=${project.id}"
                                                   class="tooltips" data-toggle="tooltip"
                                                   data-placement="top" title="Bug管理"><i
                                                    class="fa fa-bug"></i></a></li>
                                            <li><a href="../code/list.do?proID=${project.id}"
                                                   class="tooltips" data-toggle="tooltip"
                                                   data-placement="top" title="业务码管理"><i
                                                    class="fa fa-file-code-o"></i></a></li>
                                            <li><a target="_blank"
                                                   href="../preview/${project.id}.do" class="tooltips"
                                                   data-toggle="tooltip" data-placement="top" title="文档预览"><i
                                                    class="fa fa-eye"></i></a></li>

                                            <li><a target="_blank"
                                                   href="../preview/${project.id}.do" class="tooltips"
                                                   data-toggle="tooltip" data-placement="top" title="成员管理"><i
                                                    class="fa fa-users"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<#include "../common/scripts.ftl">
</body>
</html>
