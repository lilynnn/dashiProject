<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입소신청</title>

	<style>
    .outer{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        height: 1300px;
        align:center;
    }
    
    .image1{
        width: 1100px;
        margin: 50px;
        border: none;
    }

    .image2{
        width: 1100px;
        margin: 50px;
        border: none;
    }
    
    .entrance{text-align:center;
		    background-color: rgb(102,184,94);
		    font-size: 15px;
		    border: none;
		    border-radius: 5px;
		    color: #fff;
		    font-size: 20px;
		    font-weight: bold;
		    padding: 30px 40px;
		    text-transform: uppercase;
		    width:fit-content;
		    margin-right:40px; }

   .answer{ text-align:center;
		    background-color: rgb(143,153,142);
		    font-size: 15px;
		    border: none;
		    border-radius: 5px;
		    color: #fff;
		    font-size: 20px;
		    font-weight: bold;
		    padding: 30px 40px;
		    width:fit-content;
		    margin-top: 60px;
		    margin-bottom: 60px; }
		    
   
		    
	</style>
	</head>
	
	
	<body>
	
	<!-- 네비게이터 -->
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 전체 div -->
    <div class="outer">
    
    <h3 align= "left" style="margin:30px;"><b>입소신청</b></h3>
    <hr>

        <!-- 이미지1 -->
        <div>
            <img  class="image1" src="<%=contextPath%>/resources/images/testimg2.jpg">
        </div>

        <br><br>

    	
        <h4 align="center" style="border: 10px;"> <b>입소신청페이지 입니다. 
	            신청글을 남겨주시면 확인 후 유선상으로 연락드리겠습니다. <br>
	            입소와 입양 후에도 아이들의 소식을 확인하실 수 있습니다.</b></h4>
            
          
           <div style="text-align:center";>
           
           <!-- 버튼 -->
           <button type="button" class="entrance" name="" value="">입소신청</button>
            
           <button type="button" class="answer" name="" value="">1:1 문의</button>
           </div>

        <!-- 이미지2 -->
        <div>
            <img class="image2" src="<%=contextPath%>/resources/images/testimg.jpg">
        </div>

       
       <!-- 푸터바 -->
       <%@ include file="../common/footerbar.jsp" %>
       
    </div>
</body>
</html>