/**
 *
 * 删除项目
 *
 */
$(document).on("click", "#remove_pro", function () {
    var $this = $(this);
    if (window.confirm('确定删除该项目吗? 删除后该项目下的所有内容将被删除!')) {
        window.location.href = 'delete?id=' + $this.data("id");
        return true;
    } else {
        return false;
    }
});