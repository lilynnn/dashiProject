<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 영역 구분하려고 작성! 수정할 거 없으면지우기!!! */
    .image-area,.adopt-area,.review-area,.title{border: 1px solid black;}

    /* 메인페이지 전체 감싸는 div */
    .outer{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        padding-bottom: 60px;
        border: 1px solid red;
    }

    /* 메인 이미지 영역 스타일 */
    /* 어떤 사진 들어갈지 몰라서 임의대로 작성 
       사진크기에 맞춰 수정하기 */
    .image-area{
        width: 800px;
        height: 400px;
        margin: auto;
    }

    /* 입양 공고 영역 스타일 */
    .adopt-area{
        width: 1100px;
        margin: auto;
        height: 200px;
    }

    /* 입양 후기 영역 스타일 */
    .review-area{
        width: 1100px;
        margin: auto;
        height: 200px;
    }

    /* 입양공고,입양후기 타이틀 영역 스타일 */
    .title{ 
       margin-top: 30px;
    }
    .title a{
        margin-left: 50px;
        text-decoration: none;
        color: rgb(42, 43, 42);
        font-size: 25px;
    }
    .title a:hover{
        text-decoration: none;
        color: rgb(42, 43, 42);
    }

</style>
</head>
<body>

	<%@ include file="views/common/menubar.jsp" %>

    <div class="outer">

        <!-- 메인이미지(강아지 사진 등) 영역 -->
        <div class="image-area">
            세경님네 귀여운 댕댕이 사진
        </div>
        
        <!-- 하단 a태그 눌렀을 때 입양공고 메인페이지로 이동 -->
        <div class="title"><a href="">입양 공고</a></div>
        <hr style="width: 1100px; margin-top: 10px;">
        
        <!-- 입양 공고 게시글 띄우는 영역 -->
        <div class="adopt-area"></div>
        
        <!-- 하단 a태그 눌렀을 때 입양후기 메인페이지로 이동 -->
        <div class="title"><a href="">입양 후기</a></div>
        <hr style="width: 1100px; margin-top: 10px;">
        
        <!-- 입양 후기 게시글 띄우는 영역 -->
        <div class="review-area"></div>
    
    </div>

    <%@ include file="views/common/footerbar.jsp" %>
</body>
</html>