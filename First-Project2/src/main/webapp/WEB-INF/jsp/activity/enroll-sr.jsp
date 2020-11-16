<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SR밑에 활동추가</title>


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>

<!-- 달력날짜 표시  -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
<script type="text/javascript">
	$(function() {
		$.datepicker
				.setDefaults({
					dateFormat : 'yy-mm-dd' //Input Display Format 변경
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
					,
					changeYear : true //콤보박스에서 년 선택 가능
					,
					changeMonth : true //콤보박스에서 월 선택 가능                
					,
					showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					,
					buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
					,
					buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
					,
					buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
					,
					yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
					,
					monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
							'9', '10', '11', '12' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 부분 Tooltip 텍스트
					,
					minDate : "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,
					maxDate : "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
				});

		//input을 datepicker로 선언
		$(".datepicker").datepicker();
		$("#datepicker2").datepicker();

	});

	
	function activity1() {
		var add = document.add;
		var chck;


		var activity_status = add.activity_status.value;
		var type = add.type.value;
		var activity_registrationDate = add.activity_registrationDate.value;
		var activity_estimatedDate = add.activity_estimatedDate.value;
		var title = add.activity_title.value;
		var content = add.activity_content.value;
				

		if (!activity_status || !activity_registrationDate || !type || !title || !content || !activity_estimatedDate) {
			alert("정보를 입력해주세요.");
		} else {
			var forms = $("#add").serialize();
			$.ajax({
				url: "/activity/enroll-sr",
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
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}

input {
	size: 50px;
}

.my {
	font: bold;
	font-size: 15px;
	text-align: left;
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
	margin-bottom: 50px;
}

tr.hide {
	display: none
}
</style>

</head>
<body>


	<div class="container">
	<form id="add" name="add"  method="POST">
		<div>
			<h1 class="font2">활동 추가</h1>
		</div>
		<!-- 몸통 -->
		<div class="row" style="margin-left:20px;">
			<label class="col-md-2 my" style="width: 120px;">유형</label>
			<select name="type" id="type" style="height: 30px;" class="col-md-2">
				<option>신규</option>
				<option>이슈</option>
			</select>
			
			<label class=" my" style="width: 120px; margin-left:50px; ">시작일</label>
			<input type="date" id="activity_registrationDate" name ="activity_registrationDate" > 
				
			<input id="sr_id" name="sr_id" value="${sr_id}" style="visibility: hidden;"/>
			
		</div>

		<div class="row" style="margin-top: 20px; margin-left:20px;" >
			<label class="col-md-2 my" style="width: 120px;  ">상태</label>
			<select name="activity_status" id="activity_status"	style="height: 30px;" class="col-md-2">
				<option>진행중</option>
				<option>개발완료</option>
			</select> 
				
			<label class="my" style="width: 120px;  margin-left:50px;">완료예정일</label>
			<input type="date" id="activity_estimatedDate" name="activity_estimatedDate">
			
		</div>



		<div style="margin: 20px; margin-top:50px;">
			<label class="col-md-1 my">제목</label> 
			<input type="text" name="activity_title" id="activity_title" size="90px;">
		</div>

		<div style="margin: 20px; margin-top:30px;">
			<label class="col-md-1 my">내용</label>

			<textarea name="activity_content" id="activity_content" rows="12" cols="100"></textarea>
			
		</div>

		<div style="margin-left: 400px; margin-top: 30px;">
			<input class="btn btn-default" type="button" onclick="activity1()"   value="등록">
			
			<input class="btn btn-default" type = "reset" value = "취소"/>
		</div>
		
		</form>
		
	</div>

	<div style="margin-bottom: 50px;"></div>



	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>