<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.notice.model.vo.Notice, java.util.ArrayList, com.dashi.common.model.vo.*"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
                    	공지사항
                <hr>
                </div>
                <div id="search">
                	<form action="<%=contextPath%>/noKeyword.ad" method="post">
	                    <input type="text" name="titleSearch" placeholder="제목 키워드 검색" value="<%=keyword %>" required>
	                    <input type="hidden" name="spage" value="1">
	                    <button type="submit">검색</button>
                    </form>
                </div>
                
                <div style="width: 600px;" align="right">
                	<% if(loginAdmin != null){ %>
                    
                    <a href="<%=contextPath%>/noEnrollForm.ad" class="btn btn-sm btn-dark">
                        	글쓰기
                    </a>
                    <% } %>
                </div>

                <div style="margin-top: 10px;">
                    <table class="noticeList">
                        <thead>
                            <tr>
                                <td width="60"></td>
                                <th width="80">No.</th>
                                <th width="470">제목</th>
                                <th width="70">작성자</th>
                                <th width="100">작성일</th>
                                <th width="70">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% if(list.isEmpty()){ %>
	                    <!--공지글 없을 때-->
	                    <tr>
	                        <td colspan="5">게시된 공지사항이 없습니다.</td>
	                    </tr>
	                    <% }else{ %>
	                    
		                    <% for(Notice n : list){ %>
		                    <!--일반 공지글 있을 때-->
		                    <tr>
		                        <% if(n.getNoticeYN().equals("Y")){ %>
		                        <td>
		                        	<button class="btn-sm" style="background: #f57f7f; border: none; font-weight: bolder;">
	                                	공지
	                            	</button>
		                        </td>
		                        <% }else{ %>
		                        	<td></td>
		                        <% } %>
		                        <td><%=n.getNoticeNo()%></td>
		                        <td><%=n.getNoticeTitle()%></td>
		                        <td><%=n.getMnNo() %></td>
		                        <td><%=n.getWriteDate()%></td>
		                        <td><%=n.getViewCount()%></td>
		                    </tr>
		                    <% } %>
	                    <% } %>
                       
                        </tbody>
                    </table>
                </div>
                
              <div class="paging-area" align="center" style="width:100%; margin-top:30px;">
		
				<% if(currentPage != 1){ %>
	            	<button class="btn btn-light" onclick="location.href='<%=contextPath%>/noKeyword.ad?titleSearch=<%=keyword%>&spage=<%=currentPage-1%>';">&lt;</button>
	            <% } %>
	            
	            <% for(int p=startPage; p<=endPage; p++){ %>
	            	<% if(p == currentPage){ %>
	            		<button class="btn btn-light" disabled><%=p%></button>
	            	<%}else{ %>
	            		<button class="btn btn-light" onclick="location.href='<%=contextPath%>/noKeyword.ad?titleSearch=<%=keyword%>&spage=<%=p%>';"><%=p%></button>
	            	<% } %>
	           	<% } %>
	            
	            <% if(currentPage != maxPage){ %>
	           	 <button class="btn btn-light" onclick="location.href='<%=contextPath%>/noKeyword.ad?titleSearch=<%=keyword%>&spage=<%=currentPage+1%>';">&gt;</button>
				<% } %>
        
  		 	</div>
                
                
        	
        	<div style="width:100%; margin-top:30px;" align="center">
        		<a href="<%=contextPath%>/noList.ad?cpage=1" class="btn btn-sm btn-outline-secondary">목록으로</a>
        	</div>
        	
        </div>
    </div>
    
    	<script>
        	$(function(){
        		$(".noticeList>tbody>tr").click(function(){
        			        			
        			location.href = '<%=contextPath%>/noDetail.ad?nno=' + $(this).children().eq(1).text();
        		})
        	})
        	
        	
        </script>
   


	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>