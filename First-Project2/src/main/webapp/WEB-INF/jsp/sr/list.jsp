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


    <link rel="stylesheet" type="text/css" media="screen" href="/resources/jqueryUI/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/ui.jqgrid.css"/>

    <script src="/resources/js/jquery-1.11.0.min.js"></script>
    <script type="text/ecmascript" src="/resources/js/i18n/grid.locale-kr.js"></script>
    <script type="text/ecmascript" src="/resources/js/jquery.jqgrid.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function ($) {
            $("#jqGrid").jqGrid({
                url: "http://localhost:8080/sr/getlist",
                datatype: 'json',
                mtype: 'GET',
                colNames: ['ID', '구분', '고객사', '제품', '제목', '중요도', '요청일자', '상태'],
                colModel: [
                    {name: "srId", label: "srId", width: 30, key: true, hidden: true},
                    {name: "codeName", label: "codeName", width: 50, hidden: false},
                    {name: "customerName", label: "customerName", width: 60, hidden: false},
                    {name: "productName", label: "productName", width: 60, editable: true},
                    {name: "srTitle", label: "srTitle", width: 230, editable: true},
                    {name: "importance", label: "importance", width: 30, editable: true},
                    {name: "srRequestDate", label: "srRequestDate", width: 60, editable: true},
                    {name: "srStatus", label: "srStatus", width: 50, editable: true}
                ],
                pager: '#pager',
                loadonce: true,
                rowNum: 15,
                rownumbers: true,
                gridview: true,
                width: 1350,
                height: 420,
                rowList: [15, 30, 50],
                // viewrecords: true,
                caption: 'customer-List',
                // autoencode: true,
                jsonReader: {
                    // root: "rows",
                    // page: "page",
                    // total: "total",
                    // records: "records",
                    repeatitems: false,
                    id: "0",
                },
                onCellSelect: function (rowid) {
                    var rowid = $("#jqGrid").getRowData(rowid);
                    location.href = "http://localhost:8080/sr/" + rowid.srId + "/detail";
                },
                navOptions: {reloadGridOptions: {fromServer: true}}
            }).navGrid('#pager', {edit: false, add: false, del: false, search: false, refresh: true},
                {
                    url: '#',
                    closeOnExcqpe: true,
                    recreateForm: true,
                    closeAfterEdit: true,
                    afterComplete: function (response) {
                        if (response.responseText) {
                            alert(response.responseText);
                        }
                    },
                },
                {},
                {
                    url: '#',
                    afterComplete: function (response) {
                        if (response.responseText) {
                            alert(response.responseText);
                        }
                        $("#jqGrid").trigger('reloadGrid');
                    }
                }
            );
            $("#jqGrid").jqGrid('filterToolbar', {searchOperators: true, stringResult: true, searchOnEnter: true});


            $(this).removeClass("active");
            $("#serviceRequest").addClass("active");
            $("#srPages").addClass("show");
            $("#sr").addClass("active");

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
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">SR리스트</h6>
                    </div>
                    <div>
                        <button class="btn btn-outline-primary " style="float: right; margin: unset;"
                                onclick="location.href='http://localhost:8080/sr/enroll'">추가
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