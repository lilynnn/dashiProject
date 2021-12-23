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
<title>입소신청 상세페이지</title>
<style>

    /* 전체 영역 감싸는 div */
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
        height:1500px;
    }
	#menubar{width:250px;}
	.outer>div{float:left;}
    .image-area{
        width: 600px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    .content-area{
        margin-top:20px;
        margin: auto;
    }
    
    /* 동물정보가 담겨있는 테이블 */
    .animal-info{
        text-align: center;
        height: 40px;
        font-size: 13px;
        border-collapse: separate;
        border-spacing: 1px;
        border: 1px solid gray;
    }
    .animal-info th{background: #f5e6ff; width: 180px;}
    .animal-info td{width: 220px;}
    .table-hover tr{
    	height:50px;
    	font-size:20px;
    	border:1px solid gray;
    	text-align:center;
    }
</style>
</head>
<body>
	
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="outer">
   		
   		<!-- 관리자 메뉴바 영역-->

        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>
        
            <div style="margin-top:50px;">
                <h3>입소신청</h3>
           <hr>
            </div>
          
            <div class="content-area" align="center">            
                
                <!-- 입양공고 제목, 작성일, 조회수 -->
                <table align="left" style="margin-left: 150px;">
                    <tr>
                        <td colspan="3" width="100%" align="center">
                            <h5><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<% if(e.getAnimalType().equals("D")){ %>
								[강아지] 
							<% }else if(e.getAnimalType().equals("C")){ %>
								[고양이]
							<% }else{ %>
								[기타]
							<% } %>                            
                            [<%=e.getAnimalName()%>]의 입소신청서</b></h5>
                        </td>
                    </tr>
                    <tr style="color: rgb(87, 87, 85); font-size: 14px;">
                        <td width="50%" align="right">작성일&nbsp;</td>
                        <td width="50%" align="center"><%=e.getEntApplyDate()%></td>
                    </tr>
                </table>

                <br><br>
                <hr width="880" color="gray">
                <br>

                <div>
                   <h4> 신청자 정보 </h4>
                </div>
                <br><br>

                <!-- 동물 상세정보 -->
                <table class="animal-info" width="600px">
                    <tr>
                        <th>작성자</th>
                        <td><%=e.getMemName()%></td>
                        <th>카테고리</th>
                        <td>
                        	<% if(e.getAnimalType().equals("D")){ %>
								[강아지] 
							<% }else if(e.getAnimalType().equals("C")){ %>
								[고양이]
							<% }else{ %>
								[기타]
							<% } %>    
                        </td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><%=e.getEntApplyDate()%></td>
                        <th>처리결과</th>
                     
                         <td> 
                            <select name="search-category" id="category">
	                            <option value="확인">확인</option>
	                            <option value="승인">승인</option>
	                            <option value="거부">거부</option>
                            </select>
                            <script>
						    	$(function(){
						    		$("#category option").each(function(){
						    			if($(this).val() == "<%=e.getProcessResult()%>"){
						    				$(this).attr("selected", true);
						    			}
						    		})
						    	})
						    </script>
                   		 </td>
                    </tr>
                </table>
                <br><br><br>
                <table>
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
                <br>
                <!-- 내역 -->
                <div >
               <b>신청 상세 내역</b>
                </div>
               <br><br>

                <table class="table-hover" style="text-align:left; width:600px;">
                    <tr>
                        <th>1. 신청 보호소명  </th>
                        <td> 다시, 사랑받개! </td>
                    </tr>
                    <tr>
                        <th>2. 품종</th>
                        
                        <td><%=e.getAnimalVariety()%></td>
                    </tr>
                    <tr>
                        <th>3. 성별 </th>
                        
                        <td><%=e.getAnimalGender()%></td>
                    </tr>
                    <tr>
                        <th>4. 나이 </th>
                        
                        <td><%=e.getAnimalAge()%></td>
                    </tr>
                    <tr>
                        <th>5. 접종여부 </th>
                       
                        <td><%=e.getAnimalVaccinated()%></td>
                    </tr>
                    <tr>
                        <th>6. 중성화 유무</th>
                        <td><%=e.getAnimalNeturalization()%></td>
                    </tr>
                    <tr>
                        <th>7. 질병 유무 </th>
                        
                        <td><%=e.getAnimalDisease()%></td>
                    </tr>
                    <tr>
                        <th>8. 특이사항</th>
                       
                        <td><%=e.getAnimalIssue()%></td>
                    </tr>
                    <tr>
                        <th>9. 입소 희망 일시 </th>
                     
                        <td><%=e.getEntWantDate()%>&nbsp;<%=e.getEntWantTime()%>시</td>
                    </tr>
                </table>
                
                <br><br><br><br>
                <br>
				
				<div align="center">
	        		<a href="<%=contextPath%>/entListView.ad?cpage=1" class="btn btn-sm btn-secondary">목록가기</a>
	        		
	        		<% if(e.getProcessResult().equals("확인")){ %>
	        		<a href="confirmEnt.ad?eno=<%=e.getEntNo()%>" class="btn btn-sm btn-warning">승인하기</a>
	        		<% } %>
	        		<a href="rejectEnt.ad?eno=<%=e.getEntNo()%>" class="btn btn-sm btn-danger">반려하기</a>
	        		<a href="delete.ent?eno=<%=e.getEntNo()%>" class="btn btn-sm btn-dark">삭제하기</a>
        		</div>


            </div>
        
    </div>

    <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>