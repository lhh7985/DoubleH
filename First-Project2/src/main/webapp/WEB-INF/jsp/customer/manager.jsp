<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hello thymeleaf</title>
    <!-- Custom fonts for this template-->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<script>
    $(document).ready(function () {
        $('#myTable2').DataTable();
    });
</script>
<body>
<div>
    <div class="table-responsive">
        <table id="myTable2" class="table table-bordered" width="100%">
            <thead>
            <tr>
                <th>구분</th>
                <th>담당자</th>
                <th>연락처</th>
                <th>From</th>
                <th>to</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>구분</th>
                <th>담당자</th>
                <th>연락처</th>
                <th>From</th>
                <th>to</th>
            </tr>
            </tfoot>

            <tbody>
            <c:forEach var="item" items="${list}" varStatus="status">
                <tr>
                    <td>${item.codeName}</td>
                    <td>${item.employeeName}</td>
                    <td>${item.employeeContact}</td>
                    <td>${item.managerHistoryStartDate}</td>
                    <td>${item.managerHistoryEndDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>

</body>
</html>