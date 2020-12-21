<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patch List</title>


    <!-- Custom fonts for this template-->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

    <script src="/resources/js/jquery-1.11.0.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function ($) {
            if ($("#patchHistory").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#patchInfo").addClass("active");
                $("#patchPages").addClass("show");
                $("#patchHistory").addClass("active");
            }
        });

        var winRef;

        function delivery_search() {
            href = "http://localhost:8080/search/delivery";
            if (!winRef) {
                winRef = window.open(href, "delivery", 'width=1000px, height=700px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "delivery", 'width=1000px, height=700px,toolbars=no,scrollbars=no');
                }
            }

            window.close();
        }

        function package_search() {
            href = "http://localhost:8080/search/package";
            if (!winRef) {
                $.ajax({
                    type: 'GET',
                    url: '/search/package',
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" + "message:"
                            + request.responseText + "\n" + "error:"
                            + error);
                    },
                    success: function (data) {
                        winRef = window.open(href, "package_search", 'width=1000px, height=700px,toolbars=no,scrollbars=no');
                    }
                });


            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    $.ajax({
                        type: 'GET',
                        url: '/search/package',
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "message:"
                                + request.responseText + "\n" + "error:"
                                + error);
                        },
                        success: function (data) {
                            winRef = window.open(href, "package_search", 'width=1000px, height=700px,toolbars=no,scrollbars=no');
                        }
                    });
                }
            }
            window.close();
        }

        function setPackage(packageName, packageId, productName) {
            document.getElementById("package_name").value = packageName;
            document.getElementById("package_id").value = packageId;
            document.getElementById("product_name").value = productName;
        };

        function setDelivery(customerName, deliveryId) {
            document.getElementById("customer_name").value = customerName;
            document.getElementById("delivery_id").value = deliveryId;
        };

        function PatchEnroll() {
            var add = document.patchAdd;
            var customer_name = add.customerName.value;

            var product_name = add.productName.value;
            var package_name = add.packageName.value;

            var patchDate = add.patchDate.value;
            var title = add.srTitle.value;
            var content = add.srContent.value;


            if (!customer_name || !product_name || !package_name || !title || !content || !patchDate) {
                alert("정보를 입력해주세요.");
            } else {
                var forms = $("#patchAdd").serialize();
                $.ajax({
                    url: "/patch/enroll",
                    type: "POST",
                    data: forms,
                    success: function () {
                        location.replace("http://localhost:8080/patch/list");
                    }
                });
            }
        }
    </script>
</head>
<style>
    .btn-height {
        height: 38px;
    }

    label {
        display: block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        font-size: 15px;
        line-height: 1.42857143;
    }


</style>


<body id="page-top">

<div id="wrapper">
    <%@include file="../header.jsp" %>
    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4" style="width: 1400px;">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">패치이력</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="">
                    <form id="patchAdd" name="patchAdd" method="POST">
                        <!-- 몸통 -->
                        <div style="margin: 20px;" class="row">
                            <label class="col-xl-1">패키지명</label>
                            <input name="packageName" class="col-xs-4 form-control" id="package_name"
                                   style="width:30%;" readonly/>

                            <label class="col-xl-1 " style="margin-left: 70px; ">납품제품</label>
                            <input name="productName" class="col-md-4 form-control" id="product_name"
                                   style="width:20%;" readonly>
                            <button class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                                    onclick='package_search()'>검색
                            </button>

                            <input name="packageId" id="package_id" value="0" style="display: none"/>

                        </div>
                        <div style="margin: 20px;" class="row">
                            <label class="col-xl-1 ">고객사명</label>
                            <input name="customerName" class="col-md-4 form-control" id="customer_name"
                                   style="width:20%;" readonly>
                            <button class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                                    onclick="delivery_search()">검색
                            </button>

                            <input name="deliveryId" id="delivery_id" value="0" style="display: none"/>

                            <label class="col-xl-1 label1" style="margin-left:50px;">패치일자</label>
                            <input type="date" name="patchDate" id="patch_date" class="col-md-3 form-control"
                                   style="width:15%;" size="30px;">
                        </div>

                        <div style="margin: 20px;" class="row">
                            <label class="col-xl-1 label1">제목</label>
                            <input id="title" class="col-md-10 form-control" style="width:50%;" type="text"
                                   name="srTitle">
                        </div>

                        <div class="row" style="margin: 20px;">
                            <label class="col-xl-1 label1">내용</label>

                            <textarea name="srContent" id="srContent" class="form-control" style="width:90%"
                                      rows="10" cols="100"></textarea>
                        </div>

                        <div class="col-md-12 text-center" style="margin-top: 30px;">
                            <input class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                                   onclick="PatchEnroll()" value="등록"/>
                            <input class="col-xs-2 btn btn-outline-primary btn-height" type="reset"
                                   onclick="history.back();" value="취소"/>
                        </div>

                    </form>
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