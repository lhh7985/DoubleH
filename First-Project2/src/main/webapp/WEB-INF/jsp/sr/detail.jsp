<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link href="/resources/boots/css/sb-admin-2.css" rel="stylesheet">

    <script src="/resources/js/jquery-1.11.0.min.js"></script>

    <title>Insert title here</title>

    <script type="text/javascript">
        $(document).ready(function ($) {
            if ($("#sr").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#serviceRequest").addClass("active");
                $("#srPages").addClass("show");
                $("#sr").addClass("active");
            }
        });

        var winRef;

        function goActivity() {
            var srId = ${srvo.srId};
            href = "http://localhost:8080/activity/enroll/sr/" + srId;
            if (!winRef) {
                $.ajax({
                    type: 'GET',
                    url: '/activity/enroll/sr/' + srId,
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" + "message:"
                            + request.responseText + "\n" + "error:"
                            + error);
                    },
                    success: function (data) {
                        winRef = window.open(href, "activity", 'width=1000px, height=800px,toolbars=no,scrollbars=no');
                    }
                });
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    $.ajax({
                        type: 'GET',
                        url: '/activity/enroll/sr/' + srId,
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "message:"
                                + request.responseText + "\n" + "error:"
                                + error);
                        },
                        success: function (data) {
                            winRef = window.open(href, "activity", 'width=1000px, height=800px,toolbars=no,scrollbars=no');
                        }
                    });
                }

            }

        }

        function srEdit() {
            $(".edit").attr('readonly', false);
            document.getElementById("btn_edit").style.display = "none";
            document.getElementById("btn_editComplete").style.display = "inline-block";
        }

        function srUpdate() {
            var forms = $("#update").serialize();
            $.ajax({
                url: "/sr/update",
                type: "POST",
                data: forms,
                success: function (result) {
                    if (result != 0) {
                        alert("수정 되었습니다.")
                        location.reload();
                    } else {
                        alert("작성자만 수정할 수 있습니다.")
                    }
                }
            });
        }


        function srComplete(srId) {
            var srCompleteConfirm = confirm("완료하시겠습니까?");
            if (srCompleteConfirm) {
                $.ajax({
                    type: 'POST',
                    url: '/sr/complete/' + srId,
                    error: function (request) {
                        alert("상태 :" + request.status + "/n" + "Text :" + request.responseText);
                    },
                    success: function (result) {
                        if (result != 0) {
                            document.getElementById("btn_srComplete").style.display = "none";
                            location.reload();
                            alert("요구사항이 완료되었습니다.")
                        } else {
                            alert("작성자만 완료할 수 있습니다.")
                        }
                    }
                })
            }
        }

        function activityComplete(activityId) {
            $.ajax({
                type: 'POST',
                url: '/activity/detail?activityId=' + activityId,
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
                },
                success: function (data) {
                    location.reload();
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
                        location.reload();
                    } else {
                        alert("실패!!")
                    }
                }
            });
        }

        function DeleteSr(srId) {
            var confirm_val = confirm("삭제 하시겠습니까?");
            if (confirm_val) {
                $.ajax({
                    type: 'GET',
                    url: '/sr/delete/' + srId,
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" + "message:"
                            + request.responseText + "\n" + "error:"
                            + error);
                    },
                    success: function (result) {
                        if (result > 0) {
                            alert("삭제되었습니다.")
                            location.href = "/sr/list";
                        } else {
                            alert("실패!!")
                        }
                    }
                });
            }
        }

        function reloadPage() {
            location.reload();
        }

    </script>

</head>

<style>

    .mymargin {
        margin: 10px;
    }

    label {
        display: block;
        width: 100%;
        height: 34px;
        padding: 3px 6px;
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
                    <h6 class="m-0 font-weight-bold text-primary col-md-10">상세정보</h6>
                    <sec:authentication var="userId" property="principal"/>
                    <c:choose>
                        <c:when test="${srvo.srStatus eq '완료'}">
                            <td height="45px;"></td>
                        </c:when>
                        <c:otherwise>
                            <input id="btn_edit" class="col-xs-1 btn btn-outline-primary btn-height" type="button"
                                   onclick="srEdit()" value="수정" style="margin-right: 15px; display: inline-block;"/>
                            <input id="btn_editComplete" class="col-xs-1 btn btn-outline-primary btn-height"
                                   type="button" onclick="srUpdate()" value="완료"
                                   style="margin-right:15px; display: none;"/>
                            <button class="col-xs-2 btn btn-outline-success" id="btn_srComplete"
                                    onclick="srComplete(${srvo.srId})">활동완료
                            </button>
                        </c:otherwise>
                    </c:choose>
                    <button class="col-xs-1 btn btn-outline-danger" style="margin-left: 15px;"
                            onclick="DeleteSr(${srvo.srId})">삭제
                    </button>
                </div>
            </div>
            <div class="card-body">
                <div class="row mymargin">
                    <label class="col-md-1">고객사</label>
                    <input class="col-md-2 form-control" style="width:15%;" value="${srvo.customerName }" disabled/>

                    <label class="col-md-1" style="margin-left: 40px;">제품</label>
                    <input class="col-md-2 form-control" value="${srvo.productName }" disabled/>

                    <label class="col-md-1" style="margin-left: 40px;">유형</label>
                    <input class="col-md-1 form-control" value="${srvo.codeName }" disabled/>

                    <label class="col-md-1" style="margin-left: 40px;">중요도</label>
                    <input class="col-md-1 form-control" value="${srvo.importance}" disabled/>
                </div>


                <div class="row mymargin">

                    <label class="col-md-1">요청일</label>
                    <input class="col-md-2 form-control" value="${srvo.srRequestDate}" disabled/>

                    <label class="col-md-1" style="margin-left: 40px;">등록자</label>
                    <input class="col-md-1 form-control" value="${srvo.employeeName}" disabled/>

                    <label class="col-md-1" style="	margin-left: 40px;">등록일</label>
                    <input class="col-md-2 form-control" value="${srvo.srRegistrationDate}" disabled/>

                    <label class="col-md-1" style="margin-left: 40px;">완료일</label>
                    <input class="col-md-2 form-control" value="${srvo.srCompletionDate}" disabled/>
                </div>


                <form id="update" name="update">
                    <input name="srId" value="${srvo.srId}" style="display: none">

                    <div class="row mymargin" style="margin-top : 20px;">
                        <label class="col-md-1">제목</label>
                        <input class="col-md-7 form-control edit" name="srTitle" value="${srvo.srTitle}" readonly/>

                    </div>

                    <div class="row mymargin">
                        <label class="col-md-1">요구사항</label>
                        <textarea class="col-md-9 form-control edit" name="srContent" style="width:80%;" rows="5"
                                  cols="150" readonly>${srvo.srContent}</textarea>
                    </div>
                </form>


                <div style="margin-top: 20px;">
                    <div class="row-fluid">
                        <h2 class="col-md-1">활동</h2>

                        <button class="col-md-1 btn btn-outline-primary" style="float:right;" type="button"
                                onclick="goActivity();">활동추가
                        </button>
                        <div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th width="10%">유형</th>
                                    <th width="30%">제목</th>
                                    <th width="10%">등록자</th>
                                    <th width="15%">시작일</th>
                                    <th width="15%">완료예정일</th>
                                    <th width="10%">상태</th>
                                    <th width="10%"></th>
                                </tr>
                                </thead>

                                <tbody class="">
                                <c:forEach var="item" items="${acvo}" varStatus="status">
                                    <tr class="">
                                        <td>${item.codeName}</td>
                                            <%--												<td data-toggle="collapse" data-target="#${status.index}" style="cursor: pointer;">${item.activityTitle}</td>--%>
                                        <td>
                                            <a class="collapsed" href="#" data-toggle="collapse"
                                               data-target="#a${status.index}">
                                                <span>${item.activityTitle}</span>
                                            </a>
                                        </td>
                                        <td>${item.activityRegistrant}</td>
                                        <td>${item.activityRegistrationDate}</td>
                                        <td>${item.activityEstimatedDate}</td>
                                        <td>${item.activityStatus}</td>
                                        <c:choose>
                                            <c:when test="${item.activityStatus eq '완료'}">
                                                <td height="45px;"></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><input height="35px;" type="button"
                                                           onclick=activityComplete('${item.activityId}')
                                                           class="btn btn-info" value="완료하기"/></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>

                                    <tr>
                                        <td colspan="7" id="a${status.index}" class="collapse">
                                            <button class="btn btn-outline-dark" style="float:right;"
                                                    onclick="DeleteActivity(${item.activityId})">삭제
                                            </button>
                                            <div>${item.activityContent}</div>
                                            <div>완료일 : ${item.activityCompletionDate }</div>
                                        </td>
                                    </tr>

                                </c:forEach>
                                </tbody>
                            </table>
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
<script src="/resources/boots/js/sb-admin-2.min.js"></script>

</body>
</html>