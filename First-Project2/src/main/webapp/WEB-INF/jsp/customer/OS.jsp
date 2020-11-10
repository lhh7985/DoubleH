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
	
</script>

</head>

<style>
</style>
<body>

	<div>
		<table class="table table-condensed"
			style="border-collapse: collapse;">
			<thead>
				<tr>
					<th width="10%">사업건 번호</th>
					<th>제품명</th>
					<th>납품수량</th>
					<th>납품일</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="item" items="${list}" varStatus="status">
					<tr data-toggle="collapse" data-target=".${status.index}" style="cursor: pointer;">
						<td>${item.delivery_businessNum}</td>
						<td>${item.product_name}</td>
						<td>${item.delivery_quantity}</td>
						<td>${item.delivery_date}</td>
					</tr>

					<c:if test="${item.product_name eq 'ToS' || item.product_name eq 'iGRIFFIN'}">
					<tr class="p panel-collapse collapse ${status.index}">
						<td colspan="4">
							<div>
								<c:forEach var="item2" items="${list2}">
									<c:if test="${item.delivery_id eq item2.delivery_id}">
										<p>
											${item2.os_name} : <span>${item2.os_quantity}</span>
										</p>
									</c:if>
								</c:forEach>
							</div>
						</td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>