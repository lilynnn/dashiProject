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
     #img-area{
    	margin:auto;
    	width: 700px;
    	height:450px;
    	border: 1px solid black;
    }
    #img-area img{width:700px; height:450px}
    /* 동물정보 테이블 스타일 */
    .content-area table thead{font-size: 15px;}
    #animalInfo{font-size: 13px; border-collapse: separate; line-height: 200%;}
    #animalInfo th{font-size: 13px; text-align: right; padding-right: 15px;}
    #animalInfo input,textarea{margin: 1px 0px; width: 100%; background: rgb(228, 228, 228); border: none;}

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
            <div class="title-area">
				동물정보 상세보기
			</div>
            <hr style="width: 900px;">
            <br><br><br>
            
			<div id="img-area">
				<%if(at == null) {%>
					첨부된 이미지가 없습니다.
				<%} else {%>
					<input type="hidden" name="originFileno" value="<%=at.getAttachNo() %>">
					<img src="<%= contextPath%>/<%=at.getPath()+at.getChangeName() %>">
				<%} %>
			</div>
			
			<br>
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
                        <td><%=a.getAdoptStatus()%></td>
                        <td>
                        <%if(a.getAdoptDate() != null) {%>
                        	<%=a.getAdoptDate() %>
                        <%} else { %>
                        	--
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
                    <td><input type="text" value="<%=a.getAnimalVariety() %>" readonly></td>
                </tr>
                <tr>
                    <th>동물이름</th>
                    <td><input type="text" value="<%=a.getAnimalName() %>" readonly></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td><input type="text" value="<%=a.getAnimalGender() %>" readonly></td>
                </tr>
                <tr>
                    <th>나이</th>
                    <td><input type="text" value="<%=a.getAnimalAge() %>" readonly></td>
                </tr>
                <tr>
                    <th>접종유무</th>
                    <td><input type="text" value="<%=a.getAnimalVaccin() %>" readonly></td>
                </tr>
                <tr>
                    <th>중성화유무</th>
                    <td><input name="animalNeutral" type="text" value="<%=a.getAnimalNeutral() %>" readonly></td>
                </tr>
                <tr>
                    <th>질병유무</th>
                    <td><input type="text" value="<%=a.getAnimalDisease() %>" readonly></td>
                </tr>
                <tr>
                    <th>특이사항</th>
                    <td>
                        <input type="text" value="<%=a.getAnimalIssue() %>" style="height:70px;" readonly>
                    </td>
                </tr>

            </table>

            <div style=" text-align: center;">
			<br><br>
				<%if(a.getAdoptStatus().equals("N")) {%>
	              <a class="btn btn-warning" href="<%= contextPath %>/anadenroll.ad">공고등록하기</a>
                <%} %>
                &nbsp;
                <!--나머지는 기본으로 보여지게-->
                <a class="btn btn-success" href="<%=contextPath %>/anupdateForm.ad?ano=<%=a.getEntNo() %>" >수정하기</a>
                &nbsp;
                <a class="btn btn-secondary" href="<%=contextPath %>/anlist.ad?cpage=1">목록보기</a>
	
			</div>

            <br><br><br><br>
        </div>


    </div>
</body>
</html>