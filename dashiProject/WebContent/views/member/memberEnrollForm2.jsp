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

    input{
        border: 1px solid rgb(180, 180, 180);
        height: 40px;
        width: 350px;
        background: rgba(231, 231, 231, 0.616);
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;

    }

    .signUp{
        background: rgb(102,184,94);
        color: white;
        font-size: 18px;
        font-weight: bold;
        width: 150px;
    }
    #address{
        width: 250px;
    }
    #findAddress{
        width: 100px;
        background: rgb(85, 82, 82);
        color: white;
        font-size: 13px;
        font-weight: bold;

    }
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    
    <div class="outer" align="center">
        
        <!--회원가입 문구-->
        <div style="width: 430px;">

            <h2 style="text-align : left">
                회원님이 사용하실 <br> 아이디와 비밀번호, 이메일을 입력하세요.
            </h2>
        
        </div>

        <!--회원가입 폼-->
        <form action="" method="" id="enroll-form">
           
            <table>
                
                <tr>
                    <td>
                        <input type="text" name = "userId" minlength="6" maxlength="12" placeholder="&nbsp;&nbsp;아아디를 입력해주세요" required>
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
                        <input type="text" name = "userPwd" placeholder="&nbsp;&nbsp;비밀번호를 입력해주세요" required>
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
                        <input type="email" name="userEmail" placeholder="&nbsp;&nbsp;이메일을 입력해주세요">
                        <br><br>
                    </td>
                </tr>

            </table>
        </form>
         
        <input type="submit" value="가입완료" class="signUp">

    </div>
    

    
</body>
</html>