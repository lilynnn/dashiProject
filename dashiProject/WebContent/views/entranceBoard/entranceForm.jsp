<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입소신청 글작성</title>
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
  display: inline-block;
  font-size: 15px;
  font-weight: bold;
  margin: 1em auto;
  padding: 1em 2em;
  position: relative;
  text-transform: uppercase;
}
.back{ background-color: rgb( 143,153,142);}

</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
    <form action="" method="">
	<div class="outer" align="center" enctype="multipart/form-data">

        <!-- 입소신청글작성 -->
    <h3 align= "left">입소신청 글작성</h3>
    <hr>

    <table class="table">
        <tr> <!-- 제목 -->
            <th colspan="2" width=220 >제목</th> 
            <td width=780> <input type="text" style="width : 690px;" name="" value="" placeholder="제목을 입력해주세요." required></td>
        </tr>
        <tr> <!-- 내용 -->
            <th width=220 colspan="2" rowspan="2">내용</th>
            <td width=780><input type="text" style="width: 690px; height:700px;" name="" value="">
            <!-- 에디터로 내용에 형식적용하기 -->
            </td>
        </tr>
       
    </table>
   
    <hr>
    <br>
    <label for="" style="float: left;"><input type="file"></label>
    <br>

    <div>
    <button type="button" class="back">이전으로</button> 
    <button class="btn-1">작성하기</button>
    </div>
    

    </form>

	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>