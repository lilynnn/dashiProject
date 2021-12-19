<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.answerBoard.model.vo.Answer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
        margin: auto;
        margin-top: 50px;
        height:1200px
    }
    .outer>div{
        float: left; 
        box-sizing: border-box;
    }
    /**/
    #name, #serve, #meno{margin-top: 10px; height: 50px;}
    #name{
        width: 120px;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
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
        width: 80px;
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
	.Answer{
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
    
    /* 글작성 버튼 */
    .write{
    margin-top : 60px;
    float:right;
    background-color:rgb(102,184,94);
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
        <div id="name">
            1 : 1 문의
        </div>
        <div id="serve">| 최대한 빠르게 답변드리겠습니다.</div>
        <div id="meno">
            <div style="width: 60px;"></div>
            <div>로그인 후 글작성이 가능합니다.</div>
        </div>

        <!--상담전화카드-->
        <div id="call">
            <img src="<%=contextPath%>/resources/images/FAQphonecard.JPG" alt="상담전화카드 사진입니다." style="width:100%">
        </div>
        
        
		<%@ include file="../common/memberUpdateMenubar.jsp" %>
		
		
        <!--키워드 검색-->
        <div id="kDiv">
            <div class="keyword">입양</div>
             <div class="keyword">입소</div>
            <div class="keyword">실종</div>
            <div class="keyword">로그인</div>
            <div class="keyword" style="width: 110px;">결제문의</div>
            <div class="keyword">기타</div>
        </div>

        <!--1:1문의리스트-->
        <div id="list">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                       <th width="140px">NO.</th>
                        <th width="140px">카테고리</th>
                        <th width="720px">제목</th>
                        <th width="100px">아이디</th>
                        <th width="120px">작성일</th>
                    </tr>
                </thead>
                
                <tbody>
                	<% if(list.isEmpty()){ %>
                    <!--1:1문의 없을 때-->
	                    <tr>
	                        <td colspan="5"> 1:1 문의가 없습니다.</td>
	                    </tr>
        			<% }else{ %>
                    <!--1:1 있을 때-->
                    	<% for(Answer a : list){ %>
	                    <tr class="question">	
	                    	<% 
		                    	String category ="";
		                    	switch(a.getasCategory()){
		                    	case 1: category = "입양문의"; break;
		                    	case 2: category = "입소문의"; break;
		                    	case 3: category = "실종문의"; break;
		                    	case 4: category = "로그인관련"; break;
		                    	case 5: category = "결제문의"; break;
		                    	case 6: category = "기타"; break;
								}
							%>
	            			<td> <%=a.getInquireNo() %> </td>
	                        <td><%=category%></td>
	                        <td><%=a.getqTitle()%></td>
	                        <td><%=a.getMemId() %>
	                        <td><%=a.getqCreat()%></td>
	                    </tr>
	
	                    <!--1:1 답변창-->
	                    <tr class="Answer">
	                        <td colspan="5" style="background: #ecfafa;">
	                            <div align="left">
	                                <p>
	                                   	<%=a.getqTitle()%>
	                                <hr>
	                                </p>
	                                <p style="font-weight: 600;">
	                                   	 <%=a.getqContent()%>
	                                </p>
	                            </div>
	                        </td>
	                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>
        
	<% if(loginUser != null ) { %>
	 
	        <div align="right" style="width:1100px">
	            
	            <a href="<%= contextPath %>/insert.as" class="btn btn-sm btn-secondary write">글작성</a>
	            <br><br>
	        </div>
        <% } %>

    </div>

    <script>
        
        $(function(){
            $(".question").click(function(){
                
                const $answer = $(this).next(); 

                if($answer.css("display") == "none"){

                    $(this).siblings(".Answer").slideUp();

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
</body>
</html>