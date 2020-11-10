<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>

<script>

//고객 검색창 열기
var winRef;

	function customer_search() {
		href = "http://localhost:8080/search/customer_search";
		if(!winRef){
			winRef=window.open(href, "customer2",'width=800px, height=600px,toolbars=no,scrollbars=no');
		}else{
			if (winRef.closed == false) {
	            winRef.focus();
	        }else{
	        	winRef=window.open(href, "customer2",'width=800px, height=600px,toolbars=no,scrollbars=no');
	        }
		}

	}
	
	function setValue(name,id){
	    document.getElementById("customer_name").value = name;
	    document.getElementById("customer_id").value = id;
	    
	    
	};


	
	function product_search() {
		href = "http://localhost:8080/search/product_search2";
		if(!winRef){
			winRef=window.open(href, "product2",'width=800px, height=600px,toolbars=no,scrollbars=no');
		}else{
			if (winRef.closed == false) {
	            winRef.focus();
	        }else{
	        	winRef=window.open(href, "product2",'width=800px, height=600px,toolbars=no,scrollbars=no');
	        }
		}

	}
	
	
	function setProduct(name, id){
		document.getElementById("product_name").value = name;
		document.getElementById("product_id").value=id;
		
		if(name=="ToS" || name=="iGRIFFIN"){
	    	$(".inputArea input").prop("disabled",false);
	    }else{
	    	$(".inputArea input").prop("disabled",true);
	    }
	}
	
	
	function delivery_enroll(){
		var add = document.add;
		var customer_name =add.customer_name.value;
		
		var product_name = add.product_name.value;
		var delivery_date = add.delivery_date.value;
		var delivery_quantity = add.delivery_quantity.value;
		
		var delivery_businessNum = add.delivery_businessNum.value;
				
	
		if (!customer_name || !product_name || !delivery_date|| !delivery_quantity || !delivery_businessNum ) {
			alert("정보를 입력해주세요.");
		} else {
			var forms = $("#add").serialize();
			$.ajax({
				url: "/delivery/enroll",
				type:"POST",
				data:forms,
				success:function(data){
					location.href="http://localhost:8080/product/delivery"
				}
			});
		}

	}
</script>

</head>
<style>
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
	
	<div  style="margin-left:100px;">
	
		<form id="add" name="add"  method="POST">
		<div>
			<h1 class="font2">납품하기</h1>
			<br>
		</div>
		

		<!-- 몸통 -->
		<div style="margin: 20px;" class="row">
		
		<input name="customer_id" id="customer_id" value="0" style="display: none"/>
		
			<label class="col-md-1">고객</label> 
			<input name="customer_name" class="col-md-2 form-control" id="customer_name" style="width:20%;"  readonly/>
			<button class="col-md-1 btn btn-default" type="button" onclick='customer_search()'>고객검색</button>
		
		
		<input name="product_id" id="product_id" value="0" style="display: none"/>
	
			<label class="col-md-1" style="margin-left: 50px;">제품</label> 
			<input name="product_name" class="col-md-2 form-control" id="product_name"  style="width:20%;" readonly>
			<button class="col-md-1 btn btn-default" type="button" onclick="product_search()">제품검색</button>
		</div>
		
		

		<div style="margin: 20px;" class="row">
			
			
			<label class="col-md-2" style=" width: 100px;">납품일</label> 
			<input type="date" name="delivery_date" id="delivery_date" class="col-md-2 form-control" style="width:20%;" >
			
			
			<label class="col-md-2" style="margin-left:30px; width: 80px;"">총수량</label> 
			<input type="text" name="delivery_quantity" id="delivery_quantity" class="col-md-2 form-control" style="width:15%;" >
			
			<label class="col-md-2" style="margin-left:30px; width: 110px;"">사업건번호</label> 
			<input type="text" name="delivery_businessNum" id="delivery_businessNum" class="col-md-2 form-control" style="width:15%;" >
			
		</div>
		
		<br>
		<p>* ToS, iGRIFFIN 인 경우에만 입력하세요.</p>
		
		<div style="margin: 20px;" class="row inputArea">
			
			
			<label class="col-md-1 " style="margin-left:30px;">window</label> 
			<input type="text" name="Window" id="Window" class="col-md-2 form-control" style="width:10%;" disabled="disabled">
			
			
			<label class="col-md-1 " style="margin-left:30px;">Linux</label> 
			<input type="text" name="Linux" id="Linux" class="col-md-2 form-control" style="width:10%;"  disabled="disabled">
			
			<label class="col-md-1 " style="margin-left:30px;">Unix</label> 
			<input type="text" name="Unix" id="Unix" class="col-md-2 form-control" style="width:10%;" disabled="disabled" >
		</div>



		<div class="col-md-11 text-center" style="margin-top: 30px;">
			<input  class="btn btn-default" type="button"  onclick="delivery_enroll()" value="등록"/>
			
			<input class="btn btn-default" type = "reset" value = "취소"/>
		</div>
		
		</form>
	</div>

	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>