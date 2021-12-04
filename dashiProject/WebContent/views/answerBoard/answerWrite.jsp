<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	table{
        font-size: large;
		border-spacing: 40px;
	}
    table th{
        color : rgb(47, 41, 41);
        text-align: left;
    }
    b{color: orange;}


    .container {
     padding: 2em;
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



</style>
</head>

<body>
	<%@ include file="/common/menubar.jsp" %>
    <form action="" method="">
	<div class="outer" align="center" enctype="multipart/form-data">

        <!-- 1:1 문의글 제목 -->
    <h3 align= "left">1:1 문의글 작성</h3>
    <hr>

    <table class="table">
        <tr> <!-- 이름 -->
            <th width=220 colspan="2">성함 <b>*</b></th> 
            <td width=780><input type="text" style="width: 690px" name="" value="" placeholder="성함을 입력해주세요." required></td>
        </tr>
        <tr> <!-- 연락처 -->
            <th width=220 colspan="2">연락처 <b>*</b></th>
            <td width=780><input type="text" style="width: 690px" name="" value="" placeholder="연락처를 입력해주세요." required></td>
        </tr>
        <tr> <!-- 문의내용 -->
            <th width=220 colspan="2" rowspan="2">문의내용 <b>*</b> </th>
            <td width=780><input type="text" style="width: 690px; height:350px;" name="" value="" placeholder="내용을 입력해주세요" style="height:200px";></td>
        </tr>
        <tr>    <!-- 개인정보 수집 동의 체크박스 -->
            <td style="font-size: 13px;" colspan="2"><input type="checkbox">개인정보 수집 및 이용에 동의합니다.<b>*</b>
                <!-- 개인정보 동의 세부내용 link -->
                <br>  &nbsp; &nbsp;<a href="" style="font-size: 3px; color: rgb(47, 41, 41);">내용보기</a></td>

        </tr>
    </table>
   
    <hr>
    
    <div><button class="btn-1 ButtonBox-right">제출하기</button></div>
    

    </form>

	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>