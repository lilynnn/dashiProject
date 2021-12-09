<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{ 
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    
    /* 썸네일 이미지 영역스타일 */
    .rv-image{width: 220px; height: 220px; border: 1px solid black;}

    /*입양후기 제목 스타일*/
    .review-title{
        width: 150px; 
        float: left; 
        font-weight: 900;
        margin-bottom: 10px;
        padding: 10px;
    }

    /* 댓글버튼 스타일*/
    #commenticon{
        background: rgb(102,184,94); 
        color: white;
        border: none; 
        font-size: 12px; 
        border-radius: 3px;
        margin-top: 10px;
    }

    /* 글쓰기버튼 스타일*/
    #write{
        border: none;
        background: lightgray;
        color: rgb(63, 62, 62);
        font-size: 16px;
        font-weight: bold;
        height: 35px;
        width: 110px;
        float: right;
        border-radius: 9px;
        margin-right: 30px;
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        
        <!--입양후기(타이틀), 글쓰기버튼-->
        <div id="title" style="width: 100%; font-size: 26px; font-weight: 900;">
            입양 후기  
            <!--클릭 시 입양후기 작성 뷰로 이동-->
            <button id="write">글쓰기</button>      
        </div>
        <hr>

        <!--입양후기 리스트 영역-->
        <div align="center">
            <table style="width: 1000px; height: 1300px; margin-top: 50px;">
                <tr style="height:250px">
                    <td align="center">
                        <!--썸네일 이미지 (사용자가 올리는 첫번째 사진)-->
                        <div class="rv-image"></div>
                        <!--입양후기 제목-->
                        <span class="review-title" align="left">입양후기 제목</span>
                        <!--댓글 버튼 클릭 시 입양후기 상세페이지 댓글영역으로 이동-->
                        <button id="commenticon">
                            댓글
                        </button>
                        <!--댓글 수-->
                        <span class="comm-count">3</span>
                    </td>
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                </tr>
                <tr style="height:250px">
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                </tr>                <tr style="height:250px">
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                </tr>                <tr style="height:250px">
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                </tr>                <tr style="height:250px">
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>                    <td align="center">
                        <div class="rv-image"></div>
                        <span class="review-title" align="left">입양후기 제목</span>
                        <button id="commenticon">
                            댓글
                        </button>
                        <span class="comm-count">3</span>
                    </td>
                </tr>
            </table>

        </div>

    </div>

	<br><br><br><br><br>
	
    <%@include file="../common/footerbar.jsp" %>
	
</body>
</html>