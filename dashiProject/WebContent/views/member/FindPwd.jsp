<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>    
    /* 로고 영역 */
    .logo-area{
        margin-top: 100px;
    }
    .logo-area img{
        width: 245px;
        height: 75px;
    }
    /* 로그인 영역 */
    .login-area{ width: 1200px; margin: auto; }

    /* 메뉴바 영역 */
    .menu-area{
    	background: rgb(40,112,37);
    	width: 1200px;
    	margin: auto;
        margin-top: 10px;	
    }
    .menu{
        display: table-cell;
        width: 250px;
    }
    .menu a{
        text-decoration: none;
        color: white;
        display: block;
        width: 100%;
        height: 100%;
    }
    .menu>a{
        font-size: 16px;
        font-weight: bold;
        line-height: 300%;
    }
    .menu a:hover{
        color: rgb(252, 186, 3);
    }
    .menu>ul{
        list-style-type: none;
        padding: 0px;
        line-height: 200%;
    }
    .menu>ul a{
        color: white;
        font-size: 13px;
    }
    .menu>ul{display: none; padding: 0px;}
    .menu>a:hover+ul{display: block;}
    .menu>ul:hover{display: block;}

    .loginbt, .enrollbt{
        cursor:pointer;
    }

    .userId, .userPwd{
        height: 45px;

    }
    /*//////////////////////////////////////////////////*/
    .modal-content{
        border-radius: 30px
        
    }

    .login-area input, .loginBtn, .enrollBtn{
        width: 350px;
        height: 50px;
        border-radius: 4px;
    }
    .login-area input{
        border-color: rgba(202, 202, 202, 0.459);
        margin-bottom: 15px;
    }

    .find{
        font-size: 13px;
        font-weight: bold;
        margin-left: 60%;
        color: rgb(78, 77, 77);
        
    
    }
    
    .loginBtn{
        background-color: rgb(102,184,94);
        color: white;
        font-weight: bold;
        border: none;
    }

    .enrollBtn{
        background-color: white;;
        color: rgb(102,184,94);
        font-weight: bold;
         
        border-color: rgb(102,184,94);
        margin-bottom: 30px;
        margin-top: 50px;

    }

    .find{
        font-size: 13px;
        font-weight: bold;
        margin-left: 60%;
        color: rgb(78, 77, 77);
    }

    div{
        
    }
    
 	.login-area a{
    text-decoration:none;
    color:black;
    }
    
    .login-area a:hover{
    text-decoration:none;
    color:rgb( 102,184,94);
    }
	
	


</style>
</head>

<body>
   <%@ include file="../common/menubar.jsp" %> 

   <!--Pwd Modal창-->
	<div class="modal fade" id="findPwd">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="text-align:center; margin-left:115px;">다시,사랑받개 <br></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        	<div class="modal-body">
                <table style="margin:auto; style="margin-bottom:30px;">  
           		<tr>
                <th style="font-size:20px; cursor:pointer;" data-toggle="modal" data-target="#findId" >아이디 찾기<br><br></th>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                <th style="font-size:20px; color: rgb(40,112,37); margin-bottom:30px; cursor:pointer;" data-toggle="modal" data-target="#findPwd">비밀번호 찾기<br><br></th>
           		</tr>
            </table>
            
             <table style="margin-left:50px;">
            <form action="<%=contextPath%>/findPwd.me" method="post">
           
                <!-- Modal body -->
                <tr>
                    <th colspan="2"><input type="text" name="" placeholder="이름을 입력해주세요." style="width: 280px; height:40px; margin-bottom:10px;"></th>
                  </tr>
                  <tr>
                      <th colspan="2"><input type="text" name="" placeholder="생년월일6자리" style="width: 180px; height: 40px; margin-bottom:10px;"> &nbsp; - 
                        <input type="text" name="" style="width: 10px; height: 30px; margin-bottom:10px;">&nbsp; *&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*</th> 
                  </tr>
                  <tr>
                      <th colspan="2"><input type="phone" placeholder="휴대폰 번호를 입력해주세요."  style="width:280px;height:40px; margin-bottom:10px;"></th>
                  </tr>
                  <tr>
                      <th colspan="2"><input type="text" value="" name="" placeholder="인증번호 6자리를 입력해주세요." style="width:280px; height: 40px; margin-bottom:10px;"></th>
                  </tr>
                  <tr><th>&nbsp;&nbsp;</th></tr>
		        <tr>
		            <th colspan="2" style="padding-right:40px; margin-top:20px;"><button onclick="" class="searchbtn" name="pwd" style="width:280px; height:50px;"><b style="font-size:20px;">PW 재설정 <br></b></button></th>
		        </tr>     
		        <tr>
		        <th>&nbsp;&nbsp;</th>
		        </tr>
		        
        </form> </table>
      </div>
      </div>
    </div>
  </div>
                


<!-- 비밀번호 재설정  
<div class="modal fade" id="reupdatePwd" style="width: 600px;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="width: 80%; margin: auto;" >

    	<div class="modal-body">
    <form action="" method="">
        <fieldset style="margin: 40px; border-radius: 10px; border; background-color: white; width: 300px;">
    <table class="table" style="width: 300px;">
      <tr>
        <th colspan="3"><h3 style="text-align: center; padding-bottom:15px; border-bottom: 1px solid gray;">다시,사랑받개!</h3></th>
     </tr>
      <tr>
          <th style="padding-bottom: 20px;" onclick="" >&nbsp;아이디 찾기</th>
          <th align="center"></th>
          <th style="padding-bottom: 20px;  color: rgb(40,112,37); " align="center" onclick="">비밀번호 찾기&nbsp;</th>
      </tr>
      <tr>
        <th colspan="3" style="font-size:10px;"> <input type="text" style="width: 280px; height:30px;" name="updatePwd" placeholder="새 비밀번호를 입력해주세요." ><br>
            10~20자의 영문 소문자, 숫자의 특수기호 사용 </th>
      </tr>
      <tr>
          <th colspan="3"><input type="text" name="checkPwd" placeholder="새 비밀번호를 다시 입력해주세요." style="height: 30px; width: 280px;"></th>
      </tr>
      <tr>
          <th colspan="3"><button type="submit" class="searchbtn" onclick="return validatePwd();" style="width:280px; height: 30px;"><b>비밀번호 재설정</b></button></th>
      </tr>
    </table>
    </fieldset></div>
    </form>

    		<script>
	        	function validatePwd(){
	        		if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
	        			alert("변경할 비밀번호가 일치하지 않습니다.");
	        			return false;
	        		}
	        	}
	        </script>
-->
</body>
</html>