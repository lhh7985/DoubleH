<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello test</title>

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<script type="text/javascript">
	
	$('.accordian-body').on(
			'show.bs.collapse',
			function() {
				$(this).closest("table").find(".collapse.in").not(this)
						.collapse('toggle')
			})
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

tr.hide {
	display: none
}

.font1 {
	font-size: 15px;
	font-weight: bold;
	margin-top: 30px;
}

.font2 {
	font-size: 50px;
	font-weight: bold;
	text-align: center;
}

tr.hide {
	display: none
}
</style>
<body>

	<div>
		<div>
            <jsp:include page="header.jsp" />
        </div>
	</div>
	

	<div class="container">
		<div class="row" style="margin-top: 50px;">
			<button class=" col-md-4 btn" onclick="location.href='http://localhost:8080/customer/list'"
				style="margin: 5px; width: 360px; height: 200px;">
				<div> 
					<span class="glyphicon glyphicon-search" style="font-size: 60px;" aria-hidden="true"></span>
						<p class="p" style="font: bold; font-weight: bold; font-size: 23px;">고객사 조회</p>
				</div>
			</button>

			<button class=" col-md-4 btn" onclick="location.href='http://localhost:8080/product/list'"
				style="margin: 5px; width: 360px; height: 200px;">
				<div>
					<span class="glyphicon glyphicon-gift" style="font-size: 60px;"
						aria-hidden="true"></span>
				</div>
				<p class="p" style="font: bold; font-weight: bold; font-size: 23px;">제품
					조회</p>
			</button>

			<button class=" col-md-4 btn" onclick="location.href='http://localhost:8080/sr/list'"
				style="margin: 5px; width: 360px; height: 200px;">
				<div>
					<span class="glyphicon glyphicon-th-list" style="font-size: 60px;"
						aria-hidden="true"></span>
				</div>
				<p class="p" style="font: bold; font-weight: bold; font-size: 23px;">SR
					조회</p>
			</button>
			
			<!-- 2번째 줄 -->
			<button class=" col-md-4 btn" onclick="location.href='http://localhost:8080/activity/list'"
				style="margin: 5px; width: 360px; height: 200px;">
				<div> 
					<span class="glyphicon glyphicon-tasks" style="font-size: 60px;" aria-hidden="true"></span>
						<p class="p" style="font: bold; font-weight: bold; font-size: 23px;">활동</p>
				</div>
			</button>

			<button class=" col-md-4 btn" onclick="location.href='http://localhost:8080/patch'"
				style="margin: 5px; width: 360px; height: 200px;">
				<div>
					<span class="glyphicon glyphicon-floppy-saved" style="font-size: 60px;"
						aria-hidden="true"></span>
				</div>
				<p class="p" style="font: bold; font-weight: bold; font-size: 23px;">패치내역</p>
			</button>

			<button class=" col-md-4 btn"
				style="margin: 5px; width: 360px; height: 200px;">
				<div>
					<span class="glyphicon glyphicon-calendar" style="font-size: 60px;"
						aria-hidden="true"></span>
				</div>
				<p class="p" style="font: bold; font-weight: bold; font-size: 23px;">공지사항</p>
			</button>

		</div>

	</div>



	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>