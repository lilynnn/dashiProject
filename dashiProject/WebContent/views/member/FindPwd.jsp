<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.member.model.vo.Member, com.dashi.admin.model.vo.Manager"%>

<!DOCTYPE html>
<html>
<head>
<title>비밀번호찾기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
    <style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    #btn-Yes{
        background-color: rgb(102,184,94);
        border: none;
    }
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .card-title{
        margin-left: 30px;
    }
	 .links{
        text-align: center;
        margin-bottom: 10px;
        margin-right:20px;
    }
    .links>a{
    color:black;
    text-decoration:none;
    }

    a{ 
    	color:rgb(143,153,142); text-decoration: none; 
    }
    .text2{
    	color : green ;
    }
    </style>
  </head>
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	
	<%@ include file="../common/menubar.jsp" %>
	
	
	<br><br><br>
	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title" align="center" style="color:rgb(40,112,37);  margin-right:50px;"><img style="width:50%" src="<%=contextPath%>/resources/images/adminloginlogo.png"><br>
			</h2>
		</div>
        
<div class="card-body">
      <form action="findPw" class="form-signin" method="POST">
        <input type="text" name="member_id" id="member_id" class="form-control" placeholder="아이디" required><br>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required><BR>
        <input type="email" name="email" id="email" class="form-control" placeholder="이메일" required><br>
        <p class="checks" id="checks">${findpw_checkf}</p><br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">비밀번호 찾기</button>
      </form>
      
		</div>
        <div class="links">
            <a href="<%=contextPath%>/findId.me">아이디 찾기</a> | <a href="<%=contextPath%>">메인으로</a>

        </div>

	</div>
		<br><br><br>	<br><br><br>
  
  </body>
    <script type="text/javascript">

	
	  	//아이디 정규식
		var idJ = /^[a-z0-9]{5,20}$/;
		
  		$("#member_id").focusout(function(){
	     if($('#member_id').val() == ""){
	   		$('#checks').text('아이디를 입력해주세요.');
	   	  	$('#checks').css('color', 'green');
	     }
	     });
  		
  		$("#member_id").focusout(function(){
  			if(!idJ.test($(this).val())){
  			$('#checks').text('5~20자의 영문 소문자, 숫자만 사용가능합니다');
  			$('#checks').css('color', 'green');
  		}
  		 });
  		
  		$("#name").focusout(function(){
	     if($('#name').val() == ""){
	   		$('#checks').text('이름을 입력해주세요.');
	   	  	$('#checks').css('color', 'green');
	     }
	     });
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#checks').text('이메일을 입력해주세요');
	   	  	$('#checks').css('color', 'green');
	     }
	     });
  
  </script>
</html>
  <%@include file="../common/footerbar.jsp" %>
</body>
</html>