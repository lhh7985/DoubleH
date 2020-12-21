<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Insert title here</title>

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

    <script>
        $(document).ready(function ($) {
            if ($("#delivery").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#productInfo").addClass("active");
                $("#productPages").addClass("show");
                $("#delivery").addClass("active");
            }
        });

        //고객 검색창 열기
        var winRef;

        function customer_search() {
            href = "http://localhost:8080/search/customer";
            if (!winRef) {
                winRef = window.open(href, "customer2", 'width=800px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "customer2", 'width=800px, height=600px,toolbars=no,scrollbars=no');
                }
            }

        }

        function setValue(name, id) {
            document.getElementById("customer_name").value = name;
            document.getElementById("customer_id").value = id;
        };


        function product_search() {
            href = "http://localhost:8080/search/allproduct";
            if (!winRef) {
                winRef = window.open(href, "product2", 'width=800px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "product2", 'width=800px, height=600px,toolbars=no,scrollbars=no');
                }
            }

        }


        function setProduct(name, id) {
            document.getElementById("product_name").value = name;
            document.getElementById("product_id").value = id;

            if (name == "ToS" || name == "iGRIFFIN") {
                $(".inputArea input").prop("disabled", false);
            } else {
                $(".inputArea input").prop("disabled", true);
            }
        }


        function delivery_enroll() {
            var add = document.add;
            var customer_name = add.customerId.value;

            var product_name = add.productId.value;
            var delivery_date = add.deliveryDate.value;
            var delivery_quantity = add.deliveryQuantity.value;

            var delivery_businessNum = add.deliveryBusinessNum.value;


            if (!customer_name || !product_name || !delivery_date || !delivery_quantity || !delivery_businessNum) {
                alert("정보를 입력해주세요.");
            } else {
                var forms = $("#add").serialize();
                $.ajax({
                    url: "/product/delivery/enroll",
                    type: "POST",
                    data: forms,
                    success: function (data) {
                        location.href = "http://localhost:8080/product/delivery";
                    }
                });
            }

        }
    </script>

</head>
<style>
    label {
        display: block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        font-size: 15px;
        line-height: 1.42857143;
    }

    .btn-height {
        height: 38px;
    }
</style>
<body id="page-top">

<div id="wrapper">
    <%@ include file="../header.jsp" %>
    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4" style="width: 1400px;">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h5 class="mb-0 font-weight-bold text-primary">납품등록</h5>
                    </div>

                </div>
            </div>
            <div class="card-body">
                <div style="margin-left:50px;">

                    <form id="add" name="add" method="POST">


                        <!-- 몸통 -->
                        <div style="margin: 20px;" class="row">

                            <input name="customerId" id="customer_id" value="0" style="display: none"/>

                            <label class="col-md-1">고객</label>
                            <input class="col-md-2 form-control" id="customer_name" style="width:20%;"
                                   readonly/>
                            <button class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                                    onclick='customer_search()'>고객검색
                            </button>


                            <input name="productId" id="product_id" value="0" style="display: none"/>

                            <label class="col-md-1" style="margin-left: 50px;">제품</label>
                            <input class="col-md-2 form-control" id="product_name" style="width:20%;" readonly>
                            <button class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                                    onclick="product_search()">제품검색
                            </button>
                        </div>


                        <div style="margin: 20px;" class="row">


                            <label class="col-md-1" style=" width: 50px;">납품일</label>
                            <input type="date" name="deliveryDate" id="delivery_date"
                                   class="col-md-2 form-control" style="width:20%;">


                            <label class="col-md-1" style="margin-left:100px;">총수량</label>
                            <input type="text" name="deliveryQuantity" id="delivery_quantity"
                                   class="col-md-2 form-control" style="width:15%;">

                            <label class="col-md-1" style="margin-left:100px; ">사업건번호</label>
                            <input type="text" name="deliveryBusinessNum" id="delivery_businessNum"
                                   class="col-md-2 form-control" style="width:15%;">

                        </div>

                        <br>
                        <p>* ToS, iGRIFFIN 인 경우에만 입력하세요.</p>

                        <div style="margin: 20px;" class="row inputArea">


                            <label class="col-md-1 " style="margin-left:30px;">window</label>
                            <input type="text" name="Window" id="Window" class="col-md-2 form-control"
                                   style="width:10%;" disabled="disabled">


                            <label class="col-md-1 " style="margin-left:30px;">Linux</label>
                            <input type="text" name="Linux" id="Linux" class="col-md-2 form-control"
                                   style="width:10%;" disabled="disabled">

                            <label class="col-md-1 " style="margin-left:30px;">Unix</label>
                            <input type="text" name="Unix" id="Unix" class="col-md-2 form-control"
                                   style="width:10%;" disabled="disabled">
                        </div>


                        <div class="col-md-11 text-center" style="margin-top: 30px;">
                            <input class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                                   onclick="delivery_enroll()" value="등록"/>

                            <input class="col-xs-2 btn btn-outline-primary btn-height" type="reset" value="취소"/>
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