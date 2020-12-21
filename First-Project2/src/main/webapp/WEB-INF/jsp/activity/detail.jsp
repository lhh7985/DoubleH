<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <!-- Custom fonts for this template-->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

    <script src="/resources/js/jquery-1.11.0.min.js"></script>

    <title>Insert title here</title>

    <script type="text/javascript">

        $(document).ready(function ($) {
            if ($("#activity").hasClass("active")) {

            } else {
                $(this).removeClass("active");
                $("#serviceRequest").addClass("active");
                $("#srPages").addClass("show");
                $("#activity").addClass("active");
            }
        });

        function Activity_edit() {
            $(".edit").attr('readonly', false);
            document.getElementById("btn_edit").style.display = "none";
            document.getElementById("btn_complete").style.display = "inline-block";
        }

        function edit_cancel() {
            history.back();
        }

        function Activity_update() {
            var forms = $("#update").serialize();
            $.ajax({
                url: "/activity/update/employee",
                type: "POST",
                data: forms,
                success: function (result) {
                    if (result > 0) {
                        alert("수정 되었습니다.")
                        location.replace("http://localhost:8080/activity/list");
                    } else {
                        alert("실패!!")
                    }
                }
            });
        }

        function DeleteActivity(activityId) {
            $.ajax({
                type: 'GET',
                url: '/activity/delete/' + activityId,
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
                },
                success: function (result) {
                    if (result > 0) {
                        alert("삭제되었습니다.")
                        location.href = "/activity/list"
                    } else {
                        alert("실패!!")
                    }
                }
            });
        }

        function complete(activityId) {
            var check = confirm("완료하시겠습니까?");
            if (check) {
                $.ajax({
                    type: 'POST',
                    url: '/activity/complete/' + activityId,
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" + "message:"
                            + request.responseText + "\n" + "error:"
                            + error);
                    },
                    success: function (data) {
                        location.href = "/activity/list";
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
</style>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <%@include file="../header.jsp" %>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <h6 class="m-0 font-weight-bold text-primary col-md-10">활동정보</h6>
                            <c:choose>
                                <c:when test="${activityDetail.activityStatus eq '완료'}">
                                    <td height="45px;"></td>
                                </c:when>
                                <c:otherwise>
                                    <button class="col-xs-2 btn btn-outline-success"
                                            onclick="complete(${activityDetail.activityId})">활동완료
                                    </button>
                                </c:otherwise>
                            </c:choose>
                            <button class="col-xs-1 btn btn-outline-danger" style="margin-left: 15px;"
                                    onclick="DeleteActivity(${activityDetail.activityId})">삭제
                            </button>
                        </div>
                    </div>

                </div>
            </div>
            <div class="card-body">
                <form name="update" id="update" action="http://localhost:8080/activity/enroll/employee" method="post">

                    <input name="activityId" value="${activityDetail.activityId}" style="display: none"/>
                    <!-- 몸통 -->
                    <div class="row" style="margin-left:20px;">
                        <label class="col-md-1">활동유형</label>
                        <select name="type" style="margin-left: -20px;" class="col-md-1 form-control" readonly="true">
                            <option>${activityDetail.codeName}</option>
                        </select>

                        <label class="col-md-1" style="margin-left:30px;">활동상태</label>
                        <select name="activityStatus" style="margin-left: -20px;" class="col-md-1 form-control"
                                readonly="true">
                            <option>${activityDetail.activityStatus}</option>
                        </select>


                        <label class="col-md-1 my" style="margin-left: 50px;">활동예정일</label>
                        <input type="date" name="activityEstimatedDate" class="col-md-2 form-control edit"
                               value="${activityDetail.activityEstimatedDate}" readonly>

                        <label class="col-md-1" style="margin-left: 50px;">완료예정일</label>
                        <input type="date" name="activityEstimatedCompletionDate"
                               class=" col-md-2 form-control datepicker edit" style="width: 15%;"
                               value="${activityDetail.activityEstimatedCompletionDate}" readonly>


                    </div>

                    <div class="row" style="margin: 20px;">
                        <label class="col-md-1">등록자</label>
                        <input name="activityRegistrant" class=" col-md-3 form-control"
                               value="${activityDetail.activityRegistrant}" readonly>

                        <label class="col-md-1" style="margin-left: 100px;">완료일</label>
                        <input name="activityCompletionDate" class=" col-md-2 form-control"
                               value="${activityDetail.activityCompletionDate}" readonly>
                    </div>


                    <div class="row" style="margin: 20px; margin-top:20px;">
                        <label class="col-md-1">제목</label>
                        <input class="form-control edit" name="activityTitle" type="text"
                               style="width: 60%;" value="${activityDetail.activityTitle}" readonly>
                    </div>

                    <div class="row" style="margin: 20px; margin-top:30px;">
                        <label class=" col-md-1">내용</label>

                        <textarea class="form-control edit" style="width: 80%;" name="activityContent" rows="15"
                                  cols="120" readonly>${activityDetail.activityContent}</textarea>
                    </div>


                    <div class="col-md-11 text-center" style="margin-top: 30px;">
                        <input id="btn_edit" class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                               onclick="Activity_edit()" value="수정" style="display: inline-block"/>
                        <input id="btn_complete" class="col-xs-2 btn btn-outline-primary btn-height" type="button"
                               onclick="Activity_update()" value="완료" style="display: none"/>
                        <input class="col-xs-2 btn btn-outline-primary btn-height" onclick="edit_cancel()" type="reset"
                               value="취소"/>
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

<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/boots/js/demo/datatables-demo.js"></script>

</body>
</html>