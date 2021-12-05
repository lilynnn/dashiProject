<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
        width: 1100px;
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    /*왼쪽메뉴바*/
    #munubar{width:200px}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<!--전체를 감싸는 큰 div-->
    <div class="outer">
    
    	<div id="menubar">
    		<%@ include file="../admin/adminMenubar.jsp" %>
    	</div>

        <!--관리자 공지사항 상세페이지-->
        <div id="">

                <div id="title">
                    	공지사항
                <hr>
                </div>

		</div>

	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>
	

</body>
</html>