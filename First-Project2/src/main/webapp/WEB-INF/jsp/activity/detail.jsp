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
.table {
	display: table;
}

/* .row {
	display: table-row;
} */

.cell {
	display: table-cell;
	padding: 6px;
	/* 	border-bottom: 1px solid #DDD; */
}
.mymargin{
	margin: 20px;
}
</style>
<body>

	<div>
		<div>
            <jsp:include page="../header.jsp" />
        </div>
	</div>

	<div class="container">
	
		<div class="row mymargin">
			<div class="col-md-1">����</div>
			<input class="col-md-2">
		
			<div class="col-md-1" style="margin-left: 40px;">��ǰ</div>
			<input class="col-md-2">
		</div>
		
		
		<div class="row mymargin">
			<div class="col-md-1">����</div>
			<input class="col-md-2">
		
			<div class="col-md-1" style="margin-left: 40px;">�߿䵵</div>
			<input class="col-md-2">
			
			<div class="col-md-1" style="margin-left: 40px;">��û��</div>
			<input class="col-md-2">
		</div>
		
		<div class="row mymargin">
			<div class="col-md-1">�����</div>
			<input class="col-md-2">
		
			<div class="col-md-1" style="margin-left: 40px;">�����</div>
			<input class="col-md-2">
		</div>
		
		<div class="row mymargin" style="margin-top : 40px;">
			<div class="col-md-1">����</div>
			<input class="col-md-4">
		
		</div>
		
		<div class="row mymargin">
			<div class="col-md-1">�䱸����</div>
			<textarea class="col-md-9" rows="14" cols="150"></textarea>
		
		</div>
		
		
	
	
	
	
	
	
	
	<div style="margin-top: 100px;">
		<div class="row-fluid">
			<h2>Ȱ��</h2>
			
			<button class="btn btn-default pull-right" type="button">Ȱ���߰�</button>
		<div>
		<table class="table" >
			<thead>
				<tr>
					<th>����</th>
					<th>����</th>
					<th>�����</th>
					<th>������</th>
					<th>������</th>
					<th>����</th>
				</tr>
			</thead>

			<tbody class="panel">
				<tr class="panel-heading" data-toggle="collapse" data-target=".coll1">
					<td>A</td>
					<td>���ο� �⼮��� �߰�</td>
					<td>��ȣȲ</td>
					<td>2020-10-12</td>
					<td>2020-12-22</td>
					<td>������</td>
				</tr>


				<tr  class="panel-collapse collapse coll1" >
					<td class="panel-body" colspan="6">����
					</td>	
				</tr>
				
				<tr class="panel-collapse collapse coll1 panel-footer">
					<td colspan="6">
						<div class=" col-sm-1" style="width: 90px;">������ :</div>
						<div class="col-md-2">2020-10-10</div>
						<div class=" col-sm-1" style="width: 110px;">�ϷΌ���� :</div>
						<div class="col-md-2">2020-10-13</div>
						<div class=" col-sm-1" style="width: 80px;">�Ϸ��� :</div>
						<div class="col-md-2">2020-10-13</div>
					</td>
					
				</tr>
				
				
				
				<tr class="panel-heading" data-toggle="collapse" data-target=".coll2">
					<td>A</td>
					<td>���ο� �⼮��� �߰�</td>
					<td>��ȣȲ</td>
					<td>2020-10-12</td>
					<td>2020-10-26</td>
					<td>������</td>
				</tr>


				<tr  class="panel-collapse collapse coll2">
					<td class="panel-body" colspan="6">����
					</td>	
				</tr>
				
				<tr class="panel-collapse collapse coll2 panel-footer">
					<td colspan="6">
						<div class=" col-sm-1" style="width: 90px;">������ :</div>
						<div class="col-md-2">2020-10-10</div>
						<div class=" col-sm-1" style="width: 110px;">�ϷΌ���� :</div>
						<div class="col-md-2">2020-10-13</div>
						<div class=" col-sm-1" style="width: 80px;">�Ϸ��� :</div>
						<div class="col-md-2">2020-10-13</div>
					</td>
					
				</tr>
				

			</tbody>


		</table>
		</div>
		</div>
		
		

	</div>
	
	
	<div class="container-footer" style="margin-bottom: 100px;">
		<h3>End</h3>
	</div>

	</div>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>