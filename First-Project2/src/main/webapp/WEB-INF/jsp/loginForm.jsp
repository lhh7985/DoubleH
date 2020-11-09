<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<script type="text/javascript">
<!-- 공통 JavaScript -->
	function goRegister() {
		location.href = "register";
	}
</script>
</head>

<style>
.div {
	margin: auto;
	text-align: center;
}

.label {
	weight: 80px;
	font-weight: bold;
	font-size: 22px;
	display: inline-block;
	padding-top: 8px;
	font-weight: bold;
	margin-left: 30px;
}

.input {
	width: 85%;
	height: 30px;
	border: 1px solid;
	border-radius: 3px;
	border-color: gray;
	margin-bottom: 20px;
}

.login_container {
	width: 380px;
	height: 520px;
	margin: auto;
	border-radius: 3px;
	box-shadow: 0px 0px 20px #000;
}

.button {
	width: 85%;
	height: 40px;
	border: 1px solid;
	border-radius: 3px;
	border-color: gray;
	margin-top: 30px;
	background-color: rgb(83, 154, 236);
	color: white;
}

.h2 {
	margin-top: 30px;
	color: gray;
}
</style>

<body>

	<form class="login_container" name="f" action="/loginForm"	method="POST">
	   
	  <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}" />
		<div>
			<div class="div">
				<h2 class="h2">LOGIN</h2>
			</div>
			
			<label class="label" for="username">ID</label>
			<div class="div">
				<input class="input" type="text" id="username" name="username" placeholder="USERNAME 입력" />
			</div>
			<label class="label" for="password">PASSWORD</label>
			<div class="div">
				<input class="input" type="password" id="password" name="password" placeholder="PASSWORD 입력" />
			</div>
			<div class="div">
				<button type="submit" class="button">로그인</button>
			</div>
			<div class="div">
				<button class="button" type="button"
					onclick="javascript:goRegister();">회원가입</button>
			</div>
			

		</div>
		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	</form>
</body>
</html>
