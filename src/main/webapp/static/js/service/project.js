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
//获取第一个模块导航条
var $curModule = $("#module_nav").find("li:first");

var $curFunction;

var host = $("#host_url").text();

//设置选中当前导航条
$curModule.addClass("active");

//渲染模块信息
$("#panel_module_url").text($curModule.data("url"));
$("#panel_module_desc").text($curModule.data("desc"));

//根据模块id获取对应该模块下接口信息
loadInterfaceByModule($curModule.attr("id"));

//导航点击事件
$(document).on("click", ".module_nav_row", function () {
    $(".module_nav_row").removeClass("active");
    $(this).addClass("active");
    $curModule = $(this);
    $("#panel_module_url").text($curModule.data("url"));
    $("#panel_module_desc").text($curModule.data("desc"));
    loadInterfaceByModule($curModule.attr("id"));
});

/**
 * 根据模块获取接口信息
 * @param moduleID
 */
function loadInterfaceByModule(moduleId) {
    $
        .ajax({
            type: 'GET',
            url: '../function/all',
            data: {
                mId: moduleId
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                $("#function_row").empty();
                console.log(data);
                if (data.code == 1000) {
                    for (loop = 0; loop < data.result.length; loop++) {
                        var functionObj = data.result[loop];
                        var functionObjStr = JSON
                            .stringify(functionObj);

                        console.log(functionObjStr);
                        var flag = "";

                        if (functionObj.status == 2) {
                            flag = '<span class="pull-left badge badge-success">新增 </span>';
                        } else if (functionObj.status == 3) {
                            flag = '<span class="pull-left badge badge-danger">变更</span>';
                        } else if (functionObj.status == 4) {
                            flag = '<span class="pull-left badge badge-warning">Bug</span>';
                        }
                        $("#function_row").append(
                            '<tr class="f_title" data-obj=\'' + functionObjStr + '\' >'
                            + '<td>' + flag + '&nbsp;'
                            + functionObj.title + '</td>'
                            + '<td>' + functionObj.url
                            + '</td>' + '</tr>');
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
    $("#detail_url").text(host + $curModule.data("url") + curfunction.url);
    $("#method").text(curfunction.method);
    $("#response_type").text(curfunction.responseType);
    format(curfunction.responseBody);
    $("#description").text(curfunction.description);
    $("#params").empty();
    //解析参数数组然后加入到table中
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

/**
 *  格式化接口测试返回回来的JSON源码(对象转换为JSON文本)
 *
 */
function format(txt, compress/*是否为压缩模式*/) {
    var indentChar = '    ';
    if (/^\s*$/.test(txt)) {
        return "无返回示例";
    }
    try {
        var data = eval('(' + txt + ')');
    }
    catch (e) {
        return "无返回示例";
    }
    ;
    var draw = [], last = false, This = this, line = compress ? '' : '\n', nodeCount = 0, maxDepth = 0;

    var notify = function (name, value, isLast, indent/*缩进*/, formObj) {
        nodeCount++;
        /*节点计数*/
        for (var i = 0, tab = ''; i < indent; i++)tab += indentChar;
        /* 缩进HTML */
        tab = compress ? '' : tab;
        /*压缩模式忽略缩进*/
        maxDepth = ++indent;
        /*缩进递增并记录*/
        if (value && value.constructor == Array) {/*处理数组*/
            draw.push(tab + (formObj ? ('"' + name + '":') : '') + '[' + line);
            /*缩进'[' 然后换行*/
            for (var i = 0; i < value.length; i++)
                notify(i, value[i], i == value.length - 1, indent, false);
            draw.push(tab + ']' + (isLast ? line : (',' + line)));
            /*缩进']'换行,若非尾元素则添加逗号*/
        } else if (value && typeof value == 'object') {/*处理对象*/
            draw.push(tab + (formObj ? ('"' + name + '":') : '') + '{' + line);
            /*缩进'{' 然后换行*/
            var len = 0, i = 0;
            for (var key in value)len++;
            for (var key in value)notify(key, value[key], ++i == len, indent, true);
            draw.push(tab + '}' + (isLast ? line : (',' + line)));
            /*缩进'}'换行,若非尾元素则添加逗号*/
        } else {
            if (typeof value == 'string')value = '"' + value + '"';
            draw.push(tab + (formObj ? ('"' + name + '":') : '') + value + (isLast ? '' : ',') + line);
        }
        ;
    };
    var isLast = true, indent = 0;

    notify('', data, isLast, indent, false);
    $("#response_body").html("<pre><code class='language-json'>" + draw.join('') + "</code></pre>");
    Prism.highlightAll();
}