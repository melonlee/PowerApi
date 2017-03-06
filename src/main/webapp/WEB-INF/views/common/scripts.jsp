<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"></c:set>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<script src="${host}/static/js/jquery-1.11.1.min.js"></script>
<script src="${host}/static/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${host}/static/js/jquery-ui-1.10.3.min.js"></script>
<script src="${host}/static/js/bootstrap.min.js"></script>
<script src="${host}/static/js/modernizr.min.js"></script>
<script src="${host}/static/js/jquery.sparkline.min.js"></script>
<script src="${host}/static/js/toggles.min.js"></script>
<script src="${host}/static/js/retina.min.js"></script>
<script src="${host}/static/js/jquery.cookies.js"></script>
<script src="${host}/static/js/flot/jquery.flot.min.js"></script>
<script src="${host}/static/js/flot/jquery.flot.resize.min.js"></script>
<script src="${host}/static/js/flot/jquery.flot.spline.min.js"></script>
<script src="${host}/static/js/morris.min.js"></script>
<script src="${host}/static/js/raphael-2.1.0.min.js"></script>
<script src="${host}/static/js/jquery.autogrow-textarea.js"></script>
<script src="${host}/static/js/bootstrap-timepicker.min.js"></script>
<script src="${host}/static/js/jquery.maskedinput.min.js"></script>
<script src="${host}/static/js/jquery.tagsinput.min.js"></script>
<script src="${host}/static/js/jquery.mousewheel.js"></script>
<script src="${host}/static/js/select2.min.js"></script>
<script src="${host}/static/js/dropzone.min.js"></script>
<script src="${host}/static/js/jquery.validate.min.js"></script>
<script src="${host}/static/js/md5.js"></script>
<script src="${host}/static/js/custom.js"></script>

<script type="text/javascript">
    (function () {
        function hideAlert() {
            $("#action_alert").hide();
        }

        window.setTimeout(hideAlert, 1500);
    })();
</script>





