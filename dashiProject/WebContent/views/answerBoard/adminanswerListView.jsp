<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.common.model.vo.*,java.util.ArrayList, com.dashi.answerBoard.model.vo.Answer" %>
<%
    
   ArrayList<Answer> list = (ArrayList<Answer>)request.getAttribute("list"); 
    
%>

<!DOCTYPE html>
<html>
 
<body>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 1:1 </title>


<style>
    .outer{
        width: 1100px;
        height: 1500px;
        margin-top: 50px;
        margin: auto;
    }
    #menubar{width: 200px;}
    .outer>div{float: left;}
    /*faq목록*/
    .faqLine{
        width: 800px;
        box-sizing: border-box;
        margin: 20px;
    }
    .faqLine>div{
        float: left;
    }
    #faqLine1{
        width: 100%;
        font-size: 24px;
        font-weight: 900;
        margin-top: 20px;
    }
    #faqLine2{
        width: 100%;
        height: 50px;
        box-sizing: border-box;
        margin-left:30px;
    }
    #faqLine2>div{
        float: left;
        height: 100%;     
    }
    #faqLine2>div>*{
        float: left;  
    }
    #aFadList{width: 100%; margin-left:30px;}
    .faqAnswer a{
        color: black;
        font-size: 12px;
        font-weight: 600;
    }
    .question:hover{
        cursor: pointer;
    }
    .faqAnswer{display: none;}
    #sel-faq{
       font-weight:700px;
       color:rgb(252, 186, 3);
    }
    #faq-search{
       width:100%;
       height:50px;
    }
    #faq-search>div{float:left;}
    #faq-search>div>*{float:left;}
    #insertbtn{
       width:100px;
       height:30px;
    }
    .table-hover tr>td{
       font-size:14px;
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

    <div class="outer">

        <div id="menubar">
            <%@ include file="../admin/adminMenubar.jsp"%>
        </div>

        <div class="faqLine">
            
            <div id="faqLine1">
               관리자 1:1
                <hr>
            </div>

            <div id="faqLine2">

                <div id="insertbtn" style="width:100px; height:40px;">
                   
                </div>
            </div>

            
            <div id="aFadList">
                <table class="table table-hover">
                    <thead>
                        <tr align="center" style="font-size:15px;">
                            <th width="100">No.</th>
                            <th width="470">제목</th>
                            <th width="80">날짜</th>
                            <th width="80"></th>
                            <th width="80"></th>
                            <th width="80"></th>
                        </tr>
                    </thead>

                    <tbody>                       
                        <% if(list.isEmpty()){ %>
                      <!--as없을 때-->
                       <tr>
                           <td colspan="6">게시된 문의가 없습니다.</td>
                       </tr>
                    <% }else{ %>
                       <!--as 있을 때-->
                       <% for(Answer n: list){ %>
                           <tr align="center" class="question">
                            
                               <td><%=n.getInquireNo()%></td>
                               <td>
                                   <%=n.getqTitle()%>
                               </td>
                               <td>
                                   <%=n.getqCreat()%>
                               </td>
                               <td id="faqNum"><a href="<%=contextPath%>/updateview?asno=<%=n.getInquireNo()%>" class="btn btn-sm btn-warning">
                                          수정
                                   </a>
</td> <td id="faqNum"> <a href="<%=contextPath%>/asdelete?asno=<%=n.getInquireNo()%>" class="btn btn-sm btn-danger">
                                       삭제

</td>
 <td id="faqNum"><a href="<%=contextPath%>/updateview?asno=<%=n.getInquireNo()%>" class="btn btn-sm btn-dark">
                                       답변
                                   </a>
</td>
                           </tr>
    
                           <!--답변 있을경우-->
                           <tr class="faqAnswer" style="background: lightgray;">
                               <td></td>   
                               <td colspan="6" id="titleNcontent">
                                     <%=n.getqContent()%>
                                   <hr>
                                      <%=n.getAnContent()%>
                               </td>
                           </tr>
                     <% } %>
                       <% } %>
                    </tbody>
                </table>

            </div>
        </div>
      
      <div style="width:100%" align="center">
          
      </div> 
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