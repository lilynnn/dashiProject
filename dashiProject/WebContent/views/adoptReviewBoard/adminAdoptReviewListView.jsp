<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dashi.common.model.vo.PageInfo, java.util.ArrayList, com.dashi.adoptReviewBoard.model.vo.AdoptReview" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<AdoptReview> list = (ArrayList<AdoptReview>)request.getAttribute("list");
	
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
    .outer{
        width: 1100px;
        height: 1000px;
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
    .table{
        font-size: 13px;
    }
    .table>tbody tr:hover{
        background: rgb(233, 231, 231);
        cursor: pointer;
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
        
        

             <!-- 입양후기리스트 보여줄 div -->
            <div class="content-area">
                
                <!-- 전체 제목 div -->
                <div class="title-area">   
                    입양후기 관리
                </div>
                
                <hr style="width: 900px;">
                <br>
                
                <!-- 검색버튼 -->
                <div style="margin-left: 530px; width:450px;">
                    <select name="animal">
                        <option value="dog">강아지</option>
                        <option value="cat">고양이</option>
                        <option value="etc">기타</option>
                        <option selected>선택안함</option>
                    </select>
                    <input type="text" placeholder="검색어를 입력하세요.">
                                
                    <button>검색하기</button>
                </div>
                
                <table align="center" class="table" style="width: 900px; height: 250px; text-align: center; margin-top: 20px; border-collapse: collapse; font-size: 13px;">
                    <thead style="background: rgb(214, 235, 241);">
                        <tr>
                            <th width="25"></th>
                            <th width="80">no</th>
                            <th width="100">아이디</th>
                            <th width="100">닉네임</th>
                            <th width="100">분류</th>
                            <th width="300">제목</th>
                            <th width="100">조회수</th>
                            <th width="110">등록일</th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="9">조회된 게시글이 없습니다.</td>
                    	</tr>
                    <% }else{ %>
                    	<% for(AdoptReview ar : list){ %>
                        <tr>
                        <input type="hidden" value="<%= ar.getArlistNo()%>"></input>
                            <!--체크박스 수정 필요!!!!!!!!!!!!-->
                            <td><input type="checkbox" class="check" value="<%= ar.getArlistNo() %>"></td>
                            <td class="arno"><%= ar.getArlistNo() %></td>
                            <td><%= ar.getMemId() %></td>
                            <td><%= ar.getNickname() %></td>
                            <td><%= ar.getAnType() %></td>
                            <td><%= ar.getArTitle() %></td>
                            <td><%= ar.getViewCount() %></td>
                            <td><%= ar.getWriteDate() %></td>
                        </tr>
                        <% } %>	
					<% } %>
                        </tbody>
                    </table>
                
                
                <!--삭제하기 버튼-->
                <div align="right">
                    <button id="revdelete">삭제</button>
                </div>
                
                    <br><br><br>
                            
                    <!-- 페이징버튼 영역 -->
                    <div align="center">
                    	<% if(currentPage != 1) { %>
                        <button class="page" onclick="location.href='<%=contextPath%>/reviewlist.ad?cpage=<%=currentPage-1%>';">&lt;</button>
                        <% } %>
                        
                        <% for(int p=startPage; p<=endPage; p++){ %>
                        	<% if(p == currentPage){ %>
                        	<button class="page" disabled style="background:gray;"><%= p %></button>
                        	<% } else { %>
                        	<button class="page" onclick="location.href='<%=contextPath%>/reviewlist.ad?cpage=<%=p%>';"><%=p%></button>
                        	<% } %>
                        <% } %>
                        
                        <% if(currentPage != maxPage){ %>
                        <button class="page" onclick="location.href='<%=contextPath%>/reviewlist.ad?cpage=<%=currentPage+1%>';">&gt;</button>
                        <% } %>
                    </div>
                </div>
                

     
    </div>
    <script>
        $(function(){
            $(".table>tbody>tr").click(function(){
                location.href="<%=contextPath%>/reviewdetail.ad?arno=" + $(this).children("input").val();
            })
        })
    </script>
    <br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>