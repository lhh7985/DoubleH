<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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


    <script type="text/javascript">
        $(document).ready(function ($) {
            $("#jqGrid").jqGrid({
                url: "http://localhost:8080/customer/getlist",
                datatype: 'json',
                mtype: 'GET',
                colNames: ['회사ID', '회사명', '주소', '담당자', '영업담당자', 'SE담당자', ''],
                colModel: [
                    {name: "customerId", label: "customerId", width: 50, key: true, hidden: false},
                    {name: "customerName", label: "customerName", width: 100, hidden: false},
                    {name: "addressAddress", label: "addressAddress", width: 200, editable: true},
                    {name: "manager", label: "manager", width: 80, editable: true},
                    {name: "sales", label: "sales", width: 80, editable: true},
                    {name: "se", label: "se", width: 80, editable: true},
                    {
                        name: 'myac',
                        search: false,
                        width: 50,
                        fixed: true,
                        sortable: false,
                        formatter: 'actions',
                        formatoptions: {
                            keys: true, editbutton: false,
                            delOptions: {
                                url: '/customer/delete',
                                afterComplete: function () {
                                    $("#jqGrid").trigger('reloadGrid');
                                    alert("해당 고객사가 삭제되었습니다.")
                                }
                            }
                        }
                    }
                ],
                pager: '#pager',
                loadonce: true,
                rowNum: 10,
                rownumbers: true,
                gridview: true,
                width: 1350,
                height: 420,
                rowList: [5, 10, 20, 50],
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
                onCellSelect: function (rowid, iCol, cellcontent, e) {
                    var rowid = $("#jqGrid").getRowData(rowid);
                    location.href = "http://localhost:8080/customer/" + rowid.customerId + "/detail";
                },
                navOptions: {reloadGridOptions: {fromServer: true}}
            }).navGrid('#pager', {edit: false, add: false, del: false, search: false, refresh: true},
                {},
                {},
                {}
            );
            $("#jqGrid").jqGrid('filterToolbar', {searchOperators: true, stringResult: true, searchOnEnter: true});

            if ($("#customer").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#customer").addClass("active");
            }
        });


        var winRef;

        function customer_enroll() {
            href = "http://localhost:8080/customer/enroll";
            if (!winRef) {
                winRef = window.open(href, "customer_enroll", 'width=1000px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "customer_enroll", 'width=1000px, height=600px,toolbars=no,scrollbars=no');
                }
            }

            window.close();
        }

        function deleteCustomer(cellValue, options, rowdata, action) {
            location.href = "/customer/delete/" + rowdata.customerId;
        }

        function reloadPage() {
            location.reload();
        }

    </script>
</head>

<style>

    .ui-jqgrid .ui-jqgrid-bdiv {
        overflow-y: scroll;
        font-size: 18px;
        cursor: pointer;
    }
</style>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <%@include file="../header.jsp" %>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">고객사 리스트</h6>
                    </div>
                    <div>
                        <button class="btn btn-outline-primary " style="float: right; margin: unset;"
                                onclick="location.href='http://localhost:8080/customer/enroll'">추가
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

<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/boots/js/demo/datatables-demo.js"></script>

</body>
</html>