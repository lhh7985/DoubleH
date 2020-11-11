<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 정보수정</title>


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script type="text/javascript">

//수정된 값이 있는지

	function modify_customer(){
		
			if("<%= request.getParameter("customer_name") %>" !=  document.getElementById('customer_name').value){
				alert("업데이트");
			}
			if("<%= request.getParameter("manager_id") %>" !=  document.getElementById('manager_id').value){
				document.getElementById('employee_id_manager').value =  document.getElementById('manager_id').value;
			}
			if("<%= request.getParameter("se_id") %>" !=  document.getElementById('se_id').value){
				document.getElementById('employee_id_se').value =  document.getElementById('se_id').value;
			}
			if("<%= request.getParameter("sales_id") %>" !=  document.getElementById('sales_id').value){
				document.getElementById('employee_id_sales').value =  document.getElementById('sales_id').value;
			}
			if("<%= request.getParameter("address") %>" !=  document.getElementById('address_address').value){
				alert("업데이트");
			}
			if("<%= request.getParameter("addr_detail") %>" !=  document.getElementById('address_detail').value){
				alert("업데이트");
			}
			
			var forms = $("#modify_customer").serialize();
			$.ajax({
				url: "/customer/modify.do",
				type:"POST",
				data:forms,
				success:function(data){
				   alert("수정되었습니다.")
 				   location.href="http://localhost:8080/customer/list";
				}
			});
	}


	function execPostCode() {
		new daum.Postcode(
				{
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

						$("[name=address_post]").val(data.zonecode);
						$("[name=address_address]").val(fullRoadAddr);

						document.getElementById('address_post').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address_address').value = fullRoadAddr;
						/* document.getElementById('address_detail').value = data.jibunAddress; */
					}
				}).open();
	}
	
	
	function setChildValue(name,id){
	    document.getElementById("se").value = name;
	    document.getElementById("se_id").value=id;
	};
	
	function setChildValue2(name,id){
		document.getElementById("sales").value = name;
		document.getElementById("sales_id").value=id;
	};
	
	function setChildValue_other(name,id){
		document.getElementById("manager").value = name;
		document.getElementById("manager_id").value=id;
	};
	
	var winRef;

	function search_emp_secuve() {
		href = "http://localhost:8080/search/employee-search-secuve";
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
		
		href = "http://localhost:8080/search/employee-search-secuve2";
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
		href = "http://localhost:8080/search/employee-searchOther";
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
	font-size: 25px;
	font-weight: bold;
}

.font2 {
	font-size: 30px;
	font-weight: bold;
}

.inputsize {
	float: left;
}

.label1 {
	display: block;
	width: 100%;
	height: 42px;
	padding: 6px 12px;
	font-size: 18px;
	line-height: 2.567;
}

.container2 {
  padding-right: 25px;
  padding-left: 80px;
  margin-right: auto;
  margin-left: auto;
}

@media (min-width: 768px) {
  .container2 {
    width: 750px;
  }
}

@media (min-width: 992px) {
  .container2 {
    width: 970px;
  }
}

@media (min-width: 1200px) {
  .container2 {
    width: 1150px;
  }
}

</style>
<body>

	<div>
		<div>
			<jsp:include page="../header.jsp" />
		</div>
	</div>


	<div class="container2">

		<form id="modify_customer" name="modify" method="post">
			<div>
				<p class="col-md-11 text-center font2">고객정보수정</p>
			</div>

			<div>
				<!-- 몸통 -->
				<div class="row text-center form-group" style="margin: 5px;">
					<label class="col-md-2 label1 font1" style=" text-align width: 130px;">고객사명</label> 
					<input id="customer_name" name="customer_name" class="col-md-3 form-control" style="height: 42px; width: 60%" type="text" id="customer" 
						value="<%= request.getParameter("customer_name") %>"/>
					<input id="customer_id" name="customer_id" style="visibility: hidden;" value="<%= request.getParameter("customer_id") %>"/>
				</div>

				<div class="row text-center form-group" style="margin: 5px;">
					<label class="col-md-2 label1"	style="text-align width: 130px;">고객사담당자</label> 
					<input	id="manager" class="col-md-4 form-control" style="height: 42px; width: 60%"	readonly
						value="<%= request.getParameter("manager") %>"/>
					<button style="margin-left:5px; height: 42px; width:40px;" type="button" class="col-md-1 btn glyphicon glyphicon-search" onclick="search_emp()"></button>
				
					<input type="text" id="manager_id"  style="visibility: hidden;" value="<%= request.getParameter("manager_id") %>" />
					<input id="employee_id_manager" name="employee_id_manager" style="visibility: hidden;" value='0'/>

				</div>

				<div class="row text-center" style="margin: 5px;">
					<label class="col-md-2 margins label1" style="text-align width: 130px;">SE담당자</label>
					<input id="se" class="col-md-3 form-control"	style="height: 42px; width: 60%" readonly 
						value="<%= request.getParameter("se") %>"/>
					<button style="margin-left:5px; height: 42px; width:40px;" type="button" class="col-md-1  btn  glyphicon glyphicon-search"onclick="search_emp_secuve();"></button>

					<input type="text" id="se_id" style="visibility: hidden;"value="<%= request.getParameter("se_id") %>" />
					<input id="employee_id_se" name="employee_id_se" style="visibility: hidden;" value='0'/>
				</div>
				
				
				<div class="row text-center" style="margin: 5px;">
					<label class="col-md-2 label1"	style="text-align width: 130px;">영업담당자</label> 
					<input	id="sales" class="col-md-3 form-control" style=" height: 42px;width: 60%;" readonly
						value="<%= request.getParameter("sales") %>"/>
					<button style="margin-left:5px; height: 42px; width:40px;" type="button" class="col-md-1  btn  glyphicon glyphicon-search" onclick="search_emp_secuve2();"></button>
					
					<input type="text" id="sales_id" style="visibility: hidden;" value="<%= request.getParameter("sales_id") %>" />
					<input id="employee_id_sales" name="employee_id_sales" style="visibility: hidden;" value='0'/>
				</div>


				<br>


				<div  class="row text-center form-group" style="margin: 5px;">
					<label class="col-md-2 label1" style="text-align width: 130px;">주소</label>

					<input class="col-md-2 form-control" style="height: 42px; width: 30%; display: inline;" placeholder="우편번호" name="address_post" id="address_post"
							type="text" readonly="readonly" value="<%= request.getParameter("addr_post") %>" />
					<button style="margin-left:5px; height: 42px; width:100px;" type="button" class="col-md-1  btn btn-light-blue" onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편검색</button>

				</div>
				
				
				<div  class="row text-center form-group" style="margin: 5px;">
					<label class="col-md-2 label1" style="height: 42px; text-align width: 130px;"></label>
					<input class="form-control" style="height: 42px; width: 60%;" placeholder="도로명 주소"	name="address_address" id="address_address" type="text"
							readonly="readonly" value="<%= request.getParameter("address") %>"/>
				</div>
				
				
				<div  class="row text-center form-group" style="margin: 5px;">
					<label class="col-md-2 label1" style="text-align width: 130px;"></label>
					<input class="form-control" placeholder="상세주소" style="height: 42px; width: 60%;"name="address_detail" id="address_detail" type="text" 
						value="<%= request.getParameter("addr_detail") %>"/>
				</div>


			<div class="col-md-11 text-center" style="margin-top: 15px;">
				<input type="button" onclick="modify_customer()" class="btn btn-default"value="수정"> 
				<input class="btn btn-default" type="button" onclick="history.back()" value="취소" />
			</div>
			</div>

		</form>
	</div>




	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>