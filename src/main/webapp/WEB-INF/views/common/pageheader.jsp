<%--
  Created by IntelliJ IDEA.
  User: Melon
  Date: 17/3/8
  Time: 上午11:48
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="pageheader">
    <h2>
        <i class="fa fa-book"></i>${project.title }
                <span>
                <a href="../project/${project.id}" title="基础管理"><i class="fa fa-gear"
                                                                                              style="border: 0px !important;"></i></a>
                <a href="" title="接口管理"><i class="fa fa-code-fork" style="border: 0px !important;"></i></a>
                <a href="" title="Bug管理"><i class="fa fa-bug" style="border: 0px !important;"></i></a>
                <a href="" title="业务码管理"><i class="fa fa-file-code-o" style="border: 0px !important;"></i></a></span>
        <a href="create?proId=${project.id}" class="pull-right btn btn-primary">新增${param.entity}</a>
        <br/>
        <span>${project.relativedate }</span>
        <span>${project.description }</span>
    </h2>
</div>