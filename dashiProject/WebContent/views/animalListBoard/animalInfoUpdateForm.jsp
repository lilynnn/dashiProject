<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.dashi.animalListBoard.model.vo.Animal" %>
<%
	Animal a = (Animal)request.getAttribute("aInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /* 관리자 메뉴바 스타일 */
    #sel-animal{
        font-weight: 700;
        color:rgb(252, 186, 3);
    }
    /* 전체 div 스타일 */
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
    /* 제목영역 스타일 */
	.title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        width: 950px;
    }
    #img-area{margin:auto;}
    #img-area img{width:290px; height:200px}
    /* 동물정보 테이블 스타일 */
    .content-area table thead{font-size: 15px;}
    #animalInfo{font-size: 13px; border-collapse: separate; line-height: 200%;}
    #animalInfo th{font-size: 13px; text-align: right; padding-right: 15px;}
    #animalInfo input,textarea,select{padding-left:10px; margin: 1px 0px; width: 100%; background: rgb(228, 228, 228); border: none;}
	
</style>
</head>
<body>

    <!-- 동물정보 조회하는 페이지 -->
    <%@ include file="../common/menubar.jsp" %>

    <!-- 전체 영역 감싸는 div -->
    <div class="outer">

        <!-- 관리자 메뉴바 div -->
        <div class="menu">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>
		

        <div class="content-area">
        	<form action="<%=contextPath %>/anupdate.ad"  method="post" enctype="multipart/form-data">
        		<input type="hidden" name="entNo" value="<%=a.getEntNo() %>">
        		<div class="title-area">
					동물정보  수정하기
				</div>
				
	            <hr style="width: 900px;">
	             <br><br>
	            
	            <!-- 이미지 보여질 영역 -->
	            <table id="img-area" style="width:650px; text-align:center;">   	
		          	<tr>
	            		<td colspan="2">
	            			<img id="titleImg" onclick="chooseFile(1);" style="width:600px; height:400px;">
	            		</td>
	            	</tr>
	            	<tr><td>&nbsp;</td></tr>
	            </table>

				<div style="display:none;">
					<input type="file" name="file1" id="file" onchange="loadImg(this, 1);">
				</div>
				<br><br>
	            <!-- 입소번호, 입소일, 입양여부 보여질 table -->
	            <table align="center" style="width: 700px; text-align: center; font-size: 13px;">
	                <thead>
	                    <tr>
	                       <th width="200">입소번호</th> 
	                       <th width="200">입소일</th>
	                       <th width="200">입양여부</th>
	                       <th width="200">입양날짜</th>
	                    </tr>
	                    <tr>
	                        <td><%=a.getEntNo() %></td>
	                        <td><%=a.getEntDate() %></td>
	                        <td>
		                        <select name="adoptStatus">
		                        <%if(a.getAdoptStatus().equals("Y")){ %>
		                        	<option align="center" value="Y" selected>Y</option>
		                        	<option align="center" value="N">N</option>
		                        <%} else { %>
		                        	<option align="center" value="Y">Y</option>
		                        	<option align="center" value="N" selected>N</option>
		                        <%} %>
		                        </select>
	         				</td>
	                        <td>
	                        <%if(a.getAdoptDate() != null) {%>
	                        	<input name="adoptDate" type="text" value="<%=a.getAdoptDate() %>" style="text-align:center;">
	                        <%} else { %>
	                        	<input name="adoptDate"  type="text" value="--" style="text-align:center;">
	                        <%} %>
	                        </td>
	                    </tr>
	                </thead>
	            </table>
	            <br><br>
	            <!-- 동물 정보 보여질 테이블 -->
	            <table id="animalInfo" style="width: 700px;">
	                <tr>
	                    <th>동물품종</th>
	                    <td><input name="animalVariety" type="text" value="<%=a.getAnimalVariety() %>" readonly></td>
	                </tr>
	                <tr>
	                    <th>동물이름</th>
	                    <td><input name="animalName" type="text" value="<%=a.getAnimalName() %>" readonly></td>
	                </tr>
	                <tr>
	                    <th>성별</th>
	                    <td><input name="animalGender" type="text" value="<%=a.getAnimalGender() %>" readonly></td>
	                </tr>
	                <tr>
	                    <th>나이</th>
	                    <td><input name="animalAge" type="text" value="<%=a.getAnimalAge() %>"></td>
	                </tr>
	                <tr>
	                    <th>접종유무</th>
	                    <td><input name="animalVaccin" type="text" value="<%=a.getAnimalVaccin() %>"></td>
	                </tr>
	                <tr>
	                    <th>중성화유무</th>
	                    <td><input name="animalNeutral" type="text" value="<%=a.getAnimalNeutral() %>"></td>
	                </tr>
	                <tr>
	                    <th>질병유무</th>
	                    <td><input name="animalDisease" type="text" value="<%=a.getAnimalDisease() %>"></td>
	                </tr>
	                <tr>
	                    <th>특이사항</th>
	                    <td>
	                        <input name="animalIssue" type="text" value="<%=a.getAnimalIssue() %>" style="height:70px;">
	                    </td>
	                </tr>
	            </table>
				
	            <div style=" text-align: center;">
				<br><br>
		
	                <button class="btn btn-success" type="submit">저장하기</button>
	                &nbsp;
	                <a class="btn btn-secondary" href="<%=contextPath %>/anlist.ad?cpage=1">목록보기</a>
		
				</div>
        	
	        	<script>
	                function chooseFile(num){
	                    $("#file").click();
	                }
	                function loadImg(inputFile, num){
	
	                    if(inputFile.files.length == 1){    
	                        
	                        const reader = new FileReader();
	
	                        reader.readAsDataURL(inputFile.files[0]);

	                        reader.onload = function(e){
	                            // e.target.result => 읽어들인 파일만의 고유한 url
	                            switch(num){
	                                case 1:$("#titleImg").attr("src",e.target.result); break;
	                            }
	                        }
	                    } else{ //선택된 파일이 취소된 경우 =>  미리보기 된 것도 사라지게
	                        switch(num){
	                                case 1:$("#titleImg").attr("src",null); break;
	                            }
	                    }
	                }
	                
	                
	            </script>
        	</form>

            <br><br><br><br>
        </div>


    </div>
</body>
</html>