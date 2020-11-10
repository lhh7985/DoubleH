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

		//From의 초기값을 오늘 날짜로 설정
		 $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		 //To의 초기값을 내일로 설정
		 $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	});

	function cancle() {
		self.close();
	}
	
	function setValue(name,id){
	    document.getElementById("customer_name").value = name;
	    document.getElementById("customer_id").value = id;
	};
	
	function setProduct(name, id){
		document.getElementById("product_name").value = name;
		document.getElementById("product_id").value=id;
	}
	
	
	var winRef;
	function customer_search() {
		href = "http://localhost:8080/search/customer_search";
		if(!winRef){
			winRef=window.open(href, "customer",'width=800px, height=600px,toolbars=no,scrollbars=no');
		}else{
			if (winRef.closed == false) {
	            winRef.focus();
	        }else{
	        	winRef=window.open(href, "customer",'width=800px, height=600px,toolbars=no,scrollbars=no');
	        }
		}

		window.close();
	}
	
	
	function product_search() {
		var customer_id = document.getElementById('customer_id').value;
		href = "http://localhost:8080/search/product_search?customer_id=" + customer_id;
		if(!winRef){
				$.ajax({
					type : 'GET',
					url : '/search/product_search?customer_id=' + customer_id,
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					},
					success : function(data) {
						winRef=window.open(href, "product_search",'width=800px, height=600px,toolbars=no,scrollbars=no');
					}
			});

			
		}else{
			if (winRef.closed == false) {
	            winRef.focus();
	        }else{
	        	$.ajax({
					type : 'GET',
					url : '/search/product_search?customer_id=' + customer_id,
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					},
					success : function(data) {
						winRef=window.open(href, "product_search",'width=800px, height=600px,toolbars=no,scrollbars=no');
					}
			});
		}		
		}
		window.close();
	}

	
	//sr등록
	function SRenroll() {
		var add = document.add;
		var customer_name =add.customer_name.value;
		
		var product_name = add.product_name.value;
		var type = add.type.value;
		var importance = add.importance.value;
		
		var requestDate = add.requestDate.value;
		var title = add.sr_title.value;
		var content = add.sr_content.value;
				
	
		if (!customer_name || !product_name || !type|| !title || !content ||!requestDate) {
			alert("정보를 입력해주세요.");
		} else {
			var forms = $("#add").serialize();
			$.ajax({
				url: "/enroll/sr",
				type:"POST",
				data:forms,
				success:function(data){
				   	location.href="http://localhost:8080/sr"
				}
			});
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


	<div class="container" >
	
	<form id="add" name="add" action="http://localhost:8080/enroll/sr"  method="POST">
		<div>
			<h1 class="font2">S	R 등록</h1>
		</div>
		
		<input name="customer_id" id="customer_id" value="0" style="display: none"/>

		<!-- 몸통 -->
		<div style="margin: 20px;" class="row">
			<label class="col-md-1" >고객</label> 
			<input name="customer_name" class="col-md-2 form-control" id="customer_name" style="width:20%;"  readonly/>
			<button class="col-md-1 btn btn-default" type="button" onclick='customer_search()'>고객검색</button>
			
			<label class="col-md-1 " style="margin-left: 70px; width: 80px;">제품</label> 
			<input name="product_name" class="col-md-2 form-control" id="product_name"  style="width:20%;" readonly>
			<button class="col-md-1 btn btn-default" type="button" onclick="product_search()">제품검색</button>
			
		</div>
		
		
		<input name="product_id" id="product_id" value="0" style="display: none"/>
		
		<!-- <input name="sr_registrant" id="sr_registrant" style="display: none"/>
		
		<input name="sr_registrationDate" id="sr_registrationDate" style="display: none"/> -->
		
		<!-- <div style="margin: 20px;" class="row">
			<label class="col-md-1 label1">제품</label> 
			<input name="product_name" class="col-md-2 form-control" id="product_name"  style="width:35%;" readonly>
			<button class="col-md-1 btn btn-default" type="button" onclick="product_search()">제품검색</button>
		</div> -->
		
		

		<div style="margin: 20px;" class="row">
			<label class="col-md-1 label1" >신규여부</label> 
			<select name="code_name" id="type" class="col-md-2 form-control" style="width:7%;">
				<option>신규</option>
				<option>이슈</option>
			</select>
			
			<label class="col-md-1 label1" style="margin-left:30px;">중요도</label> 
			<select name="importance" id="importance" class="col-md-2 form-control" style="width:7%;">
				<option>상</option>
				<option>중</option>
				<option>하</option>
			</select>
			
			<label class="col-md-1 label1" style="margin-left:30px;">요청일자</label> 
			<input type="date" name="sr_requestDate" id="requestDate" class="col-md-2 form-control" style="width:15%;" size="30px;">
			
		</div>

		<div style="margin: 20px;" class="row">
			<label class="col-md-1 label1">제목</label> 
			<input id="title" class="col-md-2 form-control" style="width:50%;" type="text" name="sr_title">
		</div>

		<div style="margin: 20px;">
			<label class="col-md-1 label1">내용</label>

			<textarea name="sr_content" id="content" class="form-control" style="width:80%" rows="7" cols="100"></textarea>
		</div>



		<div class="col-md-11 text-center" style="margin-top: 30px;">
			<input  class="btn btn-default" type="button" onclick="SRenroll()" value="등록"/>
			
			<input class="btn btn-default" type = "reset" value = "취소"/>
		</div>
		
		</form>
	</div>

	<div style="margin-bottom: 50px;"></div>



	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>