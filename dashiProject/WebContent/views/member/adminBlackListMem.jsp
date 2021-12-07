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
   
    #munubar{width:150px}
   
 	#adminNoticeList{
         margin-left: 30px;
         width: 850px;
    }
    #adminNoticeList div{float: left;}
    /*검색창*/
    #search{
        width: 200px;
        display: inline-flex;
    }
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

        
        <div id="blackList">
        	
        	<form action="">

                <div id="title">
                 블랙리스트 관리 
                <hr>
                </div>
                <div id="search">
                    <input type="text" placeholder="ID / 이름 검색" style="margin-right: 10px;"> <input type="button" value="검색">
                </div>
                
                <div id="btn" align="right">
                    <button>복구</button>
                </div>

                <div style="margin-top: 10px;">
                    <table width="960px">
                        <thead>
                            <tr>
                                <td></td>a
                                <th>No.</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>신고사유</th>
                                <th>신고횟수</th>
                                <th>신고일</th>
                                <th>신고자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <th>1</th>
                                <th>mango_13</th>
                                <th>김말똥</th>
                                <th>비방</th>
                                <th>2회</th>
                                <th>2021-12-24</th>
                                <th>김**</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <th>2</th>
                                <th>mango_13</th>
                                <th>김말똥</th>
                                <th>비방</th>
                                <th>2회</th>
                                <th>2021-12-24</th>
                                <th>김**</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <th>3</th>
                                <th>mango_13</th>
                                <th>김말똥</th>
                                <th>비방</th>
                                <th>2회</th>
                                <th>2021-12-24</th>
                                <th>김**</th>
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