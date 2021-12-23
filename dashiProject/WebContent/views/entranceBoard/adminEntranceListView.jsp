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
 	#adminEntList{
         margin-left: 50px;
         width: 850px;
    }
    #adminEntList div{float: left;}
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
    .entList thead, tbody{
        text-align: center;
    }
    .entList{ 
        border-top:1px solid;
        border-bottom: 1px solid;    
    }
    .entList thead{background: rgb(224, 223, 223);}
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
    .entList>tbody>tr:hover{
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
        <div id="adminEntList">

                <div id="title">
                    	입소신청
                <hr>
                </div>
                

                <div style="margin-top: 10px;">
                    <table class="entList table-bordered">
                        <thead>
                            <tr>
                                <th width="80">No.</th>
                                <th width="80">승인단계</th>
                                <th width="450">제목</th>
                                <th width="90">작성자</th>
                                <th width="100">작성일</th>
                                <th colspan="2" width="120">처리</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% if(list.isEmpty()){ %>
	                    <!--공지글 없을 때-->
	                    <tr>
	                        <td colspan="6">게시된 공지사항이 없습니다.</td>
	                    </tr>
	                    <% }else{ %>
		                    <!--일반 공지글 있을 때-->
		                    <% for(Entrance e : list){ %>
		                    <tr>
		                    	<td><%=e.getEntNo()%></td>
		                    	
		                    	<% if(e.getProcessResult().equals("확인")){ %>
		                    	<td>
		                        	<button class="btn-sm btn-primary" style="width:100%">
	                                	확인
	                            	</button>
		                        </td>
		                        <% }else if(e.getProcessResult().equals("승인")){ %>
		                        <td>
		                        	<button class="btn-sm btn-outline-danger" style="border: none; font-weight: bolder; width:100%">
	                                	승인
	                            	</button>
		                        </td>
		                        <% }else{ %>
		                        <td>
		                        	<button class="btn-sm btn-outline-dark" style="border: none; font-weight: bolder; width:100%">
	                                	반려
	                            	</button>
		                        </td>
		                        <% } %>
		                        
		                        <td><%=e.getEntTitle()%></td>
		                        <td><%=e.getMemNo()%></td>
		                        <td><%=e.getEntApplyDate()%></td>
		                        <td>
		                        	<button class="btn-sm btn-outline-danger" style="border: none; font-weight: bolder; width:100%">
	                                	승인
	                            	</button>
		                        </td>
		                        <td>
		                        	<button class="btn-sm btn-outline-dark" style="border: none; font-weight: bolder; width:100%">
	                                	반려
	                            	</button>
		                        </td>
		                    </tr>
		                    <% } %>
                       	<% } %>
                        </tbody>
                    </table>
                </div>
        	
        	<br><br><br><br><br><br>
        	<div class="paging-area" align="center" style="width:100%; margin-top:30px;">
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
        		$(".entList>tbody>tr").click(function(){
        			  location.href = '<%=contextPath%>/entDetail.ad?eno=' + $(this).children().eq(0).text();
        		})
        	})
        	
        	
        </script>
    

	


	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>