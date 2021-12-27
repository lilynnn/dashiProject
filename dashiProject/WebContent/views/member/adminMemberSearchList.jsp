<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dashi.common.model.vo.PageInfo, java.util.ArrayList, com.dashi.member.model.vo.Member" %>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
	
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
    .page:hover{
        background: gray;
        cursor: pointer;
    }
    .btn:hover{
        color:black;
        cursor:pointer;
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
                    전체회원 조회
                </div>
                
                <hr style="width: 900px;">
                
                <!-- 검색버튼 -->
                <div style="margin-left: 600px; width:450px;">
                    <!--
                    <select name="grade">
                        <option value="silver">실버</option>
                        <option value="gold">골드</option>
                        <option value="diamond">다이아</option>
                        <option value="delete">탈퇴</option>
                        <option selected>선택안함</option>
                    </select>
                    -->
                    <form action="<%=contextPath%>/searchmem.ad" method="post">
                    	<input type="text" name="searchmem" placeholder="이름을 입력하세요." value="<%=keyword %>" required>
                    	<input type="hidden" name="spage" value="1">
                    	<button type="submit">검색</button>
                    </form>
                                
                  
                </div>

                
                <table align="center" class="table" style="width: 900px; height: 250px; text-align: center; margin-top: 20px; border-collapse: collapse; font-size: 13px;">
                    <thead style="background: rgb(214, 235, 241);">
                        <tr>
                            <th width="8">no</th>
                            <th width="50">이름</th>
                            <th width="30">아이디</th>
                            <th width="40">생년월일</th>
                            <th width="150">주소</th>
                            <th width="100">휴대폰</th>
                            <th width="60">입양신청</th>
                            <th width="60">결제여부</th>
                            <th width="60">회원등급</th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="9">조회된 회원이 없습니다.</td>
                    	</tr>
                    <% }else{ %>
                    	<% for(Member m : list){ %>
                        <tr>
                            <td><%= m.getMemNo() %></td>
                            <td><%= m.getMemName() %></td>
                            <td><%= m.getMemId() %></td>
                            <td><%= m.getBirth() %></td>
                            <td><%= m.getAddress() %>&nbsp;<%= m.getAddressDetail() %></td>
                            <td><%= m.getPhone() %></td>
                            <td><%= m.getAdoptYN() %></td>
                            <td><%= m.getPayYN() %></td>
                            
                            <td>
                                <select name="grade">
                                    <option value="silver">
                                        <% if(m.getGrade() == 1){ %>
                                                    실버
                                        <% }else if(m.getGrade() == 2){ %>
                                                    골드
                                            <% }else if(m.getGrade() == 3){ %>
                                                    다이아
                                            <% } %>
                                    </option>
                                    <option value="gold">골드</option>
                                    <option value="diamond">다이아</option>
                                </select>
                            </td>
	                            <!--
			                    <% if(m.getGrade() == 1){ %>
			                    <td>
										실버
								</td>		
			                    <% }else if(m.getGrade() == 2){ %>
			                    <td>
			                        	골드
			                    </td>    	
			                    <% }else if(m.getGrade() == 3){ %>
			                    <td>
			                        	다이아
			                    </td>    	
			                    <% }else if(m.getGrade() == 9){ %>
			                    <td>
			                        	탈퇴
			                    </td>    	
			                    <% } %>
                            -->
                        </tr>
                        <% } %>	
					<% } %>
                    </tbody>
                    </table>
                    
                    
                    
                    <br>
                    <!--수정하기 버튼-->
                    <div align="right">
                        <!--클릭 시 alert창 발생-->
                        <button id="update-grade">등급 변경</button>
                    </div>
                    <br>
                    <script>
			        	$(function(){
			        		$("#update-grade").click(function(){
			        			var result = confirm('등급을 변경하시겠습니까?');
	                    		if(result){
		                    		alert('회원 등급이 변경되었습니다.');
	                    		}else{
	                    			
	                    		}
			        		})
			        	})
			        </script>                
                            
                    <!-- 페이징버튼 영역 -->
                    <div align="center">
                    	<% if(currentPage != 1) { %>
                        <button class="page" onclick="location.href='<%=contextPath%>/searchmem.ad?searchmem=<%=keyword%>&spage=<%=currentPage-1%>';">&lt;</button>
                        <% } %>
                        
                        <% for(int p=startPage; p<=endPage; p++){ %>
                        	<% if(p == currentPage){ %>
                        	<button class="page" disabled style="background:gray;"><%= p %></button>
                        	<% } else { %>
                        	<button class="page" onclick="location.href='<%=contextPath%>/searchmem.ad?searchmem=<%=keyword%>&spage=<%=p%>';"><%=p%></button>
                        	<% } %>
                        <% } %>
                        
                        <% if(currentPage != maxPage){ %>
                        <button class="page" onclick="location.href='<%=contextPath%>/searchmem.ad?searchmem=<%=keyword%>&spage=<%=currentPage+1%>';">&gt;</button>
                        <% } %>
                    </div>
                    <br>
                    <div style="width:100%; margin-top:30px;" align="center">
        				<a href="<%=contextPath%>/memberlist.ad?cpage=1" class="btn btn-sm btn-outline-secondary">목록으로</a>
        			</div>
        			<br>
                </div>
            
    </div>
    <br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>