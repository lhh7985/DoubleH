<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<style>
.my {
	font: bold;
	font-size: 20px;
	margin-bottom: 30px;
}

.myfont {
	font-size: 15px;
	font-weight: bold;
}

tr.hide {
	display: none
}

.font1 {
	text-align: center;
	margin-left: 200px;
}

.font2 {
	font-size: 15px;
	font-weight: bold;
}

tr.hide {
	display: none
}
</style>

<script type="text/javascript">


function selectDelete(){
	var confirm_val = confirm("정말 삭제하시겠습니까?");
	
	if(confirm_val){
		var checkarr = new Array();
		
		$("input[class='chBox']:checked").each(function(){
			checkarr.push($(this).attr("data-employeeNum"));
		});
		
		$.ajax({
			url:"/employee/delete",
			type:"POST",
			data:{chbox:checkarr},
			success: function(result){
				if(result==1){
					location.href="/employee/list";
				}else{
					alert("삭제 실패");
				}
			}
		})
		
	}
	
}
	$(function() {
		$('.tabmenu').click(
				function() {
					var activeTab = $(this).attr('data-tab');

					$.ajax({
						type : 'GET',
						url : '/employee/' + activeTab,
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						},
						success : function(data) {
							$('#tabs').html(data);
						}
					});
				});
		$('#default').click();
	});
	
	function employee_enroll(){
		href="http://localhost:8080/employee/enroll";
		
		window.open(this.href,'_blank', 'width=1000px, height=600px,toolbars=no,scrollbars=no');
		return false;
	}
	
	
	function myFunction() {
		  var input, filter, table, tr, td, i, txtValue;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[2];	  
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
</style>
<body>

	<div>
		<div>
            <jsp:include page="../header.jsp" />
        </div>
	</div>

	<div class="container">

		<div>
			<h3 style="font-weight:bold;">사원 정보</h3>
		</div>


		<div>
		
		<div class="panel with-nav-tabs panel-default" style="margin-top: 10px;">
				   <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li data-tab='secuve' class=" tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab" >시큐브</a></li>
                            <li data-tab='others' class="tabmenu"><a style="cursor: pointer; font-weight: bold;" data-toggle="tab">고객사</a></li>
                            
                            <form  class="navbar-form col-md-2" role="search" style="width: 40%; margin-left: 200px;">
								<select class=" form-control" style="  width: 25%; font-size: 12px;" id="searchOption" name="searchOption">
									<option value="name">이름</option>
						
								</select>
								<div class="form-group">
									<input type="text" id = "myInput" onkeyup="myFunction()" class="form-control" placeholder="Search">
								</div>
							</form>
							
							
							<button class="col-md-1 btn btn-default"  id="btn1" onclick="selectDelete()" disabled="disabled" style="margin-left: 5px;  float: right;">삭제</button>
							<button class="col-md-1 btn btn-default" style="float: right;" onclick="employee_enroll()" >추가</button>
                           
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                    
                   		<div  id='tabs'></div>
                   
                    </div>
                </div>
			</div>

			<!-- <ul class="nav nav-pills font2">

				<li data-tab='secuve' class="tabmenu"><a href="#">시큐브</a></li>
				<li data-tab='others' class="tabmenu"><a href="#">고객사</a></li>

				<form  class="navbar-form col-md-2" role="search" style="width: 40%; margin-left: 200px;">
					<select class=" form-control" style="  width: 25%; font-size: 12px;" id="searchOption" name="searchOption">
						<option value="name">이름</option>
						
					</select>
					<div class="form-group">
						<input type="text" id = "myInput" onkeyup="myFunction()" class="form-control" placeholder="Search">
					</div>
				</form>
				
				
				<button class="col-md-1 btn btn-default" style="margin-left: 5px;  float: right;">삭제</button>
				<button class="col-md-1 btn btn-default" style="float: right;" onclick="employee_enroll()" >추가</button>
			</ul> -->



			<div id='tabs'></div>
		</div>

	</div>


	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>