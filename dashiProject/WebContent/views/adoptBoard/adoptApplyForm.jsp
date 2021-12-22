<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dashi.adoptBoard.model.vo.AdoptNotice" %>
<%
	AdoptNotice an = (AdoptNotice)request.getAttribute("an");
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
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer" align="center">
	
		<form action="<%=contextPath %>/adpinsert.adt" method="post" enctype="multipart/form-data">

			<div class="title-area">
				<h4>입양신청서</h4>
			</div>
			
			<input type="hidden" name="anNo" value="<%=an.getAnlistNo() %>">
			<input type="hidden" name="memNo" value="<%=loginUser.getMemNo() %>">
			<input type="hidden" name="memName" value="<%=loginUser.getMemName() %>">
			
			<table style="width: 900px;">
				<!-- 신청할 입양공고문 제목 -->
				<tr>
					<td width=220 style="font-size: 14px;">* 입양 공고문 제목 : </td>
					<td width=780>
						<input type="text" style="width: 690px" name="adpTitle" value=" <%=an.getAnTitle() %>" readonly>
					</td>
				</tr>
				<tr>
					<!-- 공백란 -->
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<b style="font-size: 15px;">* 다음 양식을 채워주세요.</b>
					</td>
				</tr>
				
				<!-- 신청자 정보 -->
				<tr>
					<td width=220>1. 신청인 성명  </td>
					<td width=780>
						<input type="text" name="adpName" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<!-- 연령 -->
					<td width=220>2. 연 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 령 </td>
					<td width=780>
						<input type="text" name="adpAge" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<!-- 성별 -->
					<td width=220>3. 성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 별 </td>
					<td width=780>
						<input type="radio" name="adpGender" value="M" required> 남성
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="adpGender" value="F"> 여성
					</td>
				</tr>
				<tr>
					<!-- 전화번호 -->
					<td width=220>4. 전&nbsp;화&nbsp;&nbsp;&nbsp;번&nbsp;호 </td>
					<td width=780>
						<input type="text" name="phone" style="width: 690px" placeholder=" - 포함해서 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<!-- 이메일 -->
					<td width=220>5. 이&nbsp;&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;&nbsp;일 </td>
					<td width=780>
						<input type="text" name="email" style="width: 690px" required>
					</td>
				</tr>
				<tr>
					<!-- 주소 -->
					<td width=220>6. 주 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 소 </td>
					<td>
						<input type="text" name="address" style="width: 690px" placeholder=" 상세주소까지 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<!-- 기혼여부 -->
					<td width=220>7. 기&nbsp;혼&nbsp;&nbsp;&nbsp;여&nbsp;부 </td>
					<td width=780>
						<input type="radio" name="marriage" value="Y" required> 기혼
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="marriage" value="N"> 미혼
					</td>
				</tr>
				<tr>
					<!-- 직업 -->
					<td width=220>8. 직 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 업 </td>
					<td width=780>
						<input type="text" name="job" style="width: 690px" required>
					</td>
				</tr>
			</table>
			<br>

			<table style="width: 900px;">
				<!-- 기초 조사 설문지 -->
				<tr>
					<td><b>* 기초 조사 설문지를 작성해주세요.</b></td>
				</tr>
				<tr>
					<td>1. 유기동물 입양을 결심하게 된 계기를 입력해주세요.(상세히 써주세요)</td>
				</tr>
				<tr>
					<td>
						<textarea class="inputText-area" name="adReason" required></textarea>
					</td>
				</tr>
				
				<tr>
					<td>2. 반려동물을 키워본 경험이 있으십니까?</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="adExp" style="width: 830px; margin-left: 20px;" required>
					</td>
				</tr>
				
				<tr>
					<td>3. 현재 반려동물을 키우고 계십니까?</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="havePet" value="Y" style="margin-left: 30px;" required> 예
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="havePet" value="N"> 아니오
					</td>
				</tr>
				<!-- 예 라디오버튼 클릭했을때 보여지게끔하기 -->
				<tr>
					<td id="havePet-area">
						<p style="display: inline; margin-left: 20px;">종류</p>&nbsp;
						<input style="width: 150px;" type="text" name="petType" disabled>
						
						<p style="display: inline; margin-left: 20px;">나이</p>&nbsp;
						<input style="width: 100px;" type="text" name="petAge" value="0" disabled>
						
						<p style="display: inline; margin-left: 20px;">성별</p>&nbsp;&nbsp;
						<input type="radio" name="petGender" value="M" disabled > 남
						&nbsp;&nbsp;
						<input type="radio" name="petGender" value="F" disabled > 여
						&nbsp;&nbsp;&nbsp;&nbsp;
						<p style="display: inline; margin-left: 20px;">중성화여부</p>&nbsp;&nbsp;
						<input type="radio" name="petNeutral" value="Y" disabled> 예
						&nbsp;&nbsp;
						<input type="radio" name="petNeutral" value="N" disabled> 아니오
					</td>
				</tr>
					
				<tr>
					<td>4. 귀하의 가족은 모두 몇 명입니까?</td>
				</tr>
				<tr>
					<td style="font-size: 13px; color: gray;">자녀가 2명 이상인 경우 가장 어린 나이를 작성해주세요.</td>
				</tr>
				<tr>
					<td>
						<p style="display: inline; margin-left: 30px;">성인</p>&nbsp;
						<input type="text" name="aMate" placeholder="0명" value="0" required>
						<p style="display: inline; margin-left: 30px;">아이</p>&nbsp;
						<input type="text" name="cMate" placeholder="0명" value="0" required>
						<p style="display: inline; margin-left: 30px;">아이</p>&nbsp;
						<input type="text" name="childAge" placeholder="0세" value="0" required>
					</td>
				</tr>

				<tr>
					<td>5. 귀하의 동거인은 입양에 찬성하시나요?</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="agreeYPN" value="Y" style="margin-left: 30px;" required> 모두찬성
						<input type="radio" name="agreeYPN" value="P" style="margin-left: 30px;"> 부분찬성
						<input type="radio" name="agreeYPN" value="N" style="margin-left: 30px;"> 본인 제외 모두 반대
					</td>
				</tr>

				<tr>
					<td>6. 1년 이내에 결혼, 출산, 이사 등 환경변화 계획이 있으신가요? </td>
				</tr>
				<tr>
					<td>
						<textarea name="eventAni" class="inputText-area" required></textarea>
					</td>
				</tr>

				<tr>
					<td>7. 하루에 몇 시간 이상 집을 비우시나요?</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="emptyHouse" value="1h미만" style="margin-left: 30px;" required> 1시간 미만
						<input type="radio" name="emptyHouse" value="1h-4h" style="margin-left: 30px;"> 1 ~ 4 시간
						<input type="radio" name="emptyHouse" value="4h-8h" style="margin-left: 30px;"> 4 ~ 8 시간
						<input type="radio" name="emptyHouse" value="8h이상" style="margin-left: 30px;"> 8시간 이상
					</td>
				</tr>

				<tr>
					<td>8. 거주하고 계신 주택 형태에 표시해주세요</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="houseType" value="아파트" style="margin-left: 30px;" required> 아파트
						<input type="radio" name="houseType" value="단독주택" style="margin-left: 30px;"> 단독주택
						<input type="radio" name="houseType" value="다세대주택" style="margin-left: 30px;"> 다세대주택
						<input type="radio" name="houseType" value="원룸" style="margin-left: 30px;"> 원룸
						<input type="radio" name="houseType" value="기타" style="margin-left: 30px;"> 기타
					</td>
				</tr>

				<tr>
					<td>9. 거주하고 계신 주택은 본인(혹은 가족)의 소유입니까?</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="hself" value="Y" style="margin-left: 30px;" required> 예
						<input type="radio" name="hself" value="N" style="margin-left: 30px;"> 아니오
					</td>
				</tr>

				<tr>
					<td>10. 입양에 대해 이웃의 동의를 구하셨나요?</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="neiYN" value="Y" style="margin-left: 30px;" required> 예
						<input type="radio" name="neiYN" value="N" style="margin-left: 30px;"> 아니오
					</td>
				</tr>

				<tr>
					<td>11. 한 달 기준 고정적으로 예상되는 예방접종 및 양육비용을 기입하세요.</td>
				</tr>
				<tr>
					<td>
						<input name="expCost" type="text" style="width: 830px; margin-left: 20px;" placeholder=" 만원 단위로 입력해주세요." required>
					</td>
				</tr>

				<tr>
					<!-- 공백란 -->
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td><b>모든 문항을 작성한 후 유의사항을 읽고 서명한 파일을 첨부해서 제출해주세요.</b></td>
				</tr>
				<tr>
					<td>
						<input name="upfile" type="file">
					</td>
				</tr>
			</table>
			
			<br><br>
			<button class="btn btn-lg btn-success">제출하기</button>
			<br><br>

		</form>

	<script>
		$(function(){
			$("input:radio[name=havePet]").click(function(){
				if($("input[name=havePet]:checked").val() == 'Y'){
					// 펫을 키우고있다면 활성화
					$("#havePet-area input").attr("disabled",false);
				} else{
					$("#havePet-area input").attr("disabled",true);
				}
			})
		})
	</script>
	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>