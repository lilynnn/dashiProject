<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .outer{
        width: 1200px;
        height: 800px;
        margin: auto;
        margin-top: 30px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    
    .content-area{
         width: 850px;
         float: left;
         margin-left: 20px;
    }
    .title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }
    .tbody>tr{
        border-bottom: solid 1px gray;
    }
    .btn{
        border: none;
        background: rgb(102,184,94);
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }
    .page{
        border: none;
        background: lightgray;
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 30px;
        width: 30px;
        border-radius: 9px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <!-- 전체 영역 감싸는 div -->
    <div class="outer">
            <!-- 관리자 메뉴바 영역-->

        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>
        
        <form action="">

             <!-- 입양후기리스트 보여줄 div -->
            <div class="content-area">
                
                <!-- 전체 제목 div -->
                <div class="title-area">   
                    입양후기 관리
                </div>
                
                <hr style="width: 900px;">
                <br><br><br>
                
                <!-- 검색버튼 -->
                <div style="margin-left: 550px; width:400px;">
                    <select name="animal">
                        <option value="dog">강아지</option>
                        <option value="cat">고양이</option>
                        <option value="etc">기타</option>
                        <option selected>선택안함</option>
                    </select>
                    <input type="text" placeholder="검색어를 입력하세요.">
                                
                    <button  style="border: none; width: 70px; height: 30px; border-radius: 8px;">검색하기</button>
                </div>
                
                <table align="center" class="table" style="width: 900px; height: 250px; text-align: center; margin-top: 20px; border-collapse: collapse;">
                    <thead style="background: rgb(214, 235, 241);">
                        <tr>
                            <th width="25"></th>
                            <th width="25">no</th>
                            <th width="100">아이디</th>
                            <th width="100">닉네임</th>
                            <th width="100">분류</th>
                            <th width="300">제목</th>
                            <th width="50">조회수</th>
                            <th width="110">등록일</th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <tr>
                            <!--체크박스 수정 필요!!!!!!!!!!!!-->
                            <td><input type="checkbox" id="check" name="post" value="check"></td>
                            <td>1</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>강아지</td>
                            <td>입양후기 제목1</td>
                            <td>10</td>
                            <td>YYYY-MM-DD</td>
                        </tr>
                        <tr>
                            <!--체크박스 수정 필요!!!!!!!!!!!!-->
                            <td><input type="checkbox" id="check" name="post" value="check"></td>
                            <td>1</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>강아지</td>
                            <td>입양후기 제목1</td>
                            <td>10</td>
                            <td>YYYY-MM-DD</td>
                        </tr>
                        <tr>
                            <!--체크박스 수정 필요!!!!!!!!!!!!-->
                            <td><input type="checkbox" id="check" name="post" value="check"></td>
                            <td>1</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>강아지</td>
                            <td>입양후기 제목1</td>
                            <td>10</td>
                            <td>YYYY-MM-DD</td>
                        </tr>
                        <tr>
                            <!--체크박스 수정 필요!!!!!!!!!!!!-->
                            <td><input type="checkbox" id="check" name="post" value="check"></td>
                            <td>1</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>강아지</td>
                            <td>입양후기 제목1</td>
                            <td>10</td>
                            <td>YYYY-MM-DD</td>
                        </tr>
                        <tr>
                            <!--체크박스 수정 필요!!!!!!!!!!!!-->
                            <td><input type="checkbox" id="check" name="post" value="check"></td>
                            <td>1</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>강아지</td>
                            <td>입양후기 제목1</td>
                            <td>10</td>
                            <td>YYYY-MM-DD</td>
                        </tr>
                        </tbody>
                    </table>
                    <br><br><br>
                            
                    <!-- 페이징버튼 영역 -->
                    <div align="center">
                        <button class="page">&lt;</button>
                        <button class="page">1</button>
                        <button class="page">2</button>
                        <button class="page">3</button>
                        <button class="page">4</button>
                        <button class="page">&gt;</button>
                    </div>
                </div>
                <!--삭제하기 버튼-->
                <div align="right">
                    <button class="btn">삭제</button>
                </div>
            </form>

    </div>
    <br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>