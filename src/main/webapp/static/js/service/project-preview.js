/**
 *
 * 项目管理模块中的js业务处理逻辑主要包括
 *
 * 1.项目预览
 *  1.1 根据模块获取接口信息
 *  1.2 渲染选中接口信息的详情
 * 2.接口测试跳转
 *
 * @type {*|{ID, TAG}|{}|jQuery}
 */

$(document).ready(function () {

    var curFunction;

    //获取第一个模块导航条
    var $curModule = $("#module_nav").find("li:first");
    //设置选中当前导航条
    $curModule.addClass("active");
    //渲染模块信息
    loadInterfaceByModule();

    //导航点击事件
    $(document).on("click", ".module_nav_row", function () {
        $(".module_nav_row").removeClass("active");
        $(this).addClass("active");
        $curModule = $(this);
        loadInterfaceByModule();
    });

    /**
     * 根据模块获取接口信息
     * @param moduleID
     */
    function loadInterfaceByModule() {

        $("#panel_module_url").text($curModule.attr("url"));
        $("#panel_module_desc").text($curModule.attr("desc"));
        $
            .ajax({
                type: 'GET',
                url: '../function/all',
                data: {
                    mId: $curModule.attr("id")
                },
                cache: false,
                dataType: 'json',
                success: function (data) {
                    $("#function_row").empty();
                    if (data.code == 1000) {
                        for (loop = 0; loop < data.result.length; loop++) {
                            var functionObj = data.result[loop];
                            var functionObjStr = JSON
                                .stringify(functionObj);

                            $("#function_row").append(
                                '<tr class="f_title" data-obj=\'' + functionObjStr + '\' >'
                                + '<td>' + '&nbsp;'
                                + functionObj.title + '</td>'
                                + '</tr>');
                        }

                        $("#function_row").on(
                            "click",
                            ".f_title",
                            function () {
                                $(".f_title").removeClass("on");
                                $(this).addClass("on");
                                curFunction = JSON.parse($(this)
                                    .attr("data-obj"));
                                loaddetail(curFunction);
                            });

                        $("#function_row").find("tr:first").click();
                    }
                },
                error: function () {
                    alert("获取数据异常，请重试!");
                }
            });
    }

    /**
     * 根据接口object渲染详细信息
     *
     * @param curfunction
     */
    function loaddetail(curfunction) {

        $("#detail_title").html(curfunction.title + "&nbsp;&nbsp;&nbsp;&nbsp;" + curfunction.url);
        $("#detail_url").html($("#detail_url").data("projecthost") + $curModule.data("url") + curfunction.url);
        $("#method").html(curfunction.method);
        $("#response_type").html(curfunction.responseType);
        $("#description").html(curfunction.description);

        //设置代码高亮显示
        $("#response_body").html("<pre><code class='language-json'>" + format(curfunction.responseBody) + "</code></pre>");
        Prism.highlightAll();

        //解析参数数组然后加入到table中
        $("#params").empty();

        console.log(curfunction.params);
        var paramsAry = JSON.parse(curfunction.params);
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

    }

    /**
     * 接口测试按钮跳转
     *
     */
    $(document).on("click", "#function_test_btn", function () {
        var $this = $(this);
        window.open("../function/test?id=" + curFunction.id + "&proId=" + $this.data("proId"));

    });

});


