<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
        width: 1100px;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        height:1000px
    }
    #mem-update{
        background: rgb(32, 68, 28);
        color: white;
    }
    /*게시판 이름*/
    #name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    /*회원정보수정폼*/
    #memberInfo{
        width: 1040px;
        margin-top: 40px;
        padding: 20px;
        border: 1px solid black;
    }
    table>tr{height: 100px;}
    thead>tr>th{
        width: 200px;
        height: 40px;
        padding-left: 30px;
        padding-right: 30px;
        border-bottom: 1px solid black;
    }
    #message{
        padding-left: 30px;
        padding-right: 30px;
        border-bottom: 1px solid black;
    }
    tbody>tr>td{
        padding: 10px;
        padding-right: 30px;
        padding-left: 30px;
    }
    .info{
        text-align: right;
        border-right: 1px solid black;
    }
    td>input{
        width: 300px;
    }
    .radio{width: 50px;}
    /*회원탈퇴*/
    .modal-body>p{float: left;}
    .delMessage, .delReason{
        width: 100%;
        font-size: 11px;
        color: gray;
    }
    .delReason{color:black}
    #delcheck{
        width: 100%;
        text-align: center;
    }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

	<!-- 누리 작업 -->

    <%@ include file="../common/menubar.jsp" %>

    <!--전체 div-->
	<div class="outer">

        <!--게시판 안내-->
        <div id="name">
            	회원정보수정
        <hr>
        </div>
        
        <!--회원정보 메뉴바-->
        <div>
            <%@ include file="../common/memberUpdateMenubar.jsp" %>
        </div>
    
        <!--회원정보 폼-->
        <div id="memberInfo">
            <form action="" method="post">

                <table>
                    <thead>
                        <tr>
                            <th class="info">회원정보</th>
                            <td style="width: 730px;" id="message">
                                *표시는 필수 입력사항입니다.
                            </td>
                            <td style="width: 85px; border-bottom: 1px solid black;">
                                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteMember">
                                    탈퇴하기
                                </button>
                            </td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td class="info">이름</td>
                            <td colspan="2">강동원</td>
                        </tr>
                        <tr>
                            <td class="info">아이디</td>
                            <td colspan="2">user01</td>
                        </tr>
                        <tr>
                            <td class="info">* 닉네임</td>
                            <td colspan="2" id="nickname">
                                <input type="text" placeholder="변경하실 닉네임을 써주세요" required value="">
                                특수문자를 제외한 2~10글자 내의 한글,영어,숫자만 가능
                            </td>
                        </tr>
                        <tr>
                            <td class="info">비밀번호</td>
                            <td colspan="2">
                                <input type="password">
                                10~20자내의 영문,숫자,특수기호사용
                            </td>
                        </tr>
                        <tr>
                            <td class="info">비밀번호 확인</td>
                            <td colspan="2">
                                <input type="password" placeholder="설정하신 비밀번호와 똑같이입력하세요">
                            </td>
                        </tr>
                        <tr>
                            <td class="info">* 생년월일</td>
                            <td colspan="2">
                                <input type="date" required value="">
                            </td>
                        </tr>
                        <tr>
                            <td class="info">* 휴대폰번호</td>
                            <td colspan="2">
                                <input type="text" placeholder="(-)하이픈을 포함해서 입력해주세요" value="" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="info">이메일</td>
                            <td colspan="2">
                                <input type="text" value="">
                                <select name="domain">
                                    <option selected value="naver">@naver.com</option>
                                    <option value="google">@google.com</option>
                                    <option value="daum">@daum.net</option>
                                    <option value="none">선택안함</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="info"></td>
                            <td colspan="2">
                                다시,사랑받개!의 이메일을 받아보시겠습니까?<br>
                                <label><input type="radio" class="radio" name="emailYN">네 </label>
                                <label><input type="radio" class="radio" name="emailYN">아니오 </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="info">* 주소</td>
                            <td colspan="2">
                                <input type="text" style="width: 100px;" value="12345" required>
                                <button>우편번호</button>
                                <br><br>
                                <input type="text" style="width: 500px;" value="주소1" required>
                                기본주소
                                <br><br>
                                <input type="text" style="width: 500px;" value="주소2" required>
                                상세주소
                            </td>
                        </tr>
                        <tr>
                            <td class="info"></td>
                            <td colspan="2">
                                다시,사랑받개!의 SMS및 광고 수신에 동의하십니까?<br>
                                <label><input type="radio" class="radio" name="smsYN">네 </label>
                                <label><input type="radio" class="radio" name="smsYN">아니오 </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <button type="button" class="btn btn-primary" style="background: rgb(143,153,142); border: none;">
                                    이전으로
                                </button>
                                <button type="submit" class="btn btn-primary" style="background: rgb(102,184,94); border: none;">
                                    수정하기
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </div>

    <!-- 회원탈퇴용 모달 -->
    <div class="modal" id="deleteMember">
        <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">탈퇴하기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <p style="width: 35px;">정말</p>
                <p style="width: 100px; color:orange; font-weight: 600;">다시,사랑받개</p>
                <p style="width: 35px;">에서</p>
                <p style="width: 35px; color:red; font-weight: 600;">탈퇴</p>
                <p style="width: 250px;">하시겠습니까?</p>
                
                <br><br>
                <p class="delMessage">- 같은 아이디로 재가입이 불가합니다.</p>
                <p class="delMessage">- 현재 진행중인 입소, 입양신청이 모두 취소됩니다.</p>
                <p class="delMessage">- 탈퇴 후 복구가 불가능합니다.</p>
                <br><br><br>
                
                <p class="delReason">
                    탈퇴하시려는 이유를 알려주세요
                </p>
                <p class="delReason">
                    <input type="radio"> 원하는 만큼의 정보가 없어서
                </p>
                <p class="delReason">
                    <input type="radio"> 자주 이용하지 않아서
                </p>
                <p class="delReason">
                    <input type="radio"> 입양신청이 까다로워서
                </p>
                <p class="delReason">
                    <input type="radio"> 이미 입양이 끝나서
                </p>
                <p class="delReason">
                    <input type="radio"> 이용방법이 어려워서
                </p>
                <p id="delcheck">
                <input type="checkbox" required>위의 안내사항을 읽고 이해했습니다.
                </p>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal">취소하기</button>
                <button type="button" class="btn btn-sm" style="background: rgb(143,153,142); border: none;" data-toggle="modal" data-target="#deletePwd">
                    탈퇴하기
                </button>
                <p align="right" style="font-size: 10px; color: gray; width: 100%;">
                    탈퇴시에도 개인정보와 게시글은 3년간 보관됩니다.
                </p>
            </div>
            
        </div>
        </div>
    </div>

     <!-- 회원탈퇴 비밀번호 재입력 Modal -->
    <div class="modal" id="deletePwd">
        <div class="modal-dialog">
        <div class="modal-content">
            
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 재입력</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <form action="" method="post">
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <input type="hidden" name="userId" value="">
                    비밀번호 재입력 : <input type="password" name="userPwd" required> <br><br>
                    <button type="submit" class="btn btn-sm btn-danger">탈퇴하기...</button>
                </div>
            </form>
            
        </div>
        </div>
    </div>










	<%@ include file="../common/footerbar.jsp" %>


</body>
</html>