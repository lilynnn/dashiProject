<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        border: 1px solid black;
        width: 1100px;
        margin: auto;
        margin-top: 50px;
        height:1000px
    }
    #name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }

    .dspList-area{
        width: 1140px;
        margin: auto;
        margin-top: 30px;
        
    }

    .dspList-area>.list{
        width: 250px;
        height: 400px;
        display:inline-block;
        margin-left: 17px;a♡
    }

    .animal-image{
        border: 1px solid rebeccapurple;
        width: 90%;
        height: 60%;
        margin: auto;
    }
    .dpsInfo{
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
                <!--게시판 안내-->
                <div id="name">
                    찜하기
                    <hr>
                </div>
        
                <!--회원정보 메뉴바-->
                <div>
                    <%@ include file="../common/memberUpdateMenubar.jsp" %>
                </div>

                <!--찜목록-->
                <div class="dspList-area">
            
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="dpsInfo">
                            <div class=title>[실종] 귀요미를 찾습니다.</div>
                        </div>
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="dpsInfo">
                            <div class=title>[보호] 귀요미를 찾습니다.</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="dpsInfo">
                            <div class=title>[실종] 귀요미를 찾습니다.</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="dpsInfo">
                            <div class=title>[목격] 귀요미를 찾습니다.</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="dpsInfo">
                            <div class=title>[목격] 귀요미를 찾습니다.</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="dpsInfo">
                            <div class=title>[보호] 귀요미를 찾습니다.</div>
                        </div>
        
                    </div>
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="dpsInfo">
                            <div class=title>[실종] 귀요미를 찾습니다.</div>
                        </div>
        
                    </div>
                    
                    <div class="list">
                        <div class="animal-image">동물사진</div>
                        <div class="dpsInfo">
                            <div class=title>[보호] 귀요미를 찾습니다.</div>
                        </div>
                    </div>


    </div>




    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>