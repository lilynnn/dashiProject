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
    /* 로고 영역 */
    .logo-area{
        margin-top: 100px;
    }
    .logo-area img{
        width: 245px;
        height: 75px;
    }
    /* 로그인 영역 */
    .login-area{ width: 1200px; margin: auto; }

    /* 메뉴바 영역 */
    .menu-area{
    	background: rgb(40,112,37);
    	width: 1200px;
    	margin: auto;
        margin-top: 10px;	
        border-radius:20px
    }
    .menu{
        display: table-cell;
        width: 250px;
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
    #adminMenu>div{
        float: left;
    }
    /*왼쪽 메뉴바 작업*/
    #adminMenu{margin-left:300px}
    #aMenubar{
        width: 150px; 
        height: 90%; 
        margin-top: 65px;
        margin-left: 40px;
    }
    #aMenubar>div{
        width: 100%;
        height: 30px;
        text-align: right;
        line-height: 30px;
    }
    #member, #apply, #list, #report, #payment, #animal{
        background: lightgray;
    }
    #fighting{
       width:150px;
       height:100px;
       border:1px solid black;
    }
</style>
</head>
<body>
	
    <!-- 메인로고 영역 -->
    <div class="logo-area" align="center">
        <a href="<%= contextPath %>"><img src="resources/images/logo.PNG"></a>
    </div>
    
    <!-- 로그인 영역 -->
    <div class="login-area" align="right">
        <table>
            <tr>
                <td>로그인</td>
                <td style="width: 20px;"><!--공백란--></td>
                <td>회원가입</td>
            </tr>
        </table>
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

    <!-- 관리자 메뉴바입니다/누리작업-->
    <div id="adminMenu">
        
        <!--왼쪽메뉴바-->
        <div id="aMenubar">
        		
        		<div style="width:150px; height:85px; text-align:center; line-height:80px; font-weight:bold; color:orangered">1조 화이팅♡</div>
        
                <div id="member">회원관리</div>
                <div>전체회원조회</div>
                <div>블랙리스트조회</div>
                
                <div id="apply">신청내역관리</div>
                <div>입양신청</div>
                <div>입소신청</div>
                
                <div id="list">게시글관리</div>
                <div>공지사항</div>
                <div>입양공고</div>
                <div>입양후기</div>
                <div>실종/보호</div>
                <div>1:1문의</div>
                <div>FAQ</div>
                
                <div id="report">신고내역관리</div>
                <div>전체신고내역</div>
                
                <div id="payment">결제내역관리</div>
                <div>전체결제내역</div>
                
                <div id="animal">동물관리</div>
                <div>전체동물조회</div>
            </div>
   
    </div>

</body>
</html>