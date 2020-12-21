<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Navbar</title>


    <!-- Custom fonts for this template-->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

</head>


<body>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="http://localhost:8080/main">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">이호황</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item" id="customer">
        <a class="nav-link" href="http://localhost:8080/customer/list">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>고객사</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        제품
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item" id="productInfo">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#productPages"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>제품</span>
        </a>
        <div id="productPages" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">제품:</h6>
                <a class="collapse-item" id="product" href="http://localhost:8080/product/list">제품</a>
                <a class="collapse-item" id="delivery" href="http://localhost:8080/product/delivery">납품정보</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item" id="patchInfo">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#patchPages"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-wrench"></i>
            <span>패치</span>
        </a>
        <div id="patchPages" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Patch:</h6>
                <a class="collapse-item" id="patchHistory" href="http://localhost:8080/patch/list">패치이력</a>
                <a class="collapse-item" id="package" href="http://localhost:8080/patch/package">패키지정보</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        직원활동
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item" id="serviceRequest">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#srPages"
           aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-folder"></i>
            <span>SR</span>
        </a>
        <div id="srPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Service Request:</h6>
                <a class="collapse-item" id="sr" href="http://localhost:8080/sr/list">SR</a>
                <a class="collapse-item" id="activity" href="http://localhost:8080/activity/list">활동</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Charts -->
    <li class="nav-item" id="employee">
        <a class="nav-link" href="http://localhost:8080/employee/list">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>직원</span></a>
    </li>

    <sec:authorize access="hasRole('ADMIN')">
        <!-- Divider -->
        <hr class="sidebar-divider">
        <!-- Heading -->
        <div class="sidebar-heading">
            관리자
        </div>
        <!-- Nav Item - Tables -->
        <li class="nav-item" id="admin">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#adminPages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>시스템 관리</span>
            </a>
            <div id="adminPages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">System Management:</h6>
                    <a class="collapse-item" id="codeTable" href="http://localhost:8080/admin/codetable">코드테이블</a>
                    <a class="collapse-item" href="#">미정</a>
                </div>
            </div>
        </li>
    </sec:authorize>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <form class="form-inline">
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
            </form>

            <!-- Topbar Search -->
                        <form
                                class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                       aria-label="Search" aria-describedby="basic-addon2" style="visibility: hidden">
                                <div class="input-group-append">
<%--                                    <button class="" type="button">--%>
<%--&lt;%&ndash;                                        <i class="fas fa-search fa-sm"></i>&ndash;%&gt;--%>
<%--                                    </button>--%>
                                </div>
                            </div>
                        </form>
                    <sec:authorize access="isAnonymous()">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="http://localhost:8080/loginForm">로그인</a></li>
                        </ul>
                    </sec:authorize>

                    <sec:authorize access="isAnonymous()">
                        <ul class="nav navbar-nav navbar-right" style="margin-left: 30px; margin-right: 50px;">
                            <li><a href="http://localhost:8080/register">회원가입</a></li>
                        </ul>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="userId" property="principal"/>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a style="font-weight: bold;">${userId}&nbsp&nbsp&nbsp</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right" style="margin-right: 40px;">
                            <li><a href="http://localhost:8080/user/logout">로그아웃</a></li>
                        </ul>
                    </sec:authorize>
        </nav>
</body>
</html>
