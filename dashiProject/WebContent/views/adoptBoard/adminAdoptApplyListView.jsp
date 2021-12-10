<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 관리자메뉴바 스타일 */
    #adoptApply a{
        font-weight: 700;
        /*background: rgb(32,68,28);*/
    }

    /* 전체 감싸는 div */
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

    /* 관리자메뉴바 (입양신청) 효과 */


    /* 입양신청서 전체조회 title */
    .title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        width: 950px;
    }
    
    /* 타이틀, 검색버튼, table, paging bar 감싸는 div */
    .content-area{
         width: 950px;
         float: left;
         margin-left: 20px;
    }
    .search-area{
        margin: 20px 0px; 
        float: right;
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
    .table>tbody>tr:hover{
        cursor: pointer;
    }
</style>
</head>
<body>
    
	<!-- 지희 수정중  -->
	<!-- 관리자 입양신청리스트페이지  -->
	
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">

        <!-- 관리자 메뉴바 영역-->
        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>
        
        <form action="">

            <!-- 신청서리스트 보여줄 div -->
            <div class="content-area">

                <div class="title-area">
                    입양신청서 전체조회
                </div>
                <hr style="width: 950px;">

                <!-- 검색버튼 -->
                <div class="search-area">
                    <select name="search-category" style="height: 30px;">
                        <option value="">카테고리</option>
                        <option value="">동물품종</option>
                        <option value="">글번호</option>
                        <option value="">신청인아이디</option>
                    </select>

                    <input type="text" placeholder="검색어를 입력하세요.">
                    
                    <button id="search-btn">검색하기</button>
                </div>

                <!-- 처리상태에 따라 뱃지 바꿔서보여지게 -->
                <!-- else if사용 -->
                <!-- 신청내역 보여질 table -->
                <table id="list-area" align="center" class="table" style="width: 950px;">
                    
                    <thead class="thead-light">
                        <tr>
                            <th width="130">글번호</th>
                            <th width="100">카테고리</th>
                            <th width="300">공고제목</th>
                            <th width="120">신청인</th>
                            <th width="150">신청일</th>
                            <th width="120">처리상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>
                                <span class="badge badge-secondary" style=" width:60px; font-weight: 700;">승인대기</span>
                            </td>   
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>
                                <span class="badge badge-warning" style=" width:60px; font-weight: 700;">결제대기</span>
                            </td>
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>
                                <span class="badge badge-danger" style=" width:60px; font-weight: 700;">결제완료</span> 
                            </td>
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>
                                <span class="badge badge-success" style=" width:60px; font-weight: 700;">입양완료</span>
                            </td>
                        </tr>
                        <tr>
                            <td>AN-001</td>
                            <td>강아지</td>
                            <td>포메라니안 여름이의 가족을 기다려요</td>
                            <td>OOO</td>
                            <td>2021-11-01</td>
                            <td>
                                <span class="badge badge-dark" style=" width:60px; font-weight: 700;">반려</span>
                            </td>
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
                            <td>비숑 포포의 가족을 기다려요</td>
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
        </form>
    </div>
    <script>
        $(function(){
            $("#list-area>tbody>tr").click(function(){
                location.href="<%=contextPath%>/adapplydetail.ad";
            })
        })
    </script>
</body>
</html>