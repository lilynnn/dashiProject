<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        margin-top: 30px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }    
    #menubar{width:150px}
    .content-area{
         margin-left: 30px;
         width: 850px;
         float: left;
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
	
		<div id="menubar">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>
        
        
	
	
	
	</div>

</body>
</html>