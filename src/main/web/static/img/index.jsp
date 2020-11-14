<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("App_Path", request.getContextPath());
    %>
    <script type="text/javascript" src="${App_Path }/static/js/jquery-3.5.1.min.js"></script>
    <link href="${App_Path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${App_Path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var totalPages, currentPage;

        function to_page(pn) {
            $.ajax({
                url: "${App_Path}/emps",
                data: "pn=" + pn,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    $("#check_delete").prop("checked", false);
                    //解析并显示员工数据
                    build_emps_table(result);
                    //解析并显示分页信息和分页条
                    build_page_info(result)
                    build_page_nav(result);
                }
            });
        }

        function build_emps_table(result) {
            $("#emps_table tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                var checkBoxTd = $("<td></td>").append(
                    "<input type='checkbox' class='check_item'>");
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>")
                    .append(item.gender == 'M' ? "男" : "女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                var editbtn = $("<button></button>").addClass(
                    "btn btn-success btn-sm edit_btn").append("<span></span>")
                    .addClass("glyphicon glyphicon-pencil").append("编辑");
                editbtn.attr("edit_id", item.empId);
                var delbtn = $("<button></button>").addClass(
                    "btn btn-danger btn-sm del_btn").append("<span></span>")
                    .addClass("glyphicon glyphicon-trash").append("删除");
                delbtn.attr("del_id", item.empId);
                var btnTd = $("<td></td>").append(editbtn).append(" ").append(
                    delbtn);
                $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd)
                    .append(genderTd).append(emailTd).append(deptNameTd)
                    .append(btnTd).appendTo("#emps_table tbody");
            })
        }

        function build_page_info(result) {
            $("#page_info").empty();
            $("#page_info").append(
                "当前第" + result.extend.pageInfo.pageNum + "页，总"
                + result.extend.pageInfo.pages + "页，共"
                + result.extend.pageInfo.total + "条记录");
            totalPages = result.extend.pageInfo.pages;
            currentPage = result.extend.pageInfo.pageNum;
        }

        function build_page_nav(result) {
            $("#page_nav").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            var firstpageli = $("<li></li>").append(
                $("<a></a>").append("首页").attr("href", "#"))
            var prepageli = $("<li></li>").append($("<a></a>").append("&laquo;"))
            if (!result.extend.pageInfo.hasPreviousPage) {
                firstpageli.addClass("disabled");
                prepageli.addClass("disabled");
            } else {
                firstpageli.click(function () {
                    to_page(1);
                })
                prepageli.click(function () {
                    to_page(result.extend.pageInfo.pageNum - 1);
                })
            }
            var nextpageli = $("<li></li>").append($("<a></a>").append("&raquo;"))
            var lastpageli = $("<li></li>").append(
                $("<a></a>").append("尾页").attr("href", "#"))
            if (!result.extend.pageInfo.hasNextPage) {
                nextpageli.addClass("disabled");
                lastpageli.addClass("disabled");
            } else {
                nextpageli.click(function () {
                    to_page(result.extend.pageInfo.pageNum + 1);
                })
                lastpageli.click(function () {
                    to_page(result.extend.pageInfo.pages);
                })
            }
            ul.append(firstpageli).append(prepageli);
            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                var numli = $("<li></li>").append(
                    $("<a></a>").append(item).attr("href", "#"))
                if (result.extend.pageInfo.pageNum == item) {
                    numli.addClass("active")
                }
                numli.click(function () {
                    to_page(item);
                })
                ul.append(numli)
            })
            ul.append(nextpageli).append(lastpageli);

            var navele = $("<nav></nav>").append(ul);
            navele.appendTo("#page_nav");
        }

        function getDepts(ele) {
            $(ele).empty();
            $.ajax({
                url: "${App_Path}/depts",
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    $.each(result.extend.depts, function () {
                        var options = $("<option></option>").append(this.deptName)
                            .attr("value", this.deptId);
                        options.appendTo(ele);
                    })
                }
            })
        }

        function getemp(id) {
            $.ajax({
                url: "${App_Path}/emp/" + id,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    var empdata = result.extend.emp;
                    $("#empName_update_static").text(empdata.empName);
                    $("#email_update").val(empdata.email);
                    $("#gender_update input[name='gender']")
                        .val([empdata.gender]);
                    $("#dept_update_select").val([empdata.dId]);
                }
            })
        }

        function validate_add() {
            var empName = $("#empName_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u4E00-\u9FA5]{2,5})/;
            if (!regName.test(empName)) {
                //alert("用户名可以是2-5位中文或6-16位英文和数字组合");
                show_validate_msg("#empName_input", "error",
                    "用户名可以是2-5位中文或6-16位英文和数字组合");
                return false;
            } else {
                show_validate_msg("#empName_input", "success", "");

            }
            var email = $("#email_input").val();
            var regEmail = /^([A-Za-z0-9_-])+\@([A-Za-z0-9_-])+\.([A-Za-z]{2,4})$/;
            if (!regEmail.test(email)) {
                //alert("邮箱格式不正确");
                show_validate_msg("#email_input", "error", "邮箱格式不正确");
                return false;
            } else {
                show_validate_msg("#email_input", "success", "");
            }
            return true;
        }

        function show_validate_msg(ele, status, msg) {
            $(ele).parent().removeClass("has-success has-error")
            $(ele).next("span").text("");
            if (status == "success") {
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            } else if (status == "error") {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        $(function () {
            to_page(1);

            $("#btn_emp_add").click(function () {
                //重置表单
                $("#empaddmodal form")[0].reset();
                show_validate_msg("#empName_input", "", "");
                show_validate_msg("#email_input", "", "");
                //发送请求查出部门信息
                getDepts("#dept_select");
                //弹出模态框
                $("#empaddmodal").modal({
                    backdrop: "static"
                });
            });

            $("#empName_input").change(function () {
                var empName = this.value
                $.ajax({
                    url: "${App_Path}/checkuser",
                    type: "POST",
                    data: "empName=" + empName,
                    success: function (result) {
                        if (result.code == 100) {
                            show_validate_msg("#empName_input", "success",
                                "用户名可用");
                            $("#emp_add_save").attr("ajax_va", "success");
                        } else {
                            show_validate_msg("#empName_input", "error",
                                result.extend.va_msg);
                            $("#emp_add_save").attr("ajax_va", "error");
                        }
                    }
                })
            })

            $("#emp_add_save").click(function () {
                //数据校验
                if (!validate_add()) {
                    return false;
                }
                //用户名校验
                if ($(this).attr("ajax_va") == "error") {
                    return false;
                }
                //发送请求
                $.ajax({
                    url: "${App_Path}/emp",
                    type: "POST",
                    data: $("#empaddmodal form").serialize(),
                    success: function (result) {
                        if (result.code == 100) {
                            //插入成功后，关闭模态框
                            $("#empaddmodal").modal("hide");
                            //并来到刚刚插入的记录的页
                            to_page(totalPages + 1);
                        } else {
                            //console.log(result)
                            if (result.extend.errorField.empName != undefined) {
                                show_validate_msg(
                                    "#empName_input",
                                    "error",
                                    result.extend.errorField.empName);
                            }
                            if (result.extend.errorField.email != undefined) {
                                show_validate_msg(
                                    "#email_input",
                                    "error",
                                    result.extend.errorField.email);
                            }
                        }
                    }
                })
            })

            $(document).on("click", ".edit_btn", function () {
                getDepts("#dept_update_select");
                getemp($(this).attr("edit_id"));
                $("#emp_update_save").attr("edit_id", $(this).attr("edit_id"))
                $("#empupdatemodal").modal({
                    backdrop: "static"
                })
            })

            $("#emp_update_save").click(function () {
                var email = $("#email_update").val();
                var regEmail = /^([A-Za-z0-9_-])+\@([A-Za-z0-9_-])+\.([A-Za-z]{2,4})$/;
                if (!regEmail.test(email)) {
                    show_validate_msg("#email_update", "error",
                        "邮箱格式不正确");
                    return false;
                } else {
                    show_validate_msg("#email_update", "success",
                        "");
                }
                $.ajax({
                    url: "${App_Path}/emp/"
                        + $(this).attr("edit_id"),
                    type: "PUT",
                    data: $("#empupdatemodal form").serialize(),
                    success: function (result) {
                        //alert(result.msg);
                        $("#empupdatemodal").modal("hide");
                        to_page(currentPage);
                    }
                })
            })

            $(document).on("click", ".del_btn", function () {
                //alert($(this).parents("tr").find("td:eq(1)").text());
                var empName = $(this).parents("tr").find("td:eq(2)").text();
                var empId = $(this).attr("del_id")
                if (confirm("确认删除\"" + empName + "\"的信息吗")) {
                    $.ajax({
                        url: "${App_Path}/emp/" + empId,
                        type: "DELETE",
                        success: function (result) {
                            //alert(result.msg);
                            to_page(currentPage);
                        }
                    })
                }
            })

            $("#check_delete").click(function () {
                //alert($(this).prop("checked"))
                $(".check_item").prop("checked", $(this).prop("checked"));
            })

            $(document).on("click", ".check_item", function () {
                var flag = $(".check_item:checked").length == $(".check_item").length;
                $("#check_delete").prop("checked", flag);
            })

            $("#btn_emp_del").click(function () {
                var del_ids = "";
                $.each($(".check_item:checked"), function () {
                    //alert($(this).parents("tr").find("td:eq(2)").text());
                    del_ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
                })
                del_ids = del_ids.substring(0, del_ids.length - 1);
                if (confirm("确认删除选中的员工信息吗")) {
                    $.ajax({
                        url: "${App_Path}/emp/" + del_ids,
                        type: "DELETE",
                        success: function (result) {
                            //alert(result.msg);
                            to_page(currentPage);
                        }
                    })
                }
            })

        });
    </script>
</head>
<body>
<!-- 新增按钮弹出框 -->
<div class="modal fade" id="empaddmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_input"
                                   placeholder="empName">
                            <span id="helpBlock1" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">邮箱:</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_input"
                                   placeholder="email@163.com">
                            <span id="helpBlock2" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="F">
                                女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dept_select" class="col-sm-2 control-label">部门名:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">放弃</button>
                <button type="button" class="btn btn-primary" id="emp_add_save">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 员工信息修改弹出框 -->
<div class="modal fade" id="empupdatemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_input" class="col-sm-2 control-label">姓名:</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_input" class="col-sm-2 control-label">邮箱:</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update"
                                   placeholder="email@163.com">
                            <span id="helpBlock2" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别:</label>
                        <div class="col-sm-10" id="gender_update">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="F">
                                女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dId" class="col-sm-2 control-label">部门名:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">放弃</button>
                <button type="button" class="btn btn-primary" id="emp_update_save">修改</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-SRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button id="btn_emp_add" type="button" class="btn btn-primary">新增</button>
            <button id="btn_emp_del" type="button" class="btn btn-danger">删除</button>
            <br>
            <br>
        </div>
    </div>
    <!-- 显示表格信息 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_delete"></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-md-6" id="page_info"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav"></div>
    </div>
</div>
</body>
</html>