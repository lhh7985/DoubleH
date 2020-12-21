<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        function reloadPage() {
            location.reload();
        }
    </script>

</head>

<style>
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid #e3e6f0;
        border-radius: 0.35rem;
    }

    .card > hr {
        margin-right: 0;
        margin-left: 0;
    }

    .card > .list-group {
        border-top: inherit;
        border-bottom: inherit;
    }

    .card > .list-group:first-child {
        border-top-width: 0;
        border-top-left-radius: calc(0.35rem - 1px);
        border-top-right-radius: calc(0.35rem - 1px);
    }

    .card > .list-group:last-child {
        border-bottom-width: 0;
        border-bottom-right-radius: calc(0.35rem - 1px);
        border-bottom-left-radius: calc(0.35rem - 1px);
    }

    .card > .card-header + .list-group,
    .card > .list-group + .card-footer {
        border-top: 0;
    }

    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
        padding: 1.25rem;
    }


    .card-header {
        padding: 0.75rem 1.25rem;
        margin-bottom: 0;
        background-color: #f8f9fc;
        border-bottom: 1px solid #e3e6f0;
    }

    .card-header:first-child {
        border-radius: calc(0.35rem - 1px) calc(0.35rem - 1px) 0 0;
    }

    .mymargin {
        margin: 10px;
    }

    label {
        display: block;
        width: 100%;
        height: 34px;
        padding: 3px 6px;
        font-size: 15px;
        line-height: 1.42857143;
    }

</style>
<body>


<div class="container">
    <div class="card mb-4" style="margin-top:20px;">
        <div class="card-header">
            <h3 style="font-weight: bold;">Detail</h3>
        </div>

        <div class="card-body">
            <div class="row mymargin">
                <label class="col-md-1">고객사</label>
                <input class="col-md-2 form-control" style="width:15%;" value="${srvo.customerName }" disabled/>
                <input id="sr_id" value="${srvo.srId}" style="display: none">

                <label class="col-md-1" style="margin-left: 40px;">제품</label>
                <input class="col-md-2 form-control" style="width:10%;" value="${srvo.productName }" disabled/>

                <label class="col-md-1" style="margin-left: 40px;">유형</label>
                <input class="col-md-2 form-control" style=" width:15%;" value="${srvo.codeName }" disabled/>

                <label class="col-md-1" style="margin-left: 40px;">중요도</label>
                <input class="col-md-2 form-control" style="width:5%;" value="${srvo.importance}" disabled/>
            </div>


            <div class="row mymargin">

                <label class="col-md-1">요청일</label>
                <input class="col-md-2 form-control" style="width:15%;" value="${srvo.srRequestDate}" disabled/>

                <label class="col-md-1" style="margin-left: 40px;">등록자</label>
                <input class="col-md-2 form-control" style="width:15%;" value="${srvo.srRegistrant}" disabled/>

                <label class="col-md-1" style="margin-left: 40px;">등록일</label>
                <input class="col-md-2 form-control" style="width:15%;" value="${srvo.srRegistrationDate}" disabled/>
            </div>


            <div class="row mymargin" style="margin-top : 20px;">
                <label class="col-md-1">제목</label>
                <input class="col-md-4 form-control" style="width:50%;" value="${srvo.srTitle}" disabled/>

            </div>

            <div class="row mymargin">
                <label class="col-md-1">요구사항</label>
                <textarea class="col-md-9 form-control" style="width:80%;" rows="5" cols="150"
                          disabled>${srvo.srContent}</textarea>

            </div>
        </div>

    </div>


    <div class="card mb-4" style="margin-top: 20px;">
        <div class="card-header">
            <h2>활동</h2>
        </div>

        <div class="card-body">
            <table class="table">
                <thead>
                <tr>
                    <th width="10%">유형</th>
                    <th width="30%">제목</th>
                    <th width="10%">등록자</th>
                    <th width="15%">시작일</th>
                    <th width="15%">완료예정일</th>
                    <th width="10%">상태</th>

                </tr>
                </thead>

                <tbody class="panel table table-hover">
                <c:forEach var="item" items="${acvo}" varStatus="status">
                    <tr class="panel-heading">
                        <td>${item.codeName}</td>
                        <td data-toggle="collapse" data-target=".${status.index}"
                            style="cursor: pointer;">${item.activityTitle}</td>
                        <td>${item.activityRegistrant}</td>
                        <td>${item.activityRegistrationDate}</td>
                        <td>${item.activityEstimatedDate}</td>
                        <td>${item.activityStatus}</td>
                    </tr>


                    <tr class="panel-collapse collapse ${status.index}">
                        <td class="panel-body" colspan="7"><p
                                style="white-space:pre; margin-left: 20px;">${item.activityContent}</p>
                        </td>
                    </tr>

                    <tr class="panel-collapse collapse ${status.index} " style="background-color:lightgray">
                        <td colspan="7">
                            <div class=" col-sm-1" style="width: 80px;">완료일 :</div>
                            <div class="col-md-2">${item.activityCompletionDate }</div>

                        </td>

                    </tr>
                </c:forEach>


                </tbody>


            </table>
        </div>
    </div>

</div>
<div style="margin-bottom: 100px;"></div>
</div>

<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>