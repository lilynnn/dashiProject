<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.dashi.adoptBoard.model.vo.AdoptApply, com.dashi.adoptReviewBoard.model.vo.AdoptReview" %>
<%
	ArrayList<AdoptApply> adplist = (ArrayList<AdoptApply>)request.getAttribute("adplist");
	ArrayList<AdoptReview> arlist = (ArrayList<AdoptReview>)request.getAttribute("arlist");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
        width: 1100px;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        height:1000px
    }
    #mem-boardlist{
        background: rgb(32, 68, 28);
        color: orange;
    }
    /*게시판 이름*/
    #bo-name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    /*글쓴내역들*/
    #board-list{
        width: 1040px;
        margin: auto;
        margin-top: 40px;
    }
    #apply-list{
        width: 100%;
    }
    th{
        font-size: 20px;
        background: #eafcef;
        border-bottom: 1px solid gray;
    }
    /*메뉴바 색변경*/
    #boardlist-list{
    	font-weight:900px;
    	color:rgb(252, 186, 3);
    }
    #board-list>table>tbody>tr:hover{
        cursor: pointer;
    }
    
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<!--전체 div-->
	<div class="outer">

        <!--게시판 안내-->
        <div id="bo-name">
            	글쓴내역확인
        <hr>
        </div>
        
        <!--회원정보 메뉴바-->
        <div style="margin-left: 30px;">
            <%@ include file="../common/memberUpdateMenubar.jsp" %>
        </div>
    
        <!--글쓴내역 폼-->
        <div id="board-list">

            
            <!-- 입양신청서  영역 -->
            <table id="adopt-list" class="table table-hover" style="font-size:15px; line-hieght:100%">
                <thead>
	                <tr align="left">
	                    <th colspan="5">입양신청</th>
	                </tr>
					<!-- 
	                <tr style="background: white;">
	                    <td colspan="4"></td>
	                    <td align="center">
	                        <a href="">더보기▼</a>
	                    </td>
	                </tr>
	                 -->
	                <tr align="center">
	                    <td width="120">No.</td>
	                    <td width="500">제목</td>
	                    <td width="110">신청날짜</td>
	                    <td width="100">진행상태</td>
	                    <td width="100">삭제하기</td>
	                </tr>
				</thead>
	            <tbody>   
	                <!--글 없을때-->
	                <%if(adplist.isEmpty()) {%>
		                <tr align="center">
		                    <td colspan="5">작성한 게시글이 없습니다.</td>
		                </tr>
					<%} else {%>
		                <!--글 있을때-->
		                <%for(AdoptApply adp : adplist) {%>
		           
			                <tr align="center">
			                    <td><%=adp.getAalistNo() %></td>
			                    <td><%=adp.getAaTitle() %></td>
			                    <td><%=adp.getApplyDate() %></td>
			                    <%if(adp.getAdtStatus() == 1){ %>
				                    <td>승인대기</td>
				                    <td><a href="<%=contextPath%>/delete.adp?adpno=<%=adp.getAalistNo() %>" class="btn btn-sm btn-danger">삭제</a></td>
			                    <%} else if(adp.getAdtStatus() == 2) {%>
				                    <td>신청승인</td>
				                    <td><button class="btn btn-sm btn-danger" disabled>삭제</button></td>
			                    <%} else if(adp.getAdtStatus() == 3) {%>
			                    	<td>결제완료</td>
				                    <td><button class="btn btn-sm btn-danger" disabled>삭제</button></td>
			                    <%} else if(adp.getAdtStatus() == 4) {%>
			                    	<td>입양완료</td>
				                   <td><button class="btn btn-sm btn-danger" disabled>삭제</button></td>
			                    <%} else if(adp.getAdtStatus() == 5) {%>
			                    	<td>반려</td>
				                    <td><a href="<%=contextPath%>/delete.adp?adpno=<%=adp.getAalistNo() %>" class="btn btn-sm btn-danger">삭제</a></td>
			                    <%} %>
			                </tr>
		                <%} %>
	                <%} %>
            	</tbody>
            </table>
        
            <br><br>
            
            <table id="adopt-review" class="table table-hover" style="font-size:15px;">
                <thead>
	                <tr align="left">
	                    <th colspan="5">입양후기</th>
	                </tr>
	                <!--
	                <tr style="background: white;">
	                    <td colspan="4"></td>
	                    <td align="center">
	                        <a href="">더보기▼</a>
	                    </td>
	                </tr>
					-->
	                
	                <tr align="center">
	                    <td width="120">No.</td>
	                    <td width="750">제목</td>
	                    <td width="110">작성날짜</td>
	                    <td width="110">조회수</td>
	                    <td width="100">삭제하기</td>
	                </tr>
				</thead>
				<tbody>
	                <!--글 없을때-->
	                <%if(arlist.isEmpty()){ %>
	                <tr align="center">
	                    <td colspan="5">작성한 게시글이 없습니다.</td>
	                </tr>
	                <%} else{ %>
	                	<%for(AdoptReview ar : arlist){ %>
		                <!--글 있을때-->
		                <tr align="center">
		                    <td><%=ar.getArlistNo() %></td>
		                    <td><%=ar.getArTitle() %></td>
		                    <td><%=ar.getWriteDate() %></td>
		                    <td><%=ar.getViewCount() %></td>
		                    <td>
		                    <button onclick="location.href='<%=contextPath%>/delete.ar?arno=<%=ar.getArlistNo() %>'" class="btn btn-sm btn-danger">삭제</button>
		                    </td>
		                </tr>
		                <%}%>
		            <%}%>
                </tbody>
            </table>

            <br><br>
            
            <table id="adopt-list" class="table table-hover" style="font-size:15px;">
            	<thead>
            		<tr align="left">
	                    <th colspan="5">실종/보호</th>
	                </tr>
	                <tr style="background: white;">
	                    <td colspan="4"></td>
	                    <td align="center">
	                        <a href="">더보기▼</a>
	                    </td>
	                </tr>
	                <tr align="center">
	                    <td width="30">No.</td>
	                    <td width="30"></td>
	                    <td width="750">제목</td>
	                    <td width="110">작성날짜</td>
	                    <td width="110">조회수</td>
	                </tr>
            	</thead>
				<tbody>
	                <!--글 없을때-->
	                <tr align="center">
	                    <td colspan="5">작성한 게시글이 없습니다.</td>
	                </tr>
	
	                <!--글 있을때-->
	                <tr align="center">
	                    <td>1</td>
	                    <td>
	                        <input type="checkbox">
	                    </td>
	                    <td>여기는 제목자리</td>
	                    <td>2021-12-08</td>
	                    <td>123</td>
	                </tr>
                </tbody>
            </table>
        
        </div>
        
     </div>
	
	<script>
		$(function(){
			
			$("#adopt-list>tbody>tr").click(function(){
				console.log($(this).children().eq(0).text());
				location.href='<%=contextPath%>/detail.adp?adpno=' + $(this).children().eq(0).text();
			});
			

			
		})
	
	</script>
		
	
    <div style="margin-top: 700px;">
     <%@ include file="../common/footerbar.jsp"%>
    </div>
</body>
</html>