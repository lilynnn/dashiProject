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
    #munubar{width:150px}
    /*공지사항시작*/
 	#adminNoticeList{
         margin-left: 30px;
         width: 850px;
    }
    #adminNoticeList div{float: left;}
    /*검색창*/
    #search{width: 200px;}
    #btn{
        width: 650px;
    }
    #btn>button{
        border-radius: 5px;
        border: white;
        width: 60px;
        font-size: 13px;
    }
    /*공지사항 목록테이블 정리*/
    thead, tbody{
        text-align: center;
    }
    table{ 
        border-top:1px solid;
        border-bottom: 1px solid;    
    }
    thead{background: rgb(224, 223, 223);}
    /*타이틀 정리*/
    #title{
        width: 100%; 
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }
</style>
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
                </div>
                <div id="btn" align="right">
                    <button style="background: #d88686;">공지</button>
                    <button style="background:yellow;">글쓰기</button>
                    <button>수정</button>
                    <button>삭제</button>
                </div>

                <div style="margin-top: 10px;">
                    <table>
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
                            <tr>
                                <td><input type="checkbox"></td>
                                <th>1</th>
                                <th>제목</th>
                                <th>관리자1</th>
                                <th>2021-12-24</th>
                                <th>100</th>
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