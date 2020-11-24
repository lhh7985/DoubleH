<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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


        function checkAll() {
            if ($("#th_checkAll").is(':checked')) {
                $("input[name=chBox]").prop("checked", true);
            } else {
                $("input[name=chBox]").prop("checked", false);
            }
        }


        function selectDelete() {
            var confirm_val = confirm("정말 삭제하시겠습니까?");

            if (confirm_val) {
                var checkarr = new Array();

                $("input[class='chBox']:checked").each(function () {
                    checkarr.push($(this).attr("data-customerNum"));
                });

                $.ajax({
                    url: "/customer/delete",
                    type: "POST",
                    data: {chbox: checkarr},
                    success: function (result) {
                        if (result == 1) {
                            location.href = "/customer/list";
                        } else {
                            alert("삭제 실패");
                        }
                    }
                })

            }

        }

        function goCustomerDetail(customerId) {
            location.href = "/customer/detail?customerId=" + customerId;
        }

        var winRef;

        function customer_enroll() {
            href = "http://localhost:8080/customer/enroll";
            if (!winRef) {
                winRef = window.open(href, "customer_enroll", 'width=1000px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "customer_enroll", 'width=1000px, height=600px,toolbars=no,scrollbars=no');
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
                if ($("select option:selected").val() == 'customer') {
                    td = tr[i].getElementsByTagName("td")[1];
                } else if ($("select option:selected").val() == 'manager') {
                    td = tr[i].getElementsByTagName("td")[3];
                } else if ($("select option:selected").val() == 'sales') {
                    td = tr[i].getElementsByTagName("td")[4];
                } else if ($("select option:selected").val() == 'se') {
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

        function fn_paging(page) {
            location.href = "/customer/list?page=" + page;
        }
    </script>
</head>

<style>

    .font2 {
        font-size: 30px;
        font-weight: bold;
    }
</style>
<body>
<div>
    <div>
        <jsp:include page="../header.jsp"/>
    </div>
</div>

<div class="container">
    <div class="font2">고객사 목록</div>

    <div class="panel with-nav-tabs panel-default" style="margin-top: 10px; min-height: 600px;">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <%--						<ul class="nav nav-pills font2 row" style="padding: 5px;">--%>

                <form class="navbar-form col-md-3" role="search" style="width: 45%; margin-top:7px;">
                    <select class=" form-control" style="  width: 25%; font-size: 12px;" id="searchOption"
                            name="searchOption">
                        <option value="customer">고객사명</option>
                        <option value="manager">담당자명</option>
                        <option value="se">SE담당자명</option>
                        <option value="sales">영업담당자명</option>
                    </select>
                    <div class="form-group">
                        <input type="text" id="myInput" onkeyup="myFunction()" class="form-control"
                               placeholder="Search">
                    </div>
                </form>

                <button class=" btn btn-default" id="btn1"
                        style="margin-left: 5px; float: right;" disabled="disabled"
                        onclick="selectDelete()">선택 삭제
                </button>
                <button class="btn btn-default" style="float: right;"
                        onclick="customer_enroll()">추가
                </button>
            </ul>
            <%--					</ul>--%>
        </div>


        <div class="panel-body">
            <table id="myTable" class="table table-hover">
                <thead>
                <tr>
                    <th width="80px">회사ID</th>
                    <th width="110px">회사명</th>
                    <th width="450px">주소</th>
                    <th width="120">담당자</th>
                    <th width="120">영업담당자</th>
                    <th width="120">SE담당자</th>
                    <sec:authorize access="hasRole('ADMIN')">
                        <th width="3%"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll()">
                        </th>
                    </sec:authorize>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${list}" varStatus="status">
                    <tr>
                        <td>${item.customerId}</td>
                        <td onclick=goCustomerDetail(${item.customerId})
                            style="cursor: pointer;">${item.customerName}</td>
                        <td onclick=goCustomerDetail(${item.customerId})
                            style="cursor: pointer;">${item.addressAddress}</td>
                        <td>${item.manager}</td>
                        <td>${item.sales}</td>
                        <td>${item.se}</td>
                        <sec:authorize access="hasRole('ADMIN')">
                            <td><input type="checkbox" name="chBox" class="chBox"
                                       data-customerNum="${item.customerId}"/>
                                <script type="text/javascript">
                                    $(".chBox").click(function () {
                                        $("#th_checkAll").prop("checked", false);
                                    });
                                    $('input[type="checkbox"]').click(function () {
                                        var tmpp = $(this).prop('checked');
                                        var tt = $("[name='chBox']:checked").length;
                                        // this를 사용하여 클릭한 checkbox 가 체크되도록 설정
                                        if (tmpp == true || tt > 0) {
                                            $("#btn1").prop("disabled", false);
                                        } else {
                                            $("#btn1").prop("disabled", true);
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
    </div>

    <div>
        <nav class="text-center">
            <ul class="pagination">
                <li>
                    <a href="#" onClick="fn_paging(1)" ; aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li>
                    <c:if test="${paging.curPage ne 1}">
                        <a href="#" onClick="fn_paging(${paging.prevPage })"><span aria-hidden="true">이전</span></a>
                    </c:if>
                    <c:forEach var="pageNum" begin="${paging.startPage}" end="${paging.endPage}">
                        <c:choose>
                            <c:when test="${pageNum eq  paging.curPage}">
                                <span style="font-weight: bold;">
                                    <a href="#" onClick="fn_paging(${pageNum})" style="font-weight: bold; color:red;">
                                            ${pageNum}
                                    </a>
                                </span>
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging(${pageNum })">${pageNum }</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${paging.curPage ne paging.pageCnt && paging.pageCnt > 0}">
                        <a href="#" onClick="fn_paging(${paging.nextPage })"><span aria-hidden="true">다음</span></a>
                    </c:if>
                </li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>


    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>