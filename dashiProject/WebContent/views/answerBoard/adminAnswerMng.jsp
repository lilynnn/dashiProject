<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 답변 </title>
<style>

  
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
    }

    .image-area{
        width: 700px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid lightgray;
    }

    .content-area{
        width: 1200px;
        margin: auto;
    }
    
 
    .animal-info{
        text-align: center;
        height: 40px;
        font-size: 13px;
        border-collapse: separate;
        border-spacing: 1px;
        margin-bottom: 50px;
    }
    .animal-info th{background: rgb(211, 208, 208); width: 180px;}
    .animal-info td{width: 220px; border-bottom: 1px  solid lightgray;}
    .ansContent{
        width: 780px;
        height: 350px;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="outer">

        <form action="">

           
            <div>
                <h2>1:1 문의 답변</h2>
            </div>
           
            
          
            <div class="content-area" align="center">

               

                <div>
                   <h4> 1:1 문의내용 </h4>
                   <hr width="900">
                </div>
                <br><br>

              	<!-- 1:1 문의내용  -->
                <table class="animal-info" width="800px" style="border-top:solid 1px black; border-bottom:solid 1px black; ">

                    <tr>
                        <th width="500px">작성자</th>
                        <td width="300px">~~~~</td>
                    </tr>
                    <tr>
                        <th>분류 </th>
                        <td>강아지</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td>어쩌구 저쩌구 </td>
                    </tr>
                    <tr>
                        <th>문의 내용 </th>
                        <td height="150px" ></td>
                    </tr>


                </table>
                
				<!-- 답변창  -->
                <h4>답변하기</h4>
                <hr width="900" style="margin: 40px;">
              
                  
           
                 <textarea name="content" class="ansContent" placeholder="내용 입력" cols="35" rows="10" style="resize:none"></textarea>
            
            
                <hr>
    <br>
    <label for="" style="float: left;"><input type="file"></label>
    <br>

    <div>
    <button class="back">이전으로</button> 
    <button class="btn-1">작성하기</button>
    </div>
    

    </form>

	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>
</body>
</html>