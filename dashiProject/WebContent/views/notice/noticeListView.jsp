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
    }
    .outer>div{
        float: left; 
        box-sizing: border-box;
    }
    /*대표이미지부분*/
    #image{
        width: 100%;
        height: 300px;
        margin-bottom: 20px;
        border: 1px solid;
    }
    /*공지사항~확인해보세요div*/
    #name, #serve, #meno{margin-top: 10px; height: 50px;}
    #name{
        width: 110px;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    #serve{
        width: 900px;
        color: darkgray;
        line-height: 60px;
    }
    #meno{width: 100%;}
    /*공지사항 목록*/
    #list>table{
        text-align: center;
    }
    thead>tr{height: 30px;}
    #noticeInNotice>td{font-weight: bolder;}
    /*pagingbar*/
    .paging-area{
        width: 100%;
        margin-top: 30px;
    }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
    <%@ include file="../common/menubar.jsp" %>

    <!--전체 div-->
	<div class="outer">

        <!--image부분-->
        <div id="image">
            이미지 넣을 칸
        </div>

        <!--게시판 안내-->
        <div id="name">
            공지사항
        </div>
        <div id="serve">| 공지사항</div>
        <div id="meno">
            다시, 사랑받개의 공지사항을 확인해보세요!
        </div>

        <!--공지사항 리스트-->
        <div id="list">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th width="60px">번호</th>
                        <th width="80px"></th>
                        <th width="700px">제목</th>
                        <th width="120px">날짜</th>
                        <th width="120px">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <!--공지글 없을 때-->
                    <tr>
                        <td colspan="5">게시된 공지사항이 없습니다.</td>
                    </tr>
                    <!--공지의 공지글 있을 때-->
                    <tr id="noticeInNotice">
                        <td>1</td>
                        <td>
                            <button class="btn-sm" style="background: #f57f7f; border: none; font-weight: bolder;">
                                공지
                            </button>
                        </td>
                        <td>제목</td>
                        <td>2021-12-04</td>
                        <td>123</td>
                    </tr>
                    <!--일반 공지글 있을 때-->
                    <tr>
                        <td>1</td>
                        <td></td>
                        <td>제목</td>
                        <td>2021-12-04</td>
                        <td>123</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="paging-area" align="center">

			아직 페이징바는 미완성 상태!
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>6</button>
            <button>7</button>
            <button>8</button>
            <button>9</button>
            <button>10</button>
            <button>&gt;</button>

        </div>

    </div>

	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>