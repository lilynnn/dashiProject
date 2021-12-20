<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dashi.adoptBoard.model.vo.AdoptNotice, java.util.ArrayList, com.dashi.common.model.vo.Attachment" %>
<% 
	AdoptNotice an = (AdoptNotice)request.getAttribute("an");
	// 글번호, 제목, 내용, 작성일, 조회수, 입소번호
	// 동물품종, 동물이름, 성별, 나이, 접종여부, 중성화여부, 질병유무, 특이사항
	
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /* 전체 영역 감싸는 div */
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
        height: auto;
    }

    .image-area>img{
        width: 600px;
        height: 500px;
        margin: auto;
    }
	#img-area img{width:400px; height:370px;}
    .content-area{
        width: 1200px;
        margin: auto;
    }
    
    /* 동물정보가 담겨있는 테이블 */
    .animal-info{
        text-align: center;
        height: 140px;
        font-size: 13px;
        border-collapse: separate;
        border-spacing: 1px;
    }
    .animal-info th{background: rgb(157, 219, 167); width: 180px;}
    .animal-info td{width: 220px;}
</style>
</head>
<body>

	<!-- 지희 수정중  -->
	<!-- 사용자가 보게될 입양 공고문의 상세 페이지 -->
	
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="outer">

            <br><br><br><br>
            
            <!-- 입양공고 상세내용 영역 -->
            <div class="content-area" align="center">

                <!-- 입양공고 제목, 작성일, 조회수 -->
                <table align="left" style="margin-left: 150px;">
                    <tr>
                        <td colspan="5">
                            <h6><b><%= an.getAnTitle() %></b></h6>
                        </td>
                    </tr>
                    <tr style="color: rgb(87, 87, 85); font-size: 14px;">
                        <td>작성일&nbsp;</td>
                        <td><%= an.getWriteDate() %></td>
                        <td>&nbsp;<!--공백란--></td>
                        <td>조회수</td>
                        <td><%=an.getViewCount() %></td>
                    </tr>
                </table>

                <br><br>
                <hr width="900" color="gray">
                <br>

				<!-- 관리자가 업로드한 동물 대표 이미지 보여질 table -->
                <div class="image-area">
           			<img src="<%=contextPath %>/<%=list.get(0).getPath()+list.get(0).getChangeName() %>">
                </div>
                <br><br>

                <!-- 동물 상세정보 -->
                <table class="animal-info" width="800px">
                    <tr>
                        <th>품종</th>
                        <td><%=an.getAnimalVariety() %></td>
                        <th>나이</th>
                        <td><%=an.getAnimalAge() %> 살</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td><%=an.getAnimalGender() %></td>
                        <th>접종여부</th>
                        <td><%=an.getAnimalVaccin() %></td>
                    </tr>
                    <tr>
                        <th>중성화여부</th>
                        <td><%=an.getAnimalNeutral() %></td>
                        <th>특이사항</th>
                        <td><%=an.getAnimalIssue() %></td>
                    </tr>
                </table>
 				<br><br><br>
 				
   				<!-- 관리자가 업로드한 동물 상세 이미지 보여질 table -->
				<table border="1" id="img-area">
                	<tr>
	                	<td><img src="<%=contextPath %>/<%=list.get(1).getPath()+list.get(1).getChangeName() %>"></td>
	                	<td><img src="<%=contextPath %>/<%=list.get(2).getPath()+list.get(2).getChangeName() %>" ></td>
                	</tr>
                </table>
                <br><br><br>
                
                
                <!-- 관리자가 입력한 내용 출력되는 영역 -->
                <div class="text-area" align="center" style="width: 600px; height: 200px;">
					<%= an.getAnContent() %>
                </div>  

                <br><br>
                <!-- 고정으로 가져갈 주의사항 멘트 -->
                <img src="<%= contextPath%>/resources/images/adopt/adoptProcedureGuide.png" style="width: 800px;">
                <br>
                <img src="<%=contextPath%>/resources/images/adopt/adoptnotice.png" width="600">
                <br><br>
                
                <br><br><br><br>

                <table style="margin: auto;"> 
                    <tr>
                        <td width="900"><!-- 공백란으로 사용 --></td>
                        <td width="100" style="padding-left: 30px;">
                            <!-- 나중에 이미지 찾아서 넣기-->
                            찜하기
                        </td>
                        <td width="100" style="padding-left: 10px;">
                            <!-- 나중에 이미지 찾아서 넣기-->
                            공유하기
                        </td>
                    </tr>
                </table>

                <br>

                <!-- 이전글/다음글 넘기는 영역 -->
                <table class="table"style="width: 1100px;">
                
                    <!-- 한 줄 영역으로 클릭 효과 주기 -->
                    <tbody>
                        <tr>
                            <td width="100">이전글</td>
                            <td width="700">[동물품종][이름]의 가족을 기다려요.</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr>
                            <td width="100">다음글</td>
                            <td width="700">[동물품종][이름]의 가족을 기다려요.</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr>
                            <!-- 구분선용 공백란 -->
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>


                <!-- 나중에 경로 수정하기!! -->
                <%if(loginUser != null) {%>
                <a href="<%= contextPath%>/adapply.adt?adtno=<%=an.getAnlistNo() %>" class="btn btn-success">입양신청하기</a>
                <%} %>
                <a href="<%= contextPath%>/adlist.adt?cpage=1" class="btn btn-secondary">목록보기</a>
                <br><br><br><br>

                
            </div>

    </div>

    <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>