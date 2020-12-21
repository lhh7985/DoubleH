<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>제품 검색</title>

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
            $('#myProductTable').DataTable();
        });

        function getProduct(productName, productId) {
            opener.setProduct(productName, productId);
            window.self.close();
        }
    </script>
</head>
<body>
<div class="container">
    <h1 style="margin: 50px;">제품 선택</h1>
    <div class="table-responsive">
        <table class="table table-bordered" id="myProductTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th>
                    <div>사업건 번호</div>
                </th>
                <th>
                    <div>제품명</div>
                </th>
                <th>
                    <div>납품일</div>
                </th>
                <th>
                    <div>수량</div>
                </th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="item2" items="${deliverylist}" varStatus="stuatus">
                <tr onclick=getProduct('${item2.productName}','${item2.productId}') style="cursor: pointer;">
                    <td>${item2.deliveryBusinessNum}</td>
                    <td>${item2.productName}</td>
                    <td>${item2.deliveryDate}</td>
                    <td>${item2.deliveryQuantity}</td>
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