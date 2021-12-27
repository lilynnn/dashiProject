<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.dashi.common.model.vo.PageInfo, java.util.ArrayList, com.dashi.adoptBoard.model.vo.AdoptNotice" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<AdoptNotice> adtList = (ArrayList<AdoptNotice>)request.getAttribute("list");
	String searchCtg = (String)request.getAttribute("searchCtg");
	String searchKey = (String)request.getAttribute("searchKey");
	
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
            <form action="<%=contextPath %>/adtsearch.ad" method="get">
            	<div class="search-area" style="margin: 20px 0px; float: right;">
                <select name="searchCtg" style="height: 30px;">
                    <option value="adtTitle">제목</option>
                    <option value="adtNo">글번호</option>
                    <option value="adtStatus">처리상태</option>
                </select>
				<input type="hidden" name="spage" value="1">
                <input type="text" name="searchKey" placeholder="검색어를 입력하세요.">
                
                <button type="submit" id="search-btn">검색하기</button>
            </div>
            </form>

            <table align="center" class="table" style="width: 950px; font-size:15px;">
                
                <thead class="thead-light">
                    <tr>
                        <th width="100">글번호</th>
                        <th width="90">카테고리</th>
                        <th width="270">공고제목</th>
                        <th width="90">조회수</th>
                        <th width="100">등록일</th>
                        <th width="80">입양여부</th>
                        <th width="100">삭제하기</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 게시글이 존재하지 않을 경우 -->
                    <%if(adtList.isEmpty()){ %>	
	                    <tr>
	                    	<td colspan="7" align="center">입양공고글이 존재하지 않습니다.</td>
	                    </tr>
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
		                        <%if(an.getAdtStatus() == 4) {%>
		                        입양완료
		                        <%} else if(an.getAdtStatus() == 2) {%>
		                        결제대기
		                        <%} else { %>
		                        --
		                        <%} %>
		                        </td>
		                        <td>

		                        
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
            <div align="center">
				
	       		<%if(currentPage != 1) {%>
	            	<button class="btn btn-light" onclick="location.href='<%= contextPath%>/adtsearch.adt?&searchCtg=<%=searchCtg%>&spage=<%=currentPage-1 %>&searchKey=<%=searchKey%>';">&lt;</button>
				<%} %>
				
				<% for(int p=startPage; p<=endPage; p++){ %>
					
					<%if(p == currentPage){ %>
						<button class="btn btn-light" disabled><%= p %></button>
					<%} else { %>
	            		<button class="btn btn-light" onclick="location.href='<%= contextPath %>/adtsearch.ad?searchCtg=<%=searchCtg%>&spage=<%=p%>&searchKey=<%=searchKey%>';"><%= p %></button>	
	            	<%} %>
	         	<%} %>	
	
				<%if(currentPage != maxPage) {%>
	         		<button class="btn btn-light" onclick="location.href='<%= contextPath %>/adtsearch.ad?searchCtg=<%=searchCtg%>&spage=<%=currentPage+1%>&searchKey=<%=searchKey%>';">&gt;</button>
	            <%} %>
	            
	        </div>
            <br><br>
	        

        </div>
	<%@ include file="../common/footerbar.jsp" %>
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