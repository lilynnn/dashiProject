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
        height: 500px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        box-sizing: border-box;
        float: left;
    }
    /*게시판 이름*/
    #name{
        width: 100%;
        font-size: 20px;
        font-weight: 900;
    }
    /*상세보기 제목*/
    #title{
        font-size: 24px;
        font-weight: 900;
        width: 100%;
        margin-top: 10px;
    }
    /*등록일~조회수*/
    .dateView{
        font-size: 12px;
        color: silver;
        width: 40px;
        margin-top: 10px;
    }

</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp"%>


    <div class="outer">
        <!--게시판 이름-->
        <div id="name">공지사항</div>
        <hr>

        <!--제목, 등록일, 조회수-->
        <div id="title">제목</div>
        <div class="dateView">등록일</div>
        <div class="dateView" style="width: 100px;">2021.12.24</div>
        <div class="dateView">조회수</div>
        <div class="dateView" style="width: 700px;">123</div>
        
        <!--본문-->
        <div>본문내용</div>

        <!--이전글 다음글-->
        <div>△</div>
        <div>이전글</div>
        <div>이전글 제목</div>
        <div>▽</div>
        <div>다음글</div>
        <div>다음글제목</div>

        <!--목록으로-->
        <div>
            <button>목록으로</button>
        </div>

    </div>

    <%@ include file="../common/footerbar.jsp"%>

</body>
</html>