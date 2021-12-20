<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.answerBoard.model.vo.Answer"%>
<%
	ArrayList<Answer> list = (ArrayList<Answer>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    .answerLine{
        width: 800px;
        box-sizing: border-box;
        margin: 20px;
    }
    .answerLine>div{
        float: left;
    }
    #answerLine1{
        width: 100%;
        font-size: 24px;
        font-weight: 900;
        margin-top: 20px;
    }
    #answerLine2{
        width: 100%;
        height: 50px;
        box-sizing: border-box;
        margin-left:30px;
    }
    #answerLine2>div{
        float: left;
        height: 100%;     
    }
    #answerLine2>div>*{
        float: left;  
    }
    #aAnswerList{width: 100%; margin-left:30px;}
    .answerAnswer a{
        color: black;
        font-size: 12px;
        font-weight: 600;
    }
    .question:hover{
        cursor: pointer;
    }
    .answerAnswer{display: none;}
    #sel-faq{
    	font-weight:700px;
    	color:rgb(252, 186, 3);
    }
    #answer-search{
    	width:100%;
    	height:50px;
    }
    #answer-search>div{float:left;}
    #answer-search>div>*{float:left;}
    #insertbtn{
    	width:100px;
    	height:30px;
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

        <div class="answerLine">
            
            <div id="answerLine1">
               1:1 관리
                <hr>
            </div>

            <div id="answerLine2">

                <div id="insertbtn" style="width:100px; height:40px;">
                	<% if(loginAdmin != null){ %>
                    <a href="<%=contextPath%>/asInsert.ad" class="btn btn-sm btn-success">
                        	등록하기
                    </a>
                    <% } %>
                </div>
                <form action="<%=contextPath%>/answerSearch.ad" method="get" id="answer-search">
	                <div align="right" style="width:700px; padding-left:420px;">
	                    <input type="text" name="asearch" placeholder="제목을 키워드 입력">
	                    <button type="submit">조회</button>
                	</div>
                </form>
            </div>

            
            <div id="answerList">
                <table class="table table-hover">
                    <thead>
                        <tr align="center">
                            <th width="100">카테고리</th>
                            <th width="550">제목</th>
                            <th width="80">내용</th>
                            <th width="80"></th>
                            <th width="80"></th> 
                        </tr>
                    </thead>

                    <tbody>                       
                        <% if(list.isEmpty()){ %>
	                   <!-- 없을 때-->
	                    <tr>
	                        <td colspan="5">게시물이 없습니다.</td>
	                    </tr>
	        			<% }else{ %>
	                    <!--있을 때-->
                    	<% for(Answer a : list){ %>
	                        <tr align="center" class="question">
	                        	<% 
			                    	String category ="";
			                    	switch(a.getasCategory()){
			                    	case 1: category = "입양"; break;
			                    	case 2: category = "입소"; break;
			                    	case 3: category = "결제"; break;
			                    	case 4: category = "실/목/보"; break;
			                    	case 5: category = "기타"; break;
									}
								%>
	                            <td><%=category%></td>
	                            <td><%=a.getqTitle()%></td>
	                            <% if(loginAdmin != null){ %>
	                            <td>
	                                <a href="<%=contextPath%>/answerUpdateForm.ad?ano=<%=a.getInquireNo()%>" class="btn btn-sm btn-warning">
	                                   	 수정
	                                </a>
	                            </td>
	                            <td>
	                                <a href="<%=contextPath%>/answerDelete.ad?ano=<%=a.getInquireNo()%>" class="btn btn-sm btn-danger">
	                                    	삭제
	                                </a>
	                            </td>
	                            <td id="asNum"><%=a.getInquireNo()%></td>
	                            <% } %>
	                        </tr>
	
	                        <!--답변 있을경우-->
	                        <tr class="answerAnswer" style="background: lightgray;">
	                            <td><%=category%></td>   
	                            <td colspan="4" id="titleNcontent">
	                                	<%=a.getqTitle()%>
	                                <hr>
	                                	<%=a.getqContent()%>
	                            </td>
	                            <td> <%= a.getAnContent() %></td>
	                        </tr>
							<% } %>
	                    <% } %>
                    </tbody>
                </table>

            </div>
        </div>
		
		<div style="width:100%" align="center">
			<a href="<%=contextPath%>/adAnswer.as" class="btn btn-sm btn-light">목록으로</a>
		</div>
		
		
    </div>

    <script>
        $(function(){
            $(".question").click(function(){
                
                const $answer = $(this).next();  

                if($answer.css("display") == "none"){

                    $(this).siblings(".answerAnswer").slideUp();

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