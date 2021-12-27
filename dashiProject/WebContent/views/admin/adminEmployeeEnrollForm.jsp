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
    /*타이틀 정리*/
    #title{
        width: 100%; 
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }
    /*사원등록 시작*/
 	#emp-enroll{
         margin-left: 30px;
         margin-top: 15px;
         width: 850px;
    }
    #emp-enroll-form{
        width: 600px;
        height: 300px;
        border: 1px solid;
        margin: auto;
        background:#f8ebe7;
    }
    #emp-enroll-form>table *{
        height: 40px;
        border: 1px solid #f8ebe7;
    }
    .table-bordered{margin-top: 40px;}
    .table-bordered input{
        border: none;
        width: 100%;
    }
    #emp-enroll-btn{
        width: 100%;
        margin-top: 30px;    
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

        <!--관리자 사원관리 목록-->
        <div id="emp-enroll">
        	
        	<form action="<%=contextPath%>/insert.ad" method="post">

                <div id="title">
                    	사원등록
                <hr>
                </div>

                <div id="emp-enroll-form">
                    <table align="center" class="table-bordered">
                        <tr>
                            <th width="100">비밀번호</th>
                            <td width="400"><input type="password" name="adminPwd"></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="adminName" required></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="text" name="email" required placeholder="@전까지만 입력해주세요."></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name="phone" required placeholder="(-)포함 입력해주세요."></td>
                        </tr>
                    </table>
                </div>
                
                <div id="emp-enroll-btn" align="center">
                
                    <button type="submit" class="btn" style="background: rgb(102,184,94);">등록하기</button>
                    <button type="reset" class="btn btn-light">초기화</button>
                    <button type="button" class="btn" style="background: rgb(143,153,142);" onclick="history.back();">뒤로가기</button>

                </div>
            </form>

        </div>
  
    </div>























	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>