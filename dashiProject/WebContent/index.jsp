<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList, com.dashi.adoptBoard.model.vo.AdoptNotice, com.dashi.adoptReviewBoard.model.vo.AdoptReview" %>   
 <%
 	//ArrayList<AdoptNotice> anList = (ArrayList<AdoptNotice>)request.getAttribute("anList");
 	ArrayList<AdoptReview> arlist = (ArrayList<AdoptReview>)request.getAttribute("arlist");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다시,사랑받개!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    .image-area{
        width: 700px;
        margin: auto;
    }
    .carousel-inner img {
    width: 100%;
    height: 100%;
  }

    /* 입양 공고 영역 스타일 */
    .adopt-area{
        width: 1100px;
        margin: auto;
        height: 220px;
    }
    .notice-box{
        width: 210px; 
        height: 220px;
        float: left;
        margin-left: 9px;
    }
    
    
    /*이미지 공통 사이즈*/
    .photo-area>img{
        width: 195px; 
        height: 200px;
    }

    /* 입양 후기 영역 스타일 */
    .review-area{
        width: 1100px;
        margin: auto;
        height: 200px;
    }
    .review-box{
   		width: 210px; 
        height: 220px;
        float: left;
        margin-left: 9px;
    }

    /* 입양공고,입양후기 타이틀 영역 스타일 */
    .title{ 
       margin-top: 50px;
       padding-left: 20px;
    }
    .title>a{
        margin-left: 50px;
        text-decoration: none;
        color: black;
        font-size: 25px;
    }
    .title>a:hover{
        text-decoration: none;
        color: black
    }
    
    /*글씨 중략해서 보여지게*/
     #noticeTitle{
        font-size: 14px; 
        width:180px;
        overflow: hidden;
        text-overflow: ellipsis; 
        white-space: nowrap;

    }
	
	.notice-box:hover{
		cursor: pointer;
	}
	
</style>
</head>
<body>

	<%@ include file="views/common/menubar.jsp" %>

    <div class="outer">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            
            <div class="carousel-inner" align="center">
                <div class="carousel-item active">
                    <img src="resources/images/testimg.jpg" alt="" style="width: 900px;">
                </div>
                <div class="carousel-item">
                    <img src="resources/images/testimg2.jpg" alt="" style="width: 900px;">
                </div>
                <div class="carousel-item">
                    <img src="resources/images/testimg3.jpg" alt="" style="width: 900px;">
                </div>
            </div>

            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <!-- 하단 타이틀 눌렀을 때 입양공고 메인페이지로 이동 -->
        <div class="title">
   		<a href="<%=contextPath %>/adlist.adt?cpage=1"><b>입양 공고</b></a>
   		</div>
        <hr style="width: 1100px; margin-top: 10px;">
        
       
        
        <!-- 하단 타이틀 눌렀을 때 입양후기 메인페이지로 이동 -->
        <div class="title">
        <a href="<%=contextPath%>/list.ar?cpage=1"><b>입양 후기</b></a>
        </div>
        <hr style="width: 1100px; margin-top: 10px;">
        
        <!-- 입양 후기 게시글 띄우는 영역 -->
        <div class="review-area">
            <div class="review-area">

                <div class="review-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
                <div class="review-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
                <div class="review-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
                <div class="review-box" align="center">
                    <div class="photo-area"></div>
                    <div>입양후기제목1</div>
                </div>
            </div>
        </div>
        <br><br>
    </div>

    <%@ include file="views/common/footerbar.jsp" %>
</body>
</html>