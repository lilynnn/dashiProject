<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		background: rgb(40,112,37);
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
	
		<form action="<%=contextPath %>/entinsert.ent" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userNo" value="<%=loginUser.getMemNo()%>">


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
						<input type="text" name="title" style="width: 690px" required>
					</td>
				</tr>
				<!-- 신청자 정보 -->
				<tr>
					<td width=220>1. 신청인 성명  </td>
					<td width=780>
						<input type="text" name="userName" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>2. 동&nbsp;물&nbsp;&nbsp;&nbsp;이&nbsp;름 </td>
					<td width=780>
						<input type="text" name="petName" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>3. 동&nbsp;물&nbsp;&nbsp;&nbsp;종&nbsp;류 </td>
					<td width=780>
						<input type="radio" name="petType" value="D" required> 강아지
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="petType" value="C"> 고양이
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="petType" value="E"> 기타
					</td>
				</tr>
				<tr>
					<td width=220>4. 동&nbsp;물&nbsp;&nbsp;&nbsp;품&nbsp;종</td>
					<td width=780>
						<input type="text" name="petVariety" style="width: 690px" required placeholder="품종을 정확히 적어주세요.">
					</td>
				</tr>
				<tr>
					<td width=220>5. 동&nbsp;물&nbsp;&nbsp;&nbsp;나&nbsp;이 </td>
					<td width=780>
						<input type="number" name="petAge" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>6. 동&nbsp;물&nbsp;&nbsp;&nbsp;성&nbsp;별</td>
					<td width=780>
						<select name="petGender">
                            <option value="F">암컷</option>
                            <option value="M">수컷</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td width=220>7. 접&nbsp;종&nbsp;&nbsp;&nbsp;여&nbsp;부</td>
					<td width=780>
						<select name="petVaccin">
                            <option value="Y">접종완료</option>
                            <option value="N">접종전</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td width=220>8. 중&nbsp;성&nbsp;화&nbsp;여&nbsp;부 </td>
					<td width=780>
						<input type="radio" name="neutral" value="Y" required> 중성화 완료
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="neutral" value="N"> 중성화 전
					</td>
				</tr>
				<tr>
					<td width=220>9. 질&nbsp;병&nbsp;&nbsp;&nbsp;유&nbsp;무 </td>
					<td width=780>
						<input type="text" name="disease" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>10. 특&nbsp;이&nbsp;&nbsp;&nbsp;사&nbsp;항 </td>
					<td width=780>
						<input type="text" name="petIssue" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>11. 입소희망날짜 </td>
					<td width=780>
						<input type="date" name="wantDate" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>12. 입소희망시간 </td>
					<td width=780>
						<input type="number" name="wantTime" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<td width=220>13. 전&nbsp;화&nbsp;&nbsp;&nbsp;번&nbsp;호  </td>
					<td width=780>
						<input type="text" name="phone" style="width: 690px" required placeholder="(-)포함해서 입력해주세요">
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
					<th>대표이미지</th>
					<th colspan="2">상세이미지</th>
				</tr>
				<tr>
					<tr>
                    <td align="center" width="300">
                        <img id="titleImg" width="300" height="200" onclick="chooseFile(1);">
                    </td>
                    <td width="300">
                    	<img id="contentImg1" width="300" height="200" onclick="chooseFile(2);">
                    </td>
                    <td width="300">
                    	<img id="contentImg2" width="300" height="200" onclick="chooseFile(3);">
                    </td>
				</tr>
			</table>
			
			<div id="file-area" style="display:none">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
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
	            				case 1: $("#titleImg").attr("src", e.target.result); break;
	                            case 2: $("#contentImg1").attr("src", e.target.result); break;
	                            case 3: $("#contentImg2").attr("src", e.target.result); break;
            				
            				}
            			}
            			
            		}else{
            			switch(num){
	            			case 1: $("#titleImg").attr("src", null); break;
	        				case 2: $("#contentImg1").attr("src", null); break;
	        				case 3: $("#contentImg2").attr("src", null); break;
            			}
            		}
            		
            	}
            </script>
			
			
			<br><br>
			<button class="btn btn-lg btn-success">제출하기</button>
			<br><br>

		</form>
	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>