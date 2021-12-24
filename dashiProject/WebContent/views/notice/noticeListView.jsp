<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.notice.model.vo.Notice, com.dashi.common.model.vo.*, java.util.ArrayList"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
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
        margin: auto;
        height:1600px;
    }
    .outer>div{
        float: left; 
        box-sizing: border-box;
    }
    /*대표이미지부분*/
    #image{
        width: 700px;
        height: 350px;
        margin-bottom: 20px;
        margin-top:50px;
    }
    /*공지사항~확인해보세요div*/
    #name, #serve, #meno{margin-top: 10px; height: 50px;}
    #name{
        width: 110px;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    #serve{
        width: 900px;
        color: darkgray;
        line-height: 60px;
    }
    #meno{width: 100%;}
    /*공지사항 목록*/
    #list>table{
        text-align: center;
    }
    thead>tr{height: 30px;}
    #noticeInNotice>td{font-weight: bolder;}
    /*pagingbar*/
    .paging-area{
        width: 100%;
        margin-top: 30px;
    }
    .paging-area>button{
    	border-radius:3px;
    	border:none;
    }
    .table-hover>tbody>tr:hover{
    	cursor:pointer;
    }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
    <%@ include file="../common/menubar.jsp" %>


    <!--전체 div-->
	<div class="outer">

        <!--image부분-->
        <div id="image" style="margin-left:200px; margin-right:100px">
            <img alt="낮잠자는 고양이" src="<%=contextPath%>/resources/images/noticeMainPhoto.jpg" width="100%" height="100%">
        </div>

        <!--게시판 안내-->
        <div id="name">
            공지사항
        </div>
        <div id="serve">| 공지사항</div>
        <div id="meno">
            다시, 사랑받개의 공지사항을 확인해보세요!
        </div>

        <!--공지사항 리스트-->
        <div id="list">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th width="80px">번호</th>
                        <th width="80px"></th>
                        <th width="650px">제목</th>
                        <th width="140px">날짜</th>
                        <th width="120px">조회수</th>
                    </tr>
                </thead>
                <tbody>
                	
                	<% if(list.isEmpty()){ %>
	                    <!--공지글 없을 때-->
	                    <tr>
	                        <td colspan="5">게시된 공지사항이 없습니다.</td>
	                    </tr>
                    <% }else{ %>
                    
                    <!--공지의 공지글 있을 때
                    <tr id="noticeInNotice">
                        <td>1</td>
                        <td>
                            <button class="btn-sm" style="background: #f57f7f; border: none; font-weight: bolder;">
                                	공지
                            </button>
                        </td>
                        <td>제목</td>
                        <td>2021-12-04</td>
                        <td>123</td>
                    </tr> -->
                    
	                    <% for(Notice n : list){ %>
	                    <!--일반 공지글 있을 때-->
	                    <tr>
	                        <td><%=n.getNoticeNo().substring(2,5)%></td>
	                        
	                        <% if(n.getNoticeYN().equals("Y")){ %>
		                        <td>
		                        	<button class="btn-sm" style="background: #f57f7f; border: none; font-weight: bolder;">
	                                	공지
	                            	</button>
		                        </td>
	                        <% }else{ %>
	                        	<td></td>
	                        <% } %>
	                        <td><%=n.getNoticeTitle()%></td>
	                        <td><%=n.getWriteDate()%></td>
	                        <td><%=n.getViewCount()%></td>
	                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <script>
        	$(function(){
        		$(".table-hover>tbody>tr").click(function(){
        			        			
        			location.href = '<%=contextPath%>/detail.no?nno=' + 'N-' + $(this).children().eq(0).text();
        		})
        	})
        </script>
        
        
       

        <div class="paging-area" align="center">
			
			<% if(currentPage != 1){ %>
            	<button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage-1%>';">&lt;</button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++){ %>
            	<% if(p == currentPage){ %>
            		<button class="btn btn-light" disabled><%=p%></button>
            	<%}else{ %>
            		<button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=p%>';"><%=p%></button>
            	<% } %>
           	<% } %>
            
            <% if(currentPage != maxPage){ %>
           	 <button class="btn btn-light" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage+1%>';">&gt;</button>
			<% } %>
        </div>

    </div>



	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>