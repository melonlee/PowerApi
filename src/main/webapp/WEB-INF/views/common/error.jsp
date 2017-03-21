<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
</head>
<body class="notfound">
<section>

    <div class="notfoundpanel">
        <h1>Error!</h1>
        <h4>${exception}</h4>
        <a class="btn btn-success" href="javascript:window.history.back()">返回上一步</a>
    </div>
</section>
</body>
</html>
