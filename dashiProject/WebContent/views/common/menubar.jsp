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
        width: 239px;
    }
    .menu a{
        text-decoration: none;
        color: white;
        display: block;
        width: 100%;
        height: 100%;
    }
    .menu>a{
        font-size: 16px;
        font-weight: bold;
        line-height: 300%;
    }
    .menu a:hover{
        color: rgb(252, 186, 3);
    }

    .menu>ul{
        list-style-type: none;
        padding: 0px;
        line-height: 200%;
    }

    .menu>ul a{
        color: white;
        font-size: 13px;
    }

    .menu>ul{display: none; padding: 0px;}
    .menu>a:hover+ul{display: block;}
    .menu>ul:hover{display: block;}
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

            <!-- 보호소소개 탭 -->
	        <div class="menu">
                <a href="">보호소소개</a>
                    <ul class="menu-tag">
                        <li><a href="">다시,사랑받개!소개</a></li>
                    </ul>
            </div>

            <!-- 입소탭 -->
            <div class="menu">
                <a href="">입소</a>
                    <ul class="menu-tag">
                        <li><a href="">입소안내</a></li>
                        <li><a href="">입소신청</a></li>
                    </ul>
            </div>

            <!-- 입양탭 -->
	        <div class="menu">
                <a href="">입양</a>
                    <ul class="menu-tag">
                        <li><a href="">입양절차안내</a></li>
                        <li><a href="">입양신청</a></li>
                        <li><a href="">입양후기</a></li>
                    </ul>
            </div>

            <!-- 실종/보호/목격탭 -->
	        <div class="menu">
                <a href="">실종/보호/목격</a>
                    <ul class="menu-tag">
                        <li><a href="">신고글 작성하기</a></li>
                    </ul>
            </div>

            <!-- 고객센터탭 -->
	        <div class="menu">
                <a href="">고객센터</a>
                    <ul class="menu-tag">
                        <li><a href="">공지사항</a></li>
                        <li><a href="">FAQ</a></li>
                    </ul>
            </div>
        </ul>
    </div>


</body>
</html>