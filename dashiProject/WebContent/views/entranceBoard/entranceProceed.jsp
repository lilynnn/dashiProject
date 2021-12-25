<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 이미지 다시 수정하기...ㅎ -->
    <title>입소절차</title>
    <style>
        .outer{
            margin: auto;
            margin-top: 50px;
            width: 1200px;
            height: 1300px;
            align:center;
            left:50%;
        }
        
    </style>
</head>
<body>
    
    <!-- 네비게이터 -->
	<%@ include file="../common/menubar.jsp" %>


	
					
		
		    <div class="outer" >
		   	<!-- 소제목 -->
		    <h2 style="margin-top:50px; margin-left:80px;">입소절차</h2>
			<hr style="width:900px">
			<!-- 이미지1 -->

		    <div>
		    <img id="ent1" src="<%=request.getContextPath()%>/resources/images/entrance1.PNG" width="100%" height="100%">
			</div>
		
			<!-- 이미지2 -->
		   <div>
		    <img id="ent2" src="<%=request.getContextPath()%>/resources/images/entrance2.PNG" width="100%" height="100%">
			</div>
		
			<!-- 이미지3 -->
		   <div style="margin-bottom:30px;">
		    <img id="ent3" src="<%=request.getContextPath()%>/resources/images/entrance3.PNG" width="100%" height="100%">
			</div>
	
	
		
		
		<!-- 푸터바 -->
		<%@ include file="../common/footerbar.jsp" %>
		
		    </div>
		    
		</body>
		</html>