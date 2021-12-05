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
		height: 1700px;
		margin: auto;
	}


	#writeContent{
		margin-top: 35px;
	}

	/*말머리 seletor 스타일*/
	#animal-category{
		border: 1px solid rgb(207, 195, 195);
		width: 170px;
		height: 50px;
		border-radius: 4px;
	}

	/*전체 th부분에 색깔 넣기*/
	.outer th{
		background: rgb(236, 236, 236);
		font-size: 18px;
	}
	
	/*테이블 간격 없애기*/
	table{border-collapse: collapse;}

	/*내용안에 테이블에 들어갈  input요소 스타일*/
	#info input{
		border: 1px solid rgb(207, 195, 195);
		width: 240px;
		height: 40px;
		border-radius: 4px;
		margin-left: 20px;
	}
	/*내용 안에 테이블에 들어갈  th요소 스타일*/
	#info th{
		width: 210px;
		height: 60px;
	}
	/*내용 안에 테이블에 들어갈  td요소 스타일*/
	#info td{
		width: 300px;
		height: 60px;
	}

	/*내용 안에 들어있는 table테두리 스타일*/
	#info{
		border: 2px solid rgb(207, 195, 195);
	}

	/*td input타입들 40px띄우기*/
	#animal-category, #title, #info, #content{
		margin-left: 40px;

	}
	/*제목 input 크기 스타일*/
	#title{
		border: 1px solid rgb(207, 195, 195);
		width: 600px;
		height: 40px;
		border-radius: 4px;
	}
	#content{
		border: 1px solid rgb(207, 195, 195);
		border-radius: 4px;
	}

	/*등록버튼 스타일*/
	button{
		border:none;
		background-color: rgba(87, 84, 84, 0.932);
		color: white;
		font-size: 17px;
		width: 120px;
		height: 44px;
		border-radius: 4px;
		margin-left: 83%;
	}
	/*내용 추가내용 위로 붙이기*/
	.info, .content{
		vertical-align: top;
		padding-top: 60px;
	}

	

	
	
	


	
	


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<div style="font-size: 20px;""><h1>실종/보호</h1> <hr></div>
	

		<div id="writeContent">
			<form action="" method="">
				<table id="contentOuter" align="center">
					
					<!--제목 입력란-->
					<tr>
						<th style="width:230px; height: 130px;">말머리 *</th>
						<td style="width: 780px;" >
							<select id="animal-category" name="animal-category">
								<option value="miss">실종</option>
								<option value="protect">보호</option>
								<option value="sight">목격</option>
							</select>
						</td>
					</tr>

					<!--제목 입력란-->
					<tr>
						<th style="height: 130px;">제목 *</th>
						<td><input id="title" name="title" type="text" placeholder="제목을 입력해주세요." required></td>
					</tr>

					<!--내용 입력란-->
					<tr>
						<th style="height: 400px;" class="info">내용 *</th>
						<td>
							<table id="info">
								<tr>
									<th>묘종/견종 *</th>
									<td><input type="text" placeholder="내용을 입력해주세요." required></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input type="text" placeholder="내용을 입력해주세요." ></td>
								</tr>
								<tr>
									<th>보호 시작 날짜 *</th>
									<td><input type="text" placeholder="내용을 입력해주세요." required></td>
								</tr>
								<tr>
									<th>지역 *</th>
									<td><input type="text" placeholder="내용을 입력해주세요." required></td>
								</tr>
								<tr>
									<th>특징</th>
									<td><input type="text" placeholder="내용을 입력해주세요."></td>
								</tr>
							</table>
						</td>
					</tr>

					<!--추가 내용입력란-->
					<tr>
						<th style="height: 400px;" class="content">추가내용</th>
						<td><textarea name="content" id="content" cols="80" rows="23" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
				</table>
				<br><br><hr><br><br>


				<!--첨부파일 추가하는 div-->
				<div>
					<input type="file" style="margin-left: 45px; font-size: 17px; "value=>
				</div>

				<br><br><hr><br>
				
				<div>
					<input type="checkbox" style="margin-left: 45px;"> 개인정보 수집 및 이용에 동의합니다. * 
				</div>


				<br><hr><br>

				<button>등록</button>
			</form>
		</div>







		

	</div>
	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>