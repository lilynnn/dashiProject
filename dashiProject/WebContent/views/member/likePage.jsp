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
    /*각각의 리스트 스타일*/
    .likeList-area>.list{
        width: 250px;
        height: 300px;
        display:inline-block;
        margin-left: 17px;
    }
    /*동물사진의 스타일*/
    .animal-image{
        border: 1px solid rebeccapurple;
        width: 90%;
        height: 80%;
        margin: auto;
    }
    /*사진 밑에 동물종류 및 입양공고제목 정렬스타일*/
    .likeInfo{
        width: 90%;
        height: 40%;
        margin: auto;
        margin-top: 10px;
    }

    .likeInfo>div{
        display: inline-block;
    }



</style>
</head>
<body> 
    <%@ include file="../common/menubar.jsp" %>
   

    <div class="outer">
                <!--게시판 안내-->
                <div id="name">
                    찜하기
                    <hr>
                </div>
        
                <!--회원정보 메뉴바-->
                <div>
                    <%@ include file="../common/memberUpdateMenubar.jsp" %>
                </div>

                <!--전체 찜목록-->
                <div class="likeList-area">
                    
                    <!--하나의 찜--><!--클릭시 그 동물의 입양정보 나오게 하기-->
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="likeInfo">
                            <div class="animal-type">강아지</div>
                            <div class=title>입양공고제목</div>
                        </div>
                    </div>

                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="likeInfo">
                            <div class="animal-type">강아지</div>
                            <div class=title>입양공고제목</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="likeInfo">
                            <div class="animal-type">강아지</div>
                            <div class=title>입양공고제목</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="likeInfo">
                            <div class="animal-type">강아지</div>
                            <div class=title>입양공고제목</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="likeInfo">
                            <div class="animal-type">강아지</div>
                            <div class=title>입양공고제목</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="likeInfo">
                            <div class="animal-type">강아지</div>
                            <div class=title>입양공고제목</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="likeInfo">
                            <div class="animal-type">강아지</div>
                            <div class=title>입양공고제목</div>
                        </div>
        
                    </div>
                    
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="likeInfo">
                            <div class="animal-type">강아지</div>
                            <div class=title>입양공고제목</div>
                        </div>
                    </div>

                    <div class="paging-area" align="center" style="margin-top: 30px;">

                        <button>&lt;</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5</button>
                        <button>6</button>
                        <button>7</button>
                        <button>8</button>
                        <button>9</button>
                        <button>10</button>
                        <button>&gt;</button>
            
                    </div>
                    <br><br>


    </div>




    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>