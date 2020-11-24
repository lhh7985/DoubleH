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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<script type="text/javascript">
	

	
	function complete(activityId){
		$.ajax({
			type : 'POST',
			url : '/activity/list?activity_id=' + activityId,
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

tr.hide {
	display: none
}

.font1 {
	font-size: 17px;
	text-align:center;
	font-weight: bold;
	margin-left: 950px;
	font:bold;
}

.font2 {
	font-size: 50px;
	font-weight: bold;
	text-align: center;
}

tr.hide {
	display: none
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
			<h1 class="font2">활동</h1>
			<div>
				<button class="btn btn-default font1 col-sx-2" onclick="location.href='http://localhost:8080/activity/enroll-employee'">추가</button>
			</div>
			
		</div>
		
		<!-- 몸통 -->
		<div>
			<table class="table table-condensed"
			style="border-collapse: collapse;">
			<thead>
				<tr>
					<th>활동유형</th>
					<th>제목</th>
					<th>등록자</th>
					<th>활동예정일</th>
					<th>완료일</th>
					<th></th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="item" items="${activity}" varStatus="status">
					<tr >
						<td>${item.codeName}</td>
						<td data-toggle="collapse" data-target="#${status.index}" style="cursor: pointer;">${item.activityTitle}</td>
						<td>${item.activityRegistrant}</td>
						<td>${item.activityEstimatedDate}</td>
						<td>${item.activityCompletionDate}</td>
						<c:choose>
							<c:when  test="${item.activityCompletionDate eq null}">
								<td><input height="35px;" type="button" onclick=complete('${item.activityId}') class="btn" value="활동완료"/></td>
							</c:when>
							<c:otherwise>
									<td height="45px;"></td>
							</c:otherwise>	
						</c:choose>
					</tr>


					<tr  class="panel-collapse collapse " id="${status.index}" >
						<td style="padding: 10px;" class="panel-body" colspan="7">
							<p style="white-space:pre; margin-left: 20px;">${item.activityContent}</p>
						</td>	
					</tr>
				

				</c:forEach>
			</tbody>
		</table>
		
		</div>
	
		
	</div>



	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>