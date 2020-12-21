<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

	<title>OS View</title>

	<!-- Custom fonts for this template -->
	<link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

<title>Insert title here</title>

<script type="text/javascript">
	
</script>

</head>
<script>
	$(document).ready( function () {
		$('#myTable').DataTable();
	} );


</script>
<body>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- DataTales Example -->


			<div class="">
				<p style="font-weight: bold; font-size: 20px;">운영체제 별 수량</p>
			<div class="table">
				<table class="table table-bordered" id="myTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>제품명</th>
							<th>운영체제</th>
							<th>수량</th>
							<th>납품일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="item" items="${osList}" varStatus="status">
							<tr class="collapsed" data-toggle="collapse" data-target="#d${status.index}"  style="cursor: pointer;">
								<td>${item.productName}</td>
								<td>${item.osName}</td>
								<td>${item.osQuantity}</td>
								<td>${item.deliveryDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


		<div id="os">

		</div>
	</div>


</div>
</body>
</html>