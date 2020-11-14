<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="a" value="${admin}"></c:set>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>登录成功！当前权限:"${a}"</title>
    <script type="text/javascript" src="${ctx }/static/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
    <script>
        var totalPages, currentPage;
        var totalPages_order, currentPage_order;
        var flyId, time, com, money;
        var lastOne = false;
        var right = "${a}"

        function build_page_info(result) {
            $("#page_info").empty();
            $("#page_nav").empty();
            $("#page_info").append(
                "当前第" + result.extend.pageInfo.pageNum + "页，总"
                + result.extend.pageInfo.pages + "页，共"
                + result.extend.pageInfo.total + "条记录");
            totalPages = result.extend.pageInfo.pages;
            currentPage = result.extend.pageInfo.pageNum;

            let ul = $("<ul></ul>").addClass("pagination");
            let firstPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("首页").attr("href", "#"))
            let prePage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("&laquo;"))
            if (!result.extend.pageInfo.hasPreviousPage) {
                firstPage.addClass("disabled");
                prePage.addClass("disabled");
            } else {
                firstPage.click(function () {
                    to_page(1);
                })
                prePage.click(function () {
                    to_page(result.extend.pageInfo.pageNum - 1);
                })
            }
            let nextPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("&raquo;"))
            let lastPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("尾页").attr("href", "#"))
            if (!result.extend.pageInfo.hasNextPage) {
                nextPage.addClass("disabled");
                lastPage.addClass("disabled");
            } else {
                nextPage.click(function () {
                    to_page(result.extend.pageInfo.pageNum + 1);
                })
                lastPage.click(function () {
                    to_page(result.extend.pageInfo.pages);
                })
            }
            ul.append(firstPage).append(prePage);
            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                let num = $("<li></li>").addClass("page-item").append(
                    $("<a class=\"page-link\"></a>").append(item).attr("href", "#"));
                if (result.extend.pageInfo.pageNum == item) {
                    num.addClass("active");
                } else {
                    num.click(function () {
                        to_page(item);
                    })
                }
                ul.append(num);
            })
            ul.append(nextPage).append(lastPage);
            let nav = $("<nav></nav>").append(ul);
            nav.appendTo("#page_nav");
        }

        function build_page_info_update(result) {
            $("#page_info_update").empty();
            $("#page_nav_update").empty();
            $("#page_info_update").append(
                "当前第" + result.extend.pageInfo.pageNum + "页，总"
                + result.extend.pageInfo.pages + "页，共"
                + result.extend.pageInfo.total + "条记录");
            totalPages = result.extend.pageInfo.pages;
            currentPage = result.extend.pageInfo.pageNum;

            let ul = $("<ul></ul>").addClass("pagination");
            let firstPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("首页").attr("href", "#"))
            let prePage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("&laquo;"))
            if (!result.extend.pageInfo.hasPreviousPage) {
                firstPage.addClass("disabled");
                prePage.addClass("disabled");
            } else {
                firstPage.click(function () {
                    to_page_update(1);
                })
                prePage.click(function () {
                    to_page_update(result.extend.pageInfo.pageNum - 1);
                })
            }
            let nextPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("&raquo;"))
            let lastPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("尾页").attr("href", "#"))
            if (!result.extend.pageInfo.hasNextPage) {
                nextPage.addClass("disabled");
                lastPage.addClass("disabled");
            } else {
                nextPage.click(function () {
                    to_page_update(result.extend.pageInfo.pageNum + 1);
                })
                lastPage.click(function () {
                    to_page_update(result.extend.pageInfo.pages);
                })
            }
            ul.append(firstPage).append(prePage);
            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                let num = $("<li></li>").addClass("page-item").append(
                    $("<a class=\"page-link\"></a>").append(item).attr("href", "#"));
                if (result.extend.pageInfo.pageNum == item) {
                    num.addClass("active");
                } else {
                    num.click(function () {
                        to_page_update(item);
                    })
                }
                ul.append(num);
            })
            ul.append(nextPage).append(lastPage);
            let nav = $("<nav></nav>").append(ul);
            nav.appendTo("#page_nav_update");
        }

        function build_flights(result) {
            $("#flights_table tbody").empty();
            let flights = result.extend.pageInfo.list;
            $.each(flights, function (index, item) {
                let f_idTd = $("<td></td>").append(item.flyId);
                let comTd = $("<td></td>").append(item.company.comName);
                let startTd = $("<td></td>").append(item.origin);
                let endTd = $("<td></td>").append(item.destination);
                let timeTd = $("<td></td>").append(item.time);
                let priceTd = $("<td></td>").append(item.price);
                let btn_booking = $("<button type=\"button\" class=\"btn btn-success btn-sm booking\">" +
                    "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-person-plus\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                    "  <path fill-rule=\"evenodd\" d=\"M8 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10zM13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z\"/>\n" +
                    "</svg>" +
                    " " +
                    "预订" +
                    "</button>");
                btn_booking.attr("flyId", item.flyId);
                btn_booking.attr("com", item.cId);
                btn_booking.attr("money", item.price);
                btn_booking.attr("start", item.origin);
                btn_booking.attr("end", item.destination);
                btn_booking.attr("time", item.time);

                let btnTd_booking = $("<td></td>").append(btn_booking);
                $("<tr></tr>").append(f_idTd).append(comTd).append(startTd)
                    .append(endTd).append(timeTd).append(priceTd).append(btnTd_booking)
                    .appendTo("#flights_table tbody");
            })
        }

        function build_flights_update(result) {
            $("#flights_table_update tbody").empty();
            let flights = result.extend.pageInfo.list;
            $.each(flights, function (index, item) {
                let checkBoxTd = $("<td></td>").append("<input type=\"checkbox\" class=\"check_item\">");
                let f_idTd = $("<td></td>").append(item.flyId);
                let comTd = $("<td></td>").append(item.company.comName);
                let startTd = $("<td></td>").append(item.origin);
                let endTd = $("<td></td>").append(item.destination);
                let timeTd = $("<td></td>").append(item.time);
                let priceTd = $("<td></td>").append(item.price);
                let btn_update = $("<button type=\"button\" class=\"btn btn-success btn-sm edit_btn\">" +
                    "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-pencil-square\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                    "  <path d=\"M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z\"/>\n" +
                    "  <path fill-rule=\"evenodd\" d=\"M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z\"/>\n" +
                    "</svg>" +
                    " " +
                    "编辑" +
                    "</button>");
                let btn_delete = $("<button type=\"button\" class=\"btn btn-danger btn-sm del_btn\">" +
                    "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-trash\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                    "  <path d=\"M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z\"/>\n" +
                    "  <path fill-rule=\"evenodd\" d=\"M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z\"/>\n" +
                    "</svg>" +
                    " " +
                    "删除" +
                    "</button>");
                btn_update.attr("edit_id", item.flyId);
                btn_delete.attr("del_id", item.flyId);
                let btnTd_update = $("<td></td>").append(btn_update).append(" ").append(btn_delete);
                $("<tr></tr>").append(checkBoxTd).append(f_idTd).append(comTd).append(startTd)
                    .append(endTd).append(timeTd).append(priceTd).append(btnTd_update)
                    .appendTo("#flights_table_update tbody");
            })
        }

        function build_orders_update(result) {
            $("#orders_table_update tbody").empty();
            $.each(result, function (index, item) {
                let checkBoxTd = $("<td></td>").append("<input type=\"checkbox\" class=\"check_item_order\">");
                let o_idTd = $("<td></td>").append(item.ordId);
                let u_nameTd = $("<td></td>").append(item.user.userName);
                let id_cardTd = $("<td></td>").append(item.user.idCard);
                let startTd = $("<td></td>").append(item.flight.origin);
                let endTd = $("<td></td>").append(item.flight.destination);
                let timeTd = $("<td></td>").append(item.flight.time);
                let priceTd = $("<td></td>").append(item.money);
                let btn_edit = $("<button type=\"button\" class=\"btn btn-success btn-sm edit_btn_orders\">" +
                    "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-cart-check-fill\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                    "  <path fill-rule=\"evenodd\" d=\"M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm.354-7.646a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z\"/>\n" +
                    "</svg>" +
                    " " +
                    "修改订单" +
                    "</button>");
                let btn_del = $("<button type=\"button\" class=\"btn btn-danger btn-sm del_btn_orders\">" +
                    "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-cart-x-fill\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                    "  <path fill-rule=\"evenodd\" d=\"M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.354 5.646a.5.5 0 1 0-.708.708L7.793 7.5 6.646 8.646a.5.5 0 1 0 .708.708L8.5 8.207l1.146 1.147a.5.5 0 0 0 .708-.708L9.207 7.5l1.147-1.146a.5.5 0 0 0-.708-.708L8.5 6.793 7.354 5.646z\"/>\n" +
                    "</svg>" +
                    " " +
                    "删除订单" +
                    "</button>");
                btn_edit.attr("ordId", item.ordId);
                btn_del.attr("ordId", item.ordId);
                // btn_booking.attr("money", item.price);
                // btn_booking.attr("start", item.origin);
                // btn_booking.attr("end", item.destination);
                // btn_booking.attr("time", item.time);

                let btnTd_pay = $("<td></td>").append(btn_edit).append(" ").append(btn_del);
                $("<tr></tr>").append(checkBoxTd).append(o_idTd).append(u_nameTd).append(id_cardTd)
                    .append(startTd).append(endTd).append(timeTd).append(priceTd)
                    .append(btnTd_pay).appendTo("#orders_table_update tbody");
            })
        }

        function build_myOrders(result) {
            $.each(result, function (index, item) {
                let o_idTd = $("<td></td>").append(item.ordId);
                let u_nameTd = $("<td></td>").append(item.user.userName);
                let id_cardTd = $("<td></td>").append(item.user.idCard);
                let startTd = $("<td></td>").append(item.flight.origin);
                let endTd = $("<td></td>").append(item.flight.destination);
                let timeTd = $("<td></td>").append(item.flight.time);
                let priceTd = $("<td></td>").append(item.money);
                let btn_pay = $("<button type=\"button\" class=\"btn btn-success btn-sm pay\">" +
                    "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-cart-check-fill\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                    "  <path fill-rule=\"evenodd\" d=\"M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm.354-7.646a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z\"/>\n" +
                    "</svg>" +
                    " " +
                    "支付订单" +
                    "</button>");
                btn_pay.attr("money", item.money);
                btn_pay.attr("start", item.flight.origin);
                btn_pay.attr("end", item.flight.destination);
                btn_pay.attr("time", item.flight.time);
                let btn_cancel = $("<button type=\"button\" class=\"btn btn-danger btn-sm cancel\">" +
                    "<svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-cart-x-fill\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                    "  <path fill-rule=\"evenodd\" d=\"M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.354 5.646a.5.5 0 1 0-.708.708L7.793 7.5 6.646 8.646a.5.5 0 1 0 .708.708L8.5 8.207l1.146 1.147a.5.5 0 0 0 .708-.708L9.207 7.5l1.147-1.146a.5.5 0 0 0-.708-.708L8.5 6.793 7.354 5.646z\"/>\n" +
                    "</svg>" +
                    " " +
                    "取消订单" +
                    "</button>");
                let btnTd_pay = $("<td></td>").append(btn_pay).append(" ").append(btn_cancel);
                $("<tr></tr>").append(o_idTd).append(u_nameTd).append(id_cardTd)
                    .append(startTd).append(endTd).append(timeTd).append(priceTd)
                    .append(btnTd_pay).appendTo("#orders_table tbody");
            })
        }

        function to_page(pn) {
            $.ajax({
                url: "${ctx}/flights",
                data: "pn=" + pn,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    $("#check_delete").prop("checked", false);
                    build_flights(result);
                    build_page_info(result);
                }
            })
        }

        function to_page_update(pn) {
            $.ajax({
                url: "${ctx}/flights",
                data: "pn=" + pn,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    build_flights_update(result);
                    build_page_info_update(result);
                }
            })
        }

        function build_page_info_orders_update(result) {
            $("#page_info_order_update").empty();
            $("#page_nav_order_update").empty();
            $("#page_info_order_update").append(
                "当前第" + result.extend.pageInfo_orders.pageNum + "页，总"
                + result.extend.pageInfo_orders.pages + "页，共"
                + result.extend.pageInfo_orders.total + "条记录");
            totalPages_order = result.extend.pageInfo_orders.pages;
            currentPage_order = result.extend.pageInfo_orders.pageNum;

            let ul = $("<ul></ul>").addClass("pagination");
            let firstPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("首页").attr("href", "#"))
            let prePage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("&laquo;"))
            if (!result.extend.pageInfo_orders.hasPreviousPage) {
                firstPage.addClass("disabled");
                prePage.addClass("disabled");
            } else {
                firstPage.click(function () {
                    to_page_order_update(1);
                })
                prePage.click(function () {
                    to_page_order_update(result.extend.pageInfo_orders.pageNum - 1);
                })
            }
            let nextPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("&raquo;"))
            let lastPage = $("<li></li>").addClass("page-item").append(
                $("<a class=\"page-link\"></a>").append("尾页").attr("href", "#"))
            if (!result.extend.pageInfo_orders.hasNextPage) {
                nextPage.addClass("disabled");
                lastPage.addClass("disabled");
            } else {
                nextPage.click(function () {
                    to_page_order_update(result.extend.pageInfo_orders.pageNum + 1);
                })
                lastPage.click(function () {
                    to_page_order_update(result.extend.pageInfo_orders.pages);
                })
            }
            ul.append(firstPage).append(prePage);
            $.each(result.extend.pageInfo_orders.navigatepageNums, function (index, item) {
                let num = $("<li></li>").addClass("page-item").append(
                    $("<a class=\"page-link\"></a>").append(item).attr("href", "#"));
                if (result.extend.pageInfo_orders.pageNum == item) {
                    num.addClass("active");
                } else {
                    num.click(function () {
                        to_page_order_update(item);
                    })
                }
                ul.append(num);
            })
            ul.append(nextPage).append(lastPage);
            let nav = $("<nav></nav>").append(ul);
            nav.appendTo("#page_nav_order_update");
        }

        function to_page_order_update(pn) {
            $.ajax({
                url: "${ctx}/orders",
                data: "pn=" + pn,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    let item = result.extend.pageInfo_orders.list
                    build_orders_update(item);
                    build_page_info_orders_update(result);
                }
            })
        }

        function getCompany(ele) {
            $(ele).empty();
            $.ajax({
                url: "${ctx}/companies",
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    $.each(result.extend.companies, function () {
                        let options = $("<option></option>").append(this.comName).attr("value", this.comId);
                        options.appendTo(ele);
                    })
                }
            })
        }

        function getFlightId(ele) {
            $(ele).empty();
            $.ajax({
                url: "${ctx}/flightsId",
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    $.each(result.extend.flights, function (index, item) {
                        let options = $("<option></option>").append(item.flyId).attr("value", item.flyId);
                        options.appendTo(ele);
                    })
                }
            })
        }

        function getFlight(id) {
            $.ajax({
                url: "${ctx}/flightsByPrimary/" + id,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    let flight = result.extend.flight;
                    $("#flight_start_update").val(flight.origin);
                    $("#flight_end_update").val(flight.destination);
                    $("#flight_time_update").val(flight.time);
                    $("#flight_price_update").val(flight.price);
                }
            })
        }

        function getOrder(ordId) {
            $.ajax({
                url: "${ctx}/orderByPrimary/" + ordId,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    let order = result.extend.order;
                    $("#userName_update_static").text(order.user.userName);
                    $("#idCard_update_static").text(order.user.idCard);
                    $("#new_money").val(order.money);
                }
            })
        }

        function show_validate_msg(ele, status, msg) {
            $(ele).next("span").text("");
            if (status == "error") {
                $(ele).next("span").text(msg);
            }
        }

        $(function () {

            $("#select_flight").click(function () {
                let start = $("#startPlace").val();
                let end = $("#destination").val();
                let date = $("#date").val();
                if (start == "" && end == "" && date == "") {
                    to_page(1);
                } else if (start != "" && end != "") {
                    $.ajax({
                        url: "${ctx}/flightsByExample",
                        data: "start=" + start + "&end=" + end + "&date=" + date,
                        type: "GET",
                        success: function (result) {
                            //console.log(result);
                            build_flights(result);
                            build_page_info(result);
                        }
                    });
                } else if (start == "") {
                    alert("请输入出发地")
                } else if (end == "") {
                    alert("请输入目的地")
                }
            });

            $("#select_flight_update").click(function () {
                let start = $("#startPlace_update").val();
                let end = $("#destination_update").val();
                let date = $("#date_update").val();
                if (start == "" && end == "" && date == "") {
                    to_page_update(1);
                } else if (start != "" && end != "") {
                    $.ajax({
                        url: "${ctx}/flightsByExample",
                        data: "start=" + start + "&end=" + end + "&date=" + date,
                        type: "GET",
                        success: function (result) {
                            //console.log(result);
                            build_flights_update(result);
                            build_page_info_update(result);
                        }
                    });
                } else if (start == "") {
                    alert("请输入出发地")
                } else if (end == "") {
                    alert("请输入目的地")
                }
            });

            $("#select_order").click(function () {
                $("#orders_table tbody").empty();
                let id_card = $("#IdCard").val();
                if (id_card == "") {
                    alert("请输入身份证号！")
                } else {
                    $.ajax({
                        url: "${ctx}/ordersByExample/" + id_card,
                        type: "GET",
                        success: function (result) {
                            //console.log(result);
                            let item = result.extend.myOrders;
                            build_myOrders(item);
                        }
                    });
                }
            })

            $("#select_order_update").click(function () {
                $("#orders_table_update tbody").empty();
                let id_card = $("#IdCard_update").val();
                if (id_card == "") {
                    to_page_order_update(1);
                } else {
                    $.ajax({
                        url: "${ctx}/ordersByExample/" + id_card,
                        type: "GET",
                        success: function (result) {
                            //console.log(result);
                            let item = result.extend.myOrders;
                            build_orders_update(item);
                        }
                    });
                }
            })

            $("#flights_insert").click(function () {
                $("#helpBlock_price").text("");
                //清空表单
                $("#addFlightModel form")[0].reset();
                //发送请求查出航空公司列表，并显示在模态框的下拉列表中
                getCompany("#flight_comId");
                //弹出模态框
                $("#addFlightModel").modal({
                    backdrop: "static"
                })
            })

            $("#submit_addFlight").click(function () {
                $("#helpBlock_price").text("");
                let start = $("#flight_start").val();
                let end = $("#flight_end").val();
                let time = $("#flight_time").val();
                let price = $("#flight_price").val();
                let comId = $("#flight_comId").val();
                $.ajax({
                    url: "${ctx}/saveFlights",
                    data: "start=" + start + "&end=" + end + "&time=" + time + "&price=" + price + "&comId=" + comId,
                    type: "GET",
                    success: function (result) {
                        //console.log(result)
                        if (result.extend.wrong_price != undefined) {
                            $("#helpBlock_price").text(result.extend.wrong_price);
                        } else {
                            alert("成功添加航班");
                            $("#addFlightModel").modal("hide");
                        }

                    }
                })
            })

            $("#exchange").click(function () {
                let new_start = $("#startPlace").val();
                let new_destination = $("#destination").val();
                $("#startPlace").val(new_destination);
                $("#destination").val(new_start);
            })

            $("#exchange_update").click(function () {
                let new_start = $("#startPlace_update").val();
                let new_destination = $("#destination_update").val();
                $("#startPlace_update").val(new_destination);
                $("#destination_update").val(new_start);
            })

            $("#submit_message").click(function () {
                $("#helpBlock_name").text("");
                $("#helpBlock_email").text("");
                $("#helpBlock_idCard").text("");
                $.ajax({
                    url: "${ctx}/saveUser",
                    data: $("#bookingModel form").serialize(),
                    type: "POST",
                    success: function (result) {
                        if (result.code == 100) {
                            if (confirm("确认提交订单吗？")) {
                                $("#bookingModel").modal("hide");
                                $.ajax({
                                    url: "${ctx}/addOrder",
                                    data: "flyId=" + flyId + "&time=" + time + "&com=" + com + "&money=" + money,
                                    type: "GET",
                                    success: function () {
                                        alert("处理成功,请前往我的订单查看详细信息！");
                                    }
                                });
                            }
                        } else {
                            console.log(result);
                            let existUser = result.extend.userExist;
                            $("#helpBlock_idCard").text(existUser);
                            let error = result.extend.errorFields;
                            if (undefined != error.email) {
                                show_validate_msg("#p_email", "error", error.email);
                            }
                            if (undefined != error.userName) {
                                show_validate_msg("#p_name", "error", error.userName);
                            }

                        }
                    }
                });
            })

            $("#submit_updateFlight").click(function () {
                $("#helpBlock_price_update").text("");
                if (confirm("确认提交修改吗？")) {
                    $.ajax({
                        url: "${ctx}/updateFlight/" + $(this).attr("edit_id"),
                        type: "PUT",
                        data: $("#updateFlightModel form").serialize(),
                        success: function (result) {
                            if (result.extend.wrong_price_update != undefined) {
                                $("#helpBlock_price_update").text(result.extend.wrong_price_update);
                            } else {
                                alert("修改提交成功");
                                $("#updateFlightModel").modal("hide");
                                to_page_update(currentPage);
                            }

                        }
                    });
                }
            })

            $("#submit_message_update_order").click(function () {
                $("#helpBlock_order_price_update").text("")
                if (confirm("确认提交修改吗？")) {
                    $.ajax({
                        url: "${ctx}/updateOrder/" + $(this).attr("ordId"),
                        type: "PUT",
                        data: $("#updateOrderModel form").serialize(),
                        success: function (result) {
                            //console.log(result)
                            alert("修改提交成功");
                            $("#updateOrderModel").modal("hide");
                            to_page_order_update(currentPage_order);
                        }
                    });
                }
            })

            $(document).on("click", ".booking", function () {
                $("#helpBlock_name").text("");
                $("#helpBlock_email").text("");
                $("#helpBlock_idCard").text("");
                $("#bookingModel form")[0].reset();
                let start = $(this).attr("start");
                let end = $(this).attr("end");
                time = $(this).attr("time");
                flyId = $(this).attr("flyId");
                com = $(this).attr("com");
                money = $(this).attr("money");
                $("#model_flight_message").text(start + "→" + end + "=====时间：" + time);
                $("#bookingModel").modal({
                    backdrop: "static"
                })
            })

            $(document).on("click", ".edit_btn", function () {
                $("#helpBlock_price_update").text("");
                getFlight($(this).attr("edit_id"));
                $("#updateFlightModel").modal({
                    backdrop: "static"
                })
                $("#submit_updateFlight").attr("edit_id", $(this).attr("edit_id"))
            })

            $(document).on("click", ".del_btn", function () {
                if (confirm("确认删除当前航班的信息吗")) {
                    $.ajax({
                        url: "${ctx}/deleteFlights/" + $(this).attr("del_id"),
                        type: "DELETE",
                        success: function (result) {
                            alert("删除成功");
                            $("#check_delete").prop("checked", false);
                            to_page_update(currentPage);
                        }
                    })
                }
            })

            $(document).on("click", ".edit_btn_orders", function () {
                $("#helpBlock_order_price_update").text("")
                getFlightId($("#new_flight"));
                getOrder($(this).attr("ordId"));
                $("#updateOrderModel").modal({
                    backdrop: "static"
                })
                $("#submit_message_update_order").attr("ordId", $(this).attr("ordId"))
            })

            $(document).on("click", ".del_btn_orders", function () {
                if (confirm("确认删除当前订单的信息吗")) {
                    $.ajax({
                        url: "${ctx}/deleteOrders/" + $(this).attr("ordId"),
                        type: "DELETE",
                        success: function (result) {
                            alert("删除成功");
                            $("#check_delete_update").prop("checked", false);
                            to_page_order_update(currentPage_order);
                        }
                    })
                }
            })

            $(document).on("click", ".pay", function () {
                $("#pay_money").text("支付金额：" + $(this).attr("money"));
                let start = $(this).attr("start");
                let end = $(this).attr("end");
                let time = $(this).attr("time");
                $("#model_flight_message_pay").text(start + "→" + end + "=====时间：" + time);
                $("#payModel").modal({
                    backdrop: "static"
                });
            })

            $(document).on("click", ".cancel", function () {
                if (confirm("确认取消订单吗？")) {
                    alert("已提交请求，等待管理员审核...")
                }
            })

            /*flights全选框*/
            $("#check_delete").click(function () {
                $(".check_item").prop("checked", $(this).prop("checked"));
            })

            /*若某页的多选框全都选中，则将全选框页选中*/
            $(document).on("click", ".check_item", function () {
                let flag = $(".check_item:checked").length == $(".check_item").length;
                $("#check_delete").prop("checked", flag);
            })

            /*orders全选框*/
            $("#check_delete_update").click(function () {
                $(".check_item_order").prop("checked", $(this).prop("checked"));
            })

            /*若某页的多选框全都选中，则将全选框页选中*/
            $(document).on("click", ".check_item_order", function () {
                let flag = $(".check_item_order:checked").length == $(".check_item_order").length;
                $("#check_delete_update").prop("checked", flag);
            })

            /*批量删除flights*/
            $("#flights_delete_batch").click(function () {
                let del_ids = "";
                $.each($(".check_item:checked"), function () {
                    del_ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
                })
                del_ids = del_ids.substring(0, del_ids.length - 1);
                if (confirm("确认删除选中的航班信息吗")) {
                    $.ajax({
                        url: "${ctx}/deleteFlights/" + del_ids,
                        type: "DELETE",
                        success: function (result) {
                            alert("批量删除成功");
                            $("#check_delete").prop("checked", false);
                            to_page_update(currentPage);
                        }
                    })
                }
            })

            /*批量删除orders*/
            $("#orders_delete_batch").click(function () {
                let del_ids = "";
                $.each($(".check_item_order:checked"), function () {
                    del_ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
                })
                del_ids = del_ids.substring(0, del_ids.length - 1);
                if (confirm("确认删除选中的订单吗")) {
                    $.ajax({
                        url: "${ctx}/deleteOrders/" + del_ids,
                        type: "DELETE",
                        success: function (result) {
                            alert("批量删除成功");
                            $("#check_delete_update").prop("checked", false);
                            to_page_order_update(currentPage_order);
                        }
                    })
                }
            })

            alert("当前权限：" + right)
            if (right != "管理员") {
                $("#v-pills-messages-tab").addClass("disabled")
                $("#v-pills-settings-tab").addClass("disabled")
            }
        })
    </script>

</head>
<body>
<%--显示预订信息模态框--%>
<div class="modal fade" id="bookingModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">填写订单</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="p_name" class="col-form-label">姓名:</label>
                        <input type="text" class="form-control" id="p_name" name="userName" placeholder="Name:">
                        <span style="color: red" id="helpBlock_name" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="p_email" class="col-form-label">邮箱:</label>
                        <input type="text" class="form-control" id="p_email" name="email" placeholder="Email:">
                        <span style="color: red" id="helpBlock_email" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="p_phone" class="col-form-label">联系电话:</label>
                        <input type="text" class="form-control" id="p_phone" name="phone" placeholder="Phone number:">
                    </div>
                    <div class="form-group">
                        <label for="p_id_card" class="col-form-label">身份证号:</label>
                        <input type="text" class="form-control" id="p_id_card" name="idCard" placeholder="IDCard:">
                        <span style="color: red" id="helpBlock_idCard" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">性别:</label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" value="M" checked="checked">
                            男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" value="F">
                            女
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">航班信息：</label>
                        <span id="model_flight_message"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button id="submit_message" type="button" class="btn btn-primary">提交订单</button>
            </div>
        </div>
    </div>
</div>

<%--显示修改订单模态框--%>
<div class="modal fade" id="updateOrderModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">修改订单信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="userName_update_static" class="col-form-label">姓名:</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="userName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="idCard_update_static" class="col-form-label">身份证号:</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="idCard_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_flight" class="col-form-label">航班号:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="fId" id="new_flight"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_money" class="col-form-label">价格:</label>
                        <input type="text" class="form-control" id="new_money" name="money" placeholder="Price:">
                        <span style="color: red" id="helpBlock_order_price_update" class="help-block"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button id="submit_message_update_order" type="button" class="btn btn-primary">提交修改</button>
            </div>
        </div>
    </div>
</div>

<%--显示添加航班信息模态框--%>
<div class="modal fade" id="addFlightModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加航班</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="flight_start" class="col-form-label">出发地:</label>
                        <input type="text" class="form-control" id="flight_start" placeholder="Origin:">
                    </div>
                    <div class="form-group">
                        <label for="flight_end" class="col-form-label">目的地:</label>
                        <input type="text" class="form-control" id="flight_end" placeholder="Destination:">
                    </div>
                    <div class="form-group">
                        <label for="flight_time" class="col-form-label">起飞时间:</label>
                        <input type="text" class="form-control" id="flight_time" placeholder="Time:">
                    </div>
                    <div class="form-group">
                        <label for="flight_price" class="col-form-label">票价:</label>
                        <input type="text" class="form-control" id="flight_price" placeholder="Price:">
                        <span style="color: red" id="helpBlock_price" class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="flight_comId" class="col-form-label">航空公司:</label>
                        <div class="col-sm-6">
                            <select class="form-control" id="flight_comId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button id="submit_addFlight" type="button" class="btn btn-primary">添加</button>
            </div>
        </div>
    </div>
</div>

<%--显示修改航班信息模态框--%>
<div class="modal fade" id="updateFlightModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">修改航班信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="flight_start" class="col-form-label">出发地:</label>
                        <input type="text" class="form-control" id="flight_start_update" name="origin"
                               placeholder="Origin:">
                    </div>
                    <div class="form-group">
                        <label for="flight_end" class="col-form-label">目的地:</label>
                        <input type="text" class="form-control" id="flight_end_update" name="destination"
                               placeholder="Destination:">
                    </div>
                    <div class="form-group">
                        <label for="flight_time" class="col-form-label">起飞时间:</label>
                        <input type="text" class="form-control" id="flight_time_update" name="time" placeholder="Time:">
                    </div>
                    <div class="form-group">
                        <label for="flight_price" class="col-form-label">票价:</label>
                        <input type="text" class="form-control" id="flight_price_update" name="price"
                               placeholder="Price:">
                        <span style="color: red" id="helpBlock_price_update" class="help-block"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button id="submit_updateFlight" type="button" class="btn btn-primary">提交修改</button>
            </div>
        </div>
    </div>
</div>

<%--显示支付信息页面--%>
<div class="modal fade" id="payModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">支付页面</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>假装有一张二维码图片</label>
                </div>
                <div class="form-group">
                    <span id="pay_money"></span>
                </div>
                <div class="form-group">
                    <label class="col-form-label">航班信息：</label>
                    <br>
                    <span id="model_flight_message_pay"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-2">
        <div class="nav flex-column nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
               aria-controls="v-pills-home" aria-selected="true">机票预订</a>
            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
               aria-controls="v-pills-profile" aria-selected="false">我的订单</a>
            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
               aria-controls="v-pills-messages" aria-selected="false">改签/取消订单[管理员权限]</a>
            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
               aria-controls="v-pills-settings" aria-selected="false">航班安排[管理员权限]</a>
        </div>
    </div>
    <div class="col-10">
        <div class="tab-content" id="v-pills-tabContent">

            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10">
                            <h2>机票预订</h2>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div>
                            <form class="form-inline">
                                <div class="input-group flex-nowrap col-md-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">出发地：</span>
                                    </div>
                                    <input id="startPlace" type="text" class="form-control" placeholder="杭州">
                                </div>
                                <div>
                                    <button id="exchange" type="button" class="btn btn-light">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-right"
                                             fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                  d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="input-group flex-nowrap col-md-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">目的地：</span>
                                    </div>
                                    <input id="destination" type="text" class="form-control" placeholder="北京">
                                </div>
                                <div class="input-group flex-nowrap col-md-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">日期：</span>
                                    </div>
                                    <input id="date" type="text" class="form-control" placeholder="2020-01-01">
                                </div>
                            </form>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-2 col-offset-8">
                            <button id="select_flight" type="button" class="btn btn-primary">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                                    <path fill-rule="evenodd"
                                          d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                                </svg>
                                查询
                            </button>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover" id="flights_table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>航空公司</th>
                                    <th>出发地</th>
                                    <th>目的地</th>
                                    <th>出发时间</th>
                                    <th>价格</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 page_info" id="page_info"></div>
                        <div class="col-md-6 page_nav" id="page_nav"></div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10">
                            <h2>我的订单</h2>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div>
                            <form class="form-inline">
                                <div class="input-group flex-nowrap col-md-10">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">身份证号：</span>
                                    </div>
                                    <input id="IdCard" type="text" class="form-control" placeholder="IDCard:">
                                    <div style="margin: 0px 10px">
                                        <button id="select_order" type="button" class="btn btn-primary">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd"
                                                      d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                                                <path fill-rule="evenodd"
                                                      d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                                            </svg>
                                            查询
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover" id="orders_table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>姓名</th>
                                    <th>身份证号</th>
                                    <th>出发地</th>
                                    <th>目的地</th>
                                    <th>出发时间</th>
                                    <th>费用</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 page_info" id="page_info_order"></div>
                        <div class="col-md-6 page_nav" id="page_nav_order"></div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10">
                            <h2>修改订单[管理员操作]</h2>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div>
                            <form class="form-inline">
                                <div class="input-group flex-nowrap col-md-10">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">身份证号：</span>
                                    </div>
                                    <input id="IdCard_update" type="text" class="form-control" placeholder="IDCard:">
                                    <div style="margin: 0px 10px">
                                        <button id="select_order_update" type="button" class="btn btn-primary">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd"
                                                      d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                                                <path fill-rule="evenodd"
                                                      d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                                            </svg>
                                            查询
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-10">
                            <button id="orders_delete_batch" style="margin: 0px 10px" type="button"
                                    class="btn btn-danger">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                </svg>
                                批量删除
                            </button>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover" id="orders_table_update">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="check_delete_update"></th>
                                    <th>#</th>
                                    <th>姓名</th>
                                    <th>身份证号</th>
                                    <th>出发地</th>
                                    <th>目的地</th>
                                    <th>出发时间</th>
                                    <th>费用</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 page_info" id="page_info_order_update"></div>
                        <div class="col-md-6 page_nav" id="page_nav_order_update"></div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10">
                            <h2>航班安排表[管理员操作]</h2>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div>
                            <form class="form-inline">
                                <div class="input-group flex-nowrap col-md-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">出发地：</span>
                                    </div>
                                    <input id="startPlace_update" type="text" class="form-control" placeholder="杭州">
                                </div>
                                <div>
                                    <button id="exchange_update" type="button" class="btn btn-light">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-right"
                                             fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                  d="M1 11.5a.5.5 0 0 0 .5.5h11.793l-3.147 3.146a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 11H1.5a.5.5 0 0 0-.5.5zm14-7a.5.5 0 0 1-.5.5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H14.5a.5.5 0 0 1 .5.5z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="input-group flex-nowrap col-md-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">目的地：</span>
                                    </div>
                                    <input id="destination_update" type="text" class="form-control" placeholder="北京">
                                </div>
                                <div class="input-group flex-nowrap col-md-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">日期：</span>
                                    </div>
                                    <input id="date_update" type="text" class="form-control" placeholder="2020-01-01">
                                </div>
                            </form>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-10">
                            <button id="flights_insert" style="margin: 0px 10px" type="button" class="btn btn-success">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-square"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                    <path fill-rule="evenodd"
                                          d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                                添加
                            </button>
                            <button id="flights_delete_batch" style="margin: 0px 10px" type="button"
                                    class="btn btn-danger">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                </svg>
                                批量删除
                            </button>
                            <button style="float: right;" id="select_flight_update" type="button"
                                    class="btn btn-primary">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search"
                                     fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                                    <path fill-rule="evenodd"
                                          d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                                </svg>
                                查询
                            </button>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover" id="flights_table_update">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="check_delete"></th>
                                    <th>#</th>
                                    <th>航空公司</th>
                                    <th>出发地</th>
                                    <th>目的地</th>
                                    <th>出发时间</th>
                                    <th>价格</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 page_info" id="page_info_update"></div>
                        <div class="col-md-6 page_nav" id="page_nav_update"></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
