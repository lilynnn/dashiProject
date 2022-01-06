<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.answerBoard.model.vo.Answer"%>
    
<% 
	 Answer n = (Answer)request.getAttribute("n");

	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의관리</title>
<style>

    .outer{
        width: 1100px;
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{  
        box-sizing: border-box;
    }
    /*왼쪽메뉴바*/
    #munubar{width:150px}
    /*공지사항시작*/
 	#adminNoticeList{
         margin-left: 30px;
         width: 850px;
    }
    #adminNoticeList div{}
    /*검색창*/
    #search{width: 200px;}
    #btn{
        width: 650px;
        font-size:13px;
    }
    #btn>button{
        border-radius: 5px;
        border: white;
        width: 60px;
        font-size: 13px;
    }
     .btn-primary {
    	background:rgb(143,153,142);
    	border-color:rgb(143,153,142);
    }
    thead, tbody{
        text-align: center;
    }
    table{ 
        border-top:1px solid;
        border-bottom: 1px solid;    
    }
    thead{background: rgb(224, 223, 223);}
    
    .answer-table {
        border-top: 1px solid black;
    }
    /*타이틀 정리*/
    #title{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        width:700px;
    }
    #content{
    border:1px solid rgb(143,153,142);
    }
    #searchbtn{
    background: rgb(102,184,94);
    font-size: 13px;
    border: none;
    border-radius: 5px;
    color: #fff;
    display: inline-block;
    font-weight: bold;
    position: relative;
    text-transform: uppercase;
    padding: 5px;
    }
	
    .checkState{
        border-radius: 10px;
        }
    #answ{
    font-size:15px;
    background: rgb(102,184,94);
    border: none;
    border-radius: 5px;
    color: #fff;
    display: inline-block;
    font-weight: bold;
    position: relative;
    text-transform: uppercase;
    
    }
    
    th{
        background: rgb(229, 231, 229);
        font-size:13px;
    }
    tr{
        height:35px; 
        margin: 0;
    }
    .btn-warning{
  	font-size: 13px; !important
    margin-left: 8px;
    color: black;
   }
    .btn-answer{
    	width:200px;
    }
  
    
    
</style>
</head>
<body> 
    <%@ include file="../common/menubar.jsp" %>
    
    <!--전체를 감싸는 큰 div-->
    <div class="outer">
            <!-- 1:1 목록-->        
       <table align="center" class="answer-table" width="900px">
           		<div id="title" style="width:800px; margin-left:100px;">
                    	1:1 문의 
                <hr style="width: 900px;">
                </div>
       
       	<form action="<%=contextPath%>/asupdate?asno=<%=n.getInquireNo()%>" method="post">               
        <tbody>
         
           
        <tr> <!-- no -->
            <th  width=220 colspan="2">글번호</th> 
            <td  width=780><%= n.getInquireNo() %></td> 
	                        
        </tr> 
          <tr> <!-- 조회수-->
            <th  width=220 colspan="2">조회수 </th> 
            <td  width=780><%= n.getViewCount() %></td>              
        </tr>         
        
        <tr> <!-- date -->
            <th  width=220 colspan="2"> 작성날짜  </th> 
            <td  width=780><%= n.getqCreat() %></td>              
        </tr>
        <tr> <!-- 제목 -->
            <th width=220 colspan="2">제목 </th>
            <td width=780><input style="width:760px;" type="text" name="qTitle" value="<%=n.getqTitle()%>"></td>
        </tr>
        <tr style="margin-bottom:30px;" > <!-- 문의내용 -->
            <th width=220 colspan="2" rowspan=" ">문의내용  </th>
            <td width=780><textarea name="qContent" cols="100" rows="15" style="resize: none;" required><%=n.getqContent()%></textarea></td>
        </tr>
        <tr><td></td><td></td></tr>
        <tr >
        <th style="margin-top:50px;" width=220 colspan="2">답변</th>
        <td style="margin-top:50px;" width=780> 
        <textarea name="anContent"class="anContent" placeholder="내용 입력" cols="100" rows="10" style="resize:none">
        <%=n.getAnContent() %></textarea></td>
        </tr>
  
     	</tbody>
     	</table> 
     	 <div id="answerlist" >
    	 
                	<div id="btn-answer" align="right"; style="float:right; margin-top:30px; margin-right:100px;" >
                   		 <button type="submit" class="btn btn-sm" style="background: rgb(102,184,94); margin-right:8px">
                        	완료
                    	</button>
	                    <a href="<%=contextPath%>/asdelete?asno=<%=n.getInquireNo()%>" class="btn btn-sm btn-danger">
	                        	삭제
	                    </a>
	                     
			 			 <button type="button" class="btn-warning btn" style="font-size:13px; margin-left:8px;" onclick="location.href='<%=contextPath%>/asList.as';" >목록으로</button>
			 			 
                	</div>
    		 </div>
    	 
    	
    	
    	 </form>
    	 </div></div>
    	
		<!-- 관리자는 답변하기 버튼 보이게  -->
		<!-- 조건문으로 관리자 답변창 띄우고 ,  -->
	
		
	
	<div style="margin-top:400px;">
	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>
	</div>
</body>
</html>