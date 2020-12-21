<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

    <script src="/resources/js/jquery-1.11.0.min.js"></script>
    <script src="/resources/slick/slick.js"></script>
    <link href="/resources/slick/slick.css" rel="stylesheet">
    <link href="/resources/slick/slick-theme.css" rel="stylesheet">

    <script type="text/javascript">
        $(function ($) {
            $('#slider-div').slick({
                slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li
                infinite: true, 	//무한 반복 옵션
                slidesToShow: 1,		// 한 화면에 보여질 컨텐츠 개수
                slidesToScroll: 1,		//스크롤 한번에 움직일 컨텐츠 개수
                speed: 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
                arrows: true, 		// 옆으로 이동하는 화살표 표시 여부
                dots: true, 		// 스크롤바 아래 점으로 페이지네이션 여부
                autoplay: true,			// 자동 스크롤 사용 여부
                autoplaySpeed: 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
                pauseOnHover: true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
                vertical: false,		// 세로 방향 슬라이드 옵션
                prevArrow: "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
                nextArrow: "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
                dotsClass: "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
                draggable: true, 	//드래그 가능 여부

                responsive: [ // 반응형 웹 구현 옵션
                    {
                        breakpoint: 800, //화면 사이즈 960px
                        settings: {
                            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                            slidesToShow: 3
                        }
                    },
                    {
                        breakpoint: 650, //화면 사이즈 768px
                        settings: {
                            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                            slidesToShow: 2
                        }
                    }
                ]

            });
        })
    </script>
</head>

<style>

</style>


<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <%@include file="header.jsp" %>

    <div class="container-fluid">

        <!-- Page Heading -->
        <div>
            <div style="padding:30px 25px; height: 500px; background-color: lightblue;">
                <div id="slider-div">
                    <div>홍보 공지 1</div>
                    <div>홍보 공지 2</div>
                    <div>홍보 공지 3</div>
                    <div>홍보 공지 4</div>
                    <div>홍보 공지 5</div>
                    <div>홍보 공지 6</div>
                </div>
            </div>

        </div>

        <!-- DataTales Example -->
        <div class="row" style="margin-top: 30px;">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4" style="height: 120px;">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body" onclick="location.href='http://localhost:8080/customer/enroll'"
                         style="cursor:pointer;">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Customer Add
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">고객사 등록</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-building fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body" onclick="location.href='http://localhost:8080/sr/enroll'"
                         style="cursor:pointer;">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    Service Request Add
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">SR 등록</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body" onclick="location.href='http://localhost:8080/activity/enroll/employee'"
                         style="cursor:pointer;">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Activity Add
                                </div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">활동 등록</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body" onclick="location.href='http://localhost:8080/product/delivery/enroll'"
                         style="cursor:pointer;">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    Delivery Add
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">납품 등록</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-box fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<%@include file="footer.jsp"%>

<!-- Bootstrap core JavaScript-->
<script src="/resources/boots/vendor/jquery/jquery.min.js"></script>
<script src="/resources/boots/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/boots/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/boots/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/boots/js/demo/datatables-demo.js"></script>

</body>
</html>