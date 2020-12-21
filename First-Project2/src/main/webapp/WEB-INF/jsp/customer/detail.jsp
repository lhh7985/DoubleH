<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hello test</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <script src="/resources/js/jquery-1.11.0.min.js"></script>


    <script type="text/javascript">


        $(document).ready(function ($) {
            //납품정보
            $.ajax({
                type: 'GET',
                url: '/customer/delivery/' +${customer.customerId},
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
                },
                success: function (data) {
                    $("#delivery1").html(data);
                }
            });

            $.ajax({
                type: 'GET',
                url: '/customer/manager/' +${customer.customerId},

                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
                },
                success: function (data) {
                    $('#managers').html(data);
                }
            });

            ///sr
            $.ajax({
                type: 'GET',
                url: '/customer/sr/' +${customer.customerId},
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
                },
                success: function (data) {
                    $('#sr1').html(data);
                }
            });

            //activity
            $.ajax({
                type: 'GET',
                url: '/customer/activity/' + ${customer.customerId},
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
                },
                success: function (data) {
                    $('#activity1').html(data);
                }
            });


            $('.menus').on('click', function () {
                $('.menus').removeClass('active');
                $(this).addClass('active');
            });

            if ($("#customer").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#customer").addClass("active");
            }
        });


        function goModify() {
            location.href = "http://localhost:8080/customer/modify";
        }


    </script>
</head>
<style>

    .nav {
        padding-left: 0;
        margin-bottom: 0;
        list-style: none;
    }

    .nav > li {
        position: relative;
        display: block;
    }

    .nav > li > a {
        position: relative;
        display: block;
        padding: 10px 15px;
    }

    .nav > li > a:hover,
    .nav > li > a:focus {
        text-decoration: none;
        background-color: #eee;
    }

    .nav > li.disabled > a {
        color: #777;
    }

    .nav > li.disabled > a:hover,
    .nav > li.disabled > a:focus {
        color: #777;
        text-decoration: none;
        cursor: not-allowed;
        background-color: transparent;
    }

    .nav .open > a,
    .nav .open > a:hover,
    .nav .open > a:focus {
        background-color: #eee;
        border-color: #337ab7;
    }

    .nav .nav-divider {
        height: 1px;
        margin: 9px 0;
        overflow: hidden;
        background-color: #e5e5e5;
    }

    .nav > li > a > img {
        max-width: none;
    }

    .nav-tabs {
        border-bottom: 1px solid #ddd;
    }

    .nav-tabs > li {
        float: left;
        margin-bottom: -1px;
    }

    .nav-tabs > li > a {
        margin-right: 2px;
        line-height: 1.42857143;
        border: 1px solid transparent;
        border-radius: 4px 4px 0 0;
    }

    .nav-tabs > li > a:hover {
        border-color: #eee #eee #ddd;
    }

    .nav-tabs > li.active > a,
    .nav-tabs > li.active > a:hover,
    .nav-tabs > li.active > a:focus {
        color: #555;
        cursor: default;
        background-color: #fff;
        border: 1px solid #ddd;
        border-bottom-color: transparent;
    }

    .nav-tabs.nav-justified {
        width: 100%;
        border-bottom: 0;
    }

    .nav-tabs.nav-justified > li {
        float: none;
    }

    .nav-tabs.nav-justified > li > a {
        margin-bottom: 5px;
        text-align: center;
    }

    .nav-tabs.nav-justified > .dropdown .dropdown-menu {
        top: auto;
        left: auto;
    }

    @media (min-width: 768px) {
        .nav-tabs.nav-justified > li {
            display: table-cell;
            width: 1%;
        }

        .nav-tabs.nav-justified > li > a {
            margin-bottom: 0;
        }
    }

    .nav-tabs.nav-justified > li > a {
        margin-right: 0;
        border-radius: 4px;
    }

    .nav-tabs.nav-justified > .active > a,
    .nav-tabs.nav-justified > .active > a:hover,
    .nav-tabs.nav-justified > .active > a:focus {
        border: 1px solid #ddd;
    }

    @media (min-width: 768px) {
        .nav-tabs.nav-justified > li > a {
            border-bottom: 1px solid #ddd;
            border-radius: 4px 4px 0 0;
        }

        .nav-tabs.nav-justified > .active > a,
        .nav-tabs.nav-justified > .active > a:hover,
        .nav-tabs.nav-justified > .active > a:focus {
            border-bottom-color: #fff;
        }
    }

    .myfont {
        font-size: 15px;
        font-weight: bold;
        margin-bottom: 15px;
    }

    .inputsize {
        float: left;
    }

</style>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <%@include file="../header.jsp" %>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <form action="/customer/modify" method="post">
            <div class="card shadow mb-6">
                <div class="card-header py-3">
                    <div class="row">
                        <h6 class="col-md-11 m-0 font-weight-bold text-primary">고객사 정보</h6>
                        <input class="btn btn-outline-primary col-xs-1" type="submit" onclick="goModify()" value="수정">
                    </div>
                </div>
                <div class="card-body">
                    <div>

                        <div class="row" style="margin-left: 10px;">
                            <div class="inputsize col-xs-1" style="width: 5%;">
                                <p class="myfont">회사명 : </p>
                            </div>
                            <div class="inputsize col-md-2" style="width: 10%;">
                                <p>${customer.customerName}</p>
                                <input name="customerName" style="display: none" value="${customer.customerName}"/>
                                <input name="customerId" style="display: none" value="${customer.customerId}"/>
                            </div>

                            <div class="inputsize col-xs-1" style="width: 5%;">
                                <p class="myfont">주소 : </p>
                            </div>
                            <div class="inputsize col-md-6" style="width: 80%;">
                                <p>${customer.addressAddress}&nbsp;&nbsp; ${customer.addressDetail}&nbsp;&nbsp;
                                    (우:${customer.addressPost}) <br></p>
                                <input name="address" style="display: none" value="${customer.addressAddress}"/>
                                <input name="addrDetail" style="display: none" value="${customer.addressDetail}"/>
                                <input name="addrPost" style="display: none" value="${customer.addressPost}"/>
                            </div>
                        </div>


                        <div class="row" style="margin-left: 10px;">
                            <div class="inputsize col-xs-2" style="width: 5%;">
                                <p class="myfont">담당자 : </p>
                            </div>
                            <div class="inputsize col-md-1" style="width: 10%;">
                                <p><c:out value="${managers['manager'].employeeName}"/></p>
                            </div>
                            <input name="manager" style="display: none" value="${managers['manager'].employeeName}"/>
                            <input name="managerId" value="${managers['manager'].employeeId}" style="display:none "/>

                            <div class="inputsize col-xs-1" style="width: 5%;">
                                <p class="myfont">E-mail : </p>
                            </div>
                            <div class="inputsize col-md-2" style="width: 15%;">
                                <p><c:out value="${managers['manager'].employeeEmail}"/></p>
                            </div>

                            <div class="inputsize col-xs-1" style="width: 5%;">
                                <p class="myfont">연락처 : </p>
                            </div>
                            <div class="inputsize col-md-2" style="width: 10%;">
                                <p><c:out value="${managers['manager'].employeeContact}"/></p>
                            </div>

                            <div class="inputsize col-xs-1" style="width: 6%;">
                                <p class="myfont">휴대전화 : </p>
                            </div>
                            <div class="inputsize col-md-2" style="width: 40%;">
                                <p><c:out value="${managers['manager'].employeePhone}"/><br></p>
                            </div>
                        </div>


                        <div class="row" style="margin-left: 10px;">
                            <div class="inputsize col-xs-2">
                                <p class="myfont">SE담당자 : </p>
                            </div>
                            <div class="inputsize col-md-1">
                                <p><c:out value="${managers['se'].employeeName}"/></p>
                                <input name="se" style="display: none" value="${managers['se'].employeeName}"/>
                                <input name="seId" value="${managers['se'].employeeId}" style="display:none "/>
                            </div>

                            <div class="inputsize col-xs-1">
                                <p class="myfont">영업담당자 : </p>
                            </div>
                            <div class="inputsize col-md-1">
                                <p><c:out value="${managers['sales'].employeeName}"/></p>
                                <input name="sales" style="display: none" value="${managers['sales'].employeeName}"/>
                                <input name="salesId" value="${managers['sales'].employeeId}" style="display:none "/>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="">
                    <ul class="nav nav-tabs">
                        <li data-tab='delivery1' class="menus active"><a href="#delivery1"
                                                                        style="cursor: pointer; font-weight: bold;"
                                                                        data-toggle="tab">납품정보</a></li>
                        <li data-tab='manager' class="menus"><a href="#managers"
                                                                style="cursor: pointer; font-weight: bold;"
                                                                data-toggle="tab">담당자이력</a></li>
                        <li data-tab='sr' class="menus"><a href="#sr1" style="cursor: pointer; font-weight: bold;"
                                                           data-toggle="tab">SR</a></li>
                        <li data-tab='activity' class="menus"><a href="#activity1"
                                                                 style="cursor: pointer; font-weight: bold;"
                                                                 data-toggle="tab">방문내역</a></li>

                    </ul>
                </div>
            </div>
            <div class="card-body">

                <div class="" style=" min-height: 400px;">
                    <div class="">
                        <div class="tab-content">
                            <div class="tab-pane in active" id="delivery1"></div>
                            <div class="tab-pane fade" id="managers"></div>
                            <div class="tab-pane fade" id="sr1"></div>
                            <div class="tab-pane fade" id="activity1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<!-- Bootstrap core JavaScript-->
<script src="/resources/boots/vendor/jquery/jquery.min.js"></script>
<script src="/resources/boots/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/boots/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/boots/js/sb-admin-2.js"></script>

<%--<!-- Page level plugins -->--%>
<%--<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>--%>
<%--<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>--%>

<%--<!-- Page level custom scripts -->--%>
<%--<script src="/resources/boots/js/demo/datatables-demo.js"></script>--%>


</body>
</html>