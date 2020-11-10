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
.my {
	font: bold;
	font-size: 20px;
	margin-bottom: 30px;
}

.myfont {
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 15px;
}

tr.hide {
	display: none
}

.font1 {
	font-size: 15px;
	font-weight: bold;
	margin-top: 30px;
}

.font2 {
	font-size: 50px;
	font-weight: bold;
	text-align: center;
}

tr.hide {
	display: none
}
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
						<td>${item.code_name}</td>	
						<td>${item.activity_title}</td>
						<td>${item.activity_estimatedDate}</td>
						<td>${item.activity_completionDate}</td>
						<td>${item.activity_status}</td>	
					</tr>
				</c:forEach>
				</tbody>
			</table>
		
		</div>
		
	</div>


</body>
</html>