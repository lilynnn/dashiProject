<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PW 재설정</title>
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
		 <%
		 Object data = session.getAttribute("findid");
		 String finduid = (String)data;
  		 %>
  		 <div  align="center" ><b style="font-size:20px; color:green;">비밀번호 재설정</b></div>
	<br>
	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
			<div class="card-title"  style="color:rgb(40,112,37);  margin-right:50px;"><img align="center" style="width:97%;" src="<%=contextPath%>/resources/images/logo33.png">
			</div>
		</div> 
		<div class="card-body">
      		<form action="<%=contextPath%>/resetPwd2.me" class="form-signin" method="POST">
      
      			<input type="hidden" name="member_id" value="<%= finduid %>">
      
     			 <br>
		       <input type="text" name="memId" id="memId" class="form-control" placeholder="아이디를 입력하세요" required><br>
		      
		        <input type="password" name="pw" id="pw" class="form-control" placeholder="새로운 비밀번호" required ><BR>
		        
		        <input type="password" name="pw2" id="pw2" class="form-control" placeholder="비밀번호 재확인" required><br>
       
       	 <p class="check" id="check2">${resetpw_check}</p><br/>
       
       			 <button type="button"  id="btn-Yes" onclick="regist();" class="btn btn-lg btn-primary btn-block">비밀번호 재설정</button>
      	</form>
        
		</div>
		
        <div class="links">
           <div class="links">
            	<a style="margin-left:30px;" href="<%=contextPath%>/findId.me"> &nbsp;&nbsp;아이디 찾기</a> &nbsp;&nbsp;| &nbsp;&nbsp;<a href="<%=contextPath%>">메인으로</a>

        </div>
	
	</div>
		
  <br><br><br>
 
 
   		
   		</div>  <br><br><br>
   <%@include file="../common/footerbar.jsp" %>
  
  <script>
	
  	var check2 = "${findpw_checkt}";
	if(check2 != ""){
	 	alert(check2);
	}
	
	// 비밀번호 정규식
	var pwJ = /^[a-z0-9]{6,20}$/; 
	var pwc = false;
	var pwc2 = false;
	
	$("#pw").focusout(function(){
	     if($('#pw').val() == ""){
	   		$('#check').text('새로운 비밀번호를 입력해주세요.');
	   	  	$('#check').css('color', 'green');
	   	  	
	     }else if(!pwJ.test($(this).val())){
			$('#check').text('6~20자의 영문 소문자, 숫자만 사용가능합니다');
			$('#check').css('color', 'green');
	     }else{
	    	 pwc2 = true;
	    	 $('#check').hide();
	     }
	  });
	
	$("#pw2").focusout(function(){
	     if($('#pw2').val() == ""){
	   		$('#check').text('필수 정보입니다.')
	   	  	$('#check').css('color', 'red')
	 	}else
   	 	$('#check').hide()
	  });
	
	
	
	$("#pw2").keyup(function(){
		   
	    if($(this).val()!=$("#pw").val()){
	        $("#check2").html("비밀번호가 일치하지 않습니다.");
	        $("#check2").css("color",'red');
	        pwc = false;
	
	    }else{
	        $("#check2").html("비밀번호가 일치합니다");
	        $("#check2").css("color",'green');
	        pwc = true;
	    }
	});
	
	$("#pw").keyup(function(){
		     
	    if($(this).val()!=$("#pw2").val()){
	        $("#check2").html("비밀번호가 다릅니다");
	        $("#check2").css("color",'red');
	        pwc = false;
	
	    }else{
	        $("#check2").html("비밀번호가 일치합니다");
	        $("#check2").css("color",'green');
	        pwc = true;
	    }
	});

	function regist(){
		if(pwc2 == false){
		      alert('비밀번호는 6~20자의 영문 소문자, 숫자만 사용가능합니다')
		 }else if(pwc == false ){
			  	alert('비밀번호를 다시 확인해주세요')
		}else{
		 $('form').submit();
		}
		<%session.invalidate();%>
		};
		
    		
  </script>
  
    
    </body>
</html>