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


    <script type="text/javascript">
        $(document).ready(function ($) {
            // if ($("#sr").hasClass("active")) {
            // } else {
            //     $(this).removeClass("active");
                $("#serviceRequest").addClass("active");
                $("#srPages").addClass("show");
                $("#sr").addClass("active");
            // }
        });

        function cancel() {
            self.close();
        }

        function setValue(name, id) {
            document.getElementById("customer_name").value = name;
            document.getElementById("customer_id").value = id;
        };

        function setProduct(name, id) {
            document.getElementById("product_name").value = name;
            document.getElementById("product_id").value = id;
        }


        var winRef;

        function customer_search() {
            href = "http://localhost:8080/search/customer";
            if (!winRef) {
                winRef = window.open(href, "customer", 'width=800px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "customer", 'width=800px, height=600px,toolbars=no,scrollbars=no');
                }
            }

            window.close();
        }


        function product_search() {
            var customerId = document.getElementById('customer_id').value;
            href = "http://localhost:8080/search/product?customerId=" + customerId;
            if (!winRef) {
                $.ajax({
                    type: 'GET',
                    url: '/search/product?customerId=' + customerId,
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" + "message:"
                            + request.responseText + "\n" + "error:"
                            + error);
                    },
                    success: function (data) {
                        winRef = window.open(href, "product_search", 'width=800px, height=600px,toolbars=no,scrollbars=no');
                    }
                });


            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    $.ajax({
                        type: 'GET',
                        url: '/search/product?customerId=' + customerId,
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "message:"
                                + request.responseText + "\n" + "error:"
                                + error);
                        },
                        success: function (data) {
                            winRef = window.open(href, "product_search", 'width=800px, height=600px,toolbars=no,scrollbars=no');
                        }
                    });
                }
            }
            window.close();
        }


        //sr등록
        function SRenroll() {
            var add = document.add;
            var customer_name = add.customerName.value;

            var product_name = add.productName.value;
            var type = add.type.value;

            var requestDate = add.srRequestDate.value;
            var title = add.srTitle.value;
            var content = add.srContent.value;


            if (!customer_name || !product_name || !type || !title || !content || !requestDate) {
                alert("정보를 입력해주세요.");
            } else {
                var forms = $("#add").serialize();
                $.ajax({
                    url: "/sr/enroll",
                    type: "POST",
                    data: forms,
                    success: function () {
                        location.replace("http://localhost:8080/sr/list");
                    }
                });
            }
        }


    </script>
</head>
<style>
    input {
        size: 50px;
    }

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
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">활동 등록</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <form id="add" name="add" action="http://localhost:8080/enroll/sr" method="POST">


                    <!-- 몸통 -->
                    <input name="customerId" id="customer_id" value="0" style="display: none"/>
                    <div style="margin: 20px;" class="row">
                        <label class="col-md-1">고객</label>
                        <input name="customerName" class="col-md-2 form-control" id="customer_name" readonly/>
                        <button class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                                onclick='customer_search()'>고객검색
                        </button>

                        <label class="col-md-1 " style="margin-left: 70px; width: 80px;">제품</label>
                        <input name="productName" class="col-md-2 form-control" id="product_name" readonly>
                        <button class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                                onclick="product_search()">제품검색
                        </button>

                    </div>


                    <input name="productId" id="product_id" value="0" style="display: none"/>


                    <div style="margin: 20px;" class="row">
                        <label class="col-md-1 label1">신규여부</label>
                        <select name="type" id="type" class="col-md-2 form-control">
                            <option>신규</option>
                            <option>이슈</option>
                            <option>고객사방문</option>
                        </select>

                        <label class="col-md-1 label1" style="margin-left:30px;">중요도</label>
                        <select name="importance" id="importance" class="col-md-1 form-control">
                            <option>상</option>
                            <option>중</option>
                            <option>하</option>
                        </select>

                        <label class="col-md-1 label1" style="margin-left:30px;">요청일자</label>
                        <input type="date" name="srRequestDate" id="requestDate" class="col-md-2 form-control"
                               style="width:15%;" size="30px;">

                    </div>

                    <div style="margin: 20px;" class="row">
                        <label class="col-md-1 label1">제목</label>
                        <input id="title" class="col-md-8 form-control" type="text" name="srTitle">
                    </div>

                    <div class="row" style="margin: 20px;">
                        <label class="col-md-1 label1">내용</label>

                        <textarea name="srContent" id="srContent" class="col-md-10 form-control" style="width:80%"
                                  rows="7" cols="100"></textarea>
                    </div>


                    <div class="col-md-11 text-center" style="margin-top: 30px;">
                        <input class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                               onclick="SRenroll()" value="등록"/>

                        <input class="col-xs-2 btn btn-outline-primary btn-height" type="reset" value="취소"/>
                    </div>

                </form>
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