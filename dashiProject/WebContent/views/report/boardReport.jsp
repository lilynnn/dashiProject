<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 화면에 연결할 때 삭제하기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

    div{border: 1px solid;}
    .outer{
        width: 1200px;
        margin: auto;
    }
    .content-area{width: 850px; margin: auto;}
    .content-area button{border: none; background: white;}
    .content-area button:hover{cursor: pointer;}
</style>
</head>
<body>
    <!-- modal로 띄울지 팝업으로 띄울지 결정하기 -->
    <!-- 지희 작업 중 -->
    <!-- 게시글 신고하기 -->
    <div class="outer">
        <div class="content-area" align="right">
            
            <button onclick="" data-toggle="modal" data-target="#updatePwdModal">신고하기</button>

        </div>
    </div>
    <!-- 비밀번호 변경용 Modal -->
	<div class="modal" id="updatePwdModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">신고하기</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" align="center">
              
              <form action="<%= contextPath %>/updatePwd.me" method="post">
                  
                  <input type="hidden" name="userId" value="<%=userId %>">
                  <table>
                      <tr>
                          <td>현재 비밀번호  </td>
                          <td><input type="password" name="userPwd" required></td>
                      </tr>
                      <tr>
                          <td>변경할 비밀번호  </td>
                          <td><input type="password" name="updatePwd" required></td>
                      </tr>
                      <tr>
                          <td>변경할 비밀번호 확인</td>
                          <td><input type="password" name="checkPwd" required></td>
                      </tr>
                  </table>
                  
                  <br>
                  
                  <button type="submit" class="btn btn-sm btn-secondary" onclick="return validatePwd();">비밀번호 변경</button>
                  
              </form>
              
              <script>
                  function validatePwd(){
                      if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                          alert("변경할 비밀번호가 일치하지 않습니다.");
                          return false;
                      }
                  }
              </script>
            </div>
      
          </div>
        </div>
      </div>
</body>
</html>