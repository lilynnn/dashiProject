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
    .title-area 

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
            <h3><b>입양 절차 안내</b></h3>

            <br>
            <hr style="width: 900px;">
        </div>

        <!-- 내용만 감싸는 div -->
        <div align="center" class="content-area">
            <br><br><br>
            <img src="<%=contextPath%>/resources/images/adopt/adoptProcedure1.png" style="width: 800px;">
            <img src="<%=contextPath%>/resources/images/adopt/adoptProcedure2.png" style="width: 800px;">
            <img src="<%=contextPath%>/resources/images/adopt/adoptProcedure3.png" style="width: 800px;">
            <img src="<%=contextPath%>/resources/images/adopt/adoptProcedure4.png" style="width: 800px;">
        </div>
        <br><br><br>
    </div>

    <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>