<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello test</title>


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>



<script type="text/javascript">
	function getCustomer(customerName, customerId){
		opener.setValue(customerName, customerId);
		window.self.close();
	}
</script>
</head>
<body>
	<div class="container">
		<h1 style="margin: 50px;">고객 선택</h1>

		<form class="navbar-form navbar-right" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">Search</button>
		</form>
		
		<table class="table table-hover">
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
					<tr onclick=getCustomer('${item.customerName}','${item.customerId}')  style="cursor: pointer;">
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


	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>