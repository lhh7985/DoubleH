<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>고객 정보수정</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/boots/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boots/css/sb-admin-2.min.css" rel="stylesheet">

    <script src ="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="/resources/js/jquery-1.11.0.min.js"></script>


    <script type="text/javascript">

        $(document).ready(function ($) {
            if ($("#customer").hasClass("active")) {
            } else {
                $(this).removeClass("active");
                $("#customer").addClass("active");
            }
        });

        //수정된 값이 있는지

        function modify_customer() {

            if ("<%= request.getParameter("customerName") %>" != document.getElementById('customer_name').value) {
                alert("업데이트");
            }
            if ("<%= request.getParameter("managerId") %>" != document.getElementById('manager_id').value) {
                document.getElementById('employee_id_manager').value = document.getElementById('manager_id').value;
            }
            if ("<%= request.getParameter("seId") %>" != document.getElementById('se_id').value) {
                document.getElementById('employee_id_se').value = document.getElementById('se_id').value;
            }
            if ("<%= request.getParameter("salesId") %>" != document.getElementById('sales_id').value) {
                document.getElementById('employee_id_sales').value = document.getElementById('sales_id').value;
            }
            if ("<%= request.getParameter("address") %>" != document.getElementById('address_address').value) {
                alert("업데이트");
            }
            if ("<%= request.getParameter("addrDetail") %>" != document.getElementById('address_detail').value) {
                alert("업데이트");
            }

            var forms = $("#modify_customer").serialize();
            $.ajax({
                url: "/customer/modify",
                type: "POST",
                data: forms,
                success: function (data) {
                    alert("수정되었습니다.")
                    location.href = "http://localhost:8080/customer/list";
                }
            });
        }


        function execPostCode() {
            new daum.Postcode(
                {
                    oncomplete: function (data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                + data.buildingName : data.buildingName);
                        }
                        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraRoadAddr !== '') {
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
                        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                        if (fullRoadAddr !== '') {
                            fullRoadAddr += extraRoadAddr;
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        console.log(data.zonecode);
                        console.log(fullRoadAddr);

                        $("[name=address_post]").val(data.zonecode);
                        $("[name=address_address]").val(fullRoadAddr);

                        document.getElementById('address_post').value = data.zonecode; //5자리 새우편번호 사용
                        document.getElementById('address_address').value = fullRoadAddr;
                        /* document.getElementById('address_detail').value = data.jibunAddress; */
                    }
                }).open();
        }


        function setChildValue(name, id) {
            document.getElementById("se").value = name;
            document.getElementById("se_id").value = id;
        };

        function setChildValue2(name, id) {
            document.getElementById("sales").value = name;
            document.getElementById("sales_id").value = id;
        };

        function setChildValue_other(name, id) {
            document.getElementById("manager").value = name;
            document.getElementById("manager_id").value = id;
        };

        var winRef;

        function search_emp_secuve() {
            href = "http://localhost:8080/search/se";
            if (!winRef) {
                winRef = window.open(href, "se_manager", 'width=800px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "se_manager", 'width=800px, height=600px,toolbars=no,scrollbars=no');
                }
            }

        }

        function search_emp_secuve2() {

            href = "http://localhost:8080/search/sales";
            if (!winRef) {
                winRef = window.open(href, "sales", 'width=800px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, "salse", 'width=800px, height=600px,toolbars=no,scrollbars=no');
                }
            }
        }

        function search_emp() {
            href = "http://localhost:8080/search/other";
            if (!winRef) {
                winRef = window.open(href, '_blank', 'width=800px, height=600px,toolbars=no,scrollbars=no');
            } else {
                if (winRef.closed == false) {
                    winRef.focus();
                } else {
                    winRef = window.open(href, '_blank', 'width=800px, height=600px,toolbars=no,scrollbars=no');
                }
            }
        }


    </script>
</head>
<style>


    .label1 {
        display: block;
        width: 100%;
        height: 42px;
        padding: 2px 10px;
        font-size: 16px;
        line-height: 2.567;
    }


</style>


<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <%@include file="../header.jsp" %>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-md-11">
                        <h6 class="m-0 font-weight-bold text-primary">고객사 정보수정</h6>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <form id="modify_customer" name="modify" method="post">

                    <div>
                        <!-- 몸통 -->
                        <div class="row text-center form-group" style="margin: 5px;">
                            <label class="col-md-2 label1 text-left" style=" width: 130px;">고객사명</label>
                            <input id="customer_name" class="col-md-3 form-control" style="height: 42px; width: 60%"
                                   type="text"
                                   value="<%= request.getParameter("customerName") %>"/>
                            <input id="customer_id" name="customerId" style="visibility: hidden;"
                                   value="<%= request.getParameter("customerId") %>"/>
                        </div>

                        <div class="row text-center form-group" style="margin: 5px;">
                            <label class="col-md-2 label1 text-left" style="width: 130px;">고객사담당자</label>
                            <input id="manager" class="col-md-4 form-control" style="height: 42px; width: 60%" readonly
                                   value="<%= request.getParameter("manager") %>"/>
                            <button style="margin-left:5px; height: 42px; width:40px;" type="button"
                                    class="col-xs-1 btn btn-outline-primary" onclick="search_emp()"><i
                                    class="fas fa-search fa-sm"></i></button>

                            <input type="text" id="manager_id" style="visibility: hidden;"
                                   value="<%= request.getParameter("managerId") %>"/>
                            <input id="employee_id_manager" name="employeeIdManager" style="visibility: hidden;"
                                   value='0'/>

                        </div>

                        <div class="row text-center" style="margin: 5px;">
                            <label class="col-md-2 label1 text-left" style="width: 130px;">SE담당자</label>
                            <input id="se" class="col-md-3 form-control" style="height: 42px; width: 60%" readonly
                                   value="<%= request.getParameter("se") %>"/>
                            <button style="margin-left:5px; height: 42px; width:40px;" type="button"
                                    class="col-xs-1 btn btn-outline-primary" onclick="search_emp_secuve();"><i
                                    class="fas fa-search fa-sm"></i></button>

                            <input type="text" id="se_id" style="visibility: hidden;"
                                   value="<%= request.getParameter("se_id") %>"/>
                            <input id="employee_id_se" name="employeeIdSe" style="visibility: hidden;" value='0'/>
                        </div>


                        <div class="row text-center" style="margin: 5px;">
                            <label class="col-md-2 label1 text-left" style="width: 130px;">영업담당자</label>
                            <input id="sales" class="col-md-3 form-control" style=" height: 42px;width: 60%;" readonly
                                   value="<%= request.getParameter("sales") %>"/>
                            <button style="margin-left:5px; height: 42px; width:40px;" type="button"
                                    class="col-xs-1 btn btn-outline-primary" onclick="search_emp_secuve2();"><i
                                    class="fas fa-search fa-sm"></i></button>

                            <input type="text" id="sales_id" style="visibility: hidden;"
                                   value="<%= request.getParameter("salesId") %>"/>
                            <input id="employee_id_sales" name="employeeIdSales" style="visibility: hidden;" value='0'/>
                        </div>


                        <br>


                        <div class="row text-center form-group" style="margin: 5px;">
                            <label class="col-md-2 label1 text-left" style="width: 130px;">주소</label>

                            <input class="col-md-2 form-control" style="height: 42px; width: 30%; display: inline;"
                                   placeholder="우편번호" name="addressPost" id="address_post"
                                   type="text" readonly="readonly" value="<%= request.getParameter("addrPost") %>"/>
                            <button style="margin-left:5px; height: 42px; width:100px;" type="button"
                                    class="col-md-1  btn btn-outline-primary" onclick="execPostCode();">
                                <i class="fa fa-search"></i> 우편검색
                            </button>

                        </div>


                        <div class="row text-center form-group" style="margin: 5px;">
                            <label class="col-md-2 label1" style="height: 42px;width: 130px;"></label>
                            <input class="form-control" style="height: 42px; width: 60%;" placeholder="도로명 주소"
                                   name="addressAddress" id="address_address" type="text"
                                   readonly="readonly" value="<%= request.getParameter("address") %>"/>
                        </div>


                        <div class="row text-center form-group" style="margin: 5px;">
                            <label class="col-md-2 label1" style="width: 130px;"></label>
                            <input class="form-control" placeholder="상세주소" style="height: 42px; width: 60%;"
                                   name="addressDetail" id="address_detail" type="text"
                                   value="<%= request.getParameter("addrDetail") %>"/>
                        </div>


                        <div class="col-md-11 text-center" style="margin-top: 15px;">
                            <input type="button" onclick="modify_customer()" class="btn btn-outline-primary" value="수정">
                            <input class="btn btn-outline-primary" type="button" onclick="history.back()" value="취소"/>
                        </div>
                    </div>

                </form>
            </div>
        </div>

    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/boots/vendor/jquery/jquery.min.js"></script>
<script src="/resources/boots/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/boots/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/boots/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/boots/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/boots/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/boots/js/demo/datatables-demo.js"></script>

</body>
</html>