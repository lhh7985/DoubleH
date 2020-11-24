<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>납품 정보</title>


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
                    checkarr.push($(this).attr("data-deliveryNum"));
                });

                $.ajax({
                    url: "/product/delivery/delete",
                    type: "POST",
                    data: {chbox: checkarr},
                    success: function (result) {
                        if (result == 1) {
                            location.href = "/product/delivery";
                        } else {
                            alert("삭제 실패");
                        }
                    }
                })

            }

        }


        function enroll_delivery() {
            location.href = "http://localhost:8080/product/delivery";
        }

        //안씀
        var winRef;

        function delivery_enroll() {
            href = "http://localhost:8080/product/delivery";
            if (!winRef) {
                winRef = window.open(href, "customer", 'width=1000px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "customer", 'width=1000px, height=600px,toolbars=no,scrollbars=no');
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
                } else if ($("select option:selected").val() == 'product') {
                    td = tr[i].getElementsByTagName("td")[2];
                } else if ($("select option:selected").val() == 'business') {
                    td = tr[i].getElementsByTagName("td")[0];
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
            location.href = "/product/delivery?page=" + page;
        }

    </script>
</head>
<style>


    .font2 {
        font-size: 40px;
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

    <div class="font2">납품정보</div>

    <div class="panel with-nav-tabs panel-default" style="margin-top: 10px; min-height: 600px;">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <form class="navbar-form col-md-3" role="search" style="width: 45%;">
                    <select class=" form-control" style="  width: 25%; font-size: 12px;"
                            id="searchOption" name="searchOption">
                        <option value="customer">고객사명</option>
                        <option value="product">제품명</option>
                        <option value="business">사업건 번호</option>
                    </select>
                    <div class="form-group">
                        <input type="text" id="myInput" onkeyup="myFunction()" class="form-control"
                               placeholder="Search">
                    </div>
                </form>

                <button class=" btn btn-default" id="btn1" disabled="disabled" onclick="selectDelete()"
                        style="margin-left: 5px;  float: right;">삭제
                </button>
                <button class="btn btn-default" style="float: right;"
                        onclick="location.href='http://localhost:8080/product/delivery/enroll'">추가
                </button>
            </ul>
        </div>


        <div class="panel-body">
            <table class="table table-hover" id="myTable" style="table-layout: fixed">
                <thead>
                <tr>
                    <th width="10%">사업건 번호</th>
                    <th width="10%">고객사</th>
                    <th width="15%">제품</th>
                    <th width="10%">수량</th>
                    <th width="15%">납품일</th>
                    <sec:authorize access="hasRole('ADMIN')">
                        <th width="3%"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll()">
                        </th>
                    </sec:authorize>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${deliveryList}" varStatus="status">
                    <tr>
                        <td>${item.deliveryBusinessNum}</td>
                        <td>${item.customerName}</td>
                        <td data-toggle="collapse" data-target="#${status.index}"
                            style="cursor: pointer;">${item.productName}</td>
                        <td>${item.deliveryQuantity}</td>
                        <td>${item.deliveryDate}</td>
                        <sec:authorize access="hasRole('ADMIN')">
                            <td><input type="checkbox" name="chBox" class="chBox"
                                       data-deliveryNum="${item.deliveryId}"/>
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

                    <c:if test="${item.productName eq 'ToS' || item.productName eq 'iGRIFFIN'}">
                        <tr class="p panel-collapse collapse" id="${status.index}">
                            <td colspan="5">
                                <div>
                                    <c:forEach var="item2" items="${osList}">
                                        <c:if test="${item.deliveryId eq item2.deliveryId}">
                                            <p>
                                                    ${item2.osName} : <span>${item2.osQuantity}</span>
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