<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>안씀</title>


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<script type="text/javascript">
	

</script>
</head>
<style>

</style>
<body>




	<div class="container">
	
		
		<!-- 몸통 -->
		<div>
			<table class="table ">
				<thead>
					<tr>
						<th>활동유형</td>
						<th>제목</td>
						<th>활동예정일</td>
						<th>완료일</td>
						<th>활동상태</td>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.codeName}</td>
						<td>${item.activityTitle}</td>
						<td>${item.activityEstimatedDate}</td>
						<td>${item.activityCompletionDate}</td>
						<td>${item.activityStatus}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		
		</div>
		
	</div>


</body>
</html>