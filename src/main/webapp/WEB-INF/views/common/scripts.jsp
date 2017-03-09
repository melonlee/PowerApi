<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="host" value="${pageContext.request.contextPath}"/>
<script>
    var path = "${host}";
</script>
<script src="${host}/static/js/basic/jquery-1.11.1.min.js"></script>
<script src="${host}/static/js/basic/jquery-migrate-1.2.1.min.js"></script>
<script src="${host}/static/js/basic/jquery-ui-1.10.3.min.js"></script>
<script src="${host}/static/js/basic/bootstrap.min.js"></script>
<script src="${host}/static/js/basic/modernizr.min.js"></script>
<script src="${host}/static/js/basic/jquery.sparkline.min.js"></script>
<script src="${host}/static/js/basic/toggles.min.js"></script>
<script src="${host}/static/js/basic/retina.min.js"></script>
<script src="${host}/static/js/basic/jquery.cookies.js"></script>
<script src="${host}/static/js/basic/flot/jquery.flot.min.js"></script>
<script src="${host}/static/js/basic/flot/jquery.flot.resize.min.js"></script>
<script src="${host}/static/js/basic/flot/jquery.flot.spline.min.js"></script>
<script src="${host}/static/js/basic/morris.min.js"></script>
<script src="${host}/static/js/basic/raphael-2.1.0.min.js"></script>
<script src="${host}/static/js/basic/jquery.autogrow-textarea.js"></script>
<script src="${host}/static/js/basic/bootstrap-timepicker.min.js"></script>
<script src="${host}/static/js/basic/jquery.maskedinput.min.js"></script>
<script src="${host}/static/js/basic/jquery.tagsinput.min.js"></script>
<script src="${host}/static/js/basic/jquery.mousewheel.js"></script>
<script src="${host}/static/js/basic/select2.min.js"></script>
<script src="${host}/static/js/basic/dropzone.min.js"></script>
<script src="${host}/static/js/basic/jquery.validate.min.js"></script>
<script src="${host}/static/js/basic/md5.js"></script>
<script src="${host}/static/js/basic/custom.js"></script>
<script src="${host}/static/js/basic/prism.js"></script>

<script type="text/javascript">
    (function () {
        function hideAlert() {
            $("#action_alert").hide();
        }

        window.setTimeout(hideAlert, 1500);
    })();
</script>





