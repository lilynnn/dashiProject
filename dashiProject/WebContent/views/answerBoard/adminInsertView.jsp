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
/*뷰 : /adInsert.ad 
답변한 화면 보여지는 뷰 */
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
    
   .answer-table th{
        background: rgb(229, 231, 229);
        font-size:13px;
    }
   .answer-table tr{
        height:35px; 
        margin: 0;
    }

    .ad-answer> *{
        margin: auto;
        margin-top: 60px;
        margin-left: 100px;
        width: 900px;
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
            <td width=780 height=300 ><%=n.getqContent()%></td>
        </tr>
        
     	</tbody>
     </table>
    		
    		
    	<div class="ad-answer"> 
    	 
    	<hr><table class="answer-table">
    	<form action="<%= contextPath %>/" method="post">
     	<tr style="margin-bottom:30px;"> <!-- 문의내용 -->
            <th width=220 colspan="2" rowspan="2"> <b>답변</b></th>
            	 
           		<td width=780 style="padding:10px;">
                <textarea name="ancontent" class="anContent" placeholder="내용 입력" cols="35" rows="10" style="resize:none">
                </textarea>
            	</td>
            	 
        </tr>
        </table>	
        </form>
        
         
        </div>	
         
    	<button type="submit" class="btn btn-warning" onclick="loction.href='<%=contextPath%>/asupdate?asno=<%=n.getInquireNo()%>';"style="font-size:13px; margin-top:20px; margin-right:100px;float:right;">답변등록</button>
    	 
    
		<!-- footerbar영역 -->
	<div style="display:block; margin-top:300px;" >
	<%@ include file="../common/footerbar.jsp" %>
	</div>	
	</div>
	
	
</body>
</html>