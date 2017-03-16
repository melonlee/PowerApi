/**
 *模块管理模块中的JS方法
 *
 * 1.导航条数据加载并设置选中
 * 2.根据模块获取对应接口数据并渲染
 * 3.模块的删除
 *
 *
 * @type {*|{ID, TAG}|{}|jQuery}
 */

//渲染导航条第一个
var $curModule = $("#module_nav").find("li:first");
var proId = $curModule.data("pro");
$curModule.addClass("active");
$("#panel_module_url").text($curModule.data("url"));
$("#panel_module_desc").text($curModule.data("desc"));

//根据默认选中模块进行获取接口数据并渲染
loadInterfaceByModule($curModule.attr("id"));


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
                console.log(data);
                $("#datas").show();
                $("#function_row").empty();
                if (data.code == 1000) {
                    for (loop = 0; loop < data.result.length; loop++) {
                        functionObj = data.result[loop];
                        var flag = "";
                        if (functionObj.status == 2) {
                            flag = '<span class="pull-left badge badge-success">新增 </span>';
                        } else if (functionObj.status == 3) {
                            flag = '<span class="pull-left badge badge-danger">变更</span>';
                        } else if (functionObj.status == 4) {
                            flag = '<span class="pull-left badge badge-warning">异常</span>';
                        }
                        $("#function_row")
                            .append(
                                '<tr class="interface_row">'
                                + '<td><a href="../function/view?id=' + functionObj.id + '&proId=' + proId +
                                '&mId=' + functionObj.mId + '">'
                                + flag
                                + '&nbsp;'
                                + functionObj.title
                                + '</a></td>'
                                + '<td>'
                                + functionObj.url
                                + '</td>'
                                + '<td>'
                                + functionObj.createdate
                                + '</td>'
                                + '<td><a target="_blank" href="../function/test?id=' + functionObj.id + '&proId=' + proId +
                                '" title="测试">'
                                + '<i class="fa fa-paper-plane"></i></a>&nbsp;&nbsp; <a class="interface_delete_row" data-id="' + functionObj.id + '" href="#" class="delete-row" title="删除">'
                                + '<i class="fa fa-trash-o"></i></a></td>'
                                + '</tr>'
                            )
                        ;
                    }
                }
            },
            error: function () {
                $("#data_alert").show();
            }
        });
}

//点击导航
$(document).on("click", ".module_nav_row", function () {
    $(".module_nav_row").removeClass("active");
    $(this).addClass("active");
    $curModule = $(this);
    $("#panel_module_url").text($curModule.data("url"));
    $("#panel_module_desc").text($curModule.data("desc"));
    loadInterfaceByModule($curModule.attr("id"));
});


//删除模块
$(document).on("click", "#module_remove", function () {
    removeModule();
});

//新增接口
$(document).on("click", "#create_function", function () {
    window.location.href = "../function/view.do?proId=" + proId + "&mId=" + $curModule.attr("id");
});

//编辑模块内容
$(document).on("click", "#panel_module_modify", function () {
    window.location.href = "view?proId=" + proId + "&id=" + $curModule.attr("id");
});

//删除某接口内容
$(document).on("click", ".interface_delete_row", function () {
    var $this = $(this);
    if (window.confirm('确定删除该接口吗？')) {
        $.ajax({
            type: 'GET',
            url: '../function/delete',
            data: {
                id: $this.data("id")
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data.code == 1000) {
                    var $parent = $this.parents(".interface_row");
                    $parent.find("td").stop().animate({
                        height: "0px",
                        "padding-top": "0px",
                        "padding-bottom": "0px"
                    }, 200, function () {
                        $parent.remove();
                    });

                } else {
                    alert('数据提交失败，请重试!');
                }
            },
            error: function () {
                alert("获取数据异常，请重试!");
            }
        });
        return true;

    } else {

        return false;
    }

});


