<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style> 

    .outer{
        height: auto;
        margin: auto;
        margin-top: 120px;
        margin-bottom: 150px;
    }

    table input{
        border: 1px solid rgb(180, 180, 180);
        height: 45px;
        width: 460px;
        background: rgba(231, 231, 231, 0.616);
        border-radius: 3px;

    }
    /*인증요청 및 인증확인 버튼*/
    .cerConfirm, .cerRequest{
        position: relative;
        right: 95px;
        top:1px;
        background: rgba(102, 184, 94, 0.507);
        color: white;
        border: none;
        height: 30px;
        border-radius: 3px;

    }

    .birthDay{
        width: 180px;
    }

    .crFirstNum{
        width: 40px;
    }

    .next { /*완료*/
        border: none;
        background: rgb(102,184,94);
        color: white;
        font-size: 18px;
        font-weight: bold;
        height: 50px;
        width: 180px;
        border-radius: 5px;
    }

	#address{
        width: 357px;
    }
    #findAddress{
        width: 100px;
        background: rgb(85, 82, 82);
        color: white;
        font-size: 13px;
        font-weight: bold;
        border-radius: 5px;
    }

    #doubleCheck{
        position: relative;
        right: 95px;
        top:1px;
        background: rgba(102, 184, 94, 0.507);
        color: white;
        border: none;
        height: 30px;
        border-radius: 3px;
    }

</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    
    <div class="outer" align="center">
        
        <!--회원가입 문구-->
        <div style="width: 570px; margin-left: 50px;">

            <h2 style="text-align : left">
                다시, 사랑받개!를 이용하기 위해 <br> <b>이름 및 생년월일</b>을 입력해주세요.
            </h2>
            <br>
        </div>

        <div style="width: 570px; margin-left: 100px;">
       		<!--회원가입 폼-->
	        <form action="<%=contextPath %>/enroll1.me" method="post" id="enroll-form" style="text-align : left">
	           
				<input type="radio" name="gender" value="M" checked>남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" value="F" >여자
	            <table>
	                 <!-- 이름 입력란-->
	                <tr>
	                    <td>
	                        <input type="text" name = "userName" placeholder="&nbsp;&nbsp;이름을 입력해주세요." required>
	                    </td>
	                </tr>
	
	                </tr>
	
	                <!--생년월일 입력란-->
	                <tr>
	                    <td>
	                        <br>
	                        <input type="text" class="birthDay" name = "birthDay" placeholder="&nbsp;&nbsp;생년월월 6자리" required> - <input type="number" maxlength="1" name="crFirstNum" class="crFirstNum" oninput="checkMaxLength(this)" required> &nbsp;● &nbsp;&nbsp;●&nbsp;&nbsp; ● &nbsp;&nbsp;●&nbsp;&nbsp; ● &nbsp;&nbsp;● 
	                    </td>
	                </tr>
	                
	                    <!--input number타입은 maxlength가 적용되지 않아 만든 scrtipt문-->
	                    <script>
	                        function checkMaxLength(object){
	                            if(object.value.length > object.maxLength){
	                                object.value = object.value.slice(0, object.maxLength);
	                            }
	                        }
	                    </script>
	
	                <!--핸드폰 입력란-->
	                <tr>
	                    <td>
	                        <br>
	                        <input type="text" name = "phone" placeholder="&nbsp;&nbsp;휴대폰 번호를 입력해주세요." required>
	                        <button type="button" class="cerRequest">인증요청</button>
	                    </td>
	                </tr>
	
	                <!--인증번호 입력란-->
	                <tr>
	                    <td>
	                        <br>
	                        <input type="text" name="cerNum" placeholder="&nbsp;&nbsp; 인증번호 6자리를 입력해주세요." required>
	                        <button type="button" class="cerConfirm" >인증확인</button>
	                    </td>
	                </tr>
					
	            </table>
	     </div>
	        <br><hr><br>
	
	        <br>

			<div style="width: 600px; margin-left: 50px; margin-bottom: 18px;">

				<h2 style="text-align : left">
					회원님이 사용하실 <br> <b>아이디와 비밀번호, 이메일</b>을 입력하세요.
				</h2>
			
			</div>
	
			<div style="width: 570px; margin-left: 50px;">
				<!--회원가입 폼-->
	
				<!--AJAX 사용하기-->
	
				   
					<table>
						
						<tr>
							<td>
								<input type="text" name = "userId" minlength="6" maxlength="20" placeholder="&nbsp;&nbsp;아아디를 입력해주세요" required>
							</td>
							<td>
							   <button id="doubleCheck">중복확인</button>
							</td>
						</tr>
						<tr>
							<td>
								5~20자의 영문 소문자, 숫자의 특수기호 사용 <br><br>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name = "userPwd" minlength="10" maxlength="20" placeholder="&nbsp;&nbsp;비밀번호를 입력해주세요" required>
							</td>
							
						</tr>
						<tr>
							<td>
								10~20자의 영문소문자, 숫자의 특수기호 사용 <br><br>
							</td>
							
						</tr>
						<tr>
							<td>
								<input type="text" name = "checkPwd" placeholder="&nbsp;&nbsp;비밀번호를 다시 입력해주세요" required>
								<br><br>
							</td>
						</tr>
	
						<tr>
							<td>
								<input type="text" name = "userNickName" minlength="6" maxlength="20" placeholder="&nbsp;&nbsp;사용하실 닉네임을 입력해주세요" required>
							</td>
						</tr>
						<tr>
							<td>
								5~20자의 글자 <br><br>
							</td>
						</tr>

						<tr>
							<td>
								<input type="number" name = "postNo" minlength="6" maxlength="20" placeholder="&nbsp;&nbsp;우편변호" required>
							</td>
						</tr>
						
				 
						<tr>
							<td>
								<input type="text" id="address" name = "address" placeholder="&nbsp;&nbsp;주소를 입력해주세요" required>
								<input type="button" id="findAddress" name = "findAddress" value="우편번호 찾기">
		
							</td>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name = "detailAddress" placeholder="&nbsp;&nbsp;상세주소를 입력해주세요" required>
								<br><br>
							</td>
						</tr>
						<tr>
							<td>
								<input type="email" name="email" placeholder="&nbsp;&nbsp;이메일을 입력해주세요">
								<br><br>
							</td>
						</tr>
		
					</table>
					</div><br><br>
	        
        	<input type="submit" value="다음단계" class="next">





			
        	
	    	</form>

    	</div>
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>


