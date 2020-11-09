<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
	
	function Employeeadd(){
		var add = document.add;
		var name = document.add.employee_name.value;
		var contact = add.employee_contact.value;
		var phone = add.employee_phone.value;
		var email = add.employee_email.value;
		
		if(!name || !contact || !phone ||!email){
			alert("정보를 입력해주세요.");
		}
		else{
			var forms = $("#add").serialize();
			$.ajax({
				url: "/employee/add",
				type:"POST",
				data:forms,
				success:function(data){
					opener.reloadPage();
				    self.close();
				}
			});
		}
	}
	
</script>
</head>
<body>
	<div class="container">
		<h1 style="margin: 50px;">직원 추가 팝업</h1>
		
		
		<!-- 몸통 -->
		<form id="add" name="add" action="http://localhost:8080/employee/add" method = "POST">
		<div class="row" style="margin-left:20px;">
			<label class="col-md-2 my" style="width: 120px;">직원구분</label>
			<select	name = "type" style="height: 30px;" class="col-md-2">
				<c:forEach var="item" items="${type}">
					<option>${item}</option>
				</c:forEach>
			</select>
				
		</div>

		<div  class="row" style="margin-top: 20px; margin-left:20px;">
			<label class="col-md-2 my" style="width: 120px; ">직급</label>
			<select	name="employee_position" style="height: 30px;" class="col-md-2">
				<option>사장</option>
				<option>상무</option>
				<option>이사</option>
				<option>부장</option>
				<option>차장</option>
				<option>과장</option>
				<option>대리</option>
				<option>주임</option>
				<option>사원</option>
				<option>인턴</option>
			</select>
				
			<label class="col-md-2 my" style="width: 120px;  margin-left:50px;">부서</label>
			<select	name="dept"  style="height: 30px;" class="col-md-2">
				<c:forEach var="item2" items="${dept}">
					<option>${item2}</option>
				</c:forEach>
			</select>
			
		</div>

		<div class="row" style="margin-top: 20px;margin-left:20px; ">
			<label class="col-md-2 my" style="width: 120px;">이름</label>
			<input name="employee_name" class="col-md-2">
			
			<label class="col-md-2 my" style="width: 120px; margin-left:50px;">연락처</label>
			<input name="employee_contact" class="col-md-2">	
		</div>
		
		
		<div class="row" style="margin-top: 20px;margin-left:20px; ">
			<label class="col-md-2 my" style="width: 120px;">휴대전화</label>
			<input class="col-md-2" name="employee_phone">
			
			<label class="col-md-2 my" style="width: 120px; margin-left:50px;">E-mail</label>
			<input class="col-md-2" name="employee_email">	
		</div>
		
		
		<div style="margin-left: 500px; margin-top: 30px;">
		
			<input class="btn" type = "button" onclick="Employeeadd()" value = "등록"/>
            <input class="btn" type = "reset" value = "취소"/>
            
			<!-- <button class="btn btn-primary">등록</button>
			<button style="margin-left: 5px;" class="btn btn-primary">취소</button> -->
		</div>
		
		
		</form>
		
	</div>

<div style="margin-bottom: 50px;"></div>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>