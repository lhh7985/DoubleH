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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<script type="text/javascript">

function goModify(){
	location.href="http://localhost:8080/customer/modify";
}
	
	$(function() {
		$('.tabmenu').click(function() {

					var activeTab = $(this).attr('data-tab');
					
					$.ajax({
						type : 'GET',
						url : '/customer/' + activeTab,
						data : {
							customer_id : "${customer.customer_id}"
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						},
						success : function(data) {
							$('#tabs').html(data);
						}
					});
					
				});
			
		
	});


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

.font1 {
	font-size: 15px;
	font-weight: bold;
	margin-top: 30px;
}

.font2 {
	font-size: 20px;
	font-weight: bold;
}

.inputsize{
	float: left;
}
</style>
<body>

	<div>
		<div>
			<jsp:include page="../header.jsp" />
		</div>
	</div>


	<div>
		<div class="container" style="margin-bottom: 30px; margin-top: 50px;">
			<div style="margin-left: 10px;">
				<p class="my">상세정보</p>
			</div>

			<div>
				<div class="container">
				
					<form action="/customer/modify" method="post">
						<button class="btn btn-default" type="submit" style="float: right;" onclick="goModify()">수정</button>
					<div class="row" style="margin-left: 10px;">
						<div class="inputsize" style="width: 8%;" >
							<p class="myfont">회사명</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${customer.customer_name}</p>
							<input name="customer_name" style="display: none" value="${customer.customer_name}"/>
							<input name="customer_id" style="display: none" value="${customer.customer_id}" />
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">주소</p>
						</div>
						<div class="inputsize" >
							<p>${customer.address_address}&nbsp;&nbsp;  ${customer.address_detail}&nbsp;&nbsp; (우:${customer.address_post}) </p>
							<input name="address" style="display: none" value="${customer.address_address}"/>
							<input name="addr_detail" style="display: none" value="${customer.address_detail}"/>
							<input name="addr_post" style="display: none" value="${customer.address_post}"/>
						</div>
					</div>
					

					<div class="row" style="margin-left: 10px;">
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">담당자</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${manager.employee_name}</p>
							<input name="manager" style="display: none" value="${manager.employee_name}"/>
							<input name="manager_id" value="${manager.employee_id}" style="display:none "/>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">E-mail</p>
						</div>
						<div class="inputsize" style="width: 15%;">
							<p>${manager.employee_email}</p>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">연락처</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${manager.employee_contact}</p>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">휴대전화</p>
						</div>
						<div class="inputsize">
							<p>${manager.employee_phone}</p>
						</div>
					</div>
					
					
					<div class="row">
						
						
					</div>
					
					
					<div class="row" style="margin-left: 10px;">
						<div class="inputsize" style="width: 8%;">
							<p class="myfont" >SE담당자</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${se.employee_name}</p>
							<input name="se" style="display: none" value="${se.employee_name}"/>
							<input name="se_id" value="${se.employee_id}"style="display:none "/>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">영업담당자</p>
						</div>
						<div class="inputsize">
							<p>${sales.employee_name}</p>
							<input name="sales" style="display: none" value="${sales.employee_name}"/>
							<input name="sales_id" value="${sales.employee_id}" style="display:none "/>
						</div>
						
					</div>
					
					</form>
				</div>

			</div>

	
			<div class="panel with-nav-tabs panel-default" style="margin-top: 10px;">
				   <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li data-tab='delivery' class=" tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab" >납품정보</a></li>
                            <li data-tab='manager' class="tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab">담당자이력</a></li>
                            <li data-tab='sr' class="tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab">SR</a></li>
                            <li data-tab='activity' class="tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab">방문내역</a></li>
                           
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                    
                   		<div  id='tabs'></div>

                    </div>
                </div>
			</div>

			
		</div>
	</div>



	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>