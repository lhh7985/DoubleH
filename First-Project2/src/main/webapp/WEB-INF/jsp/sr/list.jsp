<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hello test</title>


    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/resources/jqgrid/css/ui.jqgrid.css">

<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--%>
<%--    <script src="resource/jqgrid/js/jquery.jqGrid.min.js"></script>--%>


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
                    checkarr.push($(this).attr("data-srNum"));
                });

                $.ajax({
                    url: "/sr/delete",
                    type: "POST",
                    data: {chbox: checkarr},
                    success: function (result) {
                        if (result == 1) {
                            location.href = "/sr";
                        } else {
                            alert("삭제 실패");
                        }
                    }
                })

            }

        }


        function detail(srId) {
            $.ajax({
                type: 'GET',
                url: '/sr/detail?srId=' + srId,
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:"
                        + request.responseText + "\n" + "error:"
                        + error);
                },
                success: function (data) {
                    location.href = "http://localhost:8080/sr/detail?srId=" + srId;
                }
            });
        }

        var winRef;

        function sr_detail(srId) {

            var _width = '1200';
            var _height = '900';

            // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
            var _left = Math.ceil((window.screen.width - _width) / 2);
            var _top = Math.ceil((window.screen.width - _height) / 2);


            href = "http://localhost:8080/sr/detail?srId=" + srId;
            if (!winRef) {
                $.ajax({
                    type: 'GET',
                    url: '/sr/detail?srId=' + srId,
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" + "message:"
                            + request.responseText + "\n" + "error:"
                            + error);
                    },
                    success: function (data) {
                        winRef = window.open(href, "detail", 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top);
                    }
                });
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    $.ajax({
                        type: 'GET',
                        url: '/sr/detail?srId=' + srId,
                        error: function (request, status, error) {
                            alert("code:" + request.status + "\n" + "message:"
                                + request.responseText + "\n" + "error:"
                                + error);
                        },
                        success: function (data) {
                            winRef = window.open(href, "detail", 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top);
                        }
                    });
                }
            }

        }

        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                if ($("select option:selected").val() == 'type') {
                    td = tr[i].getElementsByTagName("td")[0];
                } else if ($("select option:selected").val() == 'customer') {
                    td = tr[i].getElementsByTagName("td")[1];
                } else if ($("select option:selected").val() == 'product') {
                    td = tr[i].getElementsByTagName("td")[2];
                } else if ($("select option:selected").val() == 'title') {
                    td = tr[i].getElementsByTagName("td")[3];
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
        function fn_paging(page) {
            location.href = "/sr/list?page=" + page;
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
    <div class="font2">SR</div>

    <div class="panel with-nav-tabs panel-default" style="margin-top: 10px; min-height: 600px;">
        <div class="panel-heading">
            <ul class="nav nav-tabs">

                <form class="navbar-form col-md-3" role="search" style="width: 45%; margin-top:7px;">
                    <select class=" form-control" style="  width: 25%; font-size: 12px;" id="searchOption"
                            name="searchOption">
                        <option value="type">구분</option>
                        <option value="customer">고객사명</option>
                        <option value="product">제품명</option>
                        <option value="title">제목</option>
                    </select>
                    <div class="form-group">
                        <input type="text" id="myInput" onkeyup="myFunction()" class="form-control"
                               placeholder="Search">
                    </div>
                </form>

                <button class="btn btn-default" id="btn1" onclick="selectDelete()" disabled="disabled"
                        style="margin-left: 5px; float: right;">삭제
                </button>
                <button class="btn btn-default" style="float: right;"
                        onclick="location.href='http://localhost:8080/sr/enroll'">추가
                </button>
            </ul>
        </div>


        <div class="panel-body">
            <table class="table table-hover " id="myTable" style="table-layout: fixed">
                <thead>
                <tr>
                    <th width="5%">구분</th>
                    <th width="10%">고객사</th>
                    <th width="8%">제품</th>
                    <th width="30%">제목</th>
                    <th width="5%">중요도</th>
                    <th width="10%">요청일자</th>
                    <th width="8%">상태</th>
                    <sec:authorize access="hasRole('ADMIN')">
                        <th width="3%"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll()">
                        </th>
                    </sec:authorize>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${srList}">
                    <tr>
                        <td>${item.codeName}</td>
                        <td style="cursor: pointer;" onclick="detail('${item.srId}')" )>${item.customerName}</td>
                        <td style="cursor: pointer;" onclick="detail('${item.srId}')" )>${item.productName}</td>
                        <td style="cursor: pointer;" onclick="detail('${item.srId}')" )>${item.srTitle}</td>
                        <td>${item.importance}</td>
                        <td>${item.srRequestDate}</td>
                        <td>${item.srStatus}</td>
                        <sec:authorize access="hasRole('ADMIN')">
                        <td><input type="checkbox" name="chBox" class="chBox" data-srNum="${item.srId}"/>
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