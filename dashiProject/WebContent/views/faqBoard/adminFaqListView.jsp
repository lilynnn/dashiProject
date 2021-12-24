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
                FAQ관리
                <hr>
            </div>

            <div id="faqLine2">

                <div id="insertbtn" style="width:100px; height:40px;">
                    <a href="<%=contextPath%>/faqEnrollForm.ad" class="btn btn-sm btn-success">
                        	등록하기
                    </a>
                </div>
                <form action="<%=contextPath%>/faqSearch.ad" method="get" id="faq-search">
	                <div align="right" style="width:700px; padding-left:420px;">
	                    <input type="text" name="fsearch" placeholder="제목을 키워드 입력">
	                    <button type="submit">조회</button>
                	</div>
                </form>
            </div>

            
            <div id="aFadList">
                <table class="table table-hover">
                    <thead>
                        <tr align="center" style="font-size:15px;">
                            <th width="100">카테고리</th>
                            <th width="550">제목</th>
                            <th width="80"></th>
                            <th width="80"></th>
                            <th width="80"></th>
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
	                        <tr align="center" class="question">
	                        	<% 
			                    	String category ="";
			                    	switch(f.getFAQCategory()){
			                    	case 1: category = "입양"; break;
			                    	case 2: category = "입소"; break;
			                    	case 3: category = "결제"; break;
			                    	case 4: category = "실/목/보"; break;
			                    	case 5: category = "기타"; break;
									}
								%>
	                            <td><%=category%></td>
	                            <td><%=f.getFAQTitle()%></td>
	                            <td>
	                                <a href="<%=contextPath%>/faqUpdateForm.ad?fno=<%=f.getFAQNo()%>" class="btn btn-sm btn-warning">
	                                   	 수정
	                                </a>
	                            </td>
	                            <td>
	                                <a href="<%=contextPath%>/faqDelete.ad?fno=<%=f.getFAQNo()%>" class="btn btn-sm btn-danger">
	                                    	삭제
	                                </a>
	                            </td>
	                            <td id="faqNum"><%=f.getFAQNo()%></td>
	                        </tr>
	
	                        <!--답변 있을경우-->
	                        <tr class="faqAnswer" style="background: lightgray;">
	                            <td><%=category%></td>   
	                            <td colspan="4" id="titleNcontent">
	                                	<%=f.getFAQTitle()%>
	                                <hr>
	                                	<%=f.getFAQContent()%>
	                            </td>
	                        </tr>
							<% } %>
	                    <% } %>
                    </tbody>
                </table>

            </div>
        </div>
		
		<div style="width:100%" align="center">
			<a href="<%=contextPath%>/faqList.ad" class="btn btn-sm btn-light">목록으로</a>
		</div>
		
		<!-- The Modal faq ajax도전
		<div class="modal" id="updatefaq">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		
		      <div class="modal-body">
		      <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <table>
		        	<tr>
		        		<td height="30">
		        			<select name="cate">
		        				<option value="1">입양</option>
		        				<option value="2">입소</option>
		        				<option value="3">결제</option>
		        				<option value="4">실종/보호</option>
		        				<option value="5">기타</option>
		        			</select>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td width="370">
		        			<input type="text" id="title" style="width:100%; height:50px;">
		        		</td>
		        	</tr>
		        	<tr>
		        		<td width="370">
		        			<textarea id="content" style="width:100%; height:100px; resize:none;">
		        			
		        			</textarea>
		        		</td>
		        	</tr>		        
		        </table>
		      </div>
		
		      <div class="modal-footer">
		        <a type="button" class="btn btn-outline-warning" data-dismiss="modal">수정하기</a>
		      </div>
		
		    </div>
		  </div>
		</div>
		-->
		
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