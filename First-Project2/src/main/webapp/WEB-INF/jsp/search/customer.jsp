<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>고객사 검색</title>


    <!-- Custom fonts for this template -->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <script src="/resources/js/jquery-1.11.0.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function ($) {
            $('#myCustomerTable').DataTable();
        });

        function getCustomer(customerName, customerId) {
            opener.setValue(customerName, customerId);
            window.self.close();
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <h1 style="margin: 50px;">고객 선택</h1>


    <div class="table-responsive">
        <table class="table table-bordered" id="myCustomerTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>고객사명</th>
                <th>주소</th>
                <th>부서</th>
                <th>담당자</th>
                <th>연락처</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="item" items="${customerSearch}" varStatus="status">
                <tr onclick=getCustomer('${item.customerName}','${item.customerId}') style="cursor: pointer;">
                    <td>${item.customerName }</td>
                    <td>${item.addressAddress }</td>
                    <td>${item.departmentName }</td>
                    <td>${item.employeeName }</td>
                    <td>${item.employeeContact }</td>
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