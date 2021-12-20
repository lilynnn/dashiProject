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
		width:450px;
		height:400px;
		padding:20px;
		border: 1px solid rgb(171, 163, 190);
	}
	#loginForm *{float: left;}
	#loginForm p, #loginForm input{
		width: 200px;
		height: 30px;
		margin: 0;
		font-weight: 600;
		font-size: 20px;
	}
	#loginForm button{
		width: 100%;
		height: 50px;
		margin-top: 40px;
	}
	#loginForm img{
		width:100%;
		height:300px;
		padding-left:55px;
		padding-right:55px;
	}
	
</style>
</head>
<body>


	<%@ include file="../common/menubar.jsp" %>
	
	<div id="loginForm">
		<form action="<%=contextPath%>/loginMain.ad" method="post">
			<img src="<%=contextPath%>/resources/images/adminloginlogo.png">
			<p>관리자 아이디 : </p><input type="text" name="mnId" required><br>
			<p>관리자 비밀번호 : </p><input type="password" name="mnPwd" required><br>
			<button type="submit">로그인</button>
		</form>
	</div>



</body>
</html>