<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PRODUCT</title>
    <!-- Custom fonts for this template-->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">


    <link rel="stylesheet" type="text/css" media="screen" href="/resources/jqueryUI/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/ui.jqgrid.css"/>

    <script src="/resources/js/jquery-1.11.0.min.js"></script>
    <script type="text/ecmascript" src="/resources/js/i18n/grid.locale-kr.js"></script>
    <script type="text/ecmascript" src="/resources/js/jquery.jqgrid.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function ($) {
            if ($("#product").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#productInfo").addClass("active");
                $("#productPages").addClass("show");
                $("#product").addClass("active");
            }
        });
    </script>
</head>


<body id="page-top">

<div id="wrapper">

    <%@include file="../header.jsp" %>

    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">제품리스트</h6>
            </div>
            <div class="card-body">
                <div>
                    <c:forEach var="item" items="${productList}" varStatus="status">
                        <div class="row" style="background-color: #D4F4FA; height: 220px;">
                            <div>
                                <p style="padding: 10px; font-weight:bold;">${item.productName}</p>
                                <p style="padding: 10px; font-weight:bold;">${item.productContent}</p>
                            </div>
                        </div>
                    </c:forEach>
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
<script src="/resources/boots/js/sb-admin-2.min.js"></script>


</body>
</html>