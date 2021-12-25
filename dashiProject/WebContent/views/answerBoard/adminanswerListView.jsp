<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.common.model.vo.*,java.util.ArrayList, com.dashi.answerBoard.model.vo.Answer" %>
<%
	 
	ArrayList<Answer> list = (ArrayList<Answer>)request.getAttribute("list"); 
	 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1100px;
        margin: auto;
        margin-top: 50px;
        height:1200px
    }
    .outer>div{
         
        box-sizing: border-box;
    }
    .as-banner>div{
    	display:inline-block;
    }
    /**/
    #name, #serve, #meno{margin-top: 10px; height:  0px;}
    #name{
        width: 120px;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
        margin-left:20px;
    }
    #serve{
        width: 450px;
        line-height: 25px;
        font-size:15px;
        font-weight: 10px;
        color:green;
         
    }
    #meno{width: 700px;}
    #meno>div{
        width: auto;
        float: left;
        font-weight: 900;
    }
    #call{
        width: 200px;
        height: 100px;
        position: absolute;
       	margin-left: 730px;
        margin-right:400px;
    }
    .as-title{
    	font-weight:900px;
    }
    thead>tr{height: 30px;}
    .question:hover{
        cursor: pointer;
    }
	.Answer{
		display:none;
	}    
	
    .paging-area{
        width: 100%;
        margin-top: 30px;
    }
    tbody>tr>td:hover{
    	color:rgb(40,112,37);
    }
 
    /* 글작성 버튼 */
    .btn-1{
	  background: rgb(102,184,94);
	  font-size: 15px;
	  border: none;
	  border-radius: 5px;
	  color: #fff;
	  display: block;
	  font-size: 15px;
	  font-weight: bold;
	  margin: 1em auto;
	  padding: 0.5em 1em;
	  position: relative;
 	  text-transform: uppercase;
	 }

	.ButtonBox-right{
	margin-top:30px;
	float: right;}
	
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
    <%@ include file="../common/menubar.jsp" %>
    

     <!--전체 div-->
	<div class="outer">
		<div class="as-banner">
        <!--게시판 안내-->
        <div id="name" class="as-title">
            [관리자 전용] 1:1 문의 
            <div id="serve">
				1:1 문의 관리자 페이지입니다.
	        </div>
        </div>        

        
 		<br> 
        <!--리스트-->
 
 			<div class="answer-table">
			<table class="answer-table" style="text-align:center">
    			 <thead  class="thead-light">
                    <tr style="margin-bottom:30px;">
                        <th width="140px">게시물번호</th>
                        <th width="820px">제목</th>
                        <th width="120px">날짜</th>
                    </tr>
                </thead>
                
    			<tbody>
                	<% if(list.isEmpty()){ %>
                    	<!--answer 없을 때-->
	                    <tr>
	                        <td colspan="5">게시된 질문이 없습니다.</td>
	                    </tr>
	        				<% }else{ %>
	                    		<!--answer 있을 때-->
	                    		<% for(Answer a: list){ %>
	       						<tr class="question">	
		                        <td><%=a.getInquireNo()%></td>
		                        <td><%=a.getqTitle()%></td>
		                        <td><%=a.getqCreat()%></td>
		                    	</tr>
   							 	<% } %>
   							<% } %>
   					</tbody>
   					 
		</table>
		
 			 <div>
 			 <button type="button" class="btn-1 ButtonBox-right" onclick="location.href='<%=contextPath%>/enroll.as';" >글쓰기</button>
 			 </div>
  
        
        </div>
        
       
        </div>
        
     <div style="margin-top:10px;">  
	<%@ include file="../common/footerbar.jsp" %>
	</div>  
	<script>
        	$(function(){
        		$(".answer-table>tbody>tr").click(function(){
        			        			
        			location.href = '<%=contextPath%>/userdatail.as?asno='+ $(this).children().eq(0).text();
        		})
        	})
        </script>
 	
 	
	
</body>
</html>