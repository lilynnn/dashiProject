<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.entranceBoard.model.vo.Entrance, com.dashi.common.model.vo.Attachment"%>    
<%
	Entrance e = (Entrance)request.getAttribute("e");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.outer{
        margin-top: 100px;
        width: 1200px;
        margin: auto;
    }
	.title-area{
		background: #8aa68e;
		width: 1000px;
		height: 50px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 30px;
		border-radius: 5px;
	}
	.title-area h4{color: white; font-weight: bold; line-height: 190%;}

	table td{
		border-collapse: separate;
		line-height: 200%;
	}
	.inputText-area{
		width: 830px; 
		height: 100px; 
		margin-left: 20px;
		resize: none;
	}
</style>
</head>
<body>

	<!-- 지희 수정중  -->	
	<!-- 사용자 입양신청서 페이지 -->
	
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="outer" align="center">
	
		<form action="<%=contextPath %>/update.ent" method="post" enctype="multipart/form-data">
			<input type="hidden" name="eno" value="<%=e.getEntNo()%>">

			<div class="title-area">
				<h4>입소신청서</h4>
			</div>
			
		
			
			<table style="width: 900px;">
				<!-- 신청할 입양공고문 제목 -->
				<tr>
					<td colspan="2">
						<b style="font-size: 15px;">* 다음 양식을 채워주세요.</b>
					</td>
				</tr>
				<tr>
					<td width=220><b>제목을 적어주세요</b></td>
					<td width=780>
						<input type="text" name="title" value="<%=e.getEntTitle()%>" style="width: 690px" required>
					</td>
				</tr>
				<!-- 신청자 정보 -->
				<tr>
					<td width=220>1. 신청인 성명  </td>
					<td width=780>
						<input type="text" name="userName" value="<%=e.getMemName()%>" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>2. 동&nbsp;물&nbsp;&nbsp;&nbsp;이&nbsp;름 </td>
					<td width=780>
						<input type="text" name="petName" value="<%=e.getAnimalName()%>" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>3. 동&nbsp;물&nbsp;&nbsp;&nbsp;종&nbsp;류 </td>
					<% if(e.getAnimalType().equals("D")){ %>
						<td>강아지</td>
					<% }else if(e.getAnimalType().equals("C")){ %>
						<td>고양이</td>
					<% }else{ %>
						<td>기타</td>
					<% } %>
				</tr>
				<tr>
					<td width=220>4. 동&nbsp;물&nbsp;&nbsp;&nbsp;품&nbsp;종</td>
					<td width=780>
						<input type="text" name="petVariety" value=<%=e.getAnimalVariety()%> style="width: 690px" required placeholder="품종을 정확히 적어주세요.">
					</td>
				</tr>
				<tr>
					<td width=220>5. 동&nbsp;물&nbsp;&nbsp;&nbsp;나&nbsp;이 </td>
					<td width=780>
						<input type="number" name="petAge" value="<%=e.getAnimalAge()%>" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>6. 동&nbsp;물&nbsp;&nbsp;&nbsp;성&nbsp;별</td>
					<% if(e.getAnimalGender().equals("F")){ %>
						<td>암컷</td>
					<% }else{ %>
						<td>수컷</td>
					<% } %>
				</tr>
				<tr>
					<td width=220>7. 접&nbsp;종&nbsp;&nbsp;&nbsp;여&nbsp;부</td>
					<% if(e.getAnimalVaccinated().equals("Y")){ %>
						<td>접종완료</td>
					<% }else{ %>
						<td>접종 전</td>
					<% } %>
				</tr>
				<tr>
					<td width=220>8. 중&nbsp;성&nbsp;화&nbsp;여&nbsp;부 </td>
					<% if(e.getAnimalNeturalization().equals("Y")){ %>
						<td>중성화 완료</td>
					<% }else{ %>
						<td>중성화 전</td>
					<% } %>
				</tr>
				<tr>
					<td width=220>9. 질&nbsp;병&nbsp;&nbsp;&nbsp;유&nbsp;무 </td>
					<td width=780>
						<input type="text" name="disease" value="<%=e.getAnimalDisease()%>" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>10. 특&nbsp;이&nbsp;&nbsp;&nbsp;사&nbsp;항 </td>
					<td width=780>
						<input type="text" name="petIssue" value="<%=e.getAnimalIssue()%>" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>11. 입소희망날짜 </td>
					<td width=780>
						<input type="date" name="wantDate" value="<%=e.getEntWantDate()%>" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>12. 입소희망시간 </td>
					<td width=780>
						<input type="number" name="wantTime" value="<%=e.getEntWantTime()%>" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>13. 전&nbsp;화&nbsp;&nbsp;&nbsp;번&nbsp;호  </td>
					<td width=780>
						<input type="text" name="phone" value="<%=e.getReqPhone()%>" style="width: 690px" required placeholder="(-)포함해서 입력해주세요">
					</td>
				</tr>
			</table>
			<br>
			
			<table style="width:900px;">
				<tr>
					<!-- 공백란 -->
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td colspan="3"><b>입소할 동물의 사진을 첨부해주세요<mark>(필수사항)</mark></b></td>
				</tr>
				<tr>
					<!-- 공백란 -->
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr align="center">
					<th colspan="3">등록하신사진</th>
				</tr>
				<tr>
			</table>
			<% for(int i=0; i<list.size(); i++){ %>
               	<input type="hidden" name="origin<%=i+1%>" value="<%=list.get(i).getAttachNo()%>">
			<% } %>
			
			<div>
			<% for(int i=0; i<list.size(); i++){ %>
             <img id="img<%=i+1%>" width="300" height="200" onclick="chooseFile(<%=i+1%>);" src="<%=contextPath%>/<%=list.get(i).getPath()%><%=list.get(i).getChangeName()%>">
			<% } %>
			</div>
			
			<div id="file-area" style="display:none">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
            </div>
 
            <script>
            	function chooseFile(num){
            		$("#file" + num).click();
            	}
            	
            	function loadImg(inputFile, num){
            		
            		if(inputFile.files.length == 1){
            			
            			const reader = new FileReader();
            			
            			reader.readAsDataURL(inputFile.files[0]);
            			
            			reader.onload = function(e){
            				switch(num){
	            				case 1: $("#img1").attr("src", e.target.result); break;
	                            case 2: $("#img2").attr("src", e.target.result); break;
	                            case 3: $("#img3").attr("src", e.target.result); break;
            				
            				}
            			}
            			
            		}else{
            			switch(num){
	            			case 1: $("#img1").attr("src", null); break;
	        				case 2: $("#img2").attr("src", null); break;
	        				case 3: $("#img3").attr("src", null); break;
            			}
            		}
            		
            	}

			</script>			
			
			<br><br>
			<button type="button" class="btn btn-sm btn-warning">뒤로가기</button>
			<button type="submit" class="btn btn-sm btn-success">수정하기</button>
			<button type="button" class="btn btn-sm btn-outline-danger">삭제하기</button>
			<br><br>

		</form>
	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>