<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.common.model.vo.*,java.util.ArrayList, com.dashi.answerBoard.model.vo.Answer" %>
<%
	 
	ArrayList<Answer> list = (ArrayList<Answer>)request.getAttribute("list"); 
	 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>1:1문의목록</title>
<style>
    .outer{
        width: 1100px;
        margin: auto;
        margin-top: 50px;
        height:1200px;
        
    }
    .outer>div{
        float: left; 
        box-sizing: border-box;
    }
    /*자주하는질문~노력하겠습니다div*/
    #name, #serve, #meno{margin-top: 10px; height: 50px;}
    #name{
        width: 250px;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
        height:50px;
    }
    #serve{
        width: 450px;
        color: darkgray;
        line-height: 60px;
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
        margin-left: 880px;
    }
    /*키워드 검색*/
    #kDiv{width: 100%;}
    .keyword{
        float: left;
        width: 90px;
        text-align: left;
        margin-bottom: 30px;
        font-size: 12px;
        font-weight: 600;
        color: rgb(84, 103, 121);
    }
    .keyword:hover{
        color:orange;
        cursor: pointer;
    }
    /*FAQ 목록*/
    #list>table{
        text-align: center;
    }
    thead>tr{height: 30px;}
    /*답변작업*/
    .question:hover{
        cursor: pointer;
    }
   .faqAnswer{
      display:none;
   }
    /*pagingbar*/
    .paging-area{
        width: 100%;
        margin-top: 30px;
    }
    .paging-area>button{
       border-radius:3px;
       border:none;
    }
   
    
     
    
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

        <!--게시판 안내-->
        <div class="as-banner">
        <!--게시판 안내-->
        <div id="name" class="as-title">
            1:1 문의
        <br><br><br>         
          
        </div>  
        <hr>          

        
  
  
        <!--FAQ 리스트-->
        <div id="list" style="font-size:15px;">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
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

   
                       <!--FAQ 답변창-->
                       <tr class="faqAnswer">
                           <td colspan="5" style="background:#c0e2bc; font-size:15px; text-align:center;">
                               <div>
                                   <p><b>문의내용</b><br>
                                         <%=a.getqContent()%>
                                   <hr>
                                   </p><b style="color:green;">관리자 답변</b>
                                   <p style="font-weight: 600;">
                                          <%=a.getAnContent()%>
                                   </p>
                                 <% if(loginUser!=null && loginUser.getMemNo()==(a.getMemNo()) ){ %>	
                                   <p align="right"; style="margin-right:10px;" > 
                                   <a href="<%=contextPath%>/asdelete2?asno=<%=a.getInquireNo()%>" class="btn btn-sm btn-danger">
                                      		 삭제
                  	                 </a></p>
                                   <% } %>
                               </div>
                           </td>
                       </tr>
                       <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>

      
       

    </div>
    
      <% if(loginUser!=null){ %>
           <div style="margin-top:40px;">
           <button type="button" class="btn btn-success" onclick="location.href='<%=contextPath%>/enroll.as';" >글쓰기</button>
           </div>
        <% } else { %>
            <div>
           <button type="button" class="btn btn-success" onclick="location.href='<%=contextPath%>/asList.as';" >로그인 후 작성가능</button>
           </div>
        <% } %>
</div>
    <script>
        
        $(function(){
            $(".question").click(function(){
                
                const $answer = $(this).next(); 

                if($answer.css("display") == "none"){

                    $(this).siblings(".faqAnswer").slideUp();

                    $answer.slideDown(1000);

                }else{

                    $answer.slideUp();
                }
            })
        })
        
    </script>

   <%@ include file="../common/footerbar.jsp" %>

</body>
</html>