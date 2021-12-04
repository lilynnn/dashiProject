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
        margin: auto;
        margin-top: 50px;
        height:800px
    }
    .outer>div{
        float: left; 
        box-sizing: border-box;
    }
    /*회원정보수정*/
    #name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

	 <!--전체 div-->
	<div class="outer">

        <!--게시판 안내-->
        <div id="name">
            회원정보수정
            <hr>
        </div>

    </div>
</body>
</html>