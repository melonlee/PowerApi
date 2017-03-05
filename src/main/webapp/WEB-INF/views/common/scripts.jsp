<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<script src="<%=basePath%>static/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>static/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=basePath%>static/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=basePath%>static/js/bootstrap.min.js"></script>
<script src="<%=basePath%>static/js/modernizr.min.js"></script>
<script src="<%=basePath%>static/js/jquery.sparkline.min.js"></script>
<script src="<%=basePath%>static/js/toggles.min.js"></script>
<script src="<%=basePath%>static/js/retina.min.js"></script>
<script src="<%=basePath%>static/js/jquery.cookies.js"></script>
<script src="<%=basePath%>static/js/flot/jquery.flot.min.js"></script>
<script src="<%=basePath%>static/js/flot/jquery.flot.resize.min.js"></script>
<script src="<%=basePath%>static/js/flot/jquery.flot.spline.min.js"></script>
<script src="<%=basePath%>static/js/morris.min.js"></script>
<script src="<%=basePath%>static/js/raphael-2.1.0.min.js"></script>
<script src="<%=basePath%>static/js/jquery.autogrow-textarea.js"></script>
<script src="<%=basePath%>static/js/bootstrap-timepicker.min.js"></script>
<script src="<%=basePath%>static/js/jquery.maskedinput.min.js"></script>
<script src="<%=basePath%>static/js/jquery.tagsinput.min.js"></script>
<script src="<%=basePath%>static/js/jquery.mousewheel.js"></script>
<script src="<%=basePath%>static/js/select2.min.js"></script>
<script src="<%=basePath%>static/js/dropzone.min.js"></script>
<script src="<%=basePath%>static/js/jquery.validate.min.js"></script>
<script src="<%=basePath%>static/js/md5.js"></script>

<script type="text/javascript">
    (function () {
        function hideAlert() {
            $("#action_alert").hide();
        }

        window.setTimeout(hideAlert, 1500);
    })();
</script>

<script src="<%=basePath%>static/js/custom.js"></script>



