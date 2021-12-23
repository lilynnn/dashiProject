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
	#boardlist-ent{
		font-weight:900px;
    	color:rgb(252, 186, 3);
    	background: rgb(32, 68, 28);
	}
    #mem-boardlist{
       background: rgb(32, 68, 28);
       color: orange;
    }
</style>
</head>
<body>

	
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div style="width:100%" align="center">
		<br><br><br>
       <%@ include file="../common/memberUpdateMenubar.jsp" %>
       <br><br>
   </div>
	
	
	<div class="outer" align="center">
	

			<div class="title-area">
				<h4>입소신청서</h4>
			</div>
			
		
			
			<table style="width: 900px;">
				<!-- 신청할 입양공고문 제목 -->

				<tr>
					<td width=220><b>제목을 적어주세요</b></td>
					<td width=780>
						<%=e.getEntTitle()%>
					</td>
				</tr>
				<!-- 신청자 정보 -->
				<tr>
					<td width=220>1. 신청인 성명  </td>
					<td width=780>
						<%=e.getMemName()%>
					</td>
				</tr>
				<tr>
					<td width=220>2. 동&nbsp;물&nbsp;&nbsp;&nbsp;이&nbsp;름 </td>
					<td width=780>
						<%=e.getAnimalName()%>
					</td>
				</tr>
				<tr>
					<td width=220>3. 동&nbsp;물&nbsp;&nbsp;&nbsp;종&nbsp;류 </td>
					<td width=780>
						<%=e.getAnimalType()%>
					</td>
				</tr>
				<tr>
					<td width=220>4. 동&nbsp;물&nbsp;&nbsp;&nbsp;품&nbsp;종</td>
					<td width=780>
						<%=e.getAnimalVariety()%>
					</td>
				</tr>
				<tr>
					<td width=220>5. 동&nbsp;물&nbsp;&nbsp;&nbsp;나&nbsp;이 </td>
					<td width=780>
						<%=e.getAnimalAge()%>
					</td>
				</tr>
				<tr>
					<td width=220>6. 동&nbsp;물&nbsp;&nbsp;&nbsp;성&nbsp;별</td>
					<td width=780>
						<%=e.getAnimalGender()%>
					</td>
				</tr>
				<tr>
					<td width=220>7. 접&nbsp;종&nbsp;&nbsp;&nbsp;여&nbsp;부</td>
					<td width=780>
						<%=e.getAnimalVaccinated()%>
					</td>
				</tr>
				<tr>
					<td width=220>8. 중&nbsp;성&nbsp;화&nbsp;여&nbsp;부 </td>
					<td width=780>
						<%=e.getAnimalNeturalization()%>
					</td>
				</tr>
				<tr>
					<td width=220>9. 질&nbsp;병&nbsp;&nbsp;&nbsp;유&nbsp;무 </td>
					<td width=780>
						<%=e.getAnimalDisease()%>
					</td>
				</tr>
				<tr>
					<td width=220>10. 특&nbsp;이&nbsp;&nbsp;&nbsp;사&nbsp;항 </td>
					<td width=780>
						<%=e.getAnimalIssue()%>
					</td>
				</tr>
				<tr>
					<td width=220>11. 입소희망날짜 </td>
					<td width=780>
						<%=e.getEntWantDate()%>
					</td>
				</tr>
				<tr>
					<td width=220>12. 입소희망시간 </td>
					<td><%=e.getEntWantTime()%><b>시</b></td>
				</tr>
				<tr>
					<td width=220>13. 전&nbsp;화&nbsp;&nbsp;&nbsp;번&nbsp;호  </td>
					<td width=780>
						<%=e.getReqPhone()%>
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
                    <td align="center" width="300">
                        <img src="<%=contextPath%>/<%=list.get(0).getPath() + list.get(0).getChangeName()%>" width="300" height="200">
                    </td>
                    <% for(int i=1; i<list.size(); i++){ %>
                    <td width="300">
                    	<img src="<%=contextPath%>/<%=list.get(i).getPath() + list.get(i).getChangeName()%>" width="300" height="200">
                    </td>
                    <% } %>
				</tr>
			</table>
			
			<div align="center">
        		<a href="<%=contextPath%>/entList.ent" class="btn btn-sm btn-secondary">목록가기</a>
        		<% if(e.getProcessResult().equals("확인")){ %>
        		<a class="btn btn-sm btn-warning">수정하기</a>
        		<a class="btn btn-sm btn-danger">삭제하기</a>
        		<% } %>
        	</div>
        
			
	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>