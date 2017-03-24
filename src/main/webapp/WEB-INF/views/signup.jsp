<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <jsp:include page="common/style.jsp"></jsp:include>
</head>
<body class="signin">
<section>
    <div class="signuppanel">
        <div class="row">
            <div class="col-md-6">
                <div class="signup-info">
                    <div class="logopanel">
                        <h1>
                            <span>[</span> Power.API <span>]</span>
                        </h1>
                    </div>
                    <div class="mb20"></div>
                    <h5>
                        <strong>欢迎来到Power.API!</strong>
                    </h5>
                    <p>Power.API是一个为您提供API协同管理、API测试、API性能监控、API文档生成的综合性服务平台</p>
                    <div class="mb20"></div>

                    <div class="feat-list">
                        <i class="fa fa-wrench"></i>
                        <h4 class="text-success">项目管理，不同维度的项目把控</h4>
                        <p>在线编辑接口,保证团队成员始终浏览到文档的最新状态,告别Word文档传阅版本混乱</p>
                    </div>

                    <div class="feat-list">
                        <i class="fa fa-compress"></i>
                        <h4 class="text-success">测试管理，接口一键测试及自动化</h4>
                        <p>接口测试一键生成，通过测试记录可分析接口的可用性</p>
                    </div>

                    <div class="feat-list mb20">
                        <i class="fa fa-search-plus"></i>
                        <h4 class="text-success"> 成员管理，细分权限保障接口数据安全</h4>
                        <p>对不同项目内容和人员分配具体权限，确保您的数据操作安全</p>
                    </div>

                </div>
            </div>
            <div class="col-md-6">
                <c:if test="${null!=error}">
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert"
                                aria-hidden="true">&times;</button>
                            ${error}
                    </div>
                </c:if>
                <form method="post" action="signup" id="basicForm2">
                    <div class="error"></div>
                    <h3 class="nomargin">快速注册</h3>
                    <p class="mt5 mb20">
                        已经是会员? <a href="signin"><strong>登录</strong></a>
                    </p>
                    <div class="mb10">
                        <label class="control-label">用户名</label>
                        <input type="text"
                               name="username" class="form-control"
                               placeholder="您的账户名"
                               required/>
                    </div>

                    <div class="mb10">
                        <label class="control-label">密码</label>
                        <input type="password"
                               name="passwd" class="form-control"
                               placeholder="建议至少使用两种字符组合"
                               required/>
                    </div>
                    <br/>
                    <button class="btn btn-success btn-block" type="submit">注册</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy;2016 <a href="http://www.melonlee.com">Melon</a>@www.powerapi.cn
                All Rights Reserved.京ICP备:15006746
            </div>
        </div>
    </div>
</section>
<jsp:include page="common/scripts.jsp"></jsp:include>
</body>
</html>
