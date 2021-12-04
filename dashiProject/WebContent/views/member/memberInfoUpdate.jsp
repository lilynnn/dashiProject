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
        margin: auto;
        margin-top: 50px;
        height:500px
    }
    .outer>div{
        float: left; 
        box-sizing: border-box;
        width: 100%;
    }
    /*게시판 이름*/
    #name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    /*안내 메세지*/
    #checkInfo{
        margin-top: 50px;
        margin-bottom: 30px;
    }
    #checkInfo>div{
        width: 800px;
        height: 200px;
        margin-left: 120px;
        border: 1px solid lightgray;
    }
    #checkInfo div{
        float: left;
    }
    #checkInfo div>p{
        width: 500px;
        height: 80px;
    }
    /*비밀번호 재확인*/
    #checkPwd{
        width: 800px;
        height: 100px;
        margin-left: 120px;
    }
    #checkPwd>*{
        margin-right: 10px;
        margin-left: 10px;
    }
    input{
        height: 30px;
        border: 1px solid red;
        border-radius: 3px;
    }
    button{
        height: 30px;
        background-color: tomato;
        color: white;
        border: 1px solid red;
        font-weight: 600;
    }
</style>
</head>
<body>
	
    <!--누리 작업-->

	<%@ include file="../common/menubar.jsp" %>

	 <!--전체 div-->
	<div class="outer">

        <!--게시판 안내-->
        <div id="name">
            회원정보수정
            <hr>
        </div>

        <!--회원정보 메뉴바-->
        <div>
            <%@ include file="../common/memberUpdateMenubar.jsp" %>
        </div>

        <!--비밀번호 확인 칸-->
        <div id="checkInfo">
            <div>
                <div style="width: 200px; line-height: 200px;" align="center">
                    <img src="<%= contextPath %>/resources/images/lock.JPG" alt="자물쇠 사진입니다.">
                </div>
                <div style="width: 50px; line-height: 200px;" align="center">
                    <img src="<%= contextPath %>/resources/images/heightline.JPG" alt="">
                </div>
                <div>
                    <p style="font-size: 20px; font-weight: 600; line-height: 150px;">
                        비밀번호 재확인
                    </p>
                    <p> 
                        회원님의 정보를 안전하게 보호하기위해 비밀번호를 다시 확인합니다.
                    </p>
                </div>
            </div>
        </div>

        <form action="">
            <div id="checkPwd">
                회원 비밀번호 
                <input type="text">
                <button>확인</button>
            </div>
        </form>

    </div>
    
    
    <%@ include file="../common/footerbar.jsp" %>
    
    
    
</body>
</html>