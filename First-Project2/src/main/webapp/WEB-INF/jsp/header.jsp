<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>



<!DOCTYPE html>
<html lang="ko" xmlns="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Navbar</title>


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 달력날짜 표시  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}
</style>
<script type="text/javascript">
	
</script>
</head>

<body>

	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a href="http://localhost:8080/main" class="navbar-brand">Project
					Name</a>
			</div>

			<div>
				<ul class="nav navbar-nav">
					<li><a href="http://localhost:8080/customer">고객사</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-expanded="false">제품 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="http://localhost:8080/product">제품</a></li>
							<li><a href="http://localhost:8080/delivery">납품정보</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav ">
					<li><a href="http://localhost:8080/sr">SR </a></li>

				</ul>


				<ul class="nav navbar-nav">
					<li><a href="http://localhost:8080/employee/list">사원</a></li>
				</ul>
				
				
				<sec:authorize access="hasRole('ADMIN')">
					<ul class="nav navbar-nav">
						<li><a href="http://localhost:8080/admin/codetable">관리자</a></li>
					</ul>
				</sec:authorize>
	

					<sec:authorize access="isAnonymous()">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="http://localhost:8080/loginForm">로그인</a></li>
						</ul>
					</sec:authorize>

					<sec:authorize access="isAnonymous()">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="http://localhost:8080/register">회원가입</a></li>
						</ul>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<sec:authentication var="user_id" property="principal"/>
						
					
						<ul class="nav navbar-nav navbar-right">
							<li><a href="http://localhost:8080/user/logout">로그아웃</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a style="font-weight: bold;">${user_id}</a></li>
						</ul>
						
						
					</sec:authorize>




			</div>
		</div>
	</nav>

</body>
</html>