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

	
	$(function() {
		$('.tabmenu').click(function() {

					var activeTab = $(this).attr('data-tab');
					
					$.ajax({
						type : 'GET',
						url : '/' + activeTab,
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
			<jsp:include page="header.jsp" />
		</div>
	</div>
	<!-- <nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a href="http://localhost:8080/main" class="navbar-brand">Project
					Name</a>
			</div>

			<div>
				<ul class="nav navbar-nav">
					<li><a href="http://localhost:8080/customer">고객사</a></li>
				</ul>
				<ul  class="nav navbar-nav">
					<li><a href="http://localhost:8080/product">제품</a></li>
				</ul>
				<ul class="nav navbar-nav ">
					<li>
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">SR <span class="caret"></span></a>

						<ul class="dropdown-menu" role="menu">
							<li><a href="#">기능개선</a></li>
							<li><a href="#">이슈</a></li>
							<li><a href="#">기타등등</a></li>
						</ul></li>
				</ul>
				
				
				<ul  class="nav navbar-nav">
					<li><a href="http://localhost:8080/employee/employee">사원</a></li>
				</ul>
				
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">로그인</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>

		</div>
	</nav> -->


	<div>
		<div class="container" style="margin-bottom: 30px; margin-top: 50px;">
			<div style="margin-left: 10px;">
				<input class = "btn btn-default" style="float: right; margin-right:50px;" type="button" value="수정" />
				<p class="my">상세정보</p>
			</div>

			<div>
				<div class="container">
					<div class="row" style="margin-left: 10px;">
						<div class="inputsize" style="width: 8%;" >
							<p class="myfont">회사명</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${customer.customer_name}</p>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">주소</p>
						</div>
						<div class="inputsize" >
							<p>${customer.address_address}&nbsp;&nbsp;  ${customer.address_detail}&nbsp;&nbsp; (우:${customer.address_post}) </p>
						</div>
					</div>
					

					<div class="row" style="margin-left: 10px;">
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">담당자</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${manager.employee_name}</p>
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
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">영업담당자</p>
						</div>
						<div class="inputsize">
							<p>${sales.employee_name}</p>
						</div>
						
					</div>
					
					
				</div>

			</div>

			<!-- <ul class="nav nav-tabs font1" style="" id="dd">
				<li data-tab='OS' class="tabmenu nav-item"><a style="cursor: pointer;">제품</a></li>
				<li data-tab='manager' class="tabmenu nav-item"><a style="cursor: pointer;">담당자이력</a></li>
				<li data-tab='customer_sr' class="tabmenu nav-item"><a style="cursor: pointer;">SR</a></li>
				<li data-tab='customer_activity' class="tabmenu nav-item"><a style="cursor: pointer;">방문내역</a></li>
			</ul> -->
			<div class="panel with-nav-tabs panel-default" style="margin-top: 10px;">
				   <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li data-tab='OS' class=" tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab" >납품정보</a></li>
                            <li data-tab='manager' class="tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab">담당자이력</a></li>
                            <li data-tab='customer_sr' class="tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab">SR</a></li>
                            <li data-tab='customer_activity' class="tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab">방문내역</a></li>
                           
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                    
                   		<div  id='tabs'></div>
                        <!-- <div class="tab-pane fade in active" id="tab1default">Default 1</div>
                        <div class="tab-pane fade" id="tab2default">Default 2</div>
                        <div class="tab-pane fade" id="tab3default">Default 3</div>
                        <div class="tab-pane fade" id="tab4default">Default 4</div>
                        <div class="tab-pane fade" id="tab5default">Default 5</div> -->
                    </div>
                </div>
			</div>

			
		</div>
	</div>



	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>