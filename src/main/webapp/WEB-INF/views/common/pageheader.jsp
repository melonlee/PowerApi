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
        <span>${project.relativedate }</span>
        <span>${project.description }</span>
        <a href="create?proId=${project.id}" class="pull-right btn btn-primary">新增${param.entity}</a>
    </h2>
</div>

<div class="contentpanel">

    <ul class="nav nav-tabs nav-dark">
        <li ${param.index==1 ? "class='active'" : "" }><a href="../project/view?id=${project.id}"><strong>基础管理</strong></a></li>
        <li ${param.index==2 ? "class='active'" : "" }><a href="../module/all?proId=${project.id}"><strong>接口管理</strong></a></li>
        <li ${param.index==3 ? "class='active'" : "" }><a href="../bug/all?proId=${project.id}"><strong>Bug管理</strong></a></li>
        <li ${param.index==4 ? "class='active'" : "" }><a href="../code/all?proId=${project.id}"><strong>业务码管理</strong></a></li>
        <li ${param.index==5 ? "class='active'" : "" }><a href="../project/doc?id=${project.id}"><strong>文档预览</strong></a></li>
    </ul>