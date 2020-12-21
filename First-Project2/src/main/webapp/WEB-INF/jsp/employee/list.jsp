<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%--<%@ include file="/WEB-INF/jsp/header.jsp" %>--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hello tabs</title>
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

</head>


<style>

    .ui-jqgrid .ui-jqgrid-bdiv {
        overflow-y: scroll;
        font-size: 18px;
    }
</style>

<script type="text/javascript">

    $(document).ready(function ($) {

        var departmentList;
        $.ajax({
            url: "/department",
            type: "POST",
            async: false,
            success: function (data) {
                departmentList = data;
            },
        });

        $("#jqGrid").jqGrid({
            url: "http://localhost:8080/employee/getlist",
            datatype: 'json',
            mtype: 'GET',
            colNames: ['ID', '구분', '회사명', '부서', '직책', '이름', '연락처', '휴대전화', 'Email'],
            colModel: [
                {name: "employeeId", label: "employeeId", width: 50, key: true, hidden: false},
                {name: "codeUpper", label: "codeUpper", width: 100, editable: false},
                {name: "codeName", label: "codeName", width: 100, editable: false},
                {
                    name: "departmentName",
                    label: "departmentName",
                    width: 100,
                    editable: true,
                    edittype: 'select',
                    formatter: 'select',
                    editoptions: {value: {"개발팀": "개발팀", "영업팀": "영업팀", "사업팀": "사업팀", "SE팀": "SE팀", "QA팀": "QA팀"}}
                },
                {name: "employeePosition", label: "employeePosition", width: 60, editable: true},
                {name: "employeeName", label: "employeeName", width: 100, editable: true},
                {name: "employeeContact", label: "employeeContact", width: 180, editable: true},
                {name: "employeePhone", label: "employeePhone", width: 180, editable: true},
                {name: "employeeEmail", label: "employeeEmail", width: 180, editable: true},
            ],
            pager: '#pager',
            loadonce: true,
            rowNum: 15,
            rownumbers: true,
            gridview: true,
            width: 1350,
            height: 350,
            rowList: [15, 30, 50],
            // viewrecords: true,
            caption: 'employee-List',
            // autoencode: true,
            jsonReader: {
                // root: "rows",
                // page: "page",
                // total: "total",
                // records: "records",
                repeatitems: false,
                id: "0",
            },
            navOptions: {reloadGridOptions: {fromServer: true}}
        }).navGrid('#pager', {edit: true, add: false, del: true, search: false, refresh: true},
            {
                url: '/employee/update',
                closeOnEscape: true,
                recreateForm: true,
                closeAfterEdit: true,
                afterComplete: function (response) {
                    $("#jqGrid").trigger('reloadGrid');
                },
            },
            {},
            {
                url: '/employee/delete',
                afterComplete: function (response) {
                    $("#jqGrid").trigger('reloadGrid');
                }
            }
        );
        $("#jqGrid").jqGrid('filterToolbar', {searchOperators: true, stringResult: true, searchOnEnter: true});

        if ($("#employee").hasClass("active")) {
        } else {
            $(this).removeClass("active");
            $("#employee").addClass("active");
        }
    });


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
                    location.reload();
                }
            });
        }
    }


</script>


<style>
    .ui-jqgrid .ui-jqgrid-bdiv {
        overflow-y: scroll;
        font-size: 18px;
        font-family: 'NanumGothicB', '나눔고딕', "나눔고딕";
    }

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

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">직원리스트</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="jqGrid"></table>
                    <div id="pager"></div>
                </div>
            </div>
        </div>


        <!-- 직원 등록 -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">직원 추가</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <!-- 몸통 -->
                <form id="add" name="add" method="POST">
                    <div class="row" style="margin-left:60px; margin-top: 15px;">
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


                    <div class="row" style="margin-top: 15px;margin-left:60px; ">
                        <label class="col-md-1 label" style="width: 120px;">이름</label>
                        <input name="employeeName" class="col-md-1 form-control" style="margin-left: -50px;">

                        <label class="col-md-1 label" style="width: 120px; margin-left:50px;">연락처</label>
                        <input name="employeeContact" class="col-md-2 form-control" style="margin-left: -50px;">

                        <label class="col-md-1 label" style="width: 120px; margin-left:50px;">휴대전화</label>
                        <input class="col-md-2 form-control" name="employeePhone" style="margin-left: -30px;">

                        <label class="col-md-1 label" style="width: 120px; margin-left:50px;">E-mail</label>
                        <input class="col-md-2 form-control" name="employeeEmail" style="margin-left: -50px;">
                    </div>



                    <div class="col-md-11 text-center" style="margin-top: 30px;">
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

<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/boots/js/demo/datatables-demo.js"></script>

</body>
</html>