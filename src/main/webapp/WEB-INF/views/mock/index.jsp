<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
</head>
<body>
<section>
    <div id="preloader">
        <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
    </div>
    <div class="pageheader">
        <div class="row">
            <div class="col-md-11">
                <h2>
                    <i class="fa fa-cubes"></i>Mock管理<span>实现自动根据接口文档生成Mock接口，这些接口会自动生成模拟数据供客户端进行接口调试</span>
                </h2>
            </div>
            <div class="col-md-1">
                <p>
                    <a class="btn btn-primary" href="create">新增Mock </a>
                </p>
            </div>
        </div>
    </div>
    <div class="contentpanel">
    </div>
</section>

<jsp:include page="../common/scripts.jsp"></jsp:include>
<script type="text/javascript">

    $(document).ready(function () {

    });
</script>
</body>
</html>
