<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.answerBoard.model.vo.Answer"%>
<%
	Answer a = (Answer)request.getAttribute("a");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 글작성</title>
<style>
	.outer{
        margin-top: 100px;
        width: 1200px;
        margin: auto;
        align: left;
    }
	
	.table1{
		border-collapse: separate;
        font-size: large;
		border-spacing: 10px 40px;
	}
	
    table th{
        color : rgb(47, 41, 41);
        text-align: left;
    }
    b{color: orange;}


    .container {
     padding: 2em;
    }

    body{
        background-color: #fff;
    }

    button {
	  background: rgb(102,184,94);
	  font-size: 15px;
	  border: none;
	  border-radius: 5px;
	  color: #fff;
	  display: block;
	  font-size: 15px;
	  font-weight: bold;
	  margin: 1em auto;
	  padding: 1em 2em;
	  position: relative;
 	 text-transform: uppercase;
	 }

	.ButtonBox-right{float: right;}



    /*팝업창 스타일 - 커버  */

    .pop-up-wrap{
        width: 400px;
       	background-color: white;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        border: 1px solid green;
        box-shadow: 0 0  10px;
        opacity: 0;
        transition: all 0.5s;
        z-index: 5;
    }

    .pop-up-wrap:target{
        opacity: 1;
    }
    .dim{ 
        position: absolute; 
        left: 0; top: 0; 
        background-color: rgba(0,0,0,0.6);
        width: 100%; height: 100%;
        opacity: 0;
        z-index: -1;
        transition: all 0.5s;
    }
    .pop-up-wrap:target + div {
        opacity: 1;
        z-index: 2;
    }

    /* 팝업창 content , btn 스타일 */ 
    .btn-box{
    margin-left: 190px;
    width:367px}
    
    .btn-clo{
        cursor: pointer;    
        font-size: 15px;
        color:green;
      
        text-decoration: none;
        
            }
            
     
</style>
</head>

<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<div class="outer" align="center">
	
   
	
        <!-- 1:1 문의글 제목 -->
    <h3 align= "left" style="margin:30px;">1:1 문의글 작성</h3>
    <div align="left" style="font-size:13px; margin-left:30px;"> 글 작성 후 <b style="color:green;">수정</b>이 불가능합니다. <br>
    	    삭제만 가능하므로 정확하게 기술해주세요</div>
    <hr>

 	<form action="<%=contextPath %>/insert.as" method="post">
    
    <table class="table1">

        <tr> <!-- 제목 -->
            <th width=220 colspan="2">제목<b>*</b></th>
            <td width=780><input type="text" name="qTitle" style="width: 690px" name="qTitle"  placeholder="제목을 입력해주세요." required></td>
        </tr>
        <tr style="margin-bottom:30px;" > <!-- 문의내용 -->
            <th width=220 colspan="2" rowspan="2">문의내용 <b>*</b> </th>
            <td width=780><textarea name="qContent" placeholder="내용 입력" cols="35" rows="10" style="resize:none; width:690px;" required></textarea></td>
        </tr>
        
        <tr>    <!-- 개인정보 수집 동의 체크박스 -->
            <td style="font-size: 13px;" colspan="2"><input type="checkbox" required>개인정보 수집 및 이용에 동의합니다.<b>*</b>
                <!-- 개인정보 동의 세부내용 link -->
                <br>  &nbsp; &nbsp;<a href="#pop1">내용보기</a></td>
        </tr>
    </table>
    
    
    <!-- 팝업창 만들기 -->
    <div class="dim"></div>
    <div id="pop1" class="pop-up-wrap">
        <div class="txt-box">
        <br><br>
            <b style="color: black;">수집 목적</b> <br><br>
            회원가입 및 서비스 신청 등 <br>
            서비스 이용과 관련된 상담안내 <br><br>
            <b style="color: black;">수집 항목</b><br><br>
            이름 ,전화번호, IP (자동수집) <br> <br>
            <b style="color: black;">보유 및 이용기간</b> <br><br>
            상담 및 해당 업무 종료 후<br>
             1년 이내 파기<br><br>
           
                    <div class="btn-box" > 
        <a href="#a" class="btn-clo"><b>X</b></a>
        <br><br>
                     </div>
                </div>
        </div>
    
    <hr>
    
     <div><button type="submit" class="btn btn-success">제출하기</button>
     	   <a href="<%= contextPath %>/asList.as" class="btn btn-secondary">목록으로</a></div>
     

    </form>
    
   
       
    
    
   
	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>