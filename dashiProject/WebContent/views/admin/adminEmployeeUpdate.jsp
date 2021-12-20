<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.admin.model.vo.Manager"%>
<%
	Manager a = (Manager)request.getAttribute("a");
 %>
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
        height: 400px;
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
        	
        	<form action="<%=contextPath%>/update.ad" method="post">
				<input type="hidden" name="adminNo" value=<%=a.getMnNo()%>>
                <div id="title">
                    	사원정보수정
                <hr>
                </div>

                <div id="emp-enroll-form">
                    <table align="center" class="table-bordered">
                    	<tr>
                            <th width="100">아이디</th>
                            <td width="400"><input type="text" name="adminId" value="<%=a.getMnId()%>" required readonly></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="text" name="adminPwd" value="<%=a.getMnPwd()%>" required></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="adminName" value="<%=a.getMnName()%>" required></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="text" name="email" value="<%=a.getMnEmail()%>" required></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name="phone" value="<%=a.getMnPhone()%>" required></td>
                        </tr>
                    </table>
                </div>
                
                <div id="emp-enroll-btn" align="center">
                
                    <button type="submit" class="btn" style="background: rgb(102,184,94);">수정하기</button>
                    <a href="<%=contextPath%>/delete.ad?ano=<%=a.getMnNo()%>" class="btn btn-danger">퇴사</a>
                    <button type="button" class="btn" style="background: rgb(143,153,142);" onclick="history.back();">뒤로가기</button>

                </div>
            </form>

        </div>
  
    </div>























	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>