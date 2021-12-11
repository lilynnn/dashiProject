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

    .brithDay{
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

</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    
    <div class="outer" align="center">
        
        <!--회원가입 문구-->
        <div style="width: 570px; margin-left: 50px;">

            <h2 style="text-align : left">
                다시, 사랑받개!를 이용하기 위해 <br> <b>정보입력 및 약관 동의</b>를 진행해주세요.
            </h2>
            <br>
        </div>

        <div style="width: 570px; margin-left: 100px;">
       		<!--회원가입 폼-->
	        <form action="<%=contextPath %>/enroll2.me" method="" id="enroll-form" style="text-align : left">
	           
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
	                        <input type="text" class="brithDay" name = "brithDay" placeholder="&nbsp;&nbsp;생년월월 6자리" required> - <input type="number" maxlength="1" name="crFirstNum" class="crFirstNum" oninput="checkMaxLength(this)" required> &nbsp;● &nbsp;&nbsp;●&nbsp;&nbsp; ● &nbsp;&nbsp;●&nbsp;&nbsp; ● &nbsp;&nbsp;● 
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
	        <div><input type="checkbox">모든 약관 사항에 전체 동의합니다.</div>
	        <div><input type="checkbox">개인정보 수집 및 이용동의(필수)</div>
	        <div><input type="checkbox">마케팅 정보 수신동의(선택)</div>
	        <div><input type="checkbox">SMS</div>
	        <div><input type="checkbox">이메일</div>
	
	        <br>
	        
        	<input type="submit" value="다음단계" class="next">
        	
	    	</form>

    	</div>
    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>


