<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.dspBoard.model.vo.Category ,com.dashi.dspBoard.model.vo.Dsp, com.dashi.common.model.vo.Attachment"%>
<!DOCTYPE html>

<%
	ArrayList<Category> category = (ArrayList<Category>)request.getAttribute("category");
	Dsp d = (Dsp)request.getAttribute("d");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	ArrayList<Dsp> contentImgPath = (ArrayList<Dsp>)request.getAttribute("contentImgPath");

%>

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
		background-color: rgb(102,184,94);
		color: white;
		font-size: 17px;
		width: 120px;
		height: 44px;
		border-radius: 4px;
		margin-left: 43%;
		
	}
	img{
	cursor:pointer;
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
		<div style="font-size: 20px;"><h1>실종/보호 수정하기</h1> <hr></div>
	

		<div id="writeContent">
			<form action="<%=contextPath %>/update.dsp" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="dno" value="<%=d.getDspNo() %>">
				<table id="contentOuter" align="center" >
					
					<!--제목 입력란-->
					<!-- AJAX이용해서 실종 보호 각각 누르면 내용 안에 적는 표가 달라지도록 설정!!!!!-->
					<tr>
						<th style="width:230px; height: 130px;">말머리 *</th>
						<td style="width: 780px;" >
							<select id="animal-category" name="animal-category">
                            <% for(Category c : category) {%>
                            	<option value="<%=d.getCtg()%>"><%=c.getCategoryName()%></option>
                            <% } %>
                            
	                         <script>
	                        	$(function(){
	                        		$("#animal-category option").each(function(){
	                        			if($(this).text() == "<%=d.getCtg()%>"){
	                        				$(this).attr("selected",true);
	                        			}
	                        		})
	                        	})
                        	</script>
							</select>
						</td>
					</tr>

					<!--제목 입력란-->
					<tr>
						<th style="height: 100px;">제목 *</th>
						<td><input id="title" name="title" type="text" placeholder="제목을 입력해주세요." required value="<%= d.getDspTitle()%>"></td>
					</tr>
					
					<!--내용 입력란-->
					<tr>
						<th style="height: 400px;" class="info">내용 *</th>
						<td>
							<table id="info">
								<tr>
									<th>묘종/견종</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="animal_type" required  value="<%= d.getVariety()%>"></td>
								</tr>
								<tr>
									<th>나이</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="animal_age" required  value="<%= d.getAge()%>"></td>
								</tr>
								<tr>
									<th>몸무게</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="animal_weight" required  value="<%= d.getWeight()%>"></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="animal_gender" required  value="<%= d.getGender()%>"></td>
								</tr>
								<tr>
									<th>실종날짜 </th>
									<td><input type="date" placeholder="내용을 입력해주세요." name="missing_date" required  value="<%= d.getIssueDate()%>"></td>
								</tr>
								<tr>
									<th>지역 </th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="location" required  value="<%= d.getLocationName()%>"></td>
								</tr>
								<tr>
									<th>사례금</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="money" required  value="<%= d.getMoney()%>"></td>
								</tr>
								<tr>
									<th>특징</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="characteristic" required  value="<%= d.getIssue()%>"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" placeholder="내용을 입력해주세요." name="phone" required  value="<%= d.getPhone()%>"></td>
								</tr>
							</table>
							<br><br>
						</td>
					</tr>

					<!--추가 내용입력란-->
					<tr>
						<th style="height: 400px;" class="content">추가내용</th>
						<td><textarea name="ect" id="content" cols="80" rows="23" placeholder="내용을 입력해주세요." style="resize: none;"><%= d.getEtc()%></textarea></td>
					</tr>
				</table>
				<br><br><hr><br><br>


				<!--첨부파일 추가하는 div-->
				<div style="margin-left: 45px;">
					<table>
						<tr>
							<th>대표 이미지</th>
							<td colspan="3">
								<img id="titleImg" width="300" height="250" src="<%=d.getTitleImg() %>" alt="" onclick="chooseFile(1)">
								<input type="hidden" name="originFileNo1" value="<%= list.get(0).getAttachNo() %>">
							</td>
						</tr>	
						


						<tr>
							<th>상세 이미지</th>
							<!-- 원래 첨부했던 첨부파일 -->
							<%for(int i=0; i<contentImgPath.size(); i++){ %>
							<td>
								<input type="hidden" name="originFileNo<%=i+2 %>" value="<%= list.get(i+1).getAttachNo() %>">
								<img id="contentImg<%=i+1%>" width="200" height="150" src="<%=contextPath %>/<%=contentImgPath.get(i).getContentImg() %>" alt="" onclick="chooseFile(<%= i+2 %>)">
							</td>
							<%} %>
							
							<!-- 기존에 없었던 첨부파일을 입력하는 란 -->
							<%for(int i=contentImgPath.size() + 1; i < 5; i++){ %>
							<td>
								<img id="contentImg<%=i+1%>" width="200" height="150" src="" alt="" onclick="chooseFile(<%= i+2 %>)">
							</td>
							<%} %>


						</tr>
					</table>

				</div>
				
				
				

				<!-- 파일을 입력하는곳-->
				<div style="display:none">	
					<input type="file" name="file1" id="file1" onchange="loadImg(this ,1);">
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


				<button type="submit" class="enrollBtn1">수정하기</button>
				
			</form>
		</div>
	</div>
		
	<br><br><br><br>
	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>