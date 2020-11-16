<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인활동 추가(출장)</title>


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
<style>
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger {
	cursor: pointer;
}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker {
	cursor: pointer;
}
</style>

<script type="text/javascript">
	$(function() {
		//모든 datepicker에 대한 공통 옵션 설정
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

		/*  //From의 초기값을 오늘 날짜로 설정
		 $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		 //To의 초기값을 내일로 설정
		 $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후) */
	});

	function cancle() {
		self.close();
	}
	
	
	function Activity_add(){
		var add = document.add;
		var title = add.activity_title.value;
		var content = add.activity_content.value;
		
		if( !title ||!content){
			alert("정보를 입력해주세요.");
		}
		else{
			add.submit();
		}
	}
	
</script>
</head>
<style>
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

	<div>
		<div>
            <jsp:include page="../header.jsp" />
        </div>
	</div>


	<div class="container">
	
	<form name="add" action="http://localhost:8080/activity/enroll-employee"  method="post">
		<div>
			<h1 class="font2">활동 등록</h1>
		</div>

		<!-- 몸통 -->
		<div class="row" style="margin-left:20px;">
			<label class="col-md-2 my" style="width: 120px;">활동유형</label>
			<select name="type"	style=" width: 15%;" class="col-md-2 form-control">
				<option>출장</option>
				<option>이슈</option>
				<option>기능개발</option>
			</select>
				
			<label class="col-md-2 my" style="width: 120px;  margin-left:50px;">활동 상태</label>
			<select name="activity_status" style=" width: 15%;" class="col-md-2 form-control">
				<option>활동예정</option>
				<option>활동중</option>
				<option>완료</option>
			</select>
		</div>

		<div  class="row" style="margin-top: 20px; margin-left:20px;">
			<label class="col-md-2 my" style="width: 120px; ">활동 등록자</label>
			<input class="col-md-2 form-control" style="width: 15%;"> 
				
			<label class="col-md-2 my" style="width: 120px;  margin-left:50px;">활동예정일</label>
			<input type="date" name="activity_estimatedDate" class=" col-md-2 form-control" style="width: 15%;">
			
		</div>

		<!-- <div class="row" style="margin-top: 20px;margin-left:20px; ">
			<label class="col-md-2 my" style="width: 120px;">완료일</label>
			<input type="date" name="activity_completionDate"  class=" col-md-2">		
		</div>
 -->


		<div style="margin: 20px; margin-top:40px;">
			<label class="col-md-1 my">제목</label>
			<input class="form-control" name="activity_title" type="text" 
				style="width: 60%;">
		</div>

		<div style="margin: 20px; margin-top:30px;">
			<label class=" col-md-1 my">내용</label>

			<textarea class="form-control" style="width: 80%;" name="activity_content" rows="15" cols="120"></textarea>
		</div>



		<div style="margin-left: 500px; margin-top: 30px;">
			<input class="btn btn-default" type = "submit"  value = "등록"/>
            <input class="btn btn-default" type = "reset" value = "취소"/>
		</div>
		
		</form>
	</div>

	<div style="margin-bottom: 50px;"></div>



	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>