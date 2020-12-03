<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello thymeleaf</title>

	
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css" >
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">

function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=chBox]").prop("checked", true);
    }else{
      $("input[name=chBox]").prop("checked", false);
    }
}
</script>
</head>

<style>

</style>
<body>

	<div>
		<table class="table" id="myTable" style="table-layout:fixed">
			<thead>
				<tr>
					<th width="13%">고객사명</th>
					<th width="12%">부서</th>
					<th width="12%">이름</th>
					<th width="20%">연락처</th>
					<th width="20%">휴대전화</th>
					<th width="20%">E-mail</th>
					<sec:authorize access="hasRole('ADMIN')">
						<th width="3%"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll()"></th>
					</sec:authorize>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<td>${item.codeName}</td>
						<td>${item.departmentName}</td>
						<td>${item.employeeName}</td>
						<td>${item.employeeContact}</td>
						<td>${item.employeePhone}</td>
						<td>${item.employeeEmail}</td>
						<sec:authorize access="hasRole('ADMIN')">
						<td><input type="checkbox" name="chBox" class="chBox" data-employeeNum="${item.employeeId}" />
							<script type="text/javascript">
							$(".chBox").click(function(){
								  $("#th_checkAll").prop("checked", false);
								 });
							
							$('input[type="checkbox"]').click(function(){
						        var tmpp = $(this).prop('checked'); 
						        var tt=$("[name='chBox']:checked").length;
						        // this를 사용하여 클릭한 checkbox 가 체크되도록 설정
						        if(tmpp ==true || tt>0){
						            $("#btn1").prop("disabled",false);
						        }
						        else{
						            $("#btn1").prop("disabled",true);
						        }
						    });
							</script>
						</sec:authorize>
					
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>

 
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>