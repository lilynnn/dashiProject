<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.dashi.common.model.vo.PageInfo, java.util.ArrayList, com.dashi.animalListBoard.model.vo.Animal" %>  
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Animal> list = (ArrayList<Animal>)request.getAttribute("list");
	
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
    #sel-animal{
        font-weight: 700;
        color:rgb(252, 186, 3);
    }

    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 30px;
        height: auto
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
                    <option value="">강아지</option>
                    <option value="">고양이</option>
                    <option value="">기타</option>
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
                
                	<%for(Animal a : list) { %>
	                    <tr>
	                        <td><%=a.getEntNo() %></td>
	                        <td>
	                        <%if(a.getAnimalType().equals("D")) {%>
	                        	강아지
	                        <%}else if(a.getAnimalType().equals("C")){ %>
	                        	고양이
	                        <%} else { %>
	                        	기타
	                        <%} %>
	                        </td>
	                        <td><%=a.getAnimalVariety() %></td>
	                        <td><%=a.getAnimalName() %></td>
	                        <td><%=a.getEntDate() %></td>
	                        <td><%=a.getAdoptStatus() %></td>
	                    </tr>
                    <%} %>
                    
                </tbody>

            </table>

            <br>

            <!-- 페이징버튼 영역 -->
            <div align="center">
				
	       		<%if(currentPage != 1) {%>
	            	<button class="btn btn-light" onclick="location.href='<%= contextPath%>/anlist.ad?cpage=<%= currentPage-1 %>';">&lt</button>
				<%} %>
				
				<% for(int p=startPage; p<=endPage; p++){ %>
					
					<%if(p == currentPage){ %>
						<!-- p라는 숫자가 현재 보고있는 페이지와 동일할 경우 -->
						<button class="btn btn-light" disabled><%= p %></button>
					<%} else { %>
	            		<button class="btn btn-light" onclick="location.href='<%= contextPath %>/anlist.ad?cpage=<%= p %>';"><%= p %></button>	
	            	<%} %>
	         	<%} %>	
	
				<%if(currentPage < maxPage) {%>
	         		<button class="btn btn-light" onclick="location.href='<%= contextPath %>/aanlist.ad?cpage=<%= currentPage+1%>';">&gt</button>
	            <%} %>
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
				console.log($(this).children().eq(0).text());
                // location.href = '<%= contextPath%>/addetail?adno='+num;
               location.href = '<%= contextPath%>/andetail.ad?ano='+$(this).children().eq(0).text();
            })
        })
    </script>
	
</body>
</html>