<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.6.0/clipboard.min.js"></script>
<script type="text/javascript">
    /**
     *
     * 设置分享链接复制分享
     *
     * @type {Clipboard}
     */
    var clipboard = new Clipboard('.share');

    clipboard.on('success', function (e) {
        //to do
    });

    clipboard.on('error', function (e) {
        alert('此功能不支持该浏览器，请手工复制文本框中内容');
    });

    $(document).on("click", "#share", function () {
        $("#link").val($(this).data("content"));
    });

</script>