<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="host" value="${pageContext.request.contextPath}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/style.jsp"></jsp:include>
</head>
<body class="horizontal-menu">
<section>
    <div class="mainpanel">
        <jsp:include page="../common/menu.jsp" flush="true">
            <jsp:param name="nav" value="2"/>
        </jsp:include>
        <jsp:include page="../common/pageheader.jsp">
            <jsp:param name="entity" value="Bug"/>
            <jsp:param name="index" value="3"/>
        </jsp:include>
        <div class="tab-content">
            <div class="tab-pane active">
                <div class="panel">
                    <div class="panel-heading">
                        <h5 class="bug-key-title">#${bug.id}</h5>
                        <div class="panel-title">${bug.title}</div>
                    </div>
                    <div class="panel-body">
                        <div class="mr10 pull-right">
                            <a class="btn btn-default" type="button"><i class="fa fa-pencil mr5"></i> 编辑</a> &nbsp;&nbsp;
                            <a href="delete?id=${bug.id }" class="btn btn-danger" type="button"><i
                                    class="fa fa-trash-o mr5"></i> 删除</a>
                            <a class="btn btn-success" type="button"><i class="fa fa-trash-o mr5"></i> 解决</a>
                            <a class="btn btn-warning" type="button"><i class="fa fa-trash-o mr5"></i> 关闭</a>
                        </div>
                        <br/><br/>
                        <div class="row">
                            <div class="col-sm-12">
                                <h5 class="subtitle subtitle-lined">描述</h5>
                                <p>${bug.description}</p>
                                <br/><br/>
                                <h5 class="subtitle subtitle-lined">讨论</h5>
                                <div class="tab-content noshadow">
                                    <div>
                                        <ul class="media-list comment-list">
                                            <c:forEach var="comment" items="${comments}">
                                                <li class="media">
                                                    <a href="#" class="pull-left">
                                                        <img alt=""
                                                             src="${host}/static/images/logo.jpg"
                                                             class="media-object">
                                                    </a>
                                                    <div class="media-body">
                                                        <h4><shiro:principal/></h4>
                                                        <small class="text-muted">${comment.createdate}</small>
                                                        <p>${comment.content}</p>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <br/>
                                        <h5 class="subtitle subtitle-lined">留言</h5>
                                        <div class="mb20"></div>
                                    <textarea placeholder="..." rows="5" class="form-control"
                                              id="bug_content"></textarea>
                                        <div class="mb10"></div>
                                        <button class="btn btn-primary" id="comment_submit">提交评论</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<jsp:include page="../common/scripts.jsp"></jsp:include>

<script type="text/javascript">

    var username = "<shiro:principal/>";
    //评论提交事件
    $(document).on("click", "#comment_submit", function () {
        $.ajax({
            type: 'POST',
            url: '../bug/comment',
            data: {
                bugId: ${param.id},
                content: $("#bug_content").val()
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data.code == 1000) {
                    //拼接评论结果
                    $(".comment-list").append('<li class="media">' +
                            '<a href="#" class="pull-left">' +
                            '<img alt="" src= "${host}/static/images/logo.jpg" class="media-object"></a>' +
                            '<div class="media-body">' +
                            '<h4>' + username + '</h4>' +
                            '<small class="text-muted">' + generateNow() + '</small>' +
                            '<p>' + $("#bug_content").val() + '</p>' +
                            '</div>' +
                            '</li>');
                    $("#bug_content").val('');
                } else {
                    alert('数据提交失败，请重试!');
                }
            },
            error: function () {
                alert("获取数据异常，请重试!");
            }
        });
    });

    //获取当前时间戳

    function p(s) {
        return s < 10 ? '0' + s : s;
    }
    function generateNow() {
        var myDate = new Date();
        var year = myDate.getFullYear();
        var month = myDate.getMonth() + 1;
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        var s = myDate.getSeconds();
        var now = year + '-' + p(month) + "-" + p(date) + " " + p(h) + ':' + p(m) + ":" + p(s);
        return now;
    }
</script>
</body>
</html>
