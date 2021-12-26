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
    #adminNoticeList div{float: left;}
    /*검색창*/
    #search{width: 200px;}
    #btn{
        width: 650px;
    }
    #btn>button{
        border-radius: 5px;
        border: white;
        width: 60px;
        font-size: 13px;
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
        width: 100%; 
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
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
</style>
</head>
<body> 
    <%@ include file="../common/menubar.jsp" %>
    
    <!--전체를 감싸는 큰 div-->
    <div class="outer">
    
                <div style="margin-left:100px;" id="title">
                    	1:1 문의 관리
                </div>
		  	 <hr style="width: 900px;">
		<% if(loginUser!=null && loginUser.getMemNo()==(n.getMemNo()) ){ %>	
            <!-- 1:1 목록-->
        <div id="answerlist" >
                	<div id="btn-answer" align="right"; style="margin-bottom:10px; margin-right:100px;" >
                   		<a href="<%= contextPath %>/updateview?asno=<%=n.getInquireNo()%>" class="btn btn-sm btn-warning">
	                        	수정
	                    </a>
	                    <a href="<%=contextPath%>/asdelete?asno=<%=n.getInquireNo()%>" class="btn btn-sm btn-primary">
	                        	삭제
	                    </a>
                	</div>
	<% } %>
                
       <table align="center" class="answer-table" width="900px">
              
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
            <td width=780><%=n.getqTitle()%></td>
        </tr>
        <tr style="margin-bottom:30px;" > <!-- 문의내용 -->
            <th width=220 colspan="2" rowspan="2">문의내용  </th>
            <td width=780 name="qcontent" height=300 ><%=n.getqContent()%></td>
        </tr>
        
     	</tbody>
     </table>
     
     	<div class="ad-answer"> 
    	<hr><table align="center" width="900px" class="answer-table"style="margin-bottom:100px;">
    	<form action="<%= contextPath %>/" method="post">
     	<tr> <!-- 문의내용 -->
            <th width=220 colspan="2" rowspan="2"> <b>답변</b></th>
            
           		<td width=780 style="padding:10px;">
                 
                 <%= n.getAnContent() %> 
            	</td>
          
        </tr>
        </table>	
    		 </div>
    	</div>
    	
    	<div>
    	 <a class="btn btn-warning" href="<%=contextPath%>/adupdate.ad?asno=<%=n.getInquireNo()%>;" style="font-size:13px; margin-top:20px; margin-right:100px;float:right;">답변등록</a>
     </div>
	
	
	<div style="margin-top:100px;">
	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>
	</div>
</body>
</html>