<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    div{
        border:1px solid red;
    }
    .outer{
        border: 1px solid;
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        height: 1300px;
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
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
        border-bottom-left-radius: 3px;
        border-bottom-right-radius: 3px;
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

    .animal-image{
        border: 1px solid rebeccapurple;
        width: 90%;
        height: 60%;
        margin: auto;
    }
    .dpsInfo{
        border: 1px solid rgb(31, 202, 136);
        width: 90%;
        height: 40%;
        margin: auto;
    }
    .title{
        margin-top: 10px;
        margin-bottom: 20px;
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
            <div class="dsp"><a style="color:rgb(102,184,94);" href="">실종</a></div>
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

                <input type="text" placeholder="검색어를 입력하세요.">
                
                <button>검색하기</button>
            </form>
        </div>

        <div class="write"><button class="writeBt">글쓰기</button></div>

        <div class="dspList-area" style="border: 2px solid saddlebrown;" >
            
            <div class="list">
                <div class="animal-image">동물사진</div>
                <div class="dpsInfo">
                    <div class=title>[실종] 귀요미를 찾습니다.</div>
                    <div class="location">경기도 용인시</div>
                    <div class="content">이러쿵쿵이러ㅇㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄴㅇㄹ쿵저러쿵이러쿵저러쿵</div>
                </div>
            </div>
            <div class="list">
                <div class="animal-image">동물사진</div>
                <div class="dpsInfo">
                    <div class=title>[실종] 귀요미를 찾습니다.</div>
                    <div class="location">경기도 용인시</div>
                    <div class="content">이러쿵쿵이러ㅇㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄴㅇㄹ쿵저러쿵이러쿵저러쿵</div>
                </div>

            </div>
            <div class="list">
                <div class="animal-image">동물사진</div>
                <div class="dpsInfo">
                    <div class=title>[실종] 귀요미를 찾습니다.</div>
                    <div class="location">경기도 용인시</div>
                    <div class="content">이러쿵쿵이러ㅇㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄴㅇㄹ쿵저러쿵이러쿵저러쿵</div>
                </div>

            </div>
            <div class="list">
                <div class="animal-image">동물사진</div>
                <div class="dpsInfo">
                    <div class=title>[실종] 귀요미를 찾습니다.</div>
                    <div class="location">경기도 용인시</div>
                    <div class="content">이러쿵쿵이러ㅇㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄴㅇㄹ쿵저러쿵이러쿵저러쿵</div>
                </div>

            </div>
            <div class="list">
                <div class="animal-image">동물사진</div>
                <div class="dpsInfo">
                    <div class=title>[실종] 귀요미를 찾습니다.</div>
                    <div class="location">경기도 용인시</div>
                    <div class="content">이러쿵쿵이러ㅇㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄴㅇㄹ쿵저러쿵이러쿵저러쿵</div>
                </div>

            </div>
            <div class="list">
                <div class="animal-image">동물사진</div>
                <div class="dpsInfo">
                    <div class=title>[실종] 귀요미를 찾습니다.</div>
                    <div class="location">경기도 용인시</div>
                    <div class="content">이러쿵쿵이러ㅇㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄴㅇㄹ쿵저러쿵이러쿵저러쿵</div>
                </div>

            </div>
            <div class="list">
                <div class="animal-image">동물사진</div>
                <div class="dpsInfo">
                    <div class=title>[실종] 귀요미를 찾습니다.</div>
                    <div class="location">경기도 용인시</div>
                    <div class="content">이러쿵쿵이러ㅇㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄴㅇㄹ쿵저러쿵이러쿵저러쿵</div>
                </div>

            </div>
            <div class="list">
                <div class="animal-image">동물사진</div>
                <div class="dpsInfo">
                    <div class=title>[실종] 귀요미를 찾습니다.</div>
                    <div class="location">경기도 용인시</div>
                    <div class="content">이러쿵쿵이러ㅇㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄴㅇㄹ쿵저러쿵이러쿵저러쿵</div>
                </div>

            </div>
        </div>
        <div class="paging-area" align="center" style="margin-top: 30px;">

			아직 페이징바는 미완성 상태!
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
</body>
</html>