<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>코드테이블 수정</title>


    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet"
          href="/resources/bootstrap/css/bootstrap-theme.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


    <script type="text/javascript">
        var winRef;

        function code_enroll() {
            href = "http://localhost:8080/admin/enroll";
            if (!winRef) {
                winRef = window.open(href, "codetable", 'width=500px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "codetable", 'width=500px, height=600px,toolbars=no,scrollbars=no');
                }
            }

            window.close();
        }


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
                    checkarr.push($(this).attr("data-codeNum"));
                });

                $.ajax({
                    url: "/admin/codetable/delete",
                    type: "POST",
                    data: {chbox: checkarr},
                    success: function (result) {
                        if (result != 0) {
                            location.href = "/admin/codetable";
                        } else {
                            alert("삭제 실패");
                        }
                    }
                })

            }

        }

        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                if ($("select option:selected").val() == 'code_group') {
                    td = tr[i].getElementsByTagName("td")[1];
                } else if ($("select option:selected").val() == 'code_upper') {
                    td = tr[i].getElementsByTagName("td")[2];
                } else if ($("select option:selected").val() == 'code_name') {
                    td = tr[i].getElementsByTagName("td")[3];
                } else if ($("select option:selected").val() == 'code_status') {
                    td = tr[i].getElementsByTagName("td")[4];
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
            location.href = "/admin/codetable?page=" + page;
        }

    </script>
</head>
<style>
    .font2 {
        font-size: 40px;
        font-weight: bold;
    }

    .label1 {
        display: block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        font-size: 15px;
        line-height: 1.42857143;
    }
</style>
<body>
<div>
    <div>
        <jsp:include page="../header.jsp"/>
    </div>
</div>


<div class="container">


    <div class="font2">코드테이블 목록</div>

    <div class="panel with-nav-tabs panel-default" style="margin-top: 10px; min-height: 600px;">
        <div class="panel-heading">
            <ul class="nav nav-tabs">
                <form class="navbar-form col-md-3" role="search" style="width: 45%; ">
                    <select class=" form-control" style=" width: 25%; font-size: 12px;" id="searchOption"
                            name="searchOption">
                        <option value="code_group">코드그룹</option>
                        <option value="code_upper">상위코드</option>
                        <option value="code_name">코드명</option>
                        <option value="code_status">코드상태</option>
                    </select>
                    <div class="form-group">
                        <input type="text" id="myInput" onkeyup="myFunction()" class="form-control"
                               placeholder="Search">
                    </div>
                </form>

                <button class="btn btn-default" id="btn1" style="margin-left: 5px;  float: right;"
                        onclick="selectDelete()" disabled="disabled">선택 삭제
                </button>
                <button class="btn btn-default" style="float: right;" onclick="code_enroll()" ;>
                    추가
                </button>
            </ul>
        </div>


        <div class="panel-body">
            <table class="table table-hover" id="myTable" style="table-layout: fixed">
                <thead>
                <tr>
                    <th width="10%">코드ID</th>
                    <th width="10%">코드그룹</th>
                    <th width="15%">상위코드</th>
                    <th width="10%">코드명</th>
                    <th width="15%">코드상태</th>
                    <th width="3%"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll()"></th>

                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${list}" varStatus="status">
                    <tr>
                        <td>${item.codeId}</td>
                        <td>${item.codeGroup}</td>
                        <td>${item.codeUpper}</td>
                        <td>${item.codeName}</td>
                        <td>${item.codeStatus}</td>
                        <td><input type="checkbox" name="chBox" class="chBox" data-codeNum="${item.codeId}"/>
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