<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #updateMenu{
        box-sizing: border-box;
        width: 1100px;
        height: 30px;
    }
    #navi{
        margin: 0;
        padding: 0;
        height: 100%;
    }
    #navi>li{
        float: left;
        width: 260px;
        height: 30px;
        list-style: none;
        text-align: center;
        border: 1px solid green;
        border-radius: 3px;
        background:rgb(220, 238, 206);
    }
    #navi ul>li{
        width: 260px;
        height: 30px;
        list-style: none;
        text-align: center;
        border: 1px solid green;
        border-radius: 3px;
    }
    a{
        text-decoration: none;
        color: black;
        display: block;
        line-height: 30px;
    }
    #navi>li>ul{
        padding: 0;
        margin: 0;
        display: none;
    }
    #navi>li>a:hover+ul{
        display: block; 
    }
    #navi>li>ul:hover{display: block;}  
    
</style>
</head>
<body>

    <!--누리 작업-->

    <div id="updateMenu">

        <ul id="navi">
            <li><a href="">회원정보수정</a></li>
            <li><a href="">찜목록확인</a></li>
            
            <li><a href="">글쓴내역확인</a>
                <ul>
                    <li><a href="">게시글목록</a></li>
                    <li><a href="">댓글목록</a></li>
                </ul>
            </li>
            
            <li><a href="">1:1문의내역</a></li>
        </ul>
    </div>

</body>
</html>