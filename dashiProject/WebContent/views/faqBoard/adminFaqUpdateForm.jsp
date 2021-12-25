<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.faqBoard.model.vo.FAQ"%>
<%
	FAQ f = (FAQ)request.getAttribute("f");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1100px;
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    /*왼쪽메뉴바*/
    #munubar{width:200px}
    /*상세페이지*/
    #enroll-form{
        width: 800px;
        height: 800px;
        margin-top: 40px;
        margin-left: 20px;
    }
    #table{
        width: 100%;
    }
    #boardName>th{
        font-size: 24px;
        height: 60px;
    }
    #tbody{
        background: rgb(187, 195, 204);
        border: 1px solid lightgrey;
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
    		<%@ include file="../admin/adminMenubar.jsp" %>
    	</div>

        <div id="enroll-form">
            <form action="<%=contextPath%>/faqUpdate.ad" method="post">
				
				<input type="hidden" name="fno" value=<%=f.getFAQNo()%>>
                <table id="table">

                    <thead>
                        <tr id="boardName">
                            <th colspan="2">FAQ</th>
                        </tr>
                        <tr>
                            <th colspan="2" style="border:none; border-top: 1px solid gray; height: 30px;"></th>
                        </tr>
                    </thead>

                    <tbody id="tbody">      
                        <tr>
                            <td height="50px" align="center">카테고리</td>
                            <td>
                                <select name="category" id="category">
                                    <option value="1">입양</option>
                                    <option value="2">입소</option>
                                    <option value="3">결제</option>
                                    <option value="4">실종/보호</option>
                                    <option value="5">기타</option>
                                </select>
                                <script>
							    	$(function(){
							    		$("#category option").each(function(){
							    			if($(this).val() == "<%=f.getFAQCategory()%>"){
							    				$(this).attr("selected", true);
							    			}
							    		})
							    	})
							    </script>
                            </td>
                        </tr>
                        <tr>
                            <td width="100px" align="center">질문</td>
                            <td><input type="text" name="title" required style="width: 95%;" value="<%=f.getFAQTitle()%>"></td>
                        </tr>
                        <tr>
                            <td width="100px" align="center">답변</td>
                            <td height="300px"><textarea name="content" cols="87" rows="10" required style="resize: none;"><%=f.getFAQContent()%></textarea></td>
                        </tr>        
                    </tbody>

                </table>

                <div align="center" style="margin-top: 20px;">
                    <button type="submit" class="btn btn-sm" style="background: rgb(102,184,94);">수정하기</button>
                    <a href="<%=contextPath%>/faqList.ad" class="btn btn-sm" style="background: rgb(143,153,142);">
                    	취소하기
                    </a>
                </div>

            </form>
        </div>

    </div>
    
    

    <!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>


</body>
</html>