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

    <script type="text/javascript">
        $(document).ready(function ($) {

            $("#jqGrid").jqGrid({
                url: "http://localhost:8080/patch/package/getlist",
                datatype: 'json',
                mtype: 'GET',
                colNames: ['ID', '제품명', '패키지명', '개발자', '배포자', '커널', '버전', 'OS', '업로드일'],
                colModel: [
                    {name: "packageId", label: "packageId", width: 20, key: true, hidden: false},
                    {name: "productName", label: "productName", width: 100, editable: false},
                    {name: "packageName", label: "packageName", width: 150, editable: false},
                    {name: "developer", label: "developer", width: 50, editable: true},
                    {name: "distributor", label: "distributor", width: 50, editable: true},
                    {name: "packageKernel", label: "packageKernel", width: 100, editable: true},
                    {name: "packageVersion", label: "packageVersion", width: 40, editable: true},
                    {name: "packageOs", label: "packageOs", width: 30, editable: true},
                    {name: "packageUploadDate", label: "packageUploadDate", width: 70, editable: true},
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
                caption: 'patch-List',
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
                    url: '#',
                    closeOnEscape: true,
                    recreateForm: true,
                    closeAfterEdit: true,
                    afterComplete: function (response) {
                        $("#jqGrid").trigger('reloadGrid');
                    },
                },
                {},
                {
                    url: '#',
                    afterComplete: function (response) {
                        $("#jqGrid").trigger('reloadGrid');
                    }
                }
            );
            $("#jqGrid").jqGrid('filterToolbar', {searchOperators: true, stringResult: true, searchOnEnter: true});

            if ($("#package").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#patchInfo").addClass("active");
                $("#patchPages").addClass("show");
                $("#package").addClass("active");
            }
        });

    </script>
</head>

<style>
    .ui-jqgrid .ui-jqgrid-bdiv {
        overflow-y: scroll;
        font-size: 18px;
        font-family: 'NanumGothicB', '나눔고딕', "나눔고딕";
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
                <h6 class="m-0 font-weight-bold text-primary">패키지정보</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table id="jqGrid"></table>
                    <div id="pager"></div>
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