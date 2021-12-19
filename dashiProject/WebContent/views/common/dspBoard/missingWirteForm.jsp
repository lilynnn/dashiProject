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
		height: auto;
		margin: auto;
		margin-top: 50px;
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
		text-align: center;
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
	.enrollBtn1{
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
	}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<div style="font-size: 20px;""><h1>실종/보호</h1> <hr></div>
	

		<div id="writeContent">
			<form action="<%=contextPath%>/insert.dsp" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="userNo" value="<%= loginUser.getMemNo()%>">
				<input type="hidden" name="nickname" value="<%= loginUser.getNickname()%>">
				<table id="contentOuter" align="center" >
					
					<!--제목 입력란-->
					<!-- AJAX이용해서 실종 보호 각각 누르면 내용 안에 적는 표가 달라지도록 설정!!!!!-->
					<tr>
						<th style="width:230px; height: 130px;">말머리 *</th>
						<td style="width: 780px;" >
							<select id="animal-category" name="animal-category">
								<option value="실종">실종</option>
								<option value="보호">보호</option>
								<option value="목격">목격</option>
							</select>
						</td>
					</tr>

					<!--제목 입력란-->
					<tr>
						<th style="height: 100px;">제목 *</th>
						<td><input id="title" name="title" type="text" placeholder="제목을 입력해주세요." required></td>
					</tr>

					<!--내용 입력란-->
					<tr>
						<th style="height: 400px;" class="info">내용 *</th>
						<td>
							<table id="info">
								<tr>
									<th>묘종/견종</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="animal_type" required></td>
								</tr>
								<tr>
									<th>나이</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="animal_age" required></td>
								</tr>
								<tr>
									<th>몸무게</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="animal_weight" required></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="animal_gender" required></td>
								</tr>
								<tr>
									<th>실종날짜 </th>
									<td><input type="date" placeholder="내용을 입력해주세요." name="missing_date" required></td>
								</tr>
								<tr>
									<th>지역 </th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="location" required></td>
								</tr>
								<tr>
									<th>사례금</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="money" required></td>
								</tr>
								<tr>
									<th>특징</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="characteristic" required></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="phone" required></td>
								</tr>
							</table>
							<br><br>
						</td>
					</tr>

					<!--추가 내용입력란-->
					<tr>
						<th style="height: 400px;" class="content">추가내용</th>
						<td><textarea name="ect" id="content" cols="80" rows="23" placeholder="내용을 입력해주세요." style="resize: none;"></textarea></td>
					</tr>
				</table>
				<br><br><hr><br><br>


				<!--첨부파일 추가하는 div-->
				<div style="margin-left: 45px;">
					<table>
						<tr>
							<th>대표 이미지</th>
							<td colspan="3">
								<img id="titleImg" width="300" height="250" src="" alt="" onclick="chooseFile(1)">
							</td>
						</tr>	

						<tr>
							<th>상세 이미지</th>
							<td>
								<img id="contentImg1" width="200" height="150" src="" alt="" onclick="chooseFile(2)">
							</td>
							<td>
								<img id="contentImg2" width="200" height="150" src="" alt="" onclick="chooseFile(3)">
							</td>
							<td>
								<img id="contentImg3" width="200" height="150" src="" alt="" onclick="chooseFile(4)">
							</td>
							<td>
								<img id="contentImg4" width="200" height="150" src="" alt="" onclick="chooseFile(5)">
							</td>

						</tr>
					</table>
				</div>

				<!-- 파일을 입력하는곳-->
				<div style="display:none">
					<input type="file" name="file1" id="file1" onchange="loadImg(this ,1);" required>
					<input type="file" name="file2" id="file2" onchange="loadImg(this ,2);">
					<input type="file" name="file3" id="file3" onchange="loadImg(this ,3);">
					<input type="file" name="file4" id="file4" onchange="loadImg(this ,4);">
					<input type="file" name="file5" id="file5" onchange="loadImg(this ,5);">
				</div>

				<script>
					function chooseFile(num){
						$("#file"+num).click();
					}
				
					function loadImg(inputFile, num) {

						if(inputFile.files.length == 1){
							const reader = new FileReader();

							reader.readAsDataURL(inputFile.files[0]);

							reader.onload = function (e) {
								switch(num){
									case 1:$("#titleImg").attr("src", e.target.result); break;
									case 2:$("#contentImg1").attr("src", e.target.result); break;
									case 3:$("#contentImg2").attr("src", e.target.result); break;
									case 4:$("#contentImg3").attr("src", e.target.result); break;
									case 5:$("#contentImg4").attr("src", e.target.result); break;

								}
								
							}
						}else{
							switch(num){
								case 1:$("#titleImg").attr("src",null); break;
								case 2:$("#contentImg1").attr("src",null); break;
								case 3:$("#contentImg2").attr("src",null); break;
								case 4:$("#contentImg3").attr("src",null); break;
								case 5:$("#contentImg4").attr("src",null); break;
							}
						}
						
					}
				</script>

				<br><br><hr><br>


				<button class="enrollBtn1">등록</button>
				
			</form>
		</div>
	</div>
		
	<br><br><br><br>
	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>