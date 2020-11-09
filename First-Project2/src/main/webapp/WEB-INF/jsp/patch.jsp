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
				error : function() {
					alert("통신 실패!");
				},
				success : function(data) {
					$('#tabs').html(data);
				}
			});
		});
		$('#default').click();
	});

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
		<div>
			<h1 class="font2">패치내역</h1>
		</div>
		
		<!-- 몸통 -->
		<div>
			<table class="table ">
				<thead>
					<tr>
						<th>활동유형</td>
						<th>고객사</td>
						<th>제목</td>
						<th>활동예정일</td>
						<th>완료일</td>
						<th>활동상태</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>출장</td>
						<td>국민은행</td>
						<td>오늘 출장갑니다</td>
						<td>2020-10-19</td>
						<td>2020-11-10</td>
						<td>O</td>	
					</tr>
				</tbody>
			</table>
		
		</div>
		
	</div>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>