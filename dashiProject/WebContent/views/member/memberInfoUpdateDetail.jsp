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
        color: orange;
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
        margin-top: 90px;
        padding: 20px;
        border: 1px solid black;
    }
    .member-up>tr{height: 100px;}
    .member-up thead>tr>th{
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
    .member-up tbody>tr>td{
        padding: 10px;
        padding-right: 30px;
        padding-left: 30px;
    }
    .info{
        text-align: right;
        border-right: 1px solid black;
    }
    .member-up td>input{
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


    <%@ include file="../common/menubar.jsp" %>
    
    <%
    	String userId = loginUser.getMemId();
    	String userName = loginUser.getMemName();
    	String nickname = (loginUser.getNickname() == null) ? "" : loginUser.getNickname();
    	String userPwd = loginUser.getMemPwd();
    	String birth = (loginUser.getBirth() == null) ? "" : loginUser.getBirth();
    	String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone();
    	String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
    	String postNo = (loginUser.getPostNo() == null) ? "" : loginUser.getPostNo();
    	String addressN = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
    	String addressD = (loginUser.getAddressDetail() == null) ? "" : loginUser.getAddressDetail();
    
    %>
    
    
    
    

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
            <form action="<%=contextPath%>/updateInfo.me" method="post">

                <table class="member-up">
                    <thead>
                        <tr>
                            <th class="info">회원정보</th>
                            <td style="width: 600px;" id="message">
                                *표시는 필수 입력사항입니다.
                            </td>
                            <td style="width: 200px; border-bottom: 1px solid black;" align="right">
                                <button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#deleteMember">
                                    	탈퇴하기
                                </button>
                            </td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td class="info">이름</td>
                            <td colspan="2">
                            	<input type="text" name="userName" value="<%=userName%>">
                            </td>
                        </tr>
                        <tr>
                            <td class="info">아이디</td>
                            <td colspan="2">
								<input type="text" name="userId" value="<%=userId%>" readonly>
							</td>
                        </tr>
                        <tr>
                            <td class="info">* 닉네임</td>
                            <td colspan="2" id="nickname">
                                <input type="text" id="confirmnick" name="nickname" placeholder="변경하실 닉네임을 써주세요" value="<%=nickname%>">
                            </td>
                        </tr>
                        <tr>
                            <td class="info">비밀번호</td>
                            <td colspan="2">
                                <input type="password" id="userPwd" name="userPwd" value="<%=userPwd%>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="info">* 생년월일</td>
                            <td colspan="2">
                                <input type="text" name="birth" required value="<%=birth.substring(0,10)%>">
                            </td>
                        </tr>
                        <tr>
                            <td class="info">* 휴대폰번호</td>
                            <td colspan="2">
                                <input type="text" name="phone" placeholder="(-)을 포함해서 작성해주세요" value="<%=phone%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td class="info">이메일</td>
                            <td colspan="2">
                                <input type="text" name="email" value="<%=email%>">
                            </td>
                        </tr>
                        <tr>
                            <td class="info">* 주소</td>
                            <td colspan="2">
                                <input type="text" name="postNo" style="width: 100px;" value="<%=postNo%>" required>
                                <button>우편번호</button>
                                <br><br>
                                <input type="text" name="addressN" style="width: 500px;" value="<%=addressN%>" required>
                                	기본주소
                                <br><br>
                                <input type="text" name="addressD" style="width: 500px;" value="<%=addressD%>" required>
                                	상세주소
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <a href="<%=contextPath%>/mypage.me" class="btn btn-primary" style="background: rgb(143,153,142); border: none;">
                                    	목록으로
                                </a>
                                <button type="submit" id="updatebtn" class="btn btn-primary" style="background: rgb(102,184,94); border: none;" onclick="return validate();">
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
          <form action="<%=contextPath%>/delete.me" method="post">
          	<input type="hidden" name="userId" value="<%=userId%>">
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
                    <input type="radio" name="reason" value="원하는 만큼의 정보가 없어서" required> 원하는 만큼의 정보가 없어서
                </p>
                <p class="delReason">
                    <input type="radio" name="reason" value="자주 이용하지 않아서" required> 자주 이용하지 않아서
                </p>
                <p class="delReason">
                    <input type="radio" name="reason" value="입양신청이 까다로워서" required> 입양신청이 까다로워서
                </p>
                <p class="delReason">
                    <input type="radio" name="reason" value="이미 입양이 끝나서" required> 이미 입양이 끝나서
                </p>
                <p class="delReason">
                    <input type="radio" name="reason" value="이용방법이 어려워서" required> 이용방법이 어려워서
                </p>
                <p id="delcheck">
                <input type="checkbox" required>위의 안내사항을 읽고 이해했습니다.
                </p>
  
                                 비밀번호 재입력 : <input type="password" name="userPwd" required> <br><br><br>
            </div>
            <input type="hidden" name="password" value="<%=loginUser.getMemPwd()%>">
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-sm" style="background:rgb(143,153,142);" onclick="return confirmPwd();">탈퇴하기</button>
                <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal">취소하기</button>
                <p align="right" style="font-size: 10px; color: gray; width: 100%;">
                   		탈퇴시에도 개인정보와 게시글은 3년간 보관됩니다.
                </p>
            </div>
          </form>
       </div>
      </div>
    </div>

    <script>    
		function confirmPwd(){
			
			if($("input[name=userPwd]").val() != $("input[name=password]").val()){
				alert("비밀번호가 일치하지 않습니다!");
				
				return false;
			}
		}

	</script>










	<%@ include file="../common/footerbar.jsp" %>


</body>
</html>