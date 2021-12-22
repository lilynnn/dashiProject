<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.member.model.vo.Member, com.dashi.admin.model.vo.Manager"%>
<% 
	String contextPath = request.getContextPath(); 
	Member loginUser = (Member)session.getAttribute("loginUser");
	Manager loginAdmin = (Manager)session.getAttribute("loginAdmin");
	String alertMsg = (String)session.getAttribute("alertMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

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
        border-radius:20px
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
        text-decoration: none;
    }
    .menu>ul{display: none; padding: 0px; text-decoration: none;}
    .menu>a:hover+ul{display: block;}
    .menu>ul:hover{display: block;}
   /*//////////////////////////////////////////////////*/
   
   
    .login{
       cursor:pointer;
    }
    .enroll{
        color: rgb(26, 26, 26);
    }
    .enroll:hover{color: rgb(26, 26, 26); text-decoration: none;}


   .login-area input{
       width: 350px;
       height: 45px;
       border-radius: 4px;
       margin-left: 20px;
       
   }

   .modal-body *{
       font-size: 13px;
   }
   .find{
    margin-left: 235px;
    color: black;
    text-decoration: underline;
   }

   .loginBtn, .enrollBtn{
    width: 350px;
    height: 55px;
    border-radius: 4px;
    margin: auto;
   }

   .loginBtn{
    background-color: rgb(102,184,94);
    color: white;
    font-size: 20px;
    border:none;
   }

   .enrollBtn{
    background-color: white;
    color: rgb(102,184,94);
    font-size: 20px;
    border-color: rgb(102,184,94);
   }

   .modal-dialog.modal-dialog-centered{
    width: 420px;
    margin: auto;
   }

   .modal-content{
       border-radius: 30px;

   }


  /*인증번호 버튼 text*/
        .searchbtn{
            text-align: center;
            background-color:rgb(40,112,37);
            border: none;
            border-radius: 10px;
            font-size: 15px;
            padding-top: 10px;
            padding-bottom: 30px;
            color: aliceblue;
            position: relative;
        }
        .table{
            border-spacing: 10px;
            font-size: larger;
        }
	
	.btn-find{
	cursor:pointer;
	}
	
	#pwre{
	text-decoration:none;
	color:white;
	}
	
	.find-btn{
	text-decoration:none;
	color:black;
	}
	
	.find-btn>a:hover{
	color:green;
	text-decoration:none;
	}

</style>
</head>
<body>	

	<% if(alertMsg != null){ %>
		<script>
			alert("<%=alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>

	<%@ include file="../common/rightQuickMenu.jsp" %>
	
	<!-- 메뉴바  -->
	
    <!-- 메인로고 영역 -->
    <div class="logo-area" align="center">
        <a href="<%= contextPath %>"><img src="<%= contextPath %>/resources/images/mainLogo.JPG"></a>
    </div>
    
    <!-- 로그인 영역 -->
    <div class="login-area" align="right">
        
        
        <!--case 1.로그인 전 -->
        <%if(loginUser == null && loginAdmin == null){ %>
        <table>
            <tr>
                <td class="login" data-toggle="modal" data-target="#login_myModal">로그인</td>
                <td style="width: 20px;"><!--공백란--></td>
                <td><a class="enroll" href="<%= contextPath %>/enroll1.me">회원가입</a></td>
            </tr>
        </table>
        <%}else if(loginUser!=null && loginAdmin == null){ %>
        
        <!-- case 2. 일반사용자 로그인 후 -->
       		<div>
	            <b><%=loginUser.getMemName() %>님</b>반갑습니다! &nbsp;
	            <a href="<%= contextPath %>/logout.me" style="color: black;">로그아웃</a>&nbsp;&nbsp;&nbsp;
	            <a href="<%= contextPath %>/mypage.me" style="color: black;">마이페이지</a>
	        </div>
       
       <%} else {%>
       
       <!-- case 3. 관리자로 로그인 후 -->
        	<div>
	            <b><%=loginAdmin.getMnName() %>님</b>반갑습니다! &nbsp;
	            <a href="<%= contextPath %>/logout.me" style="color: black;">로그아웃</a>&nbsp;&nbsp;&nbsp;
	        </div>
       <%} %>


    </div>
    
    <!-- 네비게이션바 영역 -->
    <div class="menu-area" align="center">

            <!-- 보호소소개 탭 -->
	        <div class="menu">
                <a href="">보호소소개</a>
                    <ul class="menu-tag">
                        <li><a href="<%=contextPath%>/intro.la">다시,사랑받개!소개</a></li>
                    </ul>
            </div>

            <!-- 입소탭 -->
            <div class="menu">
                <a href="<%=contextPath%>/entProceed.ent">입소</a>
                    <ul class="menu-tag">
                        <li><a href="<%=contextPath%>/entExplain.ent">입소안내</a></li>
                        <li><a href="<%=contextPath%>/entProceed.ent">입소절차</a></li>
                        <li><a href="<%=contextPath%>/entMain.ent">입소신청</a></li>
                    </ul>
            </div>

            <!-- 입양탭 -->
	        <div class="menu">
                <a href="<%=contextPath %>/adlist.adt?cpage=1">입양</a>
                    <ul class="menu-tag">
                        <li><a href="<%=contextPath%>/adguide.adt">입양절차안내</a></li>
                        <li><a href="<%=contextPath %>/adlist.adt?cpage=1">입양신청</a></li>
                        <li><a href="<%=contextPath%>/list.ar">입양후기</a></li>
                    </ul>
            </div>

            <!-- 실종/보호/목격탭 -->
	        <div class="menu">
                <a href="">실종/보호/목격</a>
                    <ul class="menu-tag">
                        <li><a href="<%=contextPath%>/list.dsp">신고글 작성하기</a></li>
                    </ul>
            </div>

            <!-- 고객센터탭 -->
	        <div class="menu">
                <a href="">고객센터</a>
                    <ul class="menu-tag">
                        <li><a href="<%=contextPath%>/list.no?cpage=1">공지사항</a></li>
                        <li><a href="<%=contextPath%>/asList.as">1:1문의</a></li>
                        <li><a href="<%=contextPath%>/list.faq">FAQ</a></li>
                    </ul>
            </div>
        </ul>
    </div>

     <!--회원가입 Modal창-->
     <div class="modal fade" id="login_myModal">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
          
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title" style="margin-left: 20px; padding-top: 20px;">다시 사랑받개를!를<br>방문해주셔서 감사합니다.</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <!-- 로그인 관련 영역!!!!!!-->
                <form action="<%=contextPath%>/login.me" method="post">
                    <!-- Modal body -->
                    <div class="login-area">
                        <input type="text" class="userId" name="userId" placeholder="아이디" required>
                        <br><br>
                        <input type="password" class="userPwd" name="userPwd" placeholder="비밀번호" required>
                    </div>
	                    
				<div  class="btn-find" style="margin-top:20px; margin-bottom:15px; margin-left:18px;" data-toggle="modal" data-target="#findId" onclick="find();">
	            <a class="find-btn" href="<%= contextPath%>/findId.me">아이디 찾기</a> | <a class="find-btn" href="<%= contextPath%>/findPwd.me">비밀번호 찾기</a> 
	        	</div>
                    <button class="loginBtn">로그인</button><br>
                </form>
              </div>

                <p style="font-size: 13px; margin-left: 40px;">다시,사랑받개!가 처음이신가요?</p>
                <button class="enrollBtn">회원가입</button>
                <hr>
          </div>
          <script>
	        $(function(){
	            $(".enrollBtn").click(function(){
	                location.href = '<%= contextPath%>/enroll1.me';
	            })
	        })
    		</script>
        </div>
      </div>
    <!--회원가입 Modal창-->

   	<!--login Modal창-->
	<div class="modal fade" id="findId">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="text-align:center;margin-left:115px;">다시,사랑받개 <br></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        	<div class="modal-body">
                <table style="margin:auto; style="margin-bottom:30px;">  
           		<tr>
                <th style="color: rgb(40,112,37); font-size:20px; cursor:pointer;" data-toggle="modal" data-target="#findId" >아이디 찾기<br><br></th>
                <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </th>
                <th style="font-size:20px; margin-bottom:30px; cursor:pointer;" data-toggle="modal" data-target="#findPwd">비밀번호 찾기<br><br></th>
           		</tr>
            </table>
            
             <table style="margin-left:50px;">
            <form action="<%=contextPath%>/findId.me" method="post">
           
                <!-- Modal body -->
                  <tr>
                    <th colspan="2"><input type="text" name="name" placeholder="이름을 입력해주세요." style="width: 280px; height:40px; margin-bottom:10px;" required></th>
                  </tr>
                  <tr>
                      <th colspan="2"><input type="text" name="dob" placeholder="생년월일6자리" style="width: 180px; height: 40px; margin-bottom:10px;"> &nbsp; - 
                        <input type="text" name="" style="width: 10px; height: 30px; margin-bottom:10px;">&nbsp; *&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*</th> 
                  </tr>
                  <tr>
                      <th colspan="2"><input type="phone" placeholder="휴대폰 번호를 입력해주세요."  style="width:280px;height:40px; margin-bottom:10px;" required></th>
                  </tr>
                  <tr>
                      <th colspan="2"><input type="text" value="" name="checknum" placeholder="인증번호 6자리를 입력해주세요." style="width:280px; height: 40px; margin-bottom:10px;" required></th>
                  </tr>
                  
                  <tr>
                  <th>&nbsp;&nbsp;</th>
                  </tr>
		        
		        <tr>
		            <th colspan="2" style="padding-right:40px; margin-top:20px;"><button class="searchbtn" type="button" onclick="showId();" style="width:280px; height:50px;"><b style="font-size:20px;">아이디찾기 <br></b></button></th>
		        </tr>
		             
		        <tr>
		        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		        </tr>
		        </table>
      	  </form> 
 </div> </div> </div> </div>

    		<script>
	        	function validatePwd(){
	        		if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
	        			alert("변경할 비밀번호가 일치하지 않습니다.");
	        			return false;
	        		}else{
	        			alert("정상적으로 변경되었습니다")
	        			location.href="<%=contextPath%>";
	        		}
	        	}
	        </script>
   
   <!--Pwd Modal창-->
	<div class="modal fade" id="findPwd">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      	<% if(errorMsg != null){ %>
		<script>
			alert("<%=errorMsg%>");
		</script>
		<% session.removeAttribute("errorMsg"); %>
		<% } %>
      
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
                    <th colspan="2"><input type="text" name="" placeholder="아이디를 입력해주세요." style="width: 280px; height:40px; margin-bottom:10px;"></th>
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
		            <th colspan="2" style="padding-right:40px; margin-top:20px;"><button onclick="" class="searchbtn" name="pwd" style="width:280px; height:50px;"><a href="<%= contextPath %>/findPwd.me" id="pwre" style="font-size:20px;">PW 재설정 <br></a></button></th>
		        </tr>     
		        <tr>
		        <th>&nbsp;&nbsp;</th>
		        </tr>
		        
        </form> </table>
      </div>
      </div>
    </div>
  </div>
                
         
         
         
         
				     	   	</body>
				     	</html>
				  