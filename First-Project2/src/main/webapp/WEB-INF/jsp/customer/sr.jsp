<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SR</title>
    <!-- Custom fonts for this template-->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <script type="text/javascript">

        $(document).ready(function () {
            $('#myTable3').DataTable();
        });
        var winRef;

        function sr_detail(srId) {

            var _width = '1200';
            var _height = '900';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil((window.screen.width - _width) / 2);
            var _top = Math.ceil((window.screen.width - _height) / 2);


            href = 'http://localhost:8080/customer/' + srId + '/sr-detail';
            if (!winRef) {
                $.ajax({
                    type: 'GET',
                    url: '/customer/' + srId + '/sr-detail',
                    error: function () {
                        alert("데이터가 이미 삭제되었거나 없습니다.");
                    },
                    success: function () {
                        winRef = window.open(href, "detail", 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top);
                    }
                });
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    $.ajax({
                        type: 'GET',
                        url: '/customer/' + srId + '/sr-detail',
                        error: function () {
                            alert("데이터가 이미 삭제되었거나 없습니다.");
                        },
                        success: function () {
                            winRef = window.open(href, "detail", 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top);
                        }
                    });
                }
            }

        }


    </script>
</head>

<body>

<div class="table-responsive">
    <table id="myTable3" class="table table-bordered">
        <thead>
        <tr>
            <th width="10%">구분</th>
            <th width="15%">제품명</th>
            <th width="30%">제목</th>
            <th width="15%">요청일자</th>
            <th width="10%">상태</th>
        </tr>
        </thead>

        <tfoot>
        <tr>
            <th width="10%">구분</th>
            <th width="15%">제품명</th>
            <th width="30%">제목</th>
            <th width="15%">요청일자</th>
            <th width="10%">상태</th>
        </tr>
        </tfoot>
        <tbody>
        <c:forEach var="item" items="${srList}" varStatus="status">
            <tr>
                <td>${item.codeName}</td>
                <td>${item.productName}</td>
                <td><a style="cursor: pointer;" onclick="sr_detail('${item.srId}')">${item.srTitle}</a></td>
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

<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>

</body>
</html>