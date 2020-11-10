<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">
	
var winRef;
function goActivity() {
	var sr_id = ${srvo.sr_id};
	href = "http://localhost:8080/enroll/activity?sr_id=" + sr_id;
	if(!winRef){
		$.ajax({
			type : 'GET',
			url : '/enroll/activity?sr_id=' + sr_id,
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:"
						+ error);
			},
			success : function(data) {
				winRef=window.open(href, "activity",'width=1000px, height=800px,toolbars=no,scrollbars=no');
			}
	});
	}else{
		if (winRef.closed == false) {
            winRef.focus();
        }else{
        	$.ajax({
    			type : 'GET',
    			url : '/enroll/activity?sr_id=' + sr_id,
    			error : function(request, status, error) {
    				alert("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:"
    						+ error);
    			},
    			success : function(data) {
    				winRef=window.open(href, "activity",'width=1000px, height=800px,toolbars=no,scrollbars=no');
    			}
    	});
        }

	}

}
	
	
function complete(activity_id){
	$.ajax({
		type : 'POST',
		url : 'sr_detail?activity_id=' + activity_id,
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		},
		success : function(data) {
			location.reload();
		}
	});
}

function reloadPage() {
    location.reload();
}
</script>

</head>

<style>

.mymargin{
	margin: 10px;
}

label {
	display: block;
	width: 100%;
	height: 34px;
	padding: 3px 6px;
	font-size: 15px;
	line-height: 1.42857143;
}

</style>
<body>


	<div class="container">
	
		<h2>Detail</h2>
	
		
		<div class="row mymargin">
			<label class="col-md-1">고객사</label>
			<input  class="col-md-2 form-control" style="width:15%;" value="${srvo.customer_name }" disabled/>
			<input id="sr_id" value="${srvo.sr_id}" style="display: none">
		
			<label class="col-md-1" style="margin-left: 40px;">제품</label>
			<input class="col-md-2 form-control" style="width:10%;" value="${srvo.product_name }"  disabled/>
			
			<label class="col-md-1" style="margin-left: 40px;">유형</label>
			<input class="col-md-2 form-control" style=" width:15%;" value="${srvo.code_name }"  disabled/>
			
			<label class="col-md-1" style="margin-left: 40px;">중요도</label>
			<input class="col-md-2 form-control" style="width:5%;" value="${srvo.importance}"  disabled/>
		</div>
		
		
		<div class="row mymargin">

			<label class="col-md-1"">요청일</label>
			<input class="col-md-2 form-control" style="width:15%;" value="${srvo.sr_requestDate}"  disabled/>
			
			<label class="col-md-1" style="margin-left: 40px;">등록자</label>
			<input class="col-md-2 form-control" style="width:15%;"  value="${srvo.sr_registrant}" disabled/>
		
			<label class="col-md-1" style="margin-left: 40px;">등록일</label>
			<input class="col-md-2 form-control" style="width:15%;" value="${srvo.sr_registrationDate}"  disabled/>
		</div>
		
		
		
		<div class="row mymargin" style="margin-top : 20px;">
			<label class="col-md-1">제목</label>
			<input class="col-md-4 form-control" style="width:50%;" value="${srvo.sr_title}"  disabled/>
		
		</div>
		
		<div class="row mymargin">
			<label class="col-md-1">요구사항</label>
			<textarea class="col-md-9 form-control" style="width:80%;" rows="5" cols="150"  disabled>${srvo.sr_content}</textarea>
		
		</div>
		

	
	<div style="margin-top: 20px;">
		<div class="row-fluid">
			<h2>활동</h2>
			
		<div>
		<table class="table" >
			<thead>
				<tr>
					<th width="10%">유형</th>
					<th width="30%">제목</th>
					<th width="10%">등록자</th>
					<th width="15%">시작일</th>
					<th width="15%">완료예정일</th>
					<th width="10%">상태</th>
					
				</tr>
			</thead>

			<tbody class="panel table table-hover">
				<c:forEach var="item" items="${acvo}" varStatus="status" >
				<tr class="panel-heading" >
					<td>${item.code_name}</td>
					<td data-toggle="collapse" data-target=".${status.index}" style="cursor: pointer;">${item.activity_title}</td>
					<td>${item.activity_registrant}</td>
					<td>${item.activity_registrationDate}</td>
					<td>${item.activity_estimatedDate}</td>
					<td>${item.activity_status}</td>
					<%-- <c:choose>
						<c:when  test="${item.activity_status eq '완료'}">
							<td height="45px;"></td>
						</c:when>
						<c:otherwise>
							<td><input height="35px;" type="button" onclick=complete('${item.activity_id}') class="btn" value="활동완료"/></td>
						</c:otherwise>
					</c:choose> --%>
				</tr>
				

				<tr style="padding: 10px;"  class="panel-collapse collapse ${status.index}"  >
					<td class="panel-body" colspan="7"><p style="white-space:pre; margin-left: 20px;">${item.activity_content}</p>
					</td>	
				</tr>
				
				<tr class="panel-collapse collapse ${status.index} " style="background-color:lightgray">
					<td colspan="7">
						<div class=" col-sm-1" style="width: 80px;">완료일 :</div>
						<div class="col-md-2">${item.activity_completionDate }</div>
						
					</td>
					
				</tr>
				</c:forEach>
				

			</tbody>


		</table>
		</div>
		</div>
		
	

	</div>
	
	
	<div  style="margin-bottom: 100px;">
		
	</div>

	</div>
	
	
	
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>