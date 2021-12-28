<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dashi.common.model.vo.PageInfo, java.util.ArrayList, com.dashi.adoptReviewBoard.model.vo.AdoptReview" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1100px;
        height: 1000px;
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
    }
    .tbody>tr{
        border-bottom: solid 1px gray;
    }
    .page{
        border: none;
        background: lightgray;
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 30px;
        width: 30px;
        border-radius: 9px;
    }
    .table{
        font-size: 13px;
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
        
        

             <!-- 입양후기리스트 보여줄 div -->
            <div class="content-area">
                
                <!-- 전체 제목 div -->
                <div class="title-area">   
                    전체 결제내역 관리
                </div>
                
                <hr style="width: 900px;">
                <br>
                
                <table align="center" class="table" style="width: 900px; height: 250px; text-align: center; margin-top: 20px; border-collapse: collapse; font-size: 13px;">
                    <thead style="background: rgb(214, 235, 241);">
                        <tr>
                            <th width="100">회원번호</th>
                            <th width="100">아이디</th>
                            <th width="100">닉네임</th>
                            <th width="300">이름</th>
                            <th width="100">결제금액</th>
                            <th width="100">결제날짜</th>
                            
                            <th width="110">결제여부</th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="9">조회된 게시글이 없습니다.</td>
                    	</tr>
                    <% }else{ %>
                    	<% for(Member m : list){ %>
                        <tr>
                              <td><%= m.getMemNo()%></td>
                              <td><%= m.getMemId()%></td>
                              <td><%= m.getNickname()%></td>
                              <td><%= m.getMemName()%></td>
                              <td>50,000</td>
                              <td>2021/12/28</td>
                              <td>Y</td>
                                          
                        </tr>
                        <% } %>	
					<% } %>
					   <tr>
                              <td>1007</td>
                              <td>user07</td>
                              <td>겨울이아빠</td>
                              <td>허원식</td>
                              <td>50,000</td>
                              <td>2021/12/25</td>
                              <td>Y</td>
                                          
                        </tr>                        
                        <tr>
                              <td>1050</td>
                              <td>user50</td>
                              <td>천하장사</td>
                              <td>김지우</td>
                              <td>50,000</td>
                              <td>2021/12/22</td>
                              <td>Y</td>
                                          
                        </tr>                        
                        <tr>
                              <td>1020</td>
                              <td>user20</td>
                              <td>유쾌한반란</td>
                              <td>김말똥</td>
                              <td>50,000</td>
                              <td>2021/12/20</td>
                              <td>Y</td>
                                          
                        </tr>                        
                        <tr>
                              <td>1039</td>
                              <td>user39</td>
                              <td>아버지부름</td>
                              <td>홍길동</td>
                              <td>50,000</td>
                              <td>2021/12/18</td>
                              <td>Y</td>
                                          
                        </tr>                        <tr>
                              <td>1048</td>
                              <td>user48</td>
                              <td>개똥벌레</td>
                              <td>강개똥</td>
                              <td>50,000</td>
                              <td>2021/12/14</td>
                              <td>Y</td>
                                          
                        </tr>
                        </tbody>
                    </table>
                

     
    </div>
    <br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>