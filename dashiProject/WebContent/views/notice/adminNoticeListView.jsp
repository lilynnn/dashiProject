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
    #sel-notice{
    	font-weight:700px;
    	color:rgb(252, 186, 3);
    }
    /*왼쪽메뉴바*/
    #munubar{width:200px}
    /*공지사항시작*/
 	#adminNoticeList{
         margin-left: 30px;
         width: 850px;
    }
    #adminNoticeList div{float: left;}
    /*검색창*/
    #search{width: 250px;}
    #search>button{
    	border:none;
    	height:30px;
    	border-radius:3px;
    }
    #btn>button{
        border-radius: 5px;
        border: white;
        width: 60px;
        font-size: 13px;
    }
    /*공지사항 목록테이블 정리*/
    .noticeList thead, tbody{
        text-align: center;
    }
    .noticeList{ 
        border-top:1px solid;
        border-bottom: 1px solid;    
    }
    .noticeList thead{background: rgb(224, 223, 223);}
    /*타이틀 정리*/
    #title{
        width: 100%; 
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }
    .btn{
        width: 80px;
        height: 30px;
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

        <!--관리자 공지사항 목록-->
        <div id="adminNoticeList">
        	
        	<form action="">

                <div id="title">
                    	공지사항
                <hr>
                </div>
                <div id="search">
                    <input type="text" placeholder="제목 키워드 검색">
                    <button type="submit">검색</button>
                </div>
                
                <div style="width: 600px;" align="right">
                    <button type="button" class="btn btn-sm" style="background: tomato;">
                        	공지
                    </button>
                    
                    <a href="<%=contextPath%>/noEnrollForm.ad" class="btn btn-sm" style="background: yellow;">
                        	글쓰기
                    </a>
                </div>

                <div style="margin-top: 10px;">
                    <table class="noticeList">
                        <thead>
                            <tr>
                                <td></td>
                                <th>No.</th>
                                <th width="600">제목</th>
                                <th width="70">작성자</th>
                                <th width="100">작성일</th>
                                <th width="70">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--공지사항 없을때-->
                            <tr>
                                <td colspan="5">존재하는 공지사항이 없습니다.</td>
                            </tr>

                            <!--공지사항 있을때-->
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>제목</td>
                                <td>관리자1</td>
                                <td>2021-12-24</td>
                                <td>100</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </form>
        	
        </div>
    </div>

	


	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>