<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.report.model.vo.Report, com.dashi.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");

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
    /*왼쪽메뉴바*/
    #munubar{
		width:200px;
		height: 800px;
	}
	/*신고내역*/
	.re-content,#aReportList-find{
		width: 850px;
		margin-left: 15px;
	}
	#aReportList{
		width: 850px;
		margin-left: 15px;
	}
	#boardName{
		font-size: 24px;
		font-weight: 900;
	}
	#re-search{margin-top: 25px;}
	#re-search *{height: 35px;}
	.list-name{
		background: #fbffed;
		border-bottom: 1px solid gray;
	}
	.list-find{border-bottom: 1px solid gray;}
	.list-find>*{float: left;}
	hr{margin: 0;}
	.inputwidth{width: 325px;}
	#checkYN>label{
		width: 100px; margin: 0;}
	#checkYN>label>*{float:left;}
	#checkYN>label p{
		margin:0;
		height:100%;
		line-height:35px;
		margin-left:5px;
	}
	#search-btn{
		width: 100%;
		height: 100%;
		background: rgb(102,184,94);
		font-size: 15px;
		font-weight: 900;
		border:1px solid #59704c;
		border-radius:3px;
	}
	#re-list *{height: 30px;}
	#list-btn>a{
		margin-right: 10px;
		line-height: 15px;
	}
	#re-list-name{
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		background: #fbffed;
	}
	.paging-area{
		margin-top: 30px;
		margin-left:20px;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">

		<div id="menubar">
    		<%@ include file="../admin/adminMenubar.jsp" %>
    	</div>

		<div class="re-content">
			<div id="aReportList-find">
				<form method="get" action="<%=contextPath%>/searchReport.ad">
					<table id="re-search">
						<tr>
							<td colspan="4" width="850px" id="boardName">전체 신고 내역</td>
						</tr>
						<tr>
							<th colspan="4"><hr style="height: 1px;"></th>
						</tr>
						<tr>
							<td width="300px" align="center" class="list-name" style="border-top: 1px solid gray;">신고글 코드 조회</td>
							<td width="400px" class="list-find" style="border-top: 1px solid gray;">
								<select name="boardType" class="inputwidth">
									<option value="1">게시글</option>
									<option value="2">댓글</option>
								</select>
							</td>
							<td rowspan="4" width="100px" style="border-top: 1px solid gray; border-bottom: 1px solid gray;">
								<button type="button" id="search-btn">검색</button>
							</td>
						</tr>
						<tr>
							<td align="center" class="list-name">검색 기간</td>
							<td class="list-find">
								<input type="date" name="searchDate" style="width:325px;">
							</td>
						</tr>
						<tr>
							<td align="center" class="list-name">검색어</td>
							<td class="list-find">
								<input type="text" name="userId" class="inputwidth" placeholder="검색할 회원의 아이디를 입력해주세요.">
							</td>
						</tr>
						<tr>
							<td align="center" class="list-name">게시물 상태</td>
							<td id="checkYN" class="list-find">
								<label><input type="radio" name="status" value="N"><p> 확인중</p></label>
								<label><input type="radio" name="status" value="Y"><p> 삭제완료</p></label>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<div id="aReportList">
				<table id="re-list" style="font-size:12px;">
					<thead>
						<tr>
							<td colspan="8" width="850px"></td>
						</tr>
	
						<tr>
							<td colspan="8" align="right" id="list-btn">
								<a href="" class="btn" style="background: lightgray;">복구</a>
								<button type="button" class="btn" style="background: #f37878;">삭제</button>
							</td>
						</tr>
	
						<tr align="center" id="re-list-name">
							<th width="30px"></th>
							<th width="100px">신고글번호</th>
							<th width="100px">신고댓글번호</th>
							<th width="100px">신고종류</th>
							<th width="100px">작성자</th>
							<th width="380px">신고내용</th>
							<th width="100px">작성일</th>
							<th width="40px">처리</th>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()){ %>
						<!--신고글이 없을때-->
						<tr align="center" style="border-bottom:1px solid gray;">
							<td colspan="7">신고된 글이 없습니다.</td>
						</tr>
						<% }else{ %>
						<!--신고글이 있을때-->
							<% for(Report r : list){ %>
							<tr align="center" style="border-bottom:1px solid gray;">
								<td><input type="checkbox" name="check"></td>
								<td><%=r.getContentNo()%></td>
								<td><%=r.getReplyNo()%></td>
								
								<% 
			                    	String category ="";
			                    	switch(r.getReportCategory()){
			                    	case 1: category = "욕설 및 음란"; break;
			                    	case 2: category = "광고 및 도배"; break;
			                    	case 3: category = "사생활침해"; break;
			                    	case 4: category = "저작권위반"; break;
			                    	case 5: category = "기타"; break;
									}
								%>
								<td><%=category%></td>
								
								<td><%=r.getReportedMem()%></td>
								<td><%=r.getReportContent()%></td>
								<td><%=r.getReportDate()%></td>
								<td><%=r.getReportStatus()%></td>
							</tr>
							<% } %>
						<% } %>
					</tbody>
				</table>
			</div>
			
			<script>
				$("#re-list>tbody>tr").click(function(){
					
					console.log($("#re-list>tbody>tr").children().eq(1).text());
					location href = '<%=contextPath%>/reportDetail.ad?rno=' + $(this).children().eq(1).text();
					
				})
			</script>
			
			
	
			<!-- 페이징바 -->
            <div class="paging-area" align="center">
			<% if(currentPage != 1){ %>
            <button onclick="location.href='<%=contextPath%>/reportList.ad?cpage=<%=currentPage-1%>';" class="btn btn-outline-light text-dark">&lt;</button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++){ %>	
            	<% if(p == currentPage){ %>
            	<button disabled><%= p %></button>
            	<% }else{ %>
            	<button onclick="location.href='<%=contextPath%>/reportList.ad?cpage=<%=p%>';" class="btn btn-outline-light text-dark"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage){ %>
            <button onclick="location.href='<%=contextPath%>/reportList.ad?cpage=<%=currentPage+1%>';" class="btn btn-outline-light text-dark">&gt;</button>
			<% } %>
        	</div>
	
		</div>
	

	</div>
	
		
	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>