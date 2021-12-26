<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dashi.common.model.vo.PageInfo, java.util.ArrayList, com.dashi.member.model.vo.Member" %>
    
<%
	Member e = (Member)request.getAttribute("e");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>   

 
<!DOCTYPE html>
<html>

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
    .table>tbody tr:hover{
        background: rgb(233, 231, 231);
        cursor: pointer;
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
                   블랙리스트 관리
                </div>
                
                <hr style="width: 900px;">
                <br>
                
                
                <table align="center" class="table" style="width: 900px; height: 250px; text-align: center; margin-top: 20px; border-collapse: collapse; font-size: 13px;">
                    <thead style="background: rgb(214, 235, 241);">
                        <tr>
                            
                            <th width="80">회원번호</th>
                            <th width="100">아이디</th>
                            <th width="100">이름</th>
                            <th width="100">지정일</th>
                          	<th width="100"> </th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                    <% if(list.isEmpty()) { %>
                    	<tr>
                    		<td colspan="5"> 블랙리스트로 지정된 회원이 없습니다.</td>
                    	</tr>
                    <% }else{ %>
                    	<% for(Member m : list){ %>
                        <tr>
                            <td><%= m.getMemNo() %></td>
                            <td><%= m.getMemId() %></td>
                            <td><%= m.getMemName() %></td>
                            <td><%= m.getBlackDate() %></td>
                            <td> <button class="btn btn-danger" onclick="location.href='<%=contextPath%>/blackdelete?bno=<%=e.getMemNo()%>;" style="font-size:13px;" id="revdelete">해제</button></td>
                        </tr>
                        <% } %>	
					<% } %>
                        </tbody>
                    </table>
 

     
    </div>
    <script>
    $(function(){
        $(".btn-danger").click(function(){
            location.href="<%=contextPath%>/?bno=" + $(this).children().eq(0).val();
        })
    })
    </script>
    <br><br><br><br>
	<%@ include file="../common/footerbar.jsp" %>
</body>
</html>