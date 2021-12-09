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

    /* 이미지 추가시 스타일 변경하기 */
    .image-area{
        width: 700px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }
    
    /* 카테고리별 검색 영역 */
    .search-area{
        margin-top: 40px; 
        width: 1100px;
    }
    #search-btn{
        border-radius: 5px;
        border: none;
        height: 32px;
    }
    #search-btn:hover{
        background: rgb(126, 126, 126);
    }

    /* 입양공고 리스트  */
    .content-area{
        width: 1000px;
        height: auto;
        margin: auto;
        margin-top: 10px;
    }

    /* 입양공고 하나 감싸는 div */
    .adoptnotice{
       margin-top: 10px;
       width: 245px; 
       height: 250px; 
       box-sizing: border-box;
       display: inline-block;
    }
    .adoptnotice img{width: 230px; height: 200px;}
    .adoptnotice #category{
        margin-left: 5px; 
        width: 50px; 
        font-weight: 700;
    }
    .adoptnotice span{font-size: 13px;}

    /* 입양공고이미지+제목 클릭시 효과 */
    .content-area>div:hover{
        cursor: pointer;
    }

</style>
</head>
<body>
	
	<!-- 지희 수정중  -->
	<!-- 사용자 입양공고리스트 조회페이지 -->
	
	<%@ include file="../common/menubar.jsp" %>

    <!-- 나중에 서블릿연결해서 form 추가하기!!  -->

    <div class="outer">

        <div class="image-area" align="center">
            <!-- 백그라운드 이미지 넣기 -->
            <h1 style="padding:120px">입양공고</h1>

        </div>
        
        <form action="">
            <div class="search-area" align="right">
                <select name="animal-category" style="height: 30px;">
                    <option value="dog">강아지</option>
                    <option value="cat">고양이</option>
                    <option value="etc">기타</option>
                </select>

                <input type="text" placeholder="검색어를 입력하세요.">
                
                <button id="search-btn">검색하기</button>

            </div>

            <!-- 5행4열 배치 -->
            <!-- 페이징바는 5개 -->
            <!-- 입양공고 리스트가 보여질 영역-->
            <div class="content-area" align="center">

                <!-- 리스트 하나 감싸는 div -->
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

                <!-- if - elif문 사용해서 카테고리 구분해서 표시하기 -->
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-warning">고양이</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-secondary">기타</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                


                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>
                
                <div class="adoptnotice" align="center">
                    <img src="입양공고의대표이미지url">
                    <span id="category" class="badge badge-success">강아지</span>
                    <span>[품종명][이름]의 가족을 기다려요</span>
                </div>

           </div>
                 
        </form>
    
        <br>
        <!--페이징바 영역-->
        <div align="center">
            <button class="btn btn-light">&lt;</button>

            <button class="btn btn-light">1</button>
            <button class="btn btn-light">2</button>
            <button class="btn btn-light">3</button>
            <button class="btn btn-light">4</button>
            <button class="btn btn-light">5</button>

            <button class="btn btn-light">&gt;</button>
        </div>
    </div>
	<br>
    <br><br><br><br>
	
    <%@include file="../common/footerbar.jsp" %>

    <script>
        // 나중에 수정하기!! => 글 번호에 맞춰서 연결하기
        $(function(){
            $(".content-area>div").click(function(){
                //const num = $(this).children().eq(0).text();
                // 콘솔에 출력해서 확인해보기

                // location.href = '<%= contextPath%>/addetail?adno='+num;
                location.href = '<%= contextPath%>/addetail';
            })
        })
    </script>
	
</body>
</html>