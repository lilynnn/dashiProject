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
    /*사원관리 시작*/
 	#adminlist{
         margin-left: 30px;
         width: 850px;
    }
    .table-bordered *{
        height: 40px;
    }
    #adminlist div{float: left;}
    /*검색창*/
    #search{width: 250px;}
    #search>button{
    	border:none;
    	height:30px;
    	border-radius:3px;
    }
    .btn-sm>button{
        border-radius: 5px;
        border: white;
        width: 60px;
        font-size: 13px;
    }
    /*타이틀 정리*/
    #title{
        width: 100%; 
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }
    .btn-sm{
        width: 80px;
        height: 30px;
    }
    /*pagingbar*/
    .paging-area{
        width: 100%;
        margin-top: 30px;
    }
    .paging-area>button{
    	border-radius:3px;
    	border:none;
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

        <!--관리자 사원관리 목록-->
        <div id="adminlist">
        	
        	<form action="">

                <div id="title">
                    	사원관리
                <hr>
                </div>
                <div id="search">
                    <input type="text" placeholder="이름으로 검색">
                    <button type="submit">검색</button>
                </div>
                
                <div style="width: 600px;" align="right">
                    <a href="" class="btn btn-sm" style="background: rgb(102,184,94);">
                        	사원등록
                    </a>
                </div>

                <div style="margin-top: 10px;">
                    <table class="table-bordered">
                        <thead>
                            <tr align="center">
                                <th width="50">사번</th>
                                <th width="100">이름</th>
                                <th width="100">아이디</th>
                                <th width="200">이메일</th>
                                <th width="150">전화번호</th>
                                <th width="100">입사일</th>
                                <th width="100">퇴사일</th>
                                <th width="100">퇴사여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--사원 없을때-->
                            <tr align="center">
                                <td colspan="8">존재하는 사원이 없습니다.</td>
                            </tr>

                            <!--사원 있을때-->
                            <tr align="center">
                                <td>101</td>
                                <td>
                                    <button type="button" class="btn" data-toggle="modal" data-target="#checkInfo">김자두</button>    
                                </td>
                                <td>admin01</td>
                                <td>admin01@highfive.team</td>
                                <td>010-1111-2222</td>
                                <td>2021-07-27</td>
                                <td>-</td>
                                <td>N</td>
                            </tr>

                        </tbody>
                    </table>
                </div>

            </form>
        	
            <!-- 페이징바 -->
            <div align="center" class="paging-area">
                <button class="btn btn-light">&lt;</button>
                <button class="btn btn-light">1</button>
                <button class="btn btn-light">2</button>
                <button class="btn btn-light">3</button>
                <button class="btn btn-light">4</button>
                <button class="btn btn-light">5</button>
                <button class="btn btn-light">&gt;</button>
            </div>

        </div>
    </div>


    <!--관리자 정보확인/수정용 모달-->
    <!-- The Modal -->
    <div class="modal" id="checkInfo">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">김자두</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table>
                    <tr>
                        <th width="100">사번</th>
                        <td width="200">101</td>
                        <td rowspan="8" width="200" heigth="300">
                            <img src="<%=contextPath%>/resources/images/idcard.png" style="width: 100%;">
                        </td>
                    </tr>
                    <tr>
                        <th width="100">아이디</th>
                        <td width="200">admin01</td>
                    </tr>
                    <tr>
                        <th width="100">이메일</th>
                        <td width="200">admin01@highfive.team</td>
                    </tr>
                    <tr>
                        <th width="100">전화번호</th>
                        <td width="200">010-1111-2222</td>
                    </tr>
                    <tr>
                        <th width="100">입사일</th>
                        <td width="200">2021-07-27</td>
                    </tr>
                    <tr>
                        <th width="100">퇴사일</th>
                        <td width="200">-</td>
                    </tr>
                    <tr>
                        <th width="100">퇴사여부</th>
                        <td width="200">N</td>
                    </tr>
                </table>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">정보수정</button>
                <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
            </div>
    
        </div>
        </div>
    </div>
  
























	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>