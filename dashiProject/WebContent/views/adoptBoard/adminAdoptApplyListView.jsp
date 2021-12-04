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

             <!-- 신청서리스트 보여줄 div -->
            <div class="content-area">
                
                <!-- 전체 제목 div -->
                <div class="title-area">   
                    입양신청 전체조회
                </div>
                
                <hr style="width: 900px;">
                
                <!-- 검색버튼 -->
                <div style="margin-left: 650px; width:300px;">
                    <input type="text" placeholder="검색어를 입력하세요.">
                                
                    <button class="btn-sm btn-secondary">검색하기</button>
                </div>
                
                <table align="center" class="table" style="width: 900px; text-align: center; margin-top: 20px;">
                    <thead class="thead-light">
                        <tr>
                            <th width="100">글번호</th>
                            <th width="100">카테고리</th>
                            <th width="300">공고제목</th>
                            <th width="140">신청인명</th>
                            <th width="150">신청일</th>
                            <th width="100">처리상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>입양완료</td>
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>입양완료</td>
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>입양완료</td>
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>입양완료</td>
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>입양완료</td>
                        </tr>
                        <tr>
                            <td>AN-029</td>
                            <td>고양이</td>
                            <td>샴 헤라의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>승인대기</td>
                        </tr>
                        <tr>
                            <td>AN-061</td>
                            <td>강아지</td>
                            <td>비숑 포포의의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-10-01</td>
                            <td>신청승인</td>
                        </tr>
                        <tr>
                            <td>AN-012</td>
                            <td>고양이</td>
                            <td>러시안블루 코시의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>반려</td>
                        </tr>
                        <tr>
                            <td>AN-021</td>
                            <td>고양이</td>
                            <td>먼치킨의 조이의 가족을 기다려요</td>
                            <td>XXX</td>
                            <td>2021-11-11</td>
                            <td>결제완료</td>
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>입양완료</td>
                        </tr>
                        </tbody>
                    </table>
                            
                    <!-- 페이징버튼 영역 -->
                    <div align="center">
                        <button class="btn btn-light">1</button>
                        <button class="btn btn-light">2</button>
                        <button class="btn btn-light">3</button>
                        <button class="btn btn-light">4</button>
                        <button class="btn btn-light">5</button>
                    </div>
                </div>
            </form>

    </div>
    <br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>