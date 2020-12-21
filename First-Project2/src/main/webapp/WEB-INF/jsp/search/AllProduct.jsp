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

</head>
<script type="text/javascript">
	$(document).ready(function ($) {
		$('#myAllProductTable').DataTable();
	});

	function getProduct(productName, productId) {
		opener.setProduct(productName, productId);
		window.self.close();
	}
</script>
<body>
<div class="container-fluid">
    <h1 style="margin: 50px;">제품 선택</h1>

<div>
	<div>
		<div class="table-responsive">
			<table class="table table-bordered" id="myAllProductTable" width="100%" cellspacing="0">
				<thead>
				<tr>
					<th>제품명</th>
					<th>제품설명</th>
				</tr>
				</thead>

				<tbody>
				<c:forEach var="item2" items="${list}" varStatus="stuatus">
					<tr onclick=getProduct('${item2.productName}','${item2.productId}') style="cursor: pointer;">
						<td>${item2.productName}</td>
						<td>${item2.productContent}</td>
					</tr>
				</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
</div>

</div>

<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>
</body>
</html>