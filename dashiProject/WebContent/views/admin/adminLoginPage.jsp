<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginForm{
		margin:auto;
		margin-top:50px;
		width:400px;
		height:200px;
		padding:20px;
	}
</style>
</head>
<body>


	<%@ include file="../common/menubar.jsp" %>
	
	<div id="loginForm">
		<form action="<%=contextPath%>/loginMain.ad" method="post">
			관리자 아이디 : <input type="text" name="mnId" required><br>
			관리자 비밀번호 : <input type="password" name="mnPwd" required><br>
			<button type="submit">로그인</button>
		</form>
	</div>



</body>
</html>