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
	
function getEmployee(employee_name, employee_id){

	opener.setChildValue(employee_name,employee_id);		
	window.self.close();

	}
	
</script>
</head>
<body>
	<div class="container">
		<h1 style="margin: 50px;">직원 검색</h1>

		<form class="navbar-form navbar-right" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">Search</button>
		</form>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>부서명</th>
					<th>직급</th>
					<th>이름</th>
					<th>Email</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="item" items="${list}" varStatus="status" >
					<tr  onclick=getEmployee('${item.employee_name}','${item.employee_id}') style="cursor: pointer;">
						<td>${item.department_name}</td>
						<td>${item.employee_position}</td>
						<td>${item.employee_name}</td>
						<td>${item.employee_email}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>


	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>