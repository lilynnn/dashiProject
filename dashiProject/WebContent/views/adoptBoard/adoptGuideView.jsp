<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 감싸는 div */
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
    }
	.title-area{margin-top: 80px;}

    .content-area{width: 1170px; margin: auto; border: 1px solid;}
    .content-area>img{margin: auto;}
</style>
</head>
<body>
    <!-- 지희 작업 중 -->
    <!-- 입양절차안내페이지 -->
    
    <%@ include file="../common/menubar.jsp" %>

    <!-- 전체 감싸는 div -->
    <div class="outer">
        <div class="title-area" align="center">
            <h4><b>입양 절차 안내</b></h4>

            <br>
            <hr style="width: 900px;">
        </div>

        <!-- 내용만 감싸는 div -->
        <div align="center" class="content-area">
            <br><br><br>
            <img src="<%= contextPath%>/resources/images/adopt/adoptProcedureGuide.png" style="width: 900px;">
            <br><br>
            <img src="<%= contextPath%>/resources/images/adopt/adoptExpenseNotice.png" style="width: 850px;">
            <br><br><br><br>
            <img src="<%= contextPath%>/resources/images/adopt/adoptnotice.png" style="width: 600px;">

        </div>

    </div>

</body>
</html>