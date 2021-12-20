<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"import="com.dashi.answerBoard.model.vo.Answer"%>
<%
	Answer a = (Answer)request.getAttribute("a");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 답변 </title>
<style>

  
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
    }

    .image-area{
        width: 700px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid lightgray;
    }

    .content-area{
        margin: auto;
        display:inline-block;
    }
    
 
    .animal-info{
        text-align: center;
        height: 40px;
        font-size: 13px;
        border-collapse: separate;
        border-spacing: 1px;
        margin-bottom: 50px;
    }
    .animal-info th{background: rgb(211, 208, 208); width: 180px;}
    .animal-info td{width: 220px; border-bottom: 1px  solid lightgray;}
    .ansContent{
        width: 780px;
        height: 350px;
    }
    .buttonadmin{
    margin-left:600px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>
		<div>
	 <%@ include file="../admin/adminMenubar.jsp" %>
	 	</div>
	<div class="outer">

        <form action="<%= contextPath %>/adInsert.as" method="get">
  <br><br>
            <div>
                <h2>1:1 문의 답변</h2>
            </div>

   
          
            <div class="content-area" >
 		<div id="menubar" style="float:left; display:inline-block; margin-right:80px;">
    		
    	</div>
            
       
 <br> 
                <div>
                   <h4> 1:1 문의내용 </h4>
                   <br><br>
                </div>
                
					
				<div >
              	<!-- 1:1 문의내용  -->
                <table class="animal-info" width="800px" style="border-top:solid 1px black ; border-bottom:solid 1px black; ">

                    <tr>
                        <th width="500px">작성자</th>
                        <td width="200px"><%= a.getMemId() %></td>
                    </tr>
                    <tr>
                        <th>분류 </th>
                        <td><%= a.getasCategory() %></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><%= a.getqTitle() %></td>
                    </tr>
                    <tr>
                        <th>문의 내용 </th>
                        <td height="150px" ><%= a.getqContent() %></td>
                    </tr>

                </table>
                
				<!-- 답변창  -->
                <h4>답변하기</h4>
               
               <br><br>
                  
           
                 <textarea name="content" class="ansContent" placeholder="내용 입력" cols="35" rows="10" style="resize:none">
                 <%= a. getAnContent() %></textarea>
            
            
               
    <br><br>
    <label for="" style="margin-left:280px;"><input type="file"></label>
    <br><br>
 	<hr> <br>
    <div class="buttonadmin">
    <button onclick="history.back();" class="back">이전으로</button> 
    <button type="submit" class="btn-1">작성하기</button>
    </div>
    

    </form>

	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>
</body>
</html>