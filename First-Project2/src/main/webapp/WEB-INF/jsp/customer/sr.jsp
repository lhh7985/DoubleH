<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/bootstrap/css/bootstrap-theme.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">

/* $(function () {
	$('.sr').click(function() {
				$.ajax({
					type : 'GET',
					url : '/details/sr_detail',					
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					},
					success : function(data) {
						$('#tab').html(data);
					}
				});				
			});
}); */
$("#list").jqgrid({

})

var winRef;
function sr_detail(sr_id) {
	
	var _width = '1200';
    var _height = '900';
 
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.width - _height )/2); 

	
	
	href = "http://localhost:8080/customer/sr-detail?sr_id=" + sr_id;
	if(!winRef){
		$.ajax({
			type : 'GET',
			url : '/customer/sr-detail?sr_id=' + sr_id,
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:"
						+ error);
			},
			success : function(data) {
				winRef=window.open(href, "detail",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
			}
		});
	}else{
		if (winRef.closed == false) {
            winRef.focus();
        }else{
        	$.ajax({
    			type : 'GET',
    			url : '/customer/sr-detail?sr_id=' + sr_id,
    			error : function(request, status, error) {
    				alert("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:"
    						+ error);
    			},
    			success : function(data) {
    				winRef=window.open(href, "detail",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
    			}
    		});
        }
	}

}

/* function detail(sr_id){
	$.ajax({
		type : 'GET',
		url : '/details/sr?sr_id=' + sr_id,
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		},
		success : function(data) {
			$('#tab').html(data);
		}
	});
} */



</script>
</head>

<style>
</style>
<body>

	<div>
		<table class="table" style="table-layout: fixed">
			<thead>
				<tr>
					<th width="10%">구분</th>
					<th width="15%">제품명</th>
					<th width="30%">제목</th>
					<th width="15%">요청일자</th>
					<th width="10%">상태</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="item" items="${srList}" varStatus="status">
				<tr>
					<td>${item.codeName}</td>
					<td>${item.productName}</td>
					<td><a style="cursor: pointer;" onclick="sr_detail('${item.srId}')" >${item.srTitle}</a></td>
					<td>${item.srRequestDate}</td>
					<td>${item.srStatus}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>	
	</div>
		
	<div>
		<div id="tab"></div>
	</div>
		
</body>
</html>