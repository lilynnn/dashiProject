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

    .loginbt, .enrollbt{
        cursor:pointer;
    }

    .userId, .userPwd{
        height: 45px;

    }
    /*//////////////////////////////////////////////////*/
    .modal-content{
        border-radius: 30px
        
    }

    .login-area input, .loginBtn, .enrollBtn{
        width: 350px;
        height: 50px;
        border-radius: 4px;
    }
    .login-area input{
        border-color: rgba(202, 202, 202, 0.459);
        margin-bottom: 15px;
    }

    .find{
        font-size: 13px;
        font-weight: bold;
        margin-left: 60%;
        color: rgb(78, 77, 77);
        
    
    }

    .loginBtn{
        background-color: rgb(102,184,94);
        color: white;
        font-weight: bold;
        border: none;
    }

    .enrollBtn{
        background-color: white;;
        color: rgb(102,184,94);
        font-weight: bold;
         
        border-color: rgb(102,184,94);
        margin-bottom: 30px;
        margin-top: 50px;

    }

    .find{
        font-size: 13px;
        font-weight: bold;
        margin-left: 60%;
        color: rgb(78, 77, 77);
    }

    div{
        border: 1px solid red;
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
                <td class="loginbt" data-toggle="modal" data-target="#login_myModal">로그인</td>
                <td style="width: 20px;"><!--공백란--></td>
                <td class="enrollbt">회원가입</td>
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
 <!--회원가입 modal-->
    <!-- The Modal -->
    <div class="modal fade" id="login_myModal" style="width: 600px;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="width: 80%; margin: auto;" >

                
                <div class="outer" > <!-- 전체를 감싸는 div -->
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">다시 사랑받개!를 <br>방문해주셔서 감사합니다.</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <br>
                    <!-- Modal body -->
                    <div class="login-area" style="width: 370px;">
                        <form action="" method="post">
                            <table>
                                <tr>
                                    <td><input type="text" name="userId" placeholder="아이디" required></td>
                                </tr>
                                <tr>
                                    <td><input type="password" name="userPwd" placeholder="비밀번호" required></td>
                                </tr>
                            </table>

                            <a class="find" href="">아이디/비밀번호찾기</a>
                            <br><br>


                            <button class="loginBtn" type="submit">로그인</button>
                            <br>


                            <button class="enrollBtn"type="button" onclick="">회원가입</button>


                            <p style="font-size: 14px; position: relative; bottom:105px;">다시, 사랑받개가 처음이신가요?</p>
                        </form>
                    </div>

                </div>
                
            </div>
        </div>
    </div>
    

    <!-- 로그인버튼 눌렀을시 -->
    <script>
        $(function(){
            $(login-area>table>tr>td).click(function(){
                $("login_myModal").modal();
            })
        });
    </script>

</body>
</html>