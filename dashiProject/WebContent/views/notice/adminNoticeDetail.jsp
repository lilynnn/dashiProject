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
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    /*왼쪽메뉴바*/
    #munubar{width:200px}
    /*상세페이지*/
    #adminNoDetail{
        width: 850px;
        height: 400px;
        margin-left: 20px ;
    }
    #adminNoDetail>div{float: left;}
    #noTitle{
        width: 100%;
        height: 70px;
        font-size: 24px;
        font-weight: 900;
        line-height: 100px;
    }
    #noTitleEct>div{
        float: left;
        height: 100px;
        border: 1px solid gray;
        background: #d8f3f0;
    }
    .noEct{
        height: 49px;
        width: 100px;
        text-align: center;
        line-height: 49px;
    }
    #aNoticeContent{
        width: 100%;
        padding: 20px;
        border-top: none;
    }
    #noName{
        width: 546px;
        padding: 20px;
        line-height: 50px;
        font-size: 20px;
        font-weight: 600;
    }
    #noDate{
        width: 100px;
        height: 100%;
        text-align: center;
        line-height: 150px;
    }
    /*버튼*/
    #noBtn{
        margin-top: 30px;
        width: 100%;
    }
    #noBtn>a{
        border: none;
        border-radius: 3px;
        width: 80px;
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

	<!--전체를 감싸는 큰 div-->
    <div class="outer">
    
    	<div id="menubar">
    		<%@ include file="../admin/adminMenubar.jsp" %>
    	</div>

        <!--관리자 공지사항 상세페이지-->
        <div id="adminNoDetail">

                <div id="noTitle">
                    	공지사항
                </div>

                <div id="noTitleEct">
                    <hr>
                    <div id="noName">
                        제목
                    </div>
                    
                    <div id="noDate">
                        2021-12-04
                    </div>
                    
                    <div>
                        <div class="noEct" style="border-bottom: 1px solid gray;">
                            작성자
                        </div>
                        <div class="noEct">
                            관리자1
                        </div>
                    </div>
                    
                    <div>
                        <div class="noEct" style="border-bottom: 1px solid gray;">
                            조회수
                        </div>
                        <div class="noEct">
                            123
                        </div>
                    </div>
                
                    <div id="aNoticeContent" style="height: 400px; background: white;">
                        내용
                    </div>
                    
                </div>


                <div id="noBtn" align="right">
                    <a href="" class="btn btn-sm" style="background: rgb(143,153,142);">
                        목록으로
                    </a>
                    <a href="" class="btn btn-sm" style="background: rgb(102,184,94)">
                        수정
                    </a>
                    <a href="" class="btn btn-sm btn-danger">
                        삭제
                    </a>
                </div>    


		</div>
    </div>
	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>
	

</body>
</html>