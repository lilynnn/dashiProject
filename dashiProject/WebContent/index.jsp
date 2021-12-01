<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box;}
    
    /* 사진 넣고 나서 테두리 지우기~! */
    .image-area, .photo-area{
        border: 1px solid gray;
    }
    /* 메인페이지 전체 감싸는 div */
    .outer{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        padding-bottom: 80px;
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
        height: 220px;
    }
    .area-box{
        width: 210px; 
        height: 220px;
        float: left;
        margin-left: 9px;
    }
    .photo-area{
        width: 195px; 
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
       margin-top: 50px;
       padding-left: 20px;
    }
    .title{
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
        
        <!-- 하단 타이틀 눌렀을 때 입양공고 메인페이지로 이동 -->
        <div class="title">입양 공고</div>
        <hr style="width: 1100px; margin-top: 10px;">
        
        <!-- 입양 공고 게시글 띄우는 영역 -->
        <div class="adopt-area">
            <div class="area-box" align="center">
                <div class="photo-area"></div>
                <div>입양공고제목1</div>
            </div>
            <div class="area-box" align="center">
                <div class="photo-area"></div>
                <div>입양공고제목1</div>
            </div>
            <div class="area-box" align="center">
                <div class="photo-area"></div>
                <div>입양공고제목1</div>
            </div>
            <div class="area-box" align="center">
                <div class="photo-area"></div>
                <div>입양공고제목1</div>
            </div>
            <div class="area-box" align="center">
                <div class="photo-area"></div>
                <div>입양공고제목1</div>
            </div>
        </div>
        
        <!-- 하단 타이틀 눌렀을 때 입양후기 메인페이지로 이동 -->
        <div class="title">입양 후기</div>
        <hr style="width: 1100px; margin-top: 10px;">
        
        <!-- 입양 후기 게시글 띄우는 영역 -->
        <div class="review-area">
            <div class="adopt-area">
                <div class="area-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
                <div class="area-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
                <div class="area-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
                <div class="area-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
                <div class="area-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
            </div>
        </div>
    
    </div>

    <%@ include file="views/common/footerbar.jsp" %>
</body>
</html>