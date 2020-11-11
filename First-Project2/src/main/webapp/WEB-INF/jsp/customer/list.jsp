<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello tabs</title>

<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">


function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=chBox]").prop("checked", true);
    }else{
      $("input[name=chBox]").prop("checked", false);
    }
}



function selectDelete(){
	var confirm_val = confirm("정말 삭제하시겠습니까?");
	
	if(confirm_val){
		var checkarr = new Array();
		
		$("input[class='chBox']:checked").each(function(){
			checkarr.push($(this).attr("data-customerNum"));
		});
		
		$.ajax({
			url:"/customer/delete",
			type:"POST",
			data:{chbox:checkarr},
			success: function(result){
				if(result==1){
					location.href="/customer/list";
				}else{
					alert("삭제 실패");
				}
			}
		})
		
	}
	
}
function goCustomerDetail(customer_id){
	location.href = "/customer/info?customer_id=" + customer_id;
}

var winRef;
function customer_enroll() {
	href = "http://localhost:8080/customer/enroll";
	if(!winRef){
		winRef=window.open(href, "customer_enroll",'width=1000px, height=600px,toolbars=no,scrollbars=no');
	}else{
		if (winRef.closed == false) {
            winRef.focus();
        }else{
        	winRef=window.open(href, "customer_enroll",'width=1000px, height=600px,toolbars=no,scrollbars=no');
        }
	}
	
	window.close();
}

function myFunction() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
		if( $("select option:selected").val() == 'customer'){
		    td = tr[i].getElementsByTagName("td")[1];	  
		}else if($("select option:selected").val() == 'manager') {
			td = tr[i].getElementsByTagName("td")[3];
		}else if($("select option:selected").val() == 'sales') {
			td = tr[i].getElementsByTagName("td")[4];
		}else if($("select option:selected").val() == 'se') {
			td = tr[i].getElementsByTagName("td")[5];
		}
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
function reloadPage() {
    location.reload();
}
</script>
</head>

<style>

.font2 {
	font-size: 40px;
	font-weight: bold;
}
</style>
<body>
	<div>
		<div>
			<jsp:include page="../header.jsp" />
		</div>
	</div>

	<div class="container">
		
		<div>

			<ul class="nav nav-pills font2 row" style="padding: 5px;">
				
				<div class="col-md-4 font2s">고객사 목록</div>
				<form  class="navbar-form col-md-3" role="search" style="width: 45%; margin-top:7px;">
					<select class=" form-control" style="margin-top:6px;  width: 25%; font-size: 12px;" id="searchOption" name="searchOption">
						<option value="customer">고객사명</option>
						<option value="manager">담당자명</option>
						<option value="se">SE담당자명</option>
						<option value="sales">영업담당자명</option>
					</select>
					<div class="form-group">
						<input type="text" id = "myInput" onkeyup="myFunction()" class="form-control" placeholder="Search">
					</div>
				</form>
				
				<button class="col-md-1 btn btn-default" id="btn1" style="margin-left: 5px; margin-top:20px; float: right;" disabled="disabled" onclick="selectDelete()" >선택 삭제</button>
				<button class="col-md-1 btn btn-default" style="float: right; margin-top:20px;" onclick="customer_enroll()" >추가</button>
			</ul>
		</div>
		
		

		<table id="myTable" class="table table-hover" style="table-layout: fixed">
			<thead>
				<tr>
					<th width="80px">회사ID</th>
					<th width="110px">회사명</th>
					<th width="450px">주소</th>
					<th width="120">담당자</th>
					<th width="120">영업담당자</th>
					<th width="120">SE담당자</th>
					<sec:authorize access="hasRole('ADMIN')">
						<th width="3%"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll()"></th>
					</sec:authorize>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<td>${item.customer_id}</td>
						<td onclick=goCustomerDetail(${item.customer_id}) style="cursor: pointer;">${item.customer_name}</td>
						<td onclick=goCustomerDetail(${item.customer_id}) style="cursor: pointer;">${item.address_address}</td>
						<td>${item.manager}</td>
						<td>${item.sales}</td>
						<td>${item.se}</td>
						<sec:authorize access="hasRole('ADMIN')">
						<td><input type="checkbox" name="chBox" class="chBox" data-customerNum="${item.customer_id}" />
							<script type="text/javascript">
							$(".chBox").click(function(){
								  $("#th_checkAll").prop("checked", false);
								 });
							$('input[type="checkbox"]').click(function(){
						        var tmpp = $(this).prop('checked'); 
						        var tt=$("[name='chBox']:checked").length;
						        // this를 사용하여 클릭한 checkbox 가 체크되도록 설정
						        if(tmpp ==true || tt>0){
						            $("#btn1").prop("disabled",false);
						        }
						        else{
						            $("#btn1").prop("disabled",true);
						        }
						    });
							</script>
						</td>
						</sec:authorize>
						
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>


	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>