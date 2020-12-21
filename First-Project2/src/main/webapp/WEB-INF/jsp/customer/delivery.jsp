<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delivery</title>
    <!-- Custom fonts for this template -->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


</head>
<script>
    $(document).ready(function () {
        $('#myTable').DataTable();
    });

    //클릭시 os별 수량 div 출력
    function osShow(deliveryId, productName) {

        // alert(productName);
        if (productName == "iGRIFFIN" || productName == "ToS") {
            $.ajax({
                type: 'GET',
                url: '/customer/' + deliveryId + '/os',
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
                },
                success: function (data) {
                    $('#os').html(data);
                }
            });
        }
    }

</script>
<body>
<!-- Begin Page Content -->
<div class="container-fluid">
    <!-- DataTales Example -->
    <div>

        <div>
            <div class="table-responsive">
                <table class="table table-bordered" id="myTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th width="10%">사업건 번호</th>
                        <th>제품명</th>
                        <th>납품수량</th>
                        <th>납품일</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th width="10%">사업건 번호</th>
                        <th>제품명</th>
                        <th>납품수량</th>
                        <th>납품일</th>
                    </tr>
                    </tfoot>

                    <tbody>
                    <c:forEach var="item" items="${list}" varStatus="status">
                        <tr class="collapsed" data-toggle="collapse" data-target="#d${status.index}"
                            style="cursor: pointer;">
                            <td>${item.deliveryBusinessNum}</td>
                            <td onclick="osShow(${item.deliveryId},'${item.productName}')">${item.productName}</td>
                            <td>${item.deliveryQuantity}</td>
                            <td>${item.deliveryDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div>
    <div id="os" style="margin: 50px;"></div>
</div>
<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>

</body>
</html>