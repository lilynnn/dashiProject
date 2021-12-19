<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.dashi.animalListBoard.model.vo.Animal, com.dashi.common.model.vo.Attachment" %>

<%
	Animal a = (Animal)request.getAttribute("aInfo");
	Attachment at = (Attachment)request.getAttribute("at");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	/* 관리자메뉴바 (입양공고) 효과 */
	#sel-adopt{
		font-weight: 700;
        color:rgb(252, 186, 3);
	}
	.outer{
        width: 1200px;
        height: 800px;
        margin: auto;
        margin-top: 30px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
	.content-area{
         width: 850px;
         float: left;
         margin-left: 20px;
    }
	.title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        margin-left: 20px;
        width: 950px;
    }

	#animalInfo{font-size: 13px; border-collapse: separate;}
	#animalInfo th{text-align: center; line-height: 200%;}
	#animalInfo>tbody th{background: lightgray;}
	#animalInfo input{width: 100%;}
	#text-area{width: 100%; resize: none;}
	table td{
		line-height: 180%;
	}
	

</style>
</head>
<body>

	<!-- 지희 수정중  -->
	<!-- 관리자가 입양공고문을 작성하기 위한 페이지 -->
	<%@ include file="../common/menubar.jsp" %>

	<!-- 전체 영역 감싸는 div -->
	<div class="outer">

		<div id="menubar" style="margin-right: 20px;" >
			<%@ include file="../admin/adminMenubar.jsp" %>
		</div>

		<form action="<%=contextPath %>/adtenroll.ad"  method="post" enctype="multipart/form-data">
			
			<input type="hidden" name="entNo" value="<%=a.getEntNo() %>">
			
			<div class="content-area">

				<div class="title-area">
					입양공고글 등록하기
				</div>

				<hr style="width: 900px;">

				<table align="center" id="animalInfo" style="width: 900px;">

					<thead>
						<tr>
							<th style="font-size: 15px;">제목</th>
							<td colspan="2">
								<input name="title" type="text" value="<%=a.getAnimalVariety() %> <%=a.getAnimalName() %>(이)의 가족을 기다려요." readonly>
							</td>
						</tr>
						<!-- 공백란 -->
						<tr><td>&nbsp;</td></tr>
						<!--동물 사진 보여질 table-->
						<tr>
							<th width="290">대표사진</th>
							<th width="290">상세사진1</th>
							<th width="290">상세사진2</th>
						</tr>
						<tr>
						<%if(at!=null) {%>
							<td>
								<img id="titleImg" src="<%= contextPath%>/<%=at.getPath()+at.getChangeName() %>" width="290" height="250" onclick="chooseFile(1);">
								<input type="hidden" name="originFileNo" value="<%= at.getAttachNo() %>">		
							</td>
							<td><img id="contentImg1" width="290" height="250" onclick="chooseFile(2);"></td>
							<td><img id="contentImg2" width="290" height="250" onclick="chooseFile(3);"></td>
						<%} else {%>
							<td><img id="titleImg" width="290" height="250" onclick="chooseFile(1);"></td>
							<td><img id="contentImg1" width="290" height="250" onclick="chooseFile(2);"></td>
							<td><img id="contentImg2" width="290" height="250" onclick="chooseFile(3);"></td>
						<%} %>
						</tr>

						<!-- 공백란 -->
						<tr><td>&nbsp;</td></tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3"><b style="font-size: 18px; padding-left: 5px;">동물 정보</b></td>
						</tr>
						
						<tr>
							<td style="font-size:12px; color:gray;">&nbsp;동물정보는 동물관리페이지에서 수정가능합니다.</td>
						</tr>
						<!-- 동물 품종  -->
						<tr>
							<th>묘종 / 견종</th>
							<td colspan="2"><input name="animalVariety" type="text" value="<%=a.getAnimalVariety() %>" readonly></td>
						</tr>

						<!-- 동물 나이 -->
						<tr>
							<th>나 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이</th>
							<td colspan="2"><input name="animalAge" type="text" value="<%=a.getAnimalAge() %>" readonly></td>
						</tr>

						<!-- 동물 성별 -->
						<tr>
							<th>성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 별</th>
							<td colspan="2"><input name="animalGender" type="text" value="<%=a.getAnimalGender() %>" readonly></td>
						</tr>

						<!-- 접종 여부 -->
						<tr>
							<th>접종 &nbsp; 여부</th>
							<td colspan="2"><input name="animalVaccin" type="text" value="<%=a.getAnimalVaccin() %>" readonly></td>
						</tr>
						
						<!-- 중성화 여부 -->
						<tr>
							<th>중성화여부</th>
							<td colspan="2"><input name="animalNeutral" type="text" value="<%=a.getAnimalNeutral() %>" readonly></td>
						</tr>
						
						<!-- 질병 여부 -->
						<tr>
							<th>질병 &nbsp; 여부</th>
							<td colspan="2"><input name="animalDisease" type="text" value="<%=a.getAnimalDisease() %>" readonly></td>
						</tr>
						
						<!-- 특이사항 -->
						<tr>
							<th>특이 &nbsp; 사항</th>
							<td colspan="2"><input name="animalIssue" type="text" value="<%=a.getAnimalIssue() %>" readonly></td>
						</tr>

						<!-- 내용 -->
						<tr>
							<th>내 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 용</th>
							<td colspan="2">
								<textarea name="content" id="text-area" cols="30" rows="10"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
						<div style="display: none;">
					<!-- 첨부파일 -->
					
					<input type="file" name="file1" id="file1" onchange="loadImg(this, 1);"> <br>
					<input type="file" name="file2" id="file2" onchange="loadImg(this, 2);"> <br>
					<input type="file" name="file3" id="file3" onchange="loadImg(this, 3);"><br>

				</div>
				
				<div style=" text-align: center;">
					<br><br>
					<button class="btn btn-success" type="submit">등록하기</button>
					&nbsp;
					<button class="btn btn-secondary">목록보기</button>
					<br><br>
					
				</div>
				
				<script>
	                
					function chooseFile(num){
	                    $("#file"+num).click();
	                }
	                
					function loadImg(inputFile, num){
					
						if(inputFile.files.length == 1){    // 파일이 선택된 경우=> 읽어들여서 미리보기
	                        
	                        // 파일을 읽어들일 fileReader객체 생성
	                        const reader = new FileReader();

	                        // 파일을 읽어들이는 메소드
	                        reader.readAsDataURL(inputFile.files[0]);

	                        reader.onload = function(e){
	                            // e.target.result => 읽어들인 파일만의 고유한 url
	                            switch(num){
	                                case 1:$("#titleImg").attr("src",e.target.result); break;
	                                case 2:$("#contentImg1").attr("src",e.target.result); break;
	                                case 3:$("#contentImg2").attr("src",e.target.result); break;
	                            }
	                        }
	                    } else{ //선택된 파일이 취소된 경우 =>  미리보기 된 것도 사라지게
	                        switch(num){
	                                case 1:$("#titleImg").attr("src",null); break;
	                                case 2:$("#contentImg1").attr("src",null); break;
	                                case 3:$("#contentImg2").attr("src",null); break;
	                            }
	                    }
						
						
					}
				</script>
			</div>
		</form>


	</div>
</body>
</html>