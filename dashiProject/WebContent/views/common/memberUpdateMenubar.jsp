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
    #mem-navi{
        margin: 0;
        padding: 0;
        height: 100%;
    }
    #mem-navi>li{
        float: left;
        width: 260px;
        height: 30px;
        list-style: none;
        text-align: center;
        border: 1px solid green;
        border-radius: 3px;
        background:rgb(220, 238, 206);
        box-sizing:border-box;
    }
    #mem-navi ul>li{
        width: 260px;
        height: 30px;
        list-style: none;
        text-align: center;
        border: 1px solid green;
        border-radius: 3px;
    }
    #mem-navi a{
        text-decoration: none;
        display: block;
        line-height: 30px;
    }
    #mem-navi a:hover{
    	text-decoration: none;
    	color:black;
    }
    #mem-navi>li>ul{
        padding: 0;
        margin: 0;
        display: none;
    }
    #mem-navi>li>a:hover+ul{
        display: block; 
    }
    #mem-navi>li>ul:hover{display: block;} 
</style>
</head>
<body>


    <div id="updateMenu">

        <ul id="mem-navi">
            <li><a href="<%=request.getContextPath()%>/infoView.me" id="mem-update">회원정보수정</a></li>
            <li><a href="" id="mem-likelist">찜목록확인</a></li>
            
            <li><a href="<%=request.getContextPath()%>/boardList.me" id="mem-boardlist">글쓴내역확인</a>
                <ul>
                    <li><a href="<%=request.getContextPath()%>/boardList.me" id="boardlist-list">게시글목록</a></li>
                    <li><a href="" id="boardlist-comm">댓글목록</a></li>
                </ul>
            </li>
            
            <li><a href="<%=request.getContextPath()%>/asList.as" id="mem-question">1:1문의내역</a></li>
        </ul>
    </div>

</body>
</html>