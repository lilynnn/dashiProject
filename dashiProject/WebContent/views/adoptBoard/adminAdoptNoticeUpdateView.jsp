<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page  import = "java.util.ArrayList, com.dashi.adoptBoard.model.vo.AdoptNotice, com.dashi.common.model.vo.Attachment" %>
<%
 	AdoptNotice notice = (AdoptNotice)request.getAttribute("notice");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
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
	<!-- 관리자가 입양공고문을 수정하기 위한 페이지 -->
	<%@ include file="../common/menubar.jsp" %>

	<!-- 전체 영역 감싸는 div -->
	<div class="outer">

		<div id="menubar" style="margin-right: 20px;">
			<%@ include file="../admin/adminMenubar.jsp" %>
		</div>

		<form action="<%=contextPath%>/adtupdate.ad" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boardNo" value="<%=notice.getAnlistNo() %>">
			<input type="hidden" name="entNo" value="<%=notice.getEntNo() %>">
			<div class="content-area">

				<div class="title-area">
					입양공고글 수정하기
				</div>

				<hr style="width: 900px;">

				<table align="center" id="animalInfo" style="width: 900px;">
					<thead>
						<tr>
							<th style="font-size: 20px;">제목</th>
							<td colspan="2" style="font-size: 17px;">
								<input type="text" name="title" value="<%=notice.getAnTitle() %>">
								
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
							<%for(int i=1; i<=list.size(); i++) {%>
							<td align="center">
								<img id="Img<%=i%>" src="<%=contextPath %>/<%=list.get(i-1).getPath()+list.get(i-1).getChangeName() %>" width="290" height="250" onclick="chooseFile(<%=i%>);">
							</td>
							<%} %>
						</tr>
						<tr>
							<td colspan="3" style="color:red;">등록할 사진 3개를 선택하세요.</td>
						</tr>
						<!-- 공백란 -->
						<tr><td>&nbsp;</td></tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3"><b style="font-size: 18px; padding-left: 5px;">동물 정보</b></td>
						</tr>
						<!-- 동물 품종  -->
						<tr>
							<th>묘종 / 견종</th>
							<td colspan="2"><input name=variety value="<%=notice.getAnimalVariety() %>"></td>
						</tr>
	
						<!-- 동물 이름 -->
	                    <tr>
	                        <th>이 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 름</th>
	                        <td colspan="2"><input name=animalName value="<%=notice.getAnimalName() %>"></td>
	                    </tr>
	                    
						<!-- 동물 나이 -->
						<tr>
							<th>나 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이</th>
							<td colspan="2"><input name=animalAge value="<%=notice.getAnimalAge() %>"></td>
						</tr>
	
						<!-- 동물 성별 -->
						<tr>
							<th>성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 별</th>
							<td colspan="2"><input name=animalGender value="<%=notice.getAnimalGender() %>"></td>
						</tr>
	
						<!-- 접종 여부 -->
						<tr>
							<th>접종 &nbsp; 여부</th>
							<td colspan="2"><input name=animalVaccin value="<%=notice.getAnimalVaccin() %>"></td>
						</tr>
						
						<!-- 중성화 여부 -->
						<tr>
							<th>중성화여부</th>
							<td colspan="2"><input name=animalNeutral value="<%=notice.getAnimalNeutral() %>"></td>
						</tr>
						
						<!-- 질병여부 -->
						<tr>
							<th>질병 &nbsp; 여부</th>
							<td colspan="2"><input name=animalDisease value="<%=notice.getAnimalDisease() %>"></td>
						</tr>
						
						<!-- 특이사항 -->
						<tr>
							<th>특이 &nbsp; 사항</th>
							<td colspan="2"><input name=animalIssue value="<%=notice.getAnimalIssue() %>"></td>
						</tr>
	
						<!-- 내용 -->
						<tr>
							<th>내 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 용</th>
							<td colspan="2">
								<!--  
								<input type="text" name="content" value="<%=notice.getAnContent() %>" name="content" style="height:100px;">

								-->
								<textarea name="content" name="content" cols="100" rows="10" style="resize:none;">
<%=notice.getAnContent() %>
								</textarea>

							</td>
						</tr>
					</tbody>
				</table>

				<!-- 원본파일명 보여질 div -->
				<div style="disply:none;">
					<% if(!list.isEmpty()) {%>
						<%for(int i=1; i<=list.size(); i++) {%>
							<input type="hidden" value="<%=list.get(i-1).getOriginName() %>">
	                		<input type="hidden" name="originFileNo<%=i %>" value = "<%=list.get(i-1).getAttachNo() %>"><br>

						<%} %>				
					<%}%>				
				</div>

				<!-- 새로운 파일 input 보여질 div -->
				<div style="display:none;">
					<input type="file" name="file1" id="file1" onchange="loadImg(this, 1);"> <br>
	               	<input type="file" name="file2" id="file2" onchange="loadImg(this, 2);"> <br>
	           	    <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);"> <br>
				</div>	
	
           	    
				<div style=" text-align: center;">
					<br><br>
					<button type="submit" class="btn btn-success">등록하기</button>
					&nbsp;
					<button class="btn btn-secondary">목록보기</button>
				</div>
				
				<script>
					function chooseFile(num){
						$("#file"+num).click();
					}
					function loadImg(inputFile, num){
						
						if(inputFile.files.length == 1){
							const reader = new FileReader();
							
							reader.readAsDataURL(inputFile.files[0]);
							
							reader.onload = function(e){
								 switch(num){
	                                case 1:$("#Img1").attr("src",e.target.result); break;
	                                case 2:$("#Img2").attr("src",e.target.result); break;
	                                case 3:$("#Img3").attr("src",e.target.result); break;
	                            }
							}
						} else{
							switch(num){
                            case 1:$("#Img1").attr("src",null); break;
                            case 2:$("#Img2").attr("src",null); break;
                            case 3:$("#Img3").attr("src",null); break;
                      		}
						}
					}
				</script>
			</div>
		</form>



	</div>
</body>
</html>