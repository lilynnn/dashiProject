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
        height:700px
    }
    .outer>div{
        float: left; 
        box-sizing: border-box;
        width: 100%;
    }
    /*게시판 이름*/
    #mem-update{
        background: rgb(32, 68, 28);
        color: orange;
    }
    #name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    /*안내 메세지*/
    #checkInfo{
        margin-top: 100px;
        margin-bottom: 30px;
    }
    #checkInfo>div{
        width: 800px;
        height: 200px;
        margin-left: 120px;
        border: 1px solid lightgray;
        padding-top:10px;
    }
    #checkInfo div{
        float: left;
    }
    #checkInfo div>p{
        width: 500px;
        height: 80px;
        margin: 0;
    }
    /*비밀번호 재확인*/
    #checkPwd{
        width: 800px;
        height: 100px;
        margin-left: 120px;
    }
    #checkPwd>*{
        margin-right: 10px;
        margin-left: 10px;
        box-sizing: border-box;
    }
    input{
        height: 30px;
        border: 1px solid red;
        border-radius: 3px;
    }
    #mem-update{
        background: rgb(32, 68, 28);
        color: white;
        text-decoration:none;
    }
</style>
</head>
<body>
	
    <!--누리 작업-->
    
	<%@ include file="../common/menubar.jsp" %>

    <% String userPwd = loginUser.getMemPwd();%>

	 <!--전체 div-->
	<div class="outer">

        <!--게시판 안내-->
        <div id="name">
            회원정보수정
            <hr>
        </div>

        <!--회원정보 메뉴바-->
        <div>
            <%@ include file="../common/memberUpdateMenubar.jsp" %>
        </div>

        <!--비밀번호 확인 안내칸-->
        <div id="checkInfo">
            <div>
                <div style="width: 200px; line-height: 10px;" align="center">
                    <img src="<%= contextPath %>/resources/images/lock.JPG" alt="자물쇠 사진입니다." width="100%">
                </div>
                <div style="width: 50px; align="center">
                    <img src="<%= contextPath %>/resources/images/heightline.JPG" alt="">
                </div>
                
                <div id="checkmsg">
                    <p style="font-size: 20px; font-weight: 600; line-height: 150px;">
                        	비밀번호 재확인
                    </p>
                    <p style="line-height: 70px;"> 
                        	회원님의 정보를 안전하게 보호하기위해 비밀번호를 다시 확인합니다.
                    </p>
                </div>
            </div>
        </div>

		<form action="<%=contextPath%>/infoView.me" method="post">
            <div id="checkPwd">
               	 회원 비밀번호 
                <input type="password" name="checkPwd" style="width:200px; height:50px;">
                <button type="submit" class="btn btn-lg btn-outline-danger" id="confirm" onclick="return confirmPwd();">확인</button>
                <input type="hidden" name="password" value="<%=loginUser.getMemPwd()%>">
            </div>
		</form>

	<script>
		function confirmPwd(){
			
			if($("input[name=checkPwd]").val() != $("input[name=password]").val()){
				alert("비밀번호가 일치하지 않습니다!");
				
				return false;
			}
		}

	</script>
    </div>

	<!-- The Modal 
	<div class="modal" id="updateMe">
	  <div class="modal-dialog modal-lg modal-dialog-centered">
	    <div class="modal-content">
	
	      <div class="modal-header">
	        <h4 class="modal-title">Modal Heading</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <div class="modal-body">
	        Modal body..
	      </div>
	
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	-->





















    
    
    <%@ include file="../common/footerbar.jsp" %>
    
    
    
</body>
</html>