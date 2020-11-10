<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PRODUCT</title>


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


</head>
<body>
	<div>
		<div>
			<jsp:include page="../header.jsp" />
		</div>
	</div>



	<div class="container">

		<div class="row" style="font: bold; font-size: 40px; height: 100px;"
			align="center">제품</div>

		<c:forEach var="item" items="${productList}" varStatus = "status">
		<div class="row" style="background-color: #D4F4FA; height: 220px;">
			<div>
				<p style="padding: 10px; font: bold;">${item.product_name}</p>
				<p style="padding: 10px; font: bold;">${item.product_content}</p>
			</div>
		</div>
		</c:forEach>

		<!-- <div class="row" style="background-color: #FAE0D4; height: 220px;">
			<p style="padding: 10px; font: bold;">제품 B</p>
			<p style="padding: 10px; font: bold;">설명 어쩌꾸 저쩌구 이건 어떻게 싸용하면 개꿀</p>
		</div>
 
		<div class="row" style="background-color: #E4F7BA; height: 220px;">
			<p style="padding: 10px; font: bold;"> 제품 C</p>
			<p style="padding: 10px; font: bold;">설명 어쩌꾸 저쩌구 이건 어떻게 싸용하면 개꿀</p>
		</div>
		
		<div class="row" style="background-color: #E4F7BA; height: 220px;">
			<p style="padding: 10px; font: bold;"> 제품 D</p>
			<p style="padding: 10px; font: bold;">설명 어쩌꾸 저쩌구 이건 어떻게 싸용하면 개꿀</p>
		</div> -->
	</div>




	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>