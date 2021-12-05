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
    .title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        width: 950px;
    }
    
    .content-area{
         width: 950px;
         float: left;
         margin-left: 20px;
    }
    .table{
        text-align: center; 
        margin-top: 20px;
    }
    #search-btn{
        border-radius: 5px;
        border: none;
        height: 32px;
    }
    #search-btn:hover{
        background: rgb(126, 126, 126);
    }
</style>
</head>
<body>
    
    <!-- 지희 수정중  -->
	<!-- 관리자 입양공고리스트페이지  -->
	
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">

        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>

        <div class="content-area">

            <div class="title-area">
                입양공고 전체조회
            </div>
            <hr style="width: 950px;">

            <!-- 검색버튼 -->
            <div class="search-area" style="margin: 20px 0px; float: right;">
                <select name="search-category" style="height: 30px;">
                    <option value="">카테고리</option>
                    <option value="">동물품종</option>
                    <option value="">글번호</option>
                </select>

                <input type="text" placeholder="검색어를 입력하세요.">
                
                <button id="search-btn">검색하기</button>
            </div>

            <table align="center" class="table" style="width: 950px;">
                
                <thead class="thead-light">
                    <tr>
                        <th width="100">글번호</th>
                        <th width="90">카테고리</th>
                        <th width="300">공고제목</th>
                        <th width="120">작성자</th>
                        <th width="90">조회수</th>
                        <th width="120">등록일</th>
                        <th width="100">삭제하기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>AN-001</td>
                        <td>강아지</td>
                        <td>러시안블루 코시의 가족을 기다려요</td>
                        <td>admin01</td>
                        <td>88</td>
                        <td>2021-10-20</td>
                        <td>
                            <button class="btn btn-sm btn-light">삭제하기</button>
                        </td>
                    </tr>
                </tbody>  
            </table>

            <!-- 공지사항 등록하기 -->
            <button class="btn btn-success" style="float: right;">등록하기</button>
            
            <br>

             <!-- 페이징버튼 영역 -->
            <div align="center">
                <button class="btn btn-light">1</button>
                <button class="btn btn-light">2</button>
                <button class="btn btn-light">3</button>
                <button class="btn btn-light">4</button>
                <button class="btn btn-light">5</button>
            </div>

            <br><br>


        </div>

    </div>

</body>
</html>