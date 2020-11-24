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
	var srId = ${srvo.srId};
	href = "http://localhost:8080/activity/enroll-sr?srId=" + srId;
	if(!winRef){
		$.ajax({
			type : 'GET',
			url : '/activity/enroll-sr?srId=' + srId,
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
    			url : '/enroll/activity?srId=' + srId,
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
	
	
function complete(activityId){
	$.ajax({
		type : 'POST',
		url : '/activity/detail?activityId=' + activityId,
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
	<div>
		<div>
            <jsp:include page="../header.jsp" />
        </div>
	</div>

	<div class="container">
	
		<h2>Detail</h2>
	
		
		<div class="row mymargin">
			<label class="col-md-1">고객사</label>
			<input  class="col-md-2 form-control" style="width:15%;" value="${srvo.customerName }" disabled/>
			<input id="sr_id" value="${srvo.srId}" style="display: none">
		
			<label class="col-md-1" style="margin-left: 40px;">제품</label>
			<input class="col-md-2 form-control" style="width:10%;" value="${srvo.productName }"  disabled/>
			
			<label class="col-md-1" style="margin-left: 40px;">유형</label>
			<input class="col-md-2 form-control" style=" width:15%;" value="${srvo.codeName }"  disabled/>
			
			<label class="col-md-1" style="margin-left: 40px;">중요도</label>
			<input class="col-md-2 form-control" style="width:5%;" value="${srvo.importance}"  disabled/>
		</div>
		
		
		<div class="row mymargin">

			<label class="col-md-1"">요청일</label>
			<input class="col-md-2 form-control" style="width:15%;" value="${srvo.srRequestDate}"  disabled/>
			
			<label class="col-md-1" style="margin-left: 40px;">등록자</label>
			<input class="col-md-2 form-control" style="width:15%;" value="${srvo.srRegistrant}"  disabled/>
		
			<label class="col-md-1" style="margin-left: 40px;">등록일</label>
			<input class="col-md-2 form-control" style="width:15%;"  value="${srvo.srRegistrationDate}" disabled/>
		</div>
		
		
		
		<div class="row mymargin" style="margin-top : 20px;">
			<label class="col-md-1">제목</label>
			<input class="col-md-4 form-control" style="width:50%;" value="${srvo.srTitle}"  disabled/>
		
		</div>
		
		<div class="row mymargin">
			<label class="col-md-1">요구사항</label>
			<textarea class="col-md-9 form-control" style="width:80%;" rows="5" cols="150"  disabled>${srvo.srContent}</textarea>
		
		</div>
		

	
	<div style="margin-top: 20px;">
		<div class="row-fluid">
			<h2 class="col-md-1">활동</h2>
			
			<button class="col-md-1 btn btn-default pull-right" style="margin-top:30px;" type="button" onclick="goActivity()">활동추가</button>
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
					<th width="10%"></th>
				</tr>
			</thead>

			<tbody class="panel table table-hover">
				<c:forEach var="item" items="${acvo}" varStatus="status" >
				<tr class="panel-heading" >
					<td>${item.codeName}</td>
					<td data-toggle="collapse" data-target=".${status.index}" style="cursor: pointer;">${item.activityTitle}</td>
					<td>${item.activityRegistrant}</td>
					<td>${item.activityRegistrationDate}</td>
					<td>${item.activityEstimatedDate}</td>
					<td>${item.activityStatus}</td>
					<c:choose>
						<c:when  test="${item.activityStatus eq '완료'}">
							<td height="45px;"></td>
						</c:when>
						<c:otherwise>
							<td><input height="35px;" type="button" onclick=complete('${item.activityId}') class="btn btn-default" value="활동완료"/></td>
						</c:otherwise>
					</c:choose>
				</tr>
				

				<tr style="padding: 10px;"  class="panel-collapse collapse ${status.index}"  >
					<td class="panel-body" colspan="7"><p style="white-space:pre; margin-left: 20px;">${item.activityContent}</p>
					</td>	
				</tr>
				
				<tr class="panel-collapse collapse ${status.index} " style="background-color:lightgray">
					<td colspan="7">
						<div class=" col-sm-1" style="width: 80px;">완료일 :</div>
						<div class="col-md-2">${item.activityCompletionDate }</div>
						
					</td>
					
				</tr>
				</c:forEach>
				

			</tbody>


		</table>
		</div>
		</div>
		
	

	</div>
	
	
	<div  style="margin-bottom: 50px;">
		
	</div>

	</div>
	
	
	
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>