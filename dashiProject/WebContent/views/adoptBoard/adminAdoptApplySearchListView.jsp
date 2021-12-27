<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.dashi.common.model.vo.PageInfo, java.util.ArrayList, com.dashi.adoptBoard.model.vo.AdoptApply" %>
<%
	ArrayList<AdoptApply> list = (ArrayList<AdoptApply>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
    /* 관리자메뉴바 스타일 */
    #adoptApply a{
        font-weight: 700;
        color: rgb(252, 186, 3);
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
    #adoptApply{
        font-weight: 700;
        color:rgb(252, 186, 3);
    }

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

          <!-- 신청서리스트 보여줄 div -->
          <div class="content-area">

              <div class="title-area">
                  입양신청서 전체조회
              </div>
              <hr style="width: 950px;">

              <!-- 검색버튼 -->
              <div class="search-area">
	              <form action="<%=contextPath %>/adpsearch.ad" method="get">
	                  <select name="searchCtg" style="height: 30px;">
	                      <option value="adpNo">입양신청번호</option>
	                      <option value="adtNo">공고번호</option>
	                      <option value="userId">아이디</option>
	                  </select>
	
	                  <input type="text" name="searchKey" placeholder="검색어를 입력하세요">
                      <input type="hidden" name="spage" value="1">
	                  <button id="search-btn" type="submit">검색하기</button>
	              </form>
              </div>
			
             <!-- 신청내역 보여질 table -->
             <table id="list-area" align="center" class="table" style="width: 950px; font-size: 15px;">          
                 <thead class="thead-light">
                     <tr>
                         <th width="100">글번호</th>
                         <th width="100">공고번호</th>
                         <th width="290">공고제목</th>
                         <th width="100">신청인</th>
                         <th width="100">신청일</th>
                         <th width="120">처리상태</th>
                         <th width="100">삭제하기</th>
                     </tr>
                 </thead>
                 <tbody>
                 <%if(list.isEmpty()) {%> 
			  	 	<tr>
	                 	<td colspan="7" align="center">입양신청글이 존재하지 않습니다.</td>
	             	</tr>
				 <%} else { %> 
	                  	<%for(AdoptApply ap : list) { %>
	                  	<tr>
	                     	<input type="hidden" name="aalistNo" value="<%=ap.getAalistNo() %>">
	                  		<input type="hidden" name="anlistNo" value="<%=ap.getAnlistNo() %>">
	                  		<input type="hidden" name="memNo" value="<%=ap.getMemNo() %>">
	                     		
	                     	<td><%=ap.getAalistNo() %></td>
							<td><%=ap.getAnlistNo() %></td>
	                        <td><%=ap.getAaTitle() %></td>
	                        <td><%=ap.getMemId() %></td>
	                        <td><%=ap.getApplyDate() %></td>
	                        <td>
	                          	<%if(ap.getAdtStatus() == 1 ) {%>
	                              	<span class="badge badge-secondary" style=" width:60px; font-weight: 700;">승인대기</span>
	                          	<%} else if(ap.getAdtStatus() == 2) {%>
	                          	 	<span class="badge badge-warning" style=" width:60px; font-weight: 700;">결제대기</span>
	                          	<%} else if(ap.getAdtStatus() == 3) {%>
	                          		<span class="badge badge-danger" style=" width:60px; font-weight: 700;">결제완료</span> 
	                          	<%} else if(ap.getAdtStatus() == 4) {%>
	                          		<span class="badge badge-success" style=" width:60px; font-weight: 700;">입양완료</span>
	                          	<%} else {%>
	                          		<span class="badge badge-dark" style=" width:60px; font-weight: 700;">반려</span>
	                          	<%} %>
	                          </td>   
	                          
	                          <td>
	                          	<a href="<%=contextPath %>/adpdelete.ad?adno=<%=ap.getAalistNo() %>" class="btn btn-sm btn-light">삭제하기</a>
	                          </td>
	                      </tr>
	                  	<%} %>
	                  </tbody>  
	              </table>
				<%} %>
	            
              <br>

              <br><br>

			<div align="center">
				
	       		<%if(currentPage != 1) {%>
	            	<button class="btn btn-light" onclick="location.href='<%= contextPath%>/adpsearch.adt?&searchCtg=<%=searchCtg%>&spage=<%=currentPage-1 %>&searchKey=<%=searchKey%>';">&lt;</button>
				<%} %>
				
				<% for(int p=startPage; p<=endPage; p++){ %>
					
					<%if(p == currentPage){ %>
						<button class="btn btn-light" disabled><%= p %></button>
					<%} else { %>
	            		<button class="btn btn-light" onclick="location.href='<%= contextPath %>/adpsearch.ad?searchCtg=<%=searchCtg%>&spage=<%=p%>&searchKey=<%=searchKey%>';"><%= p %></button>	
	            	<%} %>
	         	<%} %>	
	
				<%if(currentPage < maxPage) {%>
	         		<button class="btn btn-light" onclick="location.href='<%= contextPath %>/adpsearch.ad?searchCtg=<%=searchCtg%>&spage=<%=currentPage+1%>&searchKey=<%=searchKey%>';">&gt;</button>
	            <%} %>
	            
	        </div>
		</div>

    </div>
    <script>
        $(function(){
            $("#list-area>tbody>tr").click(function(){
				console.log($(this).children().eq(0).val());
            	const key = $(this).children().eq(0).val();
                location.href="<%=contextPath%>/adpdetail.ad?apno="+key;
           
            })
            
        })
                
    </script>
</body>
</html>