<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.faqBoard.model.vo.FAQ"%>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
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
    /*자주하는질문~노력하겠습니다div*/
    #name, #serve, #meno{margin-top: 10px; height: 50px;}
    #name{
        width: 250px;
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
        <div id="name">
            자주 하는 질문(FAQ)
        </div>
        <div id="serve">| 자주 질문되는 내용입니다</div>
        <div id="meno">
            <div style="width: 70px;">고객님의</div>
            <div style="width: 306px; color:blue;">
                궁금증과 문제점을 신속하고 정확하게 해결
            </div>
            <div>하기 위해 노력하겠습니다.</div>
        </div>

        <!--상담전화카드-->
        <div id="call">
            <img src="<%=contextPath%>/resources/images/FAQphonecard.JPG" alt="상담전화카드 사진입니다." style="width:100%">
        </div>

        <!--키워드 검색-->
        <div id="kDiv">
            <div class="keyword">입양</div>
            <div class="keyword">입소</div>
            <div class="keyword">결제</div>
            <div class="keyword" style="width: 110px;">실종/보호</div>
            <div class="keyword">기타</div>
        </div>

        <!--FAQ 리스트-->
        <div id="list">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th width="140px">카테고리</th>
                        <th width="820px">제목</th>
                        <th width="120px">날짜</th>
                    </tr>
                </thead>
                
                <tbody>
                	<% if(list.isEmpty()){ %>
                    <!--FAQ 없을 때-->
	                    <tr>
	                        <td colspan="5">게시된 faq가 없습니다.</td>
	                    </tr>
        			<% }else{ %>
                    <!--FAQ 있을 때-->
                    	<% for(FAQ f : list){ %>
	                    <tr class="question">	
	                    
	                    	<% 
		                    	String category ="";
		                    	switch(f.getFAQCategory()){
		                    	case 1: category = "입양"; break;
		                    	case 2: category = "입소"; break;
		                    	case 3: category = "결제"; break;
		                    	case 4: category = "실종/보호"; break;
		                    	case 5: category = "기타"; break;
								}
							%>
	                                    
	                        <td><%=category%></td>
	                        <td><%=f.getFAQTitle()%></td>
	                        <td><%=f.getFAQEnrollDate()%></td>
	                    </tr>
	
	                    <!--FAQ 답변창-->
	                    <tr class="faqAnswer">
	                        <td colspan="5" style="background: #ecfafa;">
	                            <div align="left">
	                                <p>
	                                   	<%=f.getFAQTitle()%>
	                                <hr>
	                                </p>
	                                <p style="font-weight: 600;">
	                                   	 <%=f.getFAQContent()%>
	                                </p>
	                            </div>
	                        </td>
	                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>

       <!-- faq페이징바 작업 없음 -->

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