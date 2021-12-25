<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginForm{
		margin:auto;
		margin-top:50px;
		width:450px;
		height:1000px;
		padding:20px;
	}
	#loginForm *{float: left;}
	#loginForm p, #loginForm input{
		width: 200px;
		height: 30px;
		margin: 0;
		font-weight: 600;
		font-size: 20px;
	}
	.btn-outline-primary{
		width: 100%;
		height: 60px;
		margin-top: 40px;
		border-radius:3px;
	}
	#loginForm img{
		width:100%;
		height:300px;
		padding-left:55px;
		padding-right:55px;
	}
	#loginForm>form>input{
		width:100%;
		height:50px;
	}
	#loginForm>form>p{
		width:100%;
	}
	#find>button{
		margin-left:65px;
	}
	.modal-body input{
		width:380px;
		height:40px;
	}
</style>
</head>
<body>


	<%@ include file="../common/menubar.jsp" %>
	
	<div id="loginForm">
		<form action="<%=contextPath%>/loginMain.ad" method="post">
			<img src="<%=contextPath%>/resources/images/adminloginlogo.png">
			<p>아이디 </p><br>
			<input type="text" name="mnId" required placeholder="ID"><br>
			<p>비밀번호 </p><br>
			<input type="password" name="mnPwd" required placeholder="PASSWORD"><br>
			<button type="submit" class="btn-outline-primary">sign in</button>
		</form>
		
		<div style="margin-top:20px;" id="find">
			<button class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#find-ad-id">
			아이디찾기
			</button>
			
			
			<button class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#find-ad-pwd">
			비밀번호찾기
			</button>
		</div>
	</div>

	<!-- 관리자 아이디찾기 -->
	<div class="modal" id="find-ad-id">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">관리자 아이디 찾기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <table>
	        	<tr>
	        		<td>이름</td>
	        	</tr>
	        	<tr>
	        		<td>
	        			<input type="text" name="adname" id="adname" required>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td>전화번호</td>
	        	</tr>
	        	<tr>
	        		<td>
	        			<input type="text" name="adphone" id="adphone" placeholder="(-)포함 전화번호 입력" required>
	        		</td>
	        	</tr>
	        	<tr align="right">
	        		<td>
	        			<button type="button" class="btn btn-outline-success" onclick="findAdId();">찾기</button>
	        		</td>
	        	</tr>
	        </table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer" id="findidfooter" style="width:380px;" align="center">
	      </div>
	
	    </div>
	  </div>
	</div>

	<!-- 관리자 비밀번호 찾기 -->
	<div class="modal" id="find-ad-pwd">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">관리자 비밀번호 찾기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        <table>
	        	<tr>
	        		<td>아이디</td>
	        	</tr>
	        	<tr>
	        		<td>
	        			<input type="text" name="adid" required>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td>전화번호</td>
	        	</tr>
	        	<tr>
	        		<td>
	        			<input type="text" name="adPwdphone" placeholder="(-)포함 전화번호 입력" required>
	        		</td>
	        	</tr>
	        	<tr align="right">
	        		<td>
	        			<button type="button" class="btn btn-outline-success" onclick="findAdPwd();">찾기</button>
	        		</td>
	        	</tr>
	        </table>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer" id="findPwdfooter" style="width:380px;" align="center">
	      </div>
	
	    </div>
	  </div>
	</div>

	<script>
		function findAdId(){
			
			$.ajax({
				url:"findid.ad",
				data:{
					adname:$("input[name=adname]").val(),
					adphone:$("input[name=adphone]").val()
				},
				type:"post",
				success:function(result){

					if(result != ""){
						
						let adId = "";
						adId += "<span>회원님의 아이디 : </span>"
						 	  + "<span>" + result + "</span>"
		
				 	    $("#findidfooter").html(adId);
						
						$("input[name=adname]").val("");
						$("input[name=adphone]").val("");
						
					}else{	
						let noresult = "";
						noresult += "<span class='text-danger'>올바른 이름과 비밀번호를 입력해주세요!</span>"
		
				 	    $("#findidfooter").html(noresult);
						$("input[name=adname]").val("");
						$("input[name=adphone]").val("");
					}
					
					
				},error:function(){
					console.log("관리자 아이디찾기용 ajax통신 실패");
				}

			})

		}
		
		function findAdPwd(){
			
			$.ajax({
				url:"findPwd.ad",
				data:{
					adid:$("input[name=adid]").val(),
					adphone:$("input[name=adPwdphone]").val()
				},
				type:"post",
				success:function(result){
					
					console.log(result);
					
					if(result != ""){
						
						let adPwd = "";
						adPwd += "<span>회원님의 비밀번호 : </span>"
						 	  + "<span>" + result + "</span>"
		
				 	    $("#findPwdfooter").html(adPwd);
						$("input[name=adid]").val("");
						$("input[name=adPwdphone]").val("");
						
					}else{
						
						let noresult = "";
						noresult += "<span class='text-danger'>올바른 아이디와 전화번호를 입력해주세요!</span>"
		
				 	    $("#findPwdfooter").html(noresult);
					}
					
					
				},error:function(){
					console.log("관리자 비밀번호찾기용 ajax통신 실패");
				}

			})

		}
	</script>

























</body>
</html>