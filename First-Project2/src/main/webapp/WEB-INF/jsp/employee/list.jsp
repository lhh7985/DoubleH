<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hello tabs</title>

    <%--  jquery  --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <%--    <link rel="stylesheet" href="http://cdn.js.cloudflare.com/ajax/libs/jqgrid/4.6.0/css/ui.jqgrid.css"/>--%>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqgrid/4.6.0/js/jquery.jqGrid.min.js"></script>--%>
    <%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqgrid/4.6.0/js/i18n/grid.locale-en.js"></script>--%>
    <%--    <script src="/js/util/paginate.js"></script>--%>


    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.css">
    <%--   jqgrid --%>
    <link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgrid/jQueryUI/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/resources/jqgrid/css/ui.jqgrid.css"/>

    <script type="text/javascript" src="/resources/jqgrid/js/jquery-1.7.2.min.js"></script>

    <%--sdf--%>
    <script type="text/javascript" src="/resources/jqgrid/js/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="/resources/jqgrid/js/i18n/grid.locale-kr.js"></script>
    <script type="text/javascript" src="/resources/jqgrid/js/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="/resources/jqgrid/jQueryUI/jquery-ui.js"></script>


    <style>

        .ui-jqgrid .ui-jqgrid-bdiv {
            overflow-y: scroll
        }

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


        function selectDelete() {
            var confirm_val = confirm("정말 삭제하시겠습니까?");

            if (confirm_val) {
                var checkarr = new Array();

                $("input[class='chBox']:checked").each(function () {
                    checkarr.push($(this).attr("data-employeeNum"));
                });

                $.ajax({
                    url: "/employee/delete",
                    type: "POST",
                    data: {chbox: checkarr},
                    success: function (result) {
                        if (result == 1) {
                            location.href = "/employee/list";
                        } else {
                            alert("삭제 실패");
                        }
                    }
                })

            }

        }


        function employee_enroll() {
            href = "http://localhost:8080/employee/enroll";

            window.open(this.href, '_blank', 'width=1000px, height=600px,toolbars=no,scrollbars=no');
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

        function fn_paging(page) {
            location.href = "/employee/list?page=" + page;
        }
    </script>
</head>

<style>
</style>
<body>

<div>
    <div>
        <jsp:include page="../header.jsp"/>
    </div>
</div>

<div class="container">


    <div>
        <h3 style="font-weight:bold;">직원 정보</h3>
    </div>


    <div>

        <div class="panel with-nav-tabs panel-default" style="margin-top: 10px; min-height: 600px;">
            <div class="panel-heading">
                <ul class="nav nav-tabs">

                    <form class="navbar-form col-md-2" role="search" style="width: 40%; margin-left: 200px;">
                        <select class=" form-control" style="  width: 25%; font-size: 12px;" id="searchOption"
                                name="searchOption">
                            <option value="name">이름</option>

                        </select>
                        <div class="form-group">
                            <input type="text" id="myInput" onkeyup="myFunction()" class="form-control"
                                   placeholder="Search">
                        </div>
                    </form>


                    <button class=" btn btn-default" id="btn1" onclick="selectDelete()" disabled="disabled"
                            style="margin-left: 5px;  float: right;">삭제
                    </button>
                    <button class=" btn btn-default" style="float: right;" onclick="employee_enroll()">추가
                    </button>

                </ul>
            </div>
            <div class="panel-body">
                <form name="readForm" role="form" method="post">
                    <input type="hidden" id="bno" name="bno" value="${employeeId}"/>
                    <input type="hidden" id="page" name="page" value="${page.page}">
                    <input type="hidden" id="perPageNum" name="perPageNum" value="${page.perPageNum}">
                    <input type="hidden" id="searchType" name="searchType" value="${page.searchType}">
                    <input type="hidden" id="keyword" name="keyword" value="${page.keyword}">
                </form>

                <table class="table" id="myTable" style="table-layout:fixed">
                    <thead>
                    <tr>
                        <th width="8%">구분</th>
                        <th width="12%">회사명</th>
                        <th width="12%">부서</th>
                        <th width="12%">이름</th>
                        <th width="20%">연락처</th>
                        <th width="20%">휴대전화</th>
                        <th width="20%">E-mail</th>
                        <sec:authorize access="hasRole('ADMIN')">
                            <th width="3%"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll()">
                            </th>
                        </sec:authorize>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="item" items="${employeeList}">
                        <tr>
                            <td>${item.codeUpper}</td>
                            <td>${item.codeName}</td>
                            <td>${item.departmentName}</td>
                            <td>${item.employeeName}</td>
                            <td>${item.employeeContact}</td>
                            <td>${item.employeePhone}</td>
                            <td>${item.employeeEmail}</td>
                            <sec:authorize access="hasRole('ADMIN')">
                            <td><input type="checkbox" name="chBox" class="chBox"
                                       data-employeeNum="${item.employeeId}"/>
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
                                </sec:authorize>

                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
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
</div>


<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>