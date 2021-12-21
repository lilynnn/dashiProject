<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.member.model.vo.Member, com.dashi.admin.model.vo.Manager"%>

<% 
	String contextPath = request.getContextPath(); 
	Member loginUser = (Member)session.getAttribute("loginUser");
	Manager loginAdmin = (Manager)session.getAttribute("loginAdmin");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
   <%@ include file="../common/menubar.jsp" %> 
   
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
                    <th colspan="2"><input type="text" name="" placeholder="이름을 입력해주세요." style="width: 280px; height:40px; margin-bottom:10px;" required></th>
                  </tr>
                  <tr>
                      <th colspan="2"><input type="text" name="" placeholder="생년월일6자리" style="width: 180px; height: 40px; margin-bottom:10px;"> &nbsp; - 
                        <input type="text" name="" style="width: 10px; height: 30px; margin-bottom:10px;">&nbsp; *&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;*</th> 
                  </tr>
                  <tr>
                      <th colspan="2"><input type="phone" placeholder="휴대폰 번호를 입력해주세요."  style="width:280px;height:40px; margin-bottom:10px;" required></th>
                  </tr>
                  <tr>
                      <th colspan="2"><input type="text" value="" name="" placeholder="인증번호 6자리를 입력해주세요." style="width:280px; height: 40px; margin-bottom:10px;" required></th>
                  </tr>
                  
                  <tr>
                  <th>&nbsp;&nbsp;</th>
                  </tr>
		        
		        <tr>
		            <th colspan="2" style="padding-right:40px; margin-top:20px;"><button class="searchbtn" name="" style="width:280px; height:50px;"><b style="font-size:20px;">아이디찾기 <br></b></button></th>
		        </tr>
		             
		        <tr>
		        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		        </tr>
		        </table>
      	  </form> 
 </div> </div> </div> </div>
    
                <!-- 아이디찾기 실패 
         
   
    <form action="" method="">
        <fieldset style="margin: 40px; border-radius: 10px; border; background-color: white; width: 300px;">
    <table class="table" style="width: 300px;">
      <tr>
        <th colspan="2"><h3 style="text-align: center;">다시,사랑받개!</h3></th>
     </tr>
      <tr>
          <th style="padding-bottom: 20px;" onclick="" >아이디 찾기</th>
          <th style="padding-bottom: 20px;  color: rgb(40,112,37); " onclick="">비밀번호 찾기</th>
      </tr>
      <tr>
          <th colspan="2" style="font-size: large; padding-bottom: 10px;"> 아이디 찾기 실패 </th>
      </tr>
      <tr><th colspan="2"><input type="text" style="width: 280px; height: 30px; text-align: center;" value="해당아이디를 찾지 못하였습니다."></th></tr>
      <tr>
          <th colspan="2"><button class="searchbtn" name="" value="" style="width:280px; height: 30px;"><b>확인</b></button></th>
      </tr>
    </table>
    </fieldset>
    </form>
    
   -->

</body>
</html>