<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>

<script>

//고객 검색창 열기

	
	

	
	function code_enroll(){
		var add = document.add;
		var code_group =add.code_group.value;
		
		var code_upper = add.code_upper.value;
		var code_name = add.code_name.value;
		var code_status = add.code_status.value;		
	
		if (!code_group || !code_upper || !code_name|| !code_status ) {
			alert("정보를 입력해주세요.");
		} else {
			var forms = $("#add").serialize();
			$.ajax({
				url: "/enroll/codetable",
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
<style>
label {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 15px;
	line-height: 1.42857143;
}
</style>

<body>

	
	<div  style="margin-left:100px;">
	
		<form id="add" name="add"   method="POST">
		<div>
			<h1 class="font2">code 추가</h1>
			<br>
		</div>
		

		<!-- 몸통 -->
		<div style="margin: 10px;">
		
			<label class="col-md-1">코드그룹</label> 
			<input name="code_group" class="col-md-1 form-control" id="code_group" style="width:40%;"  />
		
		
			<label class="col-md-1" >상위코드</label> 
			<input name="code_upper" class="col-md-2 form-control" id="code_upper"  style="width:40%;"/>

		
			<label class="col-md-1" style=" width: 80px;">코드명</label> 
			<input type="text" name="code_name" id="code_name" class="col-md-2 form-control" style="width:40%;"/>
			
			<label class="col-md-1" style=" width: 110px;">상태</label> 
			<select name="code_status" id="code_status" class="col-md-1 form-control" style="width:40%;" >
				<option>활성</option>
				<option>비활성</option>
			</select>
			
			
		<div class="col-md-1" style="margin-top: 20px;">
			<input  class="btn btn-default" type="button" onclick="code_enroll()" value="등록"/>
			
			<input class="btn btn-default" type = "reset" value = "취소"/>
		</div>
		
		</div>
		

			
		
		</form>
	</div>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>