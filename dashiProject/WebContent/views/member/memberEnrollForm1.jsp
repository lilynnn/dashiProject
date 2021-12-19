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

	#postNo{
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
	           
	           <input type="radio" name="gender" value="M">남자 &nbsp;&nbsp;&nbsp;
	           <input type="radio" name="gender" value="F">여자
	           
				<br><br>
			   <table>
	                 <!-- 이름 입력란-->
	                <tr>
	                    <td>
	                        <input type="text" name = "userName" placeholder="&nbsp;&nbsp;이름을 입력해주세요." required>
	                    </td>
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
								<b>아이디</b><br>
								<input type="text" id="userId_enroll" name="userId" minlength="6" maxlength="20" placeholder="&nbsp;&nbsp;아아디를 입력해주세요" required>
								<br>
								<span id = "idCheck" style="font-size:15px"></span>
							</td>
						</tr>
						
						<script>
							$(function(){
								$("#userId_enroll").on('keyup', idCheck);
							})
	
							function idCheck(){
		
								var $idInput = $("input[id=userId_enroll]");
								
								$.ajax({
									url : 'idCheck.me',
									data:{checkId:$idInput.val()},
									success : function(result){
										if(result == "NNNNN"){
											$('#idCheck').css('color','red')
											$('#idCheck').html("사용할 수 없는 아이디입니다.")
											flag=false;
										}else{
											$('#idCheck').css('color','blue')
											$('#idCheck').html("멋진 아이디군요!!")
											$("#submit_enroll").removeAttr("disabled");
											flag=true;	
										}
										console.log(result);
									}
								})
							}

						</script>
						
						
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
								<input type="text" id="NickName" name = "userNickName" minlength="6" maxlength="20" placeholder="&nbsp;&nbsp;사용하실 닉네임을 입력해주세요" required>
								<br>
								<span id = "NickNameCheck" style="font-size:15px"></span>
							</td>
						</tr>
						<script>
							$(function(){
								$("#NickName").on('keyup', NickNameCheck);
							})
	
							function NickNameCheck(){
		
								var $nickNameInput = $("input[id=NickName]");
								
								$.ajax({
									url : 'nickNameCheck.me',
									data:{checkNickName:$nickNameInput.val()},
									success : function(result){
										if(result == "NNNNN"){
											$('#NickNameCheck').css('color','red')
											$('#NickNameCheck').html("이미 사용하고 있는 닉네임입니다.")
											flag=false;
										}else{
											$('#NickNameCheck').css('color','blue')
											$('#NickNameCheck').html("센스있는 닉네임이군요!!")
											flag=true;	
										}
										console.log(result);
									}
								})
							}

						</script>
						<tr>
							<td>
								5~20자의 글자 <br><br>
							</td>
						</tr>

						<tr>
							<td>
								<input type="number" id="postNo" name = "postNo" minlength="6" maxlength="20" placeholder="&nbsp;&nbsp;우편변호" required>
								<input type="button" id="findAddress" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</td>
						</tr>
						
				 
						<tr>
							<td>
								<input type="text" id="address" name = "address" placeholder="&nbsp;&nbsp;주소를 입력해주세요" required>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="detailAddress" name = "detailAddress" placeholder="&nbsp;&nbsp;상세주소를 입력해주세요" required>
								<br><br>
							</td>
						</tr>
						<script>
							function sample6_execDaumPostcode() {
								new daum.Postcode({
									oncomplete: function(data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var addr = ''; // 주소 변수
										var extraAddr = ''; // 참고항목 변수
						
										//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
											addr = data.roadAddress;
										} else { // 사용자가 지번 주소를 선택했을 경우(J)
											addr = data.jibunAddress;
										}
						
										// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										if(data.userSelectedType === 'R'){
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
												extraAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if(data.buildingName !== '' && data.apartment === 'Y'){
												extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if(extraAddr !== ''){
												extraAddr = ' (' + extraAddr + ')';
											}
										}
						
										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document.getElementById('postNo').value = data.zonecode;
										document.getElementById("address").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document.getElementById("detailAddress").focus();
									}
								}).open();
							}
						</script>
						<tr>
							<td>
								<input type="email" name="email" placeholder="&nbsp;&nbsp;이메일을 입력해주세요" required>
								<br><br>
							</td>
						</tr>
		
					</table>
					</div><br><br>
	        
        	<input type="submit" id="submit_enroll" value="가입하기" class="next" disabled>





			
        	
	    	</form>

    	</div>
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>


