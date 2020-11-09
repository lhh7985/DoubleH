<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function checkValue() {
		if (!document.userInfo.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

	}

	// 취소 버튼 클릭시 로그인 화면으로 이동
	function goLoginForm() {
		location.href = "/login/loginForm.do";
	}
</script>

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
	color:black;
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
	<form class="login_container" method="POST" action="register">
		<div>
			<div class="div">
				<h2 class="h2">
					Register
					</h2>
			</div>

			<label class="label">회원가입 ID</label>
			<div class="div">
				<input class="input" type="text" id="user_id" name="user_id" />
			</div>

			<label class="label">회원가입 password</label>
			<div class="div">
				<input class="input" type="password" id="user_pw" name="user_pw" />
			</div>
			
			<label class="label">직원ID</label>
			<div class="div">
				<input class="input" type="text" id="employee_id" name="employee_id" />
			</div>

			<div class="div">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<button class="button" type="submit">가입하기</button>
			</div>
			<div class="div">
				<div style="margin-top:20px">
					<a href="loginForm">취소</a>
				</div>
			</div>
		</div>
	</form>



</body>
</html>