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


$(document).ready(function(){
	//납품정보
	$.ajax({
		type : 'GET',
		url : '/customer/delivery',
		data : {
			customerId : "${customer.customerId}"
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		},
		success : function(data) {
			$('#delivery').html(data);
		}
	});

	$.ajax({
		type : 'GET',
		url : '/customer/manager',
		data : {
			customerId : "${customer.customerId}"
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		},
		success : function(data) {
			$('#manager').html(data);
		}
	});

	///sr
	$.ajax({
		type : 'GET',
		url : '/customer/sr',
		data : {
			customerId : "${customer.customerId}"
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		},
		success : function(data) {
			$('#sr').html(data);
		}
	});

	//activity
	$.ajax({
		type : 'GET',
		url : '/customer/activity',
		data : {
			customerId : "${customer.customerId}"
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		},
		success : function(data) {
			$('#activity').html(data);
		}
	});

});


function goModify(){
	location.href="http://localhost:8080/customer/modify";
}





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
							<p>${customer.customerName}</p>
							<input name="customerName" style="display: none" value="${customer.customerName}"/>
							<input name="customerId" style="display: none" value="${customer.customerId}" />
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">주소</p>
						</div>
						<div class="inputsize" >
							<p>${customer.addressAddress}&nbsp;&nbsp;  ${customer.addressDetail}&nbsp;&nbsp; (우:${customer.addressPost}) </p>
							<input name="address" style="display: none" value="${customer.addressAddress}"/>
							<input name="addrDetail" style="display: none" value="${customer.addressDetail}"/>
							<input name="addrPost" style="display: none" value="${customer.addressPost}"/>
						</div>
					</div>
					

					<div class="row" style="margin-left: 10px;">
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">담당자</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${manager.employeeName}</p>
							<input name="manager" style="display: none" value="${manager.employeeName}"/>
							<input name="managerId" value="${manager.employeeId}" style="display:none "/>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">E-mail</p>
						</div>
						<div class="inputsize" style="width: 15%;">
							<p>${manager.employeeEmail}</p>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">연락처</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${manager.employeeContact}</p>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">휴대전화</p>
						</div>
						<div class="inputsize">
							<p>${manager.employeePhone}</p>
						</div>
					</div>
					
					
					<div class="row">
						
						
					</div>
					
					
					<div class="row" style="margin-left: 10px;">
						<div class="inputsize" style="width: 8%;">
							<p class="myfont" >SE담당자</p>
						</div>
						<div class="inputsize" style="width: 10%;">
							<p>${se.employeeName}</p>
							<input name="se" style="display: none" value="${se.employeeName}"/>
							<input name="seId" value="${se.employeeId}"style="display:none "/>
						</div>
						
						<div class="inputsize" style="width: 8%;">
							<p class="myfont">영업담당자</p>
						</div>
						<div class="inputsize">
							<p>${sales.employeeName}</p>
							<input name="sales" style="display: none" value="${sales.employeeName}"/>
							<input name="salesId" value="${sales.employeeId}" style="display:none "/>
						</div>
						
					</div>
					
					</form>
				</div>

			</div>

	
			<div class="panel with-nav-tabs panel-default" style="margin-top: 10px; min-height: 600px;">
				   <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li data-tab='delivery' class="active tabmenu"><a href="#delivery" style="cursor: pointer; font-weight: bold;" data-toggle="tab" >납품정보</a></li>
                            <li data-tab='manager' class="tabmenu"><a href="#manager" style="cursor: pointer; font-weight: bold;" data-toggle="tab">담당자이력</a></li>
                            <li data-tab='sr' class="tabmenu"><a href="#sr" style="cursor: pointer; font-weight: bold;" data-toggle="tab">SR</a></li>
                            <li data-tab='activity' class="tabmenu"><a href="#activity" style="cursor: pointer; font-weight: bold;" data-toggle="tab">방문내역</a></li>
                           
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                    
<%--                   		<div id='tabs'></div>--%>
						<div class="tab-pane fade in active" id="delivery"></div>
						<div class="tab-pane fade" id="manager"></div>
						<div class="tab-pane fade" id="sr"></div>
						<div class="tab-pane fade" id="activity"></div>


                    </div>
                </div>
			</div>

			
		</div>
	</div>



	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>