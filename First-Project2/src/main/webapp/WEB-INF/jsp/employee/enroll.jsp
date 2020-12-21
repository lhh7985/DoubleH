<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

        function employeeAdd() {
            var add = document.add;
            var name = document.add.employeeName.value;
            var contact = add.employeeContact.value;
            var phone = add.employeePhone.value;
            var email = add.employeeEmail.value;

            if (!name || !contact || !phone || !email) {
                alert("정보를 입력해주세요.");
            } else {
                var forms = $("#add").serialize();
                $.ajax({
                    url: "/employee/enroll",
                    type: "POST",
                    data: forms,
                    success: function (data) {
                        opener.reloadPage();
                        self.close();
                    }
                });
            }
        }

    </script>
</head>
<style>
    .label {
        display: block;
        width: 100%;
        height: 40px;
        padding: 6px 12px;
        font-size: 15px;
        line-height: 1.8;
    }
</style>

<body id="page-top">

<div id="wrapper">

    <%@include file="../header.jsp" %>

    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- 직원 등록 -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">활동 등록</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <!-- 몸통 -->
                <form id="add" name="add" method="POST">
                    <div class="row" style="margin-left:60px; margin-top: 30px;">
                        <label class="col-md-1 label" style="width: 120px;">직원구분</label>
                        <select name="type" class="col-md-2 form-control" style="margin-left: -30px;">
                            <c:forEach var="item" items="${type}">
                                <option>${item}</option>
                            </c:forEach>
                        </select>


                        <label class="col-md-1 label" style="width: 120px; margin-left:50px; ">직급</label>
                        <select name="employeePosition"  class="col-md-2 form-control" style="margin-left: -50px;">
                            <option>사장</option>
                            <option>상무</option>
                            <option>이사</option>
                            <option>부장</option>
                            <option>차장</option>
                            <option>과장</option>
                            <option>대리</option>
                            <option>주임</option>
                            <option>사원</option>
                            <option>인턴</option>
                        </select>

                        <label class="col-md-1 label" style="width: 120px;  margin-left:50px;">부서</label>
                        <select name="departmentName" class="col-md-2 form-control" style="margin-left: -50px;">
                            <c:forEach var="item2" items="${dept}">
                                <option>${item2}</option>
                            </c:forEach>
                        </select>

                    </div>


                    <div class="row" style="margin-top: 30px;margin-left:60px; ">
                        <label class="col-md-1 label" style="width: 120px;">이름</label>
                        <input name="employeeName" class="col-md-1 form-control" style="margin-left: -50px;">

                        <label class="col-md-1 label" style="width: 120px; margin-left:50px;">연락처</label>
                        <input name="employeeContact" class="col-md-2 form-control" style="margin-left: -50px;">

                        <label class="col-md-1 label" style="width: 120px; margin-left:50px;">휴대전화</label>
                        <input class="col-md-2 form-control" name="employeePhone" style="margin-left: -30px;">

                        <label class="col-md-1 label" style="width: 120px; margin-left:50px;">E-mail</label>
                        <input class="col-md-2 form-control" name="employeeEmail" style="margin-left: -50px;">
                    </div>


                    <div class="row" style="margin-top: 20px;margin-left:20px; ">

                    </div>


                    <div class="col-md-11 text-center" style="margin-top: 50px;">
                        <button class="btn btn-outline-success" type="button" onclick="employeeAdd()">등록</button>
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