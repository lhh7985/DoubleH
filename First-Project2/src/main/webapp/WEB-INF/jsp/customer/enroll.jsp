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

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 달력날짜 표시  -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
} -->


<script type="text/javascript">

	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addressPost]").val(data.zonecode);
				$("[name=addressAddress]").val(fullRoadAddr);

				document.getElementById('address_post').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address_address').value = fullRoadAddr;
				/* document.getElementById('address_detail').value = data.jibunAddress; */
			}
		}).open();
	}
	

	
	
	function setChildValue(name,id){
	    document.getElementById("se_name").value = name;
	    document.getElementById("se_id").value=id;
	};
	
	function setChildValue2(name,id){
		document.getElementById("sales_name").value = name;
		document.getElementById("sales_id").value=id;
	};
	
	function setChildValue_other(name,id){
		document.getElementById("manager").value = name;
		document.getElementById("manager_id").value=id;
	};

	
	var winRef;

	function search_emp_secuve() {
		href = "http://localhost:8080/search/se";
		if(!winRef){
			winRef=window.open(href, "se_manager",'width=800px, height=600px,toolbars=no,scrollbars=no');
		}else{
			if (winRef.closed == false) {
	            winRef.focus();
	        }else{
	        	winRef=window.open(href, "se_manager",'width=800px, height=600px,toolbars=no,scrollbars=no');
	        }
		}

	}
	
	function search_emp_secuve2() {
		
		href = "http://localhost:8080/search/sales";
		if(!winRef){
			winRef=window.open(href, "sales",'width=800px, height=600px,toolbars=no,scrollbars=no');
		}else{
			if (winRef.closed == false) {
	            winRef.focus();
	        }else{
	        	winRef=window.open(href, "salse",'width=800px, height=600px,toolbars=no,scrollbars=no');
	        }
		}
	}
	
	function search_emp() {
		href = "http://localhost:8080/search/other";
		if(!winRef){
			winRef=window.open(href, '_blank','width=800px, height=600px,toolbars=no,scrollbars=no');
		}else{
			if (winRef.closed == false) {
	            winRef.focus();
	        }else{
	        	winRef=window.open(href,  '_blank','width=800px, height=600px,toolbars=no,scrollbars=no');
	        }
		}
	}


	function customerAdd() {
		var customer_add = document.customer_add;
		var customer_name = customer_add.customer_name.value;
		
		var employee_id_manager = customer_add.employee_id_manager.value;
		var employee_id_se = customer_add.employee_id_se.value;
		var employee_id_sales = customer_add.employee_id_sales.value;
		
		var address_post = customer_add.address_post.value;
		var address_address = customer_add.address_address.value;
		var address_detail = customer_add.address_detail.value;
				
	
		if (!customer_name || !employee_id_manager || !employee_id_se|| !employee_id_sales || !address_post) {
			alert("정보를 입력해주세요.");
		} else {
			var forms = $("#customer_add").serialize();
			$.ajax({
				url: "/customer/enroll",
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
input {
	size: 50px;
}


.font2 {
	font-size: 50px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 40px;
}


.label1 {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 15px;
	line-height: 1.42857143;
}

.margins {
	margin: auto;
}
</style>
<body>
	<div class="container">

		<form id="customer_add" name="customer_add" method="post">
			<div>
				<h1 class="col-md-11 text-center font2">고객사 등록</h1>
			</div>

			<!-- 몸통 -->
			<div class="row text-center form-group" style="margin: 20px;">
				<label class="col-md-1 label1" style="width: 100px;">고객사명</label> 
				<input name="customerName"	class="col-md-2 form-control" style="width: 15%" type="text"
					id="customer" size="18px;" /> 
				
					
					
				<label class="col-md-2 label1"	style="margin-left: 105px; width: 130px;">고객사담당자</label> 
				<input id="manager" 	class="col-md-2 form-control" style="width: 15%" readonly>
				<button type="button" class="col-md-1 margins btn btn-default"
					onclick="search_emp()">직원검색</button>
				<input type="text" id="manager_id" name="employeeIdManager" style="visibility: hidden;"/>

			</div>

			<div class="row text-center" style="margin: 20px;">
				<label class="col-md-1 margins label1" style="width: 100px;">SE담당자</label>
				<input id="se_name"  class="col-md-2 form-control" style="width: 15%" readonly />
				<button type="button" class="col-md-1 margins btn btn-default"
					onclick="search_emp_secuve();">직원검색</button>
				<input type="text" id="se_id" name="employeeIdSe" style="visibility: hidden;"/>


				<label class="col-md-1 label1" style="margin-left: 40px; width: 120px;">영업담당자</label> 
				<input id="sales_name" class="col-md-2 form-control" style="width: 15%" readonly>
				<button type="button" class="col-md-1 margins btn btn-default"
					onclick="search_emp_secuve2();">직원검색</button>
				<input type="text" id="sales_id" name="employeeIdSales" style="visibility: hidden;"/>

			</div>


			<br>

			

			<div class="col-md-11 center-block margins">
				<div class="form-group">
					<input class="form-control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="addressPost" id="address_post" type="text"
						readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="addressAddress" id="address_address" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="상세주소" name="addressDetail"
						id="address_detail" type="text" />
				</div>


			</div>


			<div class="col-md-11 text-center" style="margin-top: 30px;">
				<input type="button" onclick="customerAdd()" class="btn btn-default"
					value="등록하기">
				 <input class="btn btn-default" type = "reset" value = "취소"/>
			</div>
		</form>
	</div>


	<div style="margin-bottom: 50px;"></div>




	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>