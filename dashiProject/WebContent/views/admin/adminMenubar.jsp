<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    /*왼쪽 메뉴바 작업*/
    #aMenubar{
        width: 200px; 
        height: 90%; 
        margin-top: 18px;
    }
    #aMenubar>div{
        width: 100%;
        height: 30px;
        text-align: right;
        line-height: 30px;
        cursor: pointer;
        box-sizing:border-box;
    }
    #member, #apply, #list, #report, #payment, #animal{
        background: lightgray;
    }
    #fighting{
       width:150px;
       height:100px;
       border:1px solid black;
    }
    #aMenubar>ul>li{
        list-style-type: none;
        text-align: right;
        line-height: 30px;
    }
    #aMenubar>ul a{
        text-decoration: none;
        color: black;
    }
    #aMenubar>ul{
        display: none;
    }
    #aMenubar>ul a:hover{color: orange;}
    .aMenu{box-sizing: border-box;}

    /* 입양신청 스타일 영역 */
    #adoptApply a{
        display: block;
        width: 100%;
        height: 100%;
        text-decoration: none;          
        color: black;
    }
</style>


</head>
<body>

	
    <!-- 관리자 메뉴바입니다/누리작업-->
    <div id="adminMenu">
        
        <!--왼쪽메뉴바-->
        <div id="aMenubar">
        		
        		<div style="width:200px; height:80px; margin-bottom:5px; background-color:lemonchiffon; text-align:center; line-height:80px; font-weight:bold;">
        			1조 화이팅♡
        		</div>
        
                <div class="aMenu" id="member">회원관리</div>
                <ul>
                    <li><a href="">전체회원조회</a></li>
                    <li><a href="">블랙리스트조회</a></li>
                </ul>
                
                <div class="aMenu" id="apply">신청내역관리</div>
                <ul>
                    <li id="adoptApply"><a href="<%= request.getContextPath()%>/adadoptlist.bo">입양신청</a></li>
                    <li><a href="">입소신청</a></li>
                </ul>
                
                <div class="aMenu" id="list">게시글관리</div>
                <ul>
                    <li><a href="">공지사항</a></li>
                    <li><a href="">입양공고</a></li>
                    <li><a href="">입양후기</a></li>
                    <li><a href="">실종/보호</a></li>
                    <li><a href="">1:1문의</a></li>
                    <li><a href="">FAQ</a></li>
                </ul>

                <div class="aMenu" id="report">신고내역관리</div>
                <ul>
                    <li><a href="">전체신고내역</a></li>
                </ul>

                <div class="aMenu" id="payment">결제내역관리</div>
                <ul>
                    <li><a href="">전체결제내역</a></li>
                </ul>

                <div class="aMenu" id="animal">동물관리</div>
                <ul>
                    <li><a href="">전체동물조회</a></li>
                </ul>
         </div>
   
    </div>
    
    <script>
        $(function(){
            $(".aMenu").click(function(){

                const $ul = $(this).next();

                if($ul.css("display") == "none"){

                    $(this).siblings("ul").slideUp();

                    // 보여지게끔
                    $ul.slideDown();

                }else{
                    // 사라지게끔
                    $ul.slideUp();

                }

            })
        })
    </script>



</body>
</html>