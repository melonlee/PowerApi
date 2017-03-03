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
            <h2>
                <i class="fa fa-edit"></i>
                <span>
                     <#if (project.id)??>
                     ${project.title}
                     </#if>
                         项目信息</span>
            </h2>
        </div>
        <div class="contentpanel">
            <div class="row">
                <div class="col-md-12">
                    <form id="form1" class="form-horizontal" method="post"
                          action="modify">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                            <#if (project.id)??>
                                <input type="hidden" name="id" value="${project.id}"/>
                            </#if>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="title" class="form-control"
                                               value="<#if (project.title)??>${project.title}</#if>"
                                               placeholder="项目名称"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目pattern</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="pattern" class="form-control"
                                               value="<#if (project.pattern)??>${project.pattern}</#if>"
                                               placeholder="例如:.do,.action,默认为/"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目版本</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="version" class="form-control"
                                               value="<#if (project.version)??>${project.version}</#if>"
                                               placeholder="默认1.0"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">接口根地址</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="hostUrl" class="form-control"
                                               value="<#if (project.hostUrl)??>${project.hostUrl}</#if>"
                                               placeholder="http://api.xxx.com"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">项目描述</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="5"
                                                  name="description"><#if (project.description)??>${project.description}</#if></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <button class="btn btn-default" type="button"
                                        onclick="javascript:window.history.back()">取消
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <p>
                            <button class="btn btn-danger btn-block" id="remove_pro">删除该项目</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<#include "../common/scripts.ftl">
</body>
<script type="text/javascript">
    $(document).on("click", "#remove_pro", function () {
        var $this = $(this);
        if (window.confirm('确定删除该项目吗? 删除后该项目下的所有内容将被删除!')) {
            window.location.href = 'remove.do?id=';
            return true;
        } else {
            return false;
        }
    });
</script>
</body>
</html>
