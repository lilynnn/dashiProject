<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.dashi.common.model.vo.PageInfo, java.util.ArrayList, com.dashi.adoptBoard.model.vo.AdoptNotice" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<AdoptNotice> adtList = (ArrayList<AdoptNotice>)request.getAttribute("adtList");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 관리자메뉴바 (입양공고) 효과 */
	#sel-adopt{
		font-weight: 700;
        color:rgb(252, 186, 3);
	}

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
    .table>tbody>tr:hover{
        cursor:pointer;
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
                        <th width="110">조회수</th>
                        <th width="120">등록일</th>
                        <th width="100">삭제하기</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 게시글이 존재하지 않을 경우 -->
                    <%if(adtList.isEmpty()){ %>
                    	<p>등록된 게시글이 없습니다.</p>
                    <%} else { %>
                 	<!-- 게시글 보여질 tr -->
	                 	<%for(AdoptNotice an : adtList) {%>
		                    <tr>
		                        <td><%= an.getAnlistNo() %></td>
		                        <td>
									<%if(an.getAnimalType().equals("D")) { %>
										강아지
									<%} else if(an.getAnimalType().equals("C")){ %>
										고양이
									<%} else {%>
										기타
									<%} %>
									
								</td>
		                        <td><%= an.getAnTitle() %></td>
		                        <td><%= an.getViewCount() %></td>
		                        <td><%= an.getWriteDate() %></td>
		                        <td>

		                        <!-- 관리자 로그인 페이지 완성되면 실행시켜보기!!! -->
		                        <!-- if(loginUser != null && loginUser.getUserId().startsWith("admin") ){ ===> /* < % 안에 넣어서 작업하기  -->
								<%if(loginAdmin != null) {%>
		                    	<a href="<%=contextPath %>/adtdelete.ad?adno=<%=an.getAnlistNo() %>" class="btn btn-sm btn-light">삭제하기</a>
								<%} %>
		                        </td>
		                    </tr>
	                    <%} %>
                   	<%} %>
                </tbody>  
            </table>

                         
            <br>

             <!--페이징바 영역-->
        <div align="center">
			
       		<%if(currentPage != 1) {%>
            	<button class="btn btn-light" onclick="location.href='<%= contextPath%>/adlist.ad?cpage=<%= currentPage-1 %>';">&lt</button>
			<%} %>
			
			<% for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
					<!-- p라는 숫자가 현재 보고있는 페이지와 동일할 경우 -->
					<button class="btn btn-light" disabled><%= p %></button>
				<%} else { %>
            		<button class="btn btn-light" onclick="location.href='<%= contextPath %>/adlist.ad?cpage=<%= p %>';"><%= p %></button>	
            	<%} %>
         	<%} %>	

			<%if(currentPage < maxPage) {%>
         		<button class="btn btn-light" onclick="location.href='<%= contextPath %>/adlist.ad?cpage=<%= currentPage+1%>';">&gt</button>
            <%} %>
            
        </div>
            <br><br>


        </div>

    </div>
    <script>

        $(function(){
            $(".content-area>table>tbody>tr").click(function(){
                //const num = $(this).children().eq(0).text();
                // 콘솔에 출력해서 확인해보기

            	console.log($(this).children().eq(0).text());
                location.href = '<%= contextPath%>/adtdetail.ad?adno='+$(this).children().eq(0).text();
               
            })
        })
    </script>
</body>
</html>