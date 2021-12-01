<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
    /*영역 구분하기 위해 설정, 나중에 지우기!!!*/
    .logo-area,.login-area,.menu-area{border: 1px solid black;}
    
    /* 로고 영역 */
    .logo-area{
        height: 80px; 
    }
    .logo-area img{
        width: 245px;
        height: 75px;
    }
    /* 로그인 영역 */
    .login-area{height: 20px;}

    /* 메뉴바 영역 */
    .menu-area{
    	background: rgb(40,112,37);
    	width: 1200px;
    	margin: auto;	
    }
    .menu{
        display: table-cell;
        width: 240px;
        height: 50%;
    }
    .menu a{
        text-decoration: none;
        color: white;
        font-size: 16px;
        font-weight: bold;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 300%;
    }
    .menu a:hover{
        background: white;
        color: gray;
    }
</style>
</head>
<body>
	
    <!-- 메인로고 영역 -->
    <div class="logo-area" align="center">
        <a href="<%= contextPath %>"><img src="resources/images/logo.PNG"></a>
    </div>
    
    <!-- 로그인 영역 -->
    <div class="login-area">
        
    </div>
    
    <!-- 네비게이션바 영역 -->
    <div class="menu-area" align="center">
        <div class="menu"><a href="">보호소소개</a></div>
        <div class="menu"><a href="">입소</a></div>
        <div class="menu"><a href="">입양</a></div>
        <div class="menu"><a href="">실종/보호/목격</a></div>
        <div class="menu"><a href="">고객센터</a></div>
    </div>

</body>
</html>