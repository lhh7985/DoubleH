<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 검색</title>


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>

<script type="text/javascript">
function getProduct(product_name, product_id){
	opener.setProduct(product_name, product_id);		
	window.self.close();
}
</script>
</head>
<body>
	<div class="container">
		<h1 style="margin: 50px;" >제품 선택</h1>	

		<form class="navbar-form navbar-right" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">Search</button>
		</form>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th><div>사업건 번호</div></th>
					<th><div>제품명</div></th>
					<th><div>납품일</div></th>
					<th><div>수량</div></th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="item2" items="${deliverylist}" varStatus="stuatus">
					<tr onclick=getProduct('${item2.product_name}','${item2.product_id}')  style="cursor: pointer;">
						<td>${item2.delivery_businessNum}</td>
						<td>${item2.product_name}</td>
						<td>${item2.delivery_date}</td>
						<td>${item2.delivery_quantity}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>


	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>