<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    .outer{

        margin: auto;
        margin-top: 50px;
        width: 1200px;
        height: auto;
    }
    .image-area{
        width: 1100px;
        height: 110px;
        margin: auto;
        border: 1px solid black;
    }
    .dsp{
        display: table-cell;
        width: 60px;
        height: 50px;
    }
    .dsp a{
        text-decoration: none;
        color: black;
        font-size: 22px;
        font-weight: bold;
        line-height: 50px;
    }
    .dsp-nav a:hover{
        color:rgb(102,184,94);
    }

    .search-area{
        text-align: right;
        width: 1150px;
        margin-top: 30px;
    }
    .write{
        text-align: right;
        width: 135px;
        margin-top: 30px;
    }
    .writeBt{
        border: none;
        background: rgb(102,184,94);
        color: white;
        width: 80px;
        height: 35px;
        font-size: 15px;
        font-weight: bold;
        border-radius: 3px;
    }

    .dspList-area{
        width: 1150px;
        margin: auto;
        margin-top: 30px;
        
    }

    .dspList-area>.list{
        width: 250px;
        height: 400px;
        display:inline-block;
        margin-left: 25px;
        margin-bottom: 25px;
    }


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <div class="image-area" >
            이미지
        </div>
        
        <div class="dsp-nav" align="center" style="margin-top:30px;">
            <div class="dsp"><a href=""style="color:rgb(102,184,94);">실종</a></div>
            <div class="dsp"><a href="">보호</a></div>
            <div class="dsp"><a href="">목격</a></div>
        </div>


        <div class="search-area">
            <form action="">

                <select name="animal-category">
                    <option value="dog">강아지</option>
                    <option value="cat">고양이</option>
                    <option value="etc">기타</option>
                </select>

                <input type="search" placeholder="검색어를 입력하세요.">
                
                <button>검색하기</button>
            </form>
        </div>

        <div class="write"><button class="writeBt">글쓰기</button></div>

        <div class="dspList-area">


            <!--for문 돌려서 썸네일 여러개 만들거임-->

            <div class="list">
                <img src="" width="250" height="260">
                <p>
                    [보호] 귀요미를 찾습니다<br><br>
                    경기도 용인시 <br>
                    내용은 대충 이러쿵 저러쿵
                </p>
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
    </div>

    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>