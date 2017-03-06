<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"></c:set>
<script>
    var path = "${host}";
</script>
<title>Power.API</title>
<meta charset="utf-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="shortcut icon" href="${host}/static/images/logo.jpg" type="image/jpg">
<link href="${host}/static/css/style.default.css" rel="stylesheet">