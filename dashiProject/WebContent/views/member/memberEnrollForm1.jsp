<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style> 

    .outer{

        width: 500px;
        height: 600px;
        margin: auto;
        margin-top: 50px;
    }

    table input{
        border: 1px solid rgb(180, 180, 180);
        height: 40px;
        width: 350px;
        background: rgba(231, 231, 231, 0.616);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;

    }

    .cerConfirm, .cerRequest{
        position: relative;
        right: 80px;
        top:1px;
        background: rgba(102, 184, 94, 0.507);
        color: white;
        border: none;
        height: 30px;

    }

    .brithDay{
        width: 180px;
    }

    .crFirstNum{
        width: 40px;
    }

    .next { /*완료*/
        position: relative;
        border: none;
        background: rgb(102,184,94);
        color: white;
        font-size: 18px;
        font-weight: bold;
        height: 40px;
        width: 150px;
        left: 10px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }

</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    
    <div class="outer" align="center">
        
        <!--회원가입 문구-->
        <div style="width: 430px;">

            <h2 style="text-align : left">
                다시, 사랑받개!를 이용하기 위해서 <br> 정보입력 및 약관 동의를 진행해주세요.
            </h2>
            <br>
        
        </div>

        <!--회원가입 폼-->
        <form action="" method="" id="enroll-form">
           
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
                        <input type="text" class="brithDay" name = "brithDay" placeholder="&nbsp;&nbsp;생년월월 6자리" required> - <input type="" name="crFirstNum" class="crFirstNum"> &nbsp;● &nbsp;&nbsp;●&nbsp;&nbsp; ● &nbsp;&nbsp;●&nbsp;&nbsp; ● &nbsp;&nbsp;● 
                    </td>
                </tr>

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
                        <input type="email" name="cerNum" placeholder="&nbsp;&nbsp; 인증번호 6자리를 입력해주세요.">
                        <button type="button" class="cerConfirm" >인증확인</button>
                    </td>
                </tr>
            </table>

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


