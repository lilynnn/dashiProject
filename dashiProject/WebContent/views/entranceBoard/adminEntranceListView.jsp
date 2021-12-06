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
    #searchbtn{
    background: rgb(102,184,94);
    font-size: 10px;
    border: none;
    border-radius: 5px;
    color: #fff;
    display: inline-block;
    font-weight: bold;
    position: relative;
    text-transform: uppercase;
    padding: 5px;
    }

    .checkState{
        border-radius: 10px;
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
            <!-- 1:1 목록-->
        <div id="answerlist">
        	
        	<form action="">

                <div id="title">
                    	입소신청 관리
                <hr>
                </div>

                <!-- 카테고리 및 검색창-->
                 <div class="search-area" style="margin: 20px 0px; display: inline-block;"">
                    <select name="search-category" style="height: 20px; margin: 5px;">
                        <option value="">카테고리</option>
                        <option value="">확인중</option>
                        <option value="">승인</option>
                        <option value="">반려</option>
                    </select>

                    <input type="text" placeholder="검색어를 입력하세요.">
                    
                    <button id="searchbtn" style="margin: 5px; padding-left: 10px;padding-right: 10px;">검색</button>
                </div>
                
                <div id="btn" align="right"; style="display: inline-block;" >
                   
                    <button>삭제</button>
                </div>

                <div style="margin-top: 10px;">
                    <table>
                        <thead>
                            <tr>
                                <td></td>
                                <th>No.</th>
                                <th>카테고리</th>
                                <th width="600">제목</th>
                                <th>작성자</th>
                                <th width="100">작성일</th>
                                <th width="70"> 상태 </th>
                              


                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <th>1</th>
                                <th>강아지</th>
                                <th>입소관련 질문드립니다 </th>
                                <th>tkdjs123</th>
                                <th>2021-12-24</th>
                                <th class="checkState" style="color:red;">확인중</th>
                                
                            </tr>

                            <tr>
                                <td><input type="checkbox"></td>
                                <th>1</th>
                               
                                <th>고양이</th>
                                <th>4세 고양이 입소문의드립니다. </th>
                                <th>akdrh1927</th>
                                <th>2021-12-24</th>
                                <th class="checkState" style="color:blue;">승인</th>
                               
                            </tr>

                            <tr>
                                <td><input type="checkbox"></td>
                                <th>1</th>
                               
                                <th>기타</th>
                                <th>길에서 발견한 XXX 입소문의드립니다. </th>
                                <th>cat_012</th>
                                <th>2021-12-24</th>
                                <th class="checkState" style="color:grey;">반려</th>
                               
                            </tr>

                        </tbody>
                    </table>

                    <div align="center" style="margin-top: 30px;">
                        <button class="btn btn-light">&lt;</button>
                        <button class="btn btn-light">1</button>
                        <button class="btn btn-light">2</button>
                        <button class="btn btn-light">3</button>
                        <button class="btn btn-light">4</button>
                        <button class="btn btn-light">&gt;</button>
                    </div>

                </div>






            </form>
        	
        </div>
    </div>

	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>