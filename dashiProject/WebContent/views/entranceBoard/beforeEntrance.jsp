<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입소신청 전 안내사항</title>
<style>
	.outer{
        margin-top: 100px;
        width: 1200px;
        margin: auto;
        align: left;
    }
	
    .agreeForm{
        margin-top: 50px;
        margin-bottom: 50px;
        border: 1px solid grey;
        border-radius: 10px;
        width: 1000px;
        height: 1100px;
    }

    .container {
     padding: 2em;
    }


    .btn-1{
	  background: rgb(102,184,94);
	  font-size: 15px;
	  border: none;
	  border-radius: 5px;
	  color: #fff;
	  display: block;
	  font-size: 15px;
	  font-weight: bold;
	  margin: 1em auto;
	  padding: 0.5em 1em;
	  position: relative;
 	 text-transform: uppercase;
	 }

	.ButtonBox{
        margin-top: 50px;
        margin-bottom: 50px;
        float: center;
    }

    .adate{
        width: 13px;
        margin-top: 50px;
        margin-bottom: 50px;}

        .inputtext{
            margin-top: 30px;
            width: 400px;
            height: 50px;
        }
</style>
</head>

<body>
	<%@ include file="/views/common/menubar.jsp" %>
    <form action="" method="">

        <!-- 전체 div -->
	<div class="outer" align="center" enctype="multipart/form-data">

       
    <h3 align= "center" style="margin-top:50px;">입소신청 전 안내사항</h3>
    <hr>

        <div>
            <!-- 입소 전 안내사항 -->
            <div class="agreeForm">
        <pre>     
        
    <b>무료 입소 가능 조건</b>


    1. 소형견 기준 (품종견&묘)

    2. 8세 이하  

    3. 질병 및 장애,공격성 등의 결격사유 없는 경우 

    4. 별도 관리자의 심사기준에 따라 무료입소와 불가가 결정될 수 있습니다. 

    5. 부가 서비스에 따른 비용은 별도로 발생할 수 있습니다.



    '다시,사랑하개!'는 개인 사정 등으로 주인의 곁을 떠나게 된 아이들을 보호하고 새로운 가족을 만날 때까지 보호하며

    안전한 입양까지 함께하는 사설보호소입니다.

    투명하고 올바른 보호소로 아이들에게 행복을 선물해주기 위해 노력하겠습니다. 

    또한 입양 후 정보도 알 수 있습니다.

    보호소로 방문해주시는 방법과 저희 기사님이 자택으로 방문해드리는 방법 등이 있습니다.

    글을 남겨주시면 담당자가 최대한 신속히 연락을 드리도록 하겠습니다.

    </pre>  
   
    <div style="color: rgb(15, 177, 15);"> <b>동의 후 게시글 작성 페이지로 넘어갑니다. </b></div>
    
    <!-- 확인 날짜 입력 -->
    <div>20<input class="adate" name="" value="" type="text">년<input class="adate" name="" value="" type="text">월<input class="adate" name="" value="" type="text">일</div>
    

        <!-- 체크박스 : 안내사항 동의 -->
    <div><input type="checkbox">위의 내용에 동의하시면 아래의 문구를 똑같이 작성해주세요. <br>

        안내사항을 모두 숙지하였으며, 위의 내용에 동의합니다.</div>
    
        <!-- 텍스트입력창 : 사용자 동의 입력창  -->
    <input class="inputtext" type="text" placeholder="  안내사항을 모두 숙지하였으며, 위의 내용에 동의합니다." required>

                <!-- 작성완료 제출버튼-->
                <div>
                    <button class="btn-1 ButtonBox">작성완료</button>
                </div>
         
        
         
            </div>
        </div>
    <hr>
    
    
    

    </form>

	</div>

	<br><br><br><br>
	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>