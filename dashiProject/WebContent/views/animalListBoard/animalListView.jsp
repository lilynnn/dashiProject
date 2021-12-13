<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #sel-animal{
        font-weight: 700;
        color:rgb(252, 186, 3);
    }

    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 30px;
        height: 2200px;
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
    #search-btn{
        border-radius: 5px;
        border: none;  
        height: 32px;
    }
    #search-btn:hover{
        background: rgb(126, 126, 126);
    }
    .table>tbody>tr:hover{
        cursor:pointer;
    }
</style>
</head>
<body>

    <!-- 동물목록 전체 조회하는 페이지 -->
    <%@ include file="../common/menubar.jsp" %>

    <!-- 전체영역 감싸는 div -->
    <div class="outer">

        <!-- 관리자 메뉴바 영역 -->
        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>

        <div class="content-area">
            <div class="title-area">
                전체동물 조회하기
            </div>
            <hr style="width: 950px;">

            <!-- 검색버튼 -->
            <div class="search-area" style="margin: 20px 0px; float: right;">
                <select name="search-category" style="height: 30px;">
                    <option value="">카테고리</option>
                    <option value="">동물품종</option>
                    <option value="">동물이름</option>
                </select>

                <input type="text" placeholder="검색어를 입력하세요.">
                
                <button id="search-btn">검색하기</button>
            </div>

            <table align="center" class="table" style="width: 950px; text-align: center;">
                <thead border="1" class="thead-light" style="font-size:14px;">
                    <tr>
                        <th width="150">입소번호</th>
                        <th width="100">카테고리</th>
                        <th width="200">동물품종</th>
                        <th width="200">동물이름</th>
                        <th width="200">입소일</th>
                        <th width="100">입양여부</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td>AM-001</td>
                        <td>강아지</td>
                        <td>포메라니안</td>
                        <td>포포</td>
                        <td>2020-10-01</td>
                        <td>N</td>
                    </tr>
                </tbody>

            </table>

            <br>

            <!-- 페이징버튼 영역 -->
            <div align="center">
                <button class="btn btn-light">&lt;</button>

                <button class="btn btn-light">1</button>
                <button class="btn btn-light">2</button>
                <button class="btn btn-light">3</button>
                <button class="btn btn-light">4</button>
                <button class="btn btn-light">5</button>

                <button class="btn btn-light">&gt;</button>
            </div>

            <br><br>
        </div>

    </div>

    <script>
        // 나중에 수정하기!! => 글 번호에 맞춰서 연결하기
        $(function(){
            $(".table>tbody>tr").click(function(){
                //const num = $(this).children().eq(0).text();
                // 콘솔에 출력해서 확인해보기

                // location.href = '<%= contextPath%>/addetail?adno='+num;
                location.href = '<%= contextPath%>/andetail.ad';
            })
        })
    </script>
	
</body>
</html>