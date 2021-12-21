<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.report.model.vo.Report"%>
<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
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
		background: #d7e6f5;
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
		background: #d7e6f5;
	}
	.paging-area{
		margin-top: 30px;
		margin-left:20px;
	}
	#check:hover{cursor:pointer;}
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
				<form action="<%=contextPath%>/searchIdReport.ad"  method="get">
					<table id="re-search">
						<tr>
							<td colspan="2" width="850px" id="boardName">회원별 신고횟수 조회</td>
						</tr>
						<tr>
							<th colspan="2"><hr style="height: 1px;"></th>
						</tr>
						<tr>
							<th colspan="2" style="border-bottom: 1px solid gray;"></th>
						</tr>
						<tr>
							<td align="center" class="list-name" style="border-top: 1px solid gray;">회원 아이디 검색</td>
							<td class="list-find">
								<input type="text" name="searchId" style="width:325px;">
							</td>
							<td rowspan="2" width="100px" style="border-top: 1px solid gray; border-bottom: 1px solid gray;">
								<button type="submit" class="btn btn-outline-primary" style="width:100px;">검색</button>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<div id="aReportList">
				<table id="re-list" style="font-size:12px;">
					<thead>
						<tr>
							<td colspan="6" width="850px"></td>
						</tr>
						<tr>
							<td colspan="6" width="850px"></td>
						</tr>
						<tr align="right">
							<td colspan="6" width="850px">
								<button type="button" data-toggle="modal" data-target="#myModal">블랙리스트 처리</button>
							</td>
						</tr>
	
						<tr align="center" id="re-list-name">
							<th width="30px"></th>
							<th width="100px">회원번호</th>
							<th width="200px">회원아이디</th>
							<th width="100px">회원이름</th>
							<th width="100px">블랙리스트여부</th>
							<th width="100px">신고횟수</th>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()){ %>
						<!--신고글이 없을때-->
						<tr align="center" style="border-bottom:1px solid gray;">
							<td colspan="6">신고된 글이 없습니다.</td>
						</tr>
						<% }else{ %>
						<!--신고글이 있을때-->
							<% for(Report r : list){ %>
							<tr align="center" style="border-bottom:1px solid gray;">
								<td><input type="checkbox" id="check"></td>
								<td><%=r.getReportedMem()%></td>
								<td><%=r.getMemId()%></td>
								<td><%=r.getMemName()%></td>
								<td><%=r.getBlacklist()%></td>
								<td><%=r.getCount()%></td>
							</tr>
							<% } %>
						<% } %>
					</tbody>
				</table>
			</div>
			
			<div style="width:100%; margin-top:30px;" align="center">
				<button type="button" onclick="history.back();">목록으로</button>
			</div>
			
			
			
			<script>
				$("#re-list>tbody>tr").click(function(){			
					
					console.log($("#re-list>tbody>tr").children().eq(1).text());
					<!--location.href = '<%=contextPath%>/reportDetail.ad?rno=' + $(this).children().eq(0).text();-->
				
				})
			</script>		
	
		</div>

	</div>
	
		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
			<form>
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">해당회원을<br>블랙리스트 처리하시겠습니까?</h4>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        	회원아이디 : 
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      </div>
			</form>
		    </div>
		  </div>
		</div>
	
	
		
	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>