<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>개인활동 추가(출장)</title>

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
            // if ($("#activity").hasClass("active")) {
            // } else {
            //     $(this).removeClass("active");
                $("#serviceRequest").addClass("active");
                $("#srPages").addClass("show");
                $("#activity").addClass("active");
            // }
        });

        function cancel() {
            self.close();
        }


        function Activity_add() {
            var add = document.add;
            var title = add.activityTitle.value;
            var content = add.activityContent.value;

            if (!title || !content) {
                alert("정보를 입력해주세요.");
            } else {
                var forms = $("#add").serialize();
                $.ajax({
                    url: "/activity/enroll/employee",
                    type: "POST",
                    data: forms,
                    success: function () {
                        location.replace("http://localhost:8080/activity/list");
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

<!-- Page Wrapper -->
<div id="wrapper">

    <%@include file="../header.jsp" %>

    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">활동등록</h6>
                    </div>

                </div>
            </div>
            <div class="card-body">
                <form name="add" id="add" action="http://localhost:8080/activity/enroll/employee" method="post">

                    <!-- 몸통 -->
                    <div class="row" style="margin-left:20px;">
                        <label class="col-md-1">활동유형</label>
                        <select name="type" style="" class="col-md-1 form-control">
                            <option>출장</option>
                            <option>고객사방문</option>
                        </select>

                        <label class="col-md-1" style="margin-left:30px;">활동상태</label>
                        <select name="activityStatus" style="margin-left: -20px;" class="col-md-1 form-control">
                            <option>활동예정</option>
                            <option>활동중</option>
                            <option>완료</option>
                        </select>


                        <label class="col-md-1 my" style="margin-left: 50px;">활동예정일</label>
                        <input type="date" name="activityEstimatedDate" class="col-md-3 form-control">

                    </div>

                    <div class="row" style="margin: 20px;">
                        <label class="col-md-1">완료예정일</label>
                        <input type="date" name="activityCompletionDate" class=" col-md-3 form-control datepicker"
                               style="width: 15%;">
                    </div>


                    <div class="row" style="margin: 20px; margin-top:20px;">
                        <label class="col-md-1 my">제목</label>
                        <input class="form-control" name="activityTitle" type="text"
                               style="width: 60%;">
                    </div>

                    <div class="row" style="margin: 20px; margin-top:30px;">
                        <label class=" col-md-1 my">내용</label>

                        <textarea class="form-control" style="width: 80%;" name="activityContent" rows="15"
                                  cols="120"></textarea>
                    </div>


                    <div class="col-md-11 text-center" style="margin-top: 30px;">
                        <input class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                               onclick="Activity_add()" value="등록"/>
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