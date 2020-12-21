<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>코드테이블 수정</title>


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
    <script type="text/javascript" src="/resources/js/i18n/grid.locale-kr.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.jqgrid.min.js"></script>


    <script type="text/javascript">

        $(document).ready(function ($) {
            $("#jqGrid").jqGrid({
                url: "http://localhost:8080/admin/getlist",
                datatype: 'json',
                mtype: 'GET',
                colNames: ['ID', '코드그룹', '상위코드', '코드명', '코드상태'],
                colModel: [
                    {name: "codeId", label: "codeGroup", width: 50, key: true, hidden: false},
                    {name: "codeGroup", label: "codeGroup", width: 100, editable: true},
                    {name: "codeUpper", label: "codeUpper", width: 100, editable: true},
                    {name: "codeName", label: "codeName", width: 120, editable: true},
                    {name: "codeStatus", label: "codeStatus", width: 80, editable: true}
                ],
                pager: '#pager',
                loadonce: true,
                rowNum: 10,
                rownumbers: true,
                gridview: true,
                width: 1350,
                height: 400,
                rowList: [5, 10, 20, 50],
                // viewrecords: true,
                caption: 'activiy-List',
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
                    url: 'http://localhost:8080/admin/codetable/update',
                    closeOnExcqpe: true,
                    recreateForm: true,
                    closeAfterEdit: true,
                    afterComplete: function (response) {
                        $("#jqGrid").trigger("reloadGrid");
                    }
                },
                {},
                {
                    closeAfterDel: true,
                    reloadAfterSubmit: true,
                    url: 'http://localhost:8080/admin/codetable/delete',
                    afterComplete: function (response) {
                        var rowid = $("#jqGrid").getGridParam("selrow");
                        location.href = "http://localhost:8080/admin/codetable/delete" + rowid.codeId;
                        alert(rowid.codeId);
                        if (response.responseText) {
                            alert(response.responseText);
                        }
                        $("#jqGrid").trigger('reloadGrid');

                    }
                }
            );
            $("#jqGrid").jqGrid('filterToolbar', {searchOperators: true, stringResult: true, searchOnEnter: true});

            if ($("#codeTable").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#admin").addClass("active");
                $("#adminPages").addClass("show");
                $("#codeTable").addClass("active");
            }
        });

        function code_enroll(){
            var add = document.add;
            var code_group =add.codeGroup.value;

            var code_upper = add.codeUpper.value;
            var code_name = add.codeName.value;
            var code_status = add.codeStatus.value;

            if (!code_group || !code_name|| !code_status ) {
                alert("정보를 입력해주세요.");
            } else {
                var forms = $("#add").serialize();
                $.ajax({
                    url: "/admin/enroll",
                    type:"POST",
                    data:forms,
                    success:function(data){
                        location.reload();
                    }
                });
            }

        }

    </script>
</head>
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

    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">코드테이블</h6>
                    </div>
                    <div>
                        <button class="btn btn-outline-primary " style="float: right; margin: unset;"
                                onclick="code_enroll();">추가
                        </button>
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
                        <h6 class="m-0 font-weight-bold text-primary">코드 추가</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <!-- 몸통 -->
                <form id="add" name="add"   method="POST">
                    <div class="row" style=" margin-left: 60px;">

                        <label class="col-md-1 label">코드그룹</label>
                        <input name="codeGroup" class="col-md-1 form-control" id="code_group" style="margin-left: -30px;"  />


                        <label class="col-md-1 label" style="margin-left: 40px;">상위코드</label>
                        <input name="codeUpper" class="col-md-2 form-control" id="code_upper"  style="margin-left: -30px;"/>


                        <label class="col-md-1 label" style="margin-left: 40px;">코드명</label>
                        <input type="text" name="codeName" id="code_name" class="col-md-2 form-control" style="margin-left: -30px;"/>

                        <label class="col-md-1 label" style="margin-left: 40px;">상태</label>
                        <select name="codeStatus" id="code_status" class="col-md-1 form-control" style="margin-left: -30px;" >
                            <option>활성</option>
                            <option>비활성</option>
                        </select>

                        <div class="col-md-11 text-center" style="margin-top: 30px;">
                            <button class="btn btn-outline-success" type="button" onclick="code_enroll()">등록</button>
                            <input class="col-xs-2 btn btn-outline-danger btn-height" type="reset" value="취소"/>
                        </div>

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