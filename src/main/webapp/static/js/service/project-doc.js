/**
 *
 * 项目文档分享后页面的js处理
 *
 *
 */
$(document).ready(function () {
    //用来缓存接口
    var function_map = {};

    $.ajax({
        type: 'POST',
        url: '../' + window.location.pathname,
        data: {},
        cache: false,
        dataType: 'json',
        success: function (data) {
            if (data.code == 1000) {
                $(".panel-body").show();
                var module_html = "";
                for (var module_count = 0; module_count < data.result.length; module_count++) {
                    var moduleObj = data.result[module_count];
                    var function_html = "";
                    for (var function_count = 0; function_count < moduleObj.functions.length; function_count++) {
                        var functionObj = moduleObj.functions[function_count];
                        function_html += '<ul class="children"> ' +
                            '<li><a class="function-detail" href="#" ><i class="fa fa-chevron-right"></i>' + functionObj.title + '</a></li> ' +
                            '</ul>';
                        functionObj.url = $(".project-host").data("host") + moduleObj.url + functionObj.url;
                        function_map[functionObj.title] = functionObj;
                    }
                    module_html += '<li class="nav-parent  active  nav-active"><a href="">' +
                        '<span><i class="fa fa-th-list"></i>' + moduleObj.title + '</span></a> ' + function_html + ' </li>';
                }
                $("#module-list").append(module_html);
                //获取第一个模块导航条
                var $first_function = $("#module-list").find("li:first").find("ul:first").find("li:first");
                $first_function.find("a:first").click()
                $first_function.addClass("active");
            } else {
                $(".panel-body").hide();
                alert("您目前还没有接口数据,请前往添加!");
            }
        },
        error: function () {
            alert("获取数据异常，请重试!");
        }
    });

    //左侧导航点击事件
    $(document).on("click", ".function-detail", function () {

        $("#bug-list").hide();
        $("#code-list").hide();
        $("#interface-list").show();

        //设置第一个节点的点击样式
        $(".function-detail").parent().removeClass("active");
        $(this).parent().addClass("active");

        //解析对象内容
        var $curFunction = function_map[$(this).text()];
        $("#title").html($curFunction.title);
        $("#url").html($curFunction.url);
        $("#method").html($curFunction.method);
        $("#response_type").html($curFunction.responseType);
        $("#description").html($curFunction.description);

        //设置代码高亮显示
        $("#response_body").html("<pre><code class='language-json'>" + format($curFunction.responseBody) + "</code></pre>");
        Prism.highlightAll();

        //设置参数内容填充到表格
        $("#params").empty();
        var paramsAry = JSON.parse($curFunction.params);
        if (paramsAry.params.length > 0) {
            for (var loop = 0; loop < paramsAry.params.length; loop++) {
                var functionDetailObj = paramsAry.params[loop];
                var isneedstr = functionDetailObj.isneed == 1 ? "是" : "否";
                $("#params").append(
                    '<tr><td>' + functionDetailObj.name + '</td>' + '<td>'
                    + functionDetailObj.type + '</td>' + '<td>'
                    + functionDetailObj.desc + '</td>' + '<td>'
                    + isneedstr + '</td>' + '<td>'
                    + functionDetailObj.value + '</td>' + '<td>'
                    + functionDetailObj.defaultvalue + '</td>' + '<td>'
                    + '</tr>');
            }
            $(".param-table").show();
        } else {
            //隐藏表格
            $(".param-table").hide();
        }
    });

    $(document).on("click", ".bug-btn", function () {

        $("#bug-list").show();
        $("#code-list").hide();
        $("#interface-list").hide();

    });


    $(document).on("click", ".code-btn", function () {
        $("#bug-list").hide();
        $("#code-list").show();
        $("#interface-list").hide();
    });
});