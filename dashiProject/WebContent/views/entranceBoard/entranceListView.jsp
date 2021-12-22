<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*outer 스타일*/
    .outer{
        
        width: 1100px;
        margin: auto;
        margin-top: 50px;

    }
    /*찜하기 스타일*/
    #name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    /* 전체 찜리스트를 감싸는 div*/
    .likeList-area{
        width: 1140px;
        margin: auto;
        margin-top: 20px;
    }
    #category{
        margin-left: 5px; 
        width: 50px; 
        font-weight: 700;
    }
    /*각각의 리스트 스타일*/
    .likeList-area>.list{
        width: 250px;
        height: 300px;
        display:inline-block;
        margin-left: 17px;
    }


    /*사진 밑에 동물종류 및 입양공고제목 정렬스타일*/

    .likeList-area .list{
        display: inline-block;
    }

    .img-wrap {
    overflow: hidden;
  }
    
    .list:hover img{
        cursor: pointer;
        transform: scale(1.05);
        transition-duration: 0.3s;
        /* 이게 크롬에서 실행 할수 있게
        -webkit-transition-duration: 0.3s;*/
    }    
    .list:hover p{
        cursor: pointer;
        text-decoration: underline;
 
    }

    /*pagingbar*/
    .paging-area{
        width: 100%;
        margin-top: 30px;
    }
    .paging-area>button{
    	border-radius:3px;
    	border:none;
    }
    



</style>
</head>
<body> 
    <%@ include file="../common/menubar.jsp" %> 
   

    <div class="outer">
                <!--게시판 안내-->
                <div id="name">
                    	입소신청목록
                    <hr>
                </div>
        
                <!--회원정보 메뉴바-->
                <div>
                    <%@ include file="../common/memberUpdateMenubar.jsp" %>
                    <br><br>
                </div>

                <!--전체 찜목록-->
                <div class="likeList-area">
                    
                    <!--for문 돌려서 여러개 만들거임--> 
                    <!--클릭시 그 찜한 동물페이지 넘어가게끔-->
                    <div class="list">
                        <div class="img-wrap">
                            <img src="" width="250" height="260">
                        </div>
                        <p>
                            <span id="category" class="badge badge-success">강아지</span> 
                            <span>[품종명][이름]의 가족을 기다려요</span>
                        </p>
                    </div>


                </div>   

                <div class="paging-area" align="center">

                    <button class="btn btn-light">&lt;</button>
                    <button class="btn btn-light">1</button>
                    <button class="btn btn-light">2</button>
                    <button class="btn btn-light">3</button>
                    <button class="btn btn-light">4</button>
                    <button class="btn btn-light">5</button>
                    <button class="btn btn-light">&gt;</button>
        
                </div>



    </div>
    <br><br><br><br>




    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>