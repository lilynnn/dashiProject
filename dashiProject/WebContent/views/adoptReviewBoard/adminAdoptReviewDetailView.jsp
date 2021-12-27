<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.dashi.common.model.vo.*, com.dashi.adoptReviewBoard.model.vo.AdoptReview" %>
    
<%
	AdoptReview ar = (AdoptReview)request.getAttribute("ar");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 30px;
        height: 2200px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }

    /*입양후기 글 영역*/
    .content-area{
         width: 850px;
         float: left;
    }
    /*전체 제목 영역*/
    .title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }

    /*사용자 첨부 이미지 영역*/
    .image-area{
        width: 600px;
        height: auto;
        margin: auto;
        margin-top: 30px;
    }

    /*버튼 영역*/
    .btnn{
        border: none;
        background: rgb(102,184,94);
        color: rgb(70, 69, 69);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }
    /*사용자가 작성한 글 영역*/
    .text-area{
        width: 600px;
        margin-bottom: 100px;
        margin-top: 100px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <!-- 전체 영역 감싸는 div -->
    <div class="outer">
        
        <!-- 관리자 메뉴바 영역-->
        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>


             <!-- 입양후기 관리 영역 -->
            <div class="content-area">
                
                <!-- 전체 제목 div -->
                <div class="title-area">   
                    입양후기 관리
                </div>
                
                <hr style="width: 900px;">
                
	            <!-- 사용자가 작성한 입양후기 상세내용 영역 -->
	            <div class="content-area" align="center">
	                <!-- 입양후기 제목, 작성일, 조회수 -->
	                <table align="left" style="margin-left: 150px;">
	                    <tr>
	                        <td colspan="5" style="height: 80px;">
	                            <h2><b>
		                        <% if(ar.getAnType().equals("cat")){ %>
				                [고양이]
				                <%}else if(ar.getAnType().equals("dog")){ %>
				                [강아지]
				                <%}else if(ar.getAnType().equals("etc")){ %>
				                [기타동물]
				                <%} %>
	                            &nbsp;<%= ar.getArTitle() %></b></h2>
	                        </td>
	                    </tr>
	                    <tr style="color: rgb(87, 87, 85); font-size: 14px;">
	                        <td>작성자</td>
	                        <td><%= ar.getNickname() %></td>
	                        <td>작성일&nbsp;</td>
	                        <td><%= ar.getWriteDate() %></td>
	                        <td>&nbsp;<!--공백란--></td>
	                    </tr>
	                </table>
                    <br><br><br><br>
	                <hr width="900">
	                <br>
	
	                <!-- 사용자 작성 글내용 -->
	                <div class="text-area" align="center">
	                    <%=ar.getArContent() %>     
	                </div>   
	
	                <!-- 사용자 첨부 이미지 -->
	                <div class="image-area">
	                    <img class="image-area" src="<%=contextPath %>/<%=list.get(0).getPath() + list.get(0).getChangeName() %>">
	                </div>
	                <br><br>
	                <div class="image-area">
	                	<% for(int i=1; i<list.size(); i++){ %>
	                    <img class="image-area" src="<%=contextPath %>/<%=list.get(i).getPath() + list.get(i).getChangeName() %>">
	                    <% } %>
	                </div>
	        
	                <br><br>
	                <br><br><br><br>

	                <!--클릭 시 삭제 확인 alert창 발생-->
	                <button onclick="location.href='<%= contextPath %>/reviewdelete.ad?arno=<%= ar.getArlistNo() %>'" class="btnn" style="margin-bottom: 100px;">삭제하기</button>
	            </div>
            </div>

    </div>
</body>
</html>