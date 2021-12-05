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

             <!-- 입양후기리스트 보여줄 div -->
            <div class="content-area">
                
                <!-- 전체 제목 div -->
                <div class="title-area">   
                    전체회원 조회
                </div>
                
                <hr style="width: 900px;">
                
                <!-- 검색버튼 -->
                <div style="margin-left: 650px; width:300px;">
                    <select name="grade">
                        <option value="silver">실버</option>
                        <option value="gold">골드</option>
                        <option value="diamond">다이아</option>
                        <option value="blacklist">블랙리스트</option>
                        <option value="delete">탈퇴</option>
                        <option selected>선택안함</option>
                    </select>
                    <input type="text" placeholder="검색어를 입력하세요.">
                                
                    <button class="btn-sm btn-secondary">검색하기</button>
                </div>
                
                <table align="center" class="table" style="width: 900px; text-align: center; margin-top: 20px;" border="1">
                    <thead class="thead-light">
                        <tr>
                            <th width="25">no</th>
                            <th width="80">이름</th>
                            <th width="80">아이디</th>
                            <th width="80">생년월일</th>
                            <th width="200">주소</th>
                            <th width="80">휴대폰</th>
                            <th width="50">입양신청</th>
                            <th width="50">결제여부</th>
                            <th width="50">회원등급</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>5</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>980929</td>
                            <td>부산광역시</td>
                            <td>010-1234-1234</td>
                            <td>신청</td>
                            <td>미납</td>
                            <td>
                                <select name="grade">
                                    <option value="silver">실버</option>
                                    <option value="gold">골드</option>
                                    <option value="diamond">다이아</option>
                                    <option value="blacklist">블랙리스트</option>
                                    <option value="delete">탈퇴</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>980929</td>
                            <td>부산광역시</td>
                            <td>010-1234-1234</td>
                            <td>신청</td>
                            <td>미납</td>
                            <td>
                                <select name="grade">
                                    <option value="silver">실버</option>
                                    <option value="gold">골드</option>
                                    <option value="diamond">다이아</option>
                                    <option value="blacklist">블랙리스트</option>
                                    <option value="delete">탈퇴</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>980929</td>
                            <td>부산광역시</td>
                            <td>010-1234-1234</td>
                            <td>신청</td>
                            <td>미납</td>
                            <td>
                                <select name="grade">
                                    <option value="silver">실버</option>
                                    <option value="gold">골드</option>
                                    <option value="diamond">다이아</option>
                                    <option value="blacklist">블랙리스트</option>
                                    <option value="delete">탈퇴</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>980929</td>
                            <td>부산광역시</td>
                            <td>010-1234-1234</td>
                            <td>신청</td>
                            <td>미납</td>
                            <td>
                                <select name="grade">
                                    <option value="silver">실버</option>
                                    <option value="gold">골드</option>
                                    <option value="diamond">다이아</option>
                                    <option value="blacklist">블랙리스트</option>
                                    <option value="delete">탈퇴</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>980929</td>
                            <td>부산광역시</td>
                            <td>010-1234-1234</td>
                            <td>신청</td>
                            <td>미납</td>
                            <td>
                                <select name="grade">
                                    <option value="silver">실버</option>
                                    <option value="gold">골드</option>
                                    <option value="diamond">다이아</option>
                                    <option value="blacklist">블랙리스트</option>
                                    <option value="delete">탈퇴</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>XXX</td>
                            <td>OOO</td>
                            <td>980929</td>
                            <td>부산광역시</td>
                            <td>010-1234-1234</td>
                            <td>신청</td>
                            <td>미납</td>
                            <td>
                                <select name="grade">
                                    <option value="silver">실버</option>
                                    <option value="gold">골드</option>
                                    <option value="diamond">다이아</option>
                                    <option value="blacklist">블랙리스트</option>
                                    <option value="delete">탈퇴</option>
                                </select>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                            
                    <!-- 페이징버튼 영역 -->
                    <div align="center">
                        <button class="btn btn-light">&lt;</button>
                        <button class="btn btn-light">1</button>
                        <button class="btn btn-light">2</button>
                        <button class="btn btn-light">3</button>
                        <button class="btn btn-light">4</button>
                        <button class="btn btn-light">&gt;</button>
                    </div>
                </div>
            </form>
    </div>
    <br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>