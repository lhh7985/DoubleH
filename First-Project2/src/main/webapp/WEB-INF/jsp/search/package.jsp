<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Package Search</title>


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
            $('#myPackageTable').DataTable();
        });

        function getPackage(packageName, packageId, productName) {
            opener.setPackage(packageName, packageId, productName);
            window.self.close();
        }
    </script>
</head>
<style>
    .font2 {
        font-size: 40px;
        font-weight: bold;
    }

</style>
<body>


<div class="container">
    <div class="font2">패키지정보</div>
    <div class="table-responsive">
        <table class="table table-bordered" id="myPackageTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th width="5%">ID</th>
                <th width="10%">제품명</th>
                <th width="20%">패키지명</th>
                <th width="10%">개발자</th>
                <th width="10%">배포자</th>
                <th width="12%">커널</th>
                <th width="8%">버전</th>
                <th width="8%">OS</th>
                <th width="15%">업로드일</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="item" items="${packageList}">
                <tr onclick="getPackage('${item.packageName}','${item.packageId}','${item.productName}')"
                    style="cursor: pointer;">
                    <td>${item.packageId}</td>
                    <td>${item.productName}</td>
                    <td>${item.packageName}</td>
                    <td>${item.developer}</td>
                    <td>${item.distributor}</td>
                    <td>${item.packageKernel}</td>
                    <td>${item.packageVersion}</td>
                    <td>${item.packageOs}</td>
                    <td>${item.packageUploadDate}</td>
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