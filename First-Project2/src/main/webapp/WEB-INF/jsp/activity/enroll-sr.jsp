<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SR밑에 활동추가</title>


    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet"
          href="/resources/bootstrap/css/bootstrap-theme.css">

    <script src="/resources/js/jquery-1.11.0.min.js"></script>


    <script type="text/javascript">

        function activity1() {
            var add = document.add;
            var chck;


            var activity_status = add.activityStatus.value;
            var type = add.type.value;
            // var activity_registrationDate = add.activityRegistrationDate.value;
            var activity_estimatedDate = add.activityEstimatedDate.value;
            var title = add.activityTitle.value;
            var content = add.activityContent.value;


            if (!activity_status || !type || !title || !content || !activity_estimatedDate) {
                alert("정보를 입력해주세요.");
            } else {
                var forms = $("#add").serialize();
                $.ajax({
                    url: "/activity/enroll/sr",
                    type: "POST",
                    data: forms,
                    success: function (data) {
                        opener.reloadPage();
                        self.close();
                    }
                });

            }

        }


    </script>
    <style>

        input {
            size: 50px;
        }

        .my {
            font: bold;
            font-size: 15px;
            text-align: left;
        }

        .font2 {
            font-size: 50px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 50px;
        }

    </style>

</head>
<body>


<div class="container">
    <form id="add" name="add" method="POST">
        <div>
            <h1 class="font2">활동 추가</h1>
        </div>
        <!-- 몸통 -->
        <div class="row" style="margin-left:20px;">
            <label class="col-md-2 my" style="width: 120px;">유형</label>
            <select name="type" id="type" style="height: 30px;" class="col-md-2">
                <option>신규</option>
                <option>이슈</option>
            </select>

            <input id="sr_id" name="srId" value="${srId}" style="visibility: hidden;"/>

        </div>

        <div class="row" style="margin-top: 20px; margin-left:20px;">
            <label class="col-md-2 my" style="width: 120px;  ">상태</label>
            <select name="activityStatus" id="activity_status" style="height: 30px;" class="col-md-2">
                <option>진행중</option>
                <option>완료</option>
            </select>

            <label class="my" style="width: 120px;  margin-left:50px;">완료예정일</label>
            <input type="date" id="activity_estimatedDate" name="activityEstimatedDate">

        </div>


        <div style="margin: 20px; margin-top:50px;">
            <label class="col-md-1 my">제목</label>
            <input type="text" name="activityTitle" id="activity_title" size="90px;">
        </div>

        <div style="margin: 20px; margin-top:30px;">
            <label class="col-md-1 my">내용</label>

            <textarea name="activityContent" id="activity_content" rows="12" cols="100"></textarea>

        </div>

        <div style="margin-left: 400px; margin-top: 30px;">
            <input class="btn btn-default" type="button" onclick="activity1()" value="등록">

            <input class="btn btn-default" type="reset" value="취소"/>
        </div>

    </form>

</div>

<div style="margin-bottom: 50px;"></div>

</body>
</html>