<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<select name="" id="" class="inputwidth">
								<option value="">전체</option>
								<option value="">게시글</option>
								<option value="">댓글</option>
							</select>
						</td>
						<td rowspan="4" width="100px" style="border-top: 1px solid gray; border-bottom: 1px solid gray;">
							<button type="button" id="search-btn">검색</button>
						</td>
					</tr>
					<tr>
						<td align="center" class="list-name">검색 기간</td>
						<td class="list-find">
							<input type="date"><p style="margin:0">-</p><input type="date">
						</td>
					</tr>
					<tr>
						<td align="center" class="list-name">검색어</td>
						<td class="list-find">
							<input type="text" class="inputwidth" placeholder="검색할 키워드를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td align="center" class="list-name">게시물 상태</td>
						<td id="checkYN" class="list-find">
							<label><input type="radio" name="status"><p> 확인중</p></label>
							<label><input type="radio" name="status"><p> 삭제완료</p></label>
						</td>
					</tr>
				</table>
			</div>

			<div id="aReportList">
				<table id="re-list">
					<tr>
						<td colspan="7" width="850px"></td>
					</tr>

					<tr>
						<td colspan="7" align="right" id="list-btn">
							<a href="" class="btn" style="background: lightgray;">복구</a>
							<a href="" class="btn" style="background: #f37878;">삭제</a>
						</td>
					</tr>

					<tr align="center" id="re-list-name">
						<th width="30px"></th>
						<th width="100px">신고글번호</th>
						<th width="100px">신고종류</th>
						<th width="100px">작성자</th>
						<th width="380px">제목</th>
						<th width="100px">작성일</th>
						<th width="40px">처리</th>
					</tr>

					<!--신고글이 없을때-->
					<tr align="center" style="border-bottom:1px solid gray;">
						<td colspan="7">신고된 글이 없습니다.</td>
					</tr>

					<!--신고글이 있을때-->
					<tr align="center" style="border-bottom:1px solid gray;">
						<td><input type="checkbox"></td>
						<td>COMM-001</td>
						<td>욕설및음란</td>
						<td>bad0101</td>
						<td>제목들어갈자리</td>
						<td>2021/12/07</td>
						<td>N</td>
					</tr>
				</table>
			</div>
	
			<div class="paging-area" align="center">

				<button class="btn btn-light">&lt;</button>
	            <button class="btn btn-light">1</button>
	            <button class="btn btn-light">2</button>
	            <button class="btn btn-light">3</button>
	            <button class="btn btn-light">4</button>
	            <button class="btn btn-light">5</button>
	            <button class="btn btn-light">&gt;</button>
	            
			</div>
	
		</div>
	

	</div>
	
	
	
	
	
	
	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>