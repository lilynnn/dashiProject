<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.entranceBoard.model.vo.Entrance, com.dashi.common.model.vo.*, java.util.ArrayList"%>
<%
	ArrayList<Entrance> list = (ArrayList<Entrance>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

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
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    #sel-notice{
    	font-weight:900px;
    	color:rgb(252, 186, 3);
    }
    /*왼쪽메뉴바*/
    #munubar{width:200px}
    /*공지사항시작*/
 	#adminNoticeList{
         margin-left: 30px;
         width: 850px;
    }
    #adminNoticeList div{float: left;}
    /*검색창*/
    #search{width: 250px;}
    #search>button{
    	border:none;
    	height:30px;
    	border-radius:3px;
    }
    #btn>button{
        border-radius: 5px;
        border: white;
        width: 60px;
        font-size: 13px;
    }
    /*공지사항 목록테이블 정리*/
    .noticeList thead, tbody{
        text-align: center;
    }
    .noticeList{ 
        border-top:1px solid;
        border-bottom: 1px solid;    
    }
    .noticeList thead{background: rgb(224, 223, 223);}
    /*타이틀 정리*/
    #title{
        width: 100%; 
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }
    .btn{
        width: 80px;
        height: 30px;
    }
    .paging-area{
    	margin-bottom:30px;
    }
    .paging-area button{
    	width:20px;
    	text-align:center;
    }
    .noticeList>tbody>tr:hover{
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
    
    
    <!--전체를 감싸는 큰 div-->
    <div class="outer">
    
    	<div id="menubar">
    		<%@ include file="../admin/adminMenubar.jsp" %>
    	</div>

        <!--관리자 공지사항 목록-->
        <div id="adminNoticeList">

                <div id="title">
                    	입소신청
                <hr>
                </div>
                
                <div style="width:100%;" align="right">
                	<% if(loginAdmin != null){ %>
                    
                    <a href="<%=contextPath%>" class="btn btn-sm btn-dark">
                        	글쓰기
                    </a>
                    <% } %>
                </div>

                <div style="margin-top: 10px;">
                    <table class="noticeList table-bordered">
                        <thead>
                            <tr>
                                <th width="80">No.</th>
                                <th width="80">승인단계</th>
                                <th width="450">제목</th>
                                <th width="90">작성자</th>
                                <th width="100">작성일</th>
                                <th width="60">처리</th>
                            </tr>
                        </thead>
                        <tbody>
	                    <!--공지글 없을 때-->
	                    <tr>
	                        <td colspan="6">게시된 공지사항이 없습니다.</td>
	                    </tr>
	                    
		                    <!--일반 공지글 있을 때-->
		                    <tr>
		                    	<td></td>
		                    	<td>
		                        	<button class="btn-sm btn-primary" style="border: none; font-weight: bolder; width:100%">
	                                	확인
	                            	</button>
		                        </td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                    </tr>
                       
                        </tbody>
                    </table>
                </div>
        	
        	<div class="paging-area" align="center">
			<% if(currentPage != 1){ %>
            <button onclick="location.href='<%=contextPath%>/entListView.ad?cpage=<%=currentPage-1%>';">&lt;</button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++){ %>	
            	<% if(p == currentPage){ %>
            	<button disabled><%= p %></button>
            	<% }else{ %>
            	<button onclick="location.href='<%=contextPath%>/entListView.ad?cpage=<%=p%>';"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage){ %>
            <button onclick="location.href='<%=contextPath%>/entListView.ad?cpage=<%=currentPage+1%>';">&gt;</button>
			<% } %>
        </div>
 
        </div>
    </div>
    
    	<script>
        	$(function(){
        		$(".noticeList>tbody>tr").click(function(){
        			        			
        		})
        	})
        	
        	
        </script>
    

	


	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>