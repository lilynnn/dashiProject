<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입소안내</title>

<style>
    .outer{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        height: 1300px;
        align:center;
        
    }
    
    .title{
        font-size: 20px;
    }
    .image1{
        width:500px;
        height:400px;
        margin: 50px;
        border: none;
    }

    .image2{
        width:500px;
        height:400px;
        margin : 50px;
        border: none;
    }

    .int-text{
        width="400px"
        height:400px;
        margin-top: 50px;
    }

   
	</style>
	</head>
	
	
	<body>
	
	<!-- 네비게이터 -->
	<%@ include file="../common/menubar.jsp" %>
	
			<!-- 전체 div -->
    		<div class="outer">
			
			<h2 align:left; style="margin-left:50px;">입소소개</h2>
			<hr style="width:900px">
        	<!-- 이미지1 -->
        	<div class="int-1" style="float:left;">
            <img  class="image1" src="<%=contextPath%>/resources/images/testimg2.jpg">
			</div>
			
			<!-- 이미지1 옆 텍스트 영역  -->
             <p class="int-text"  style="float:right; margin-right:50px;">
                    <b class="title">저희 다시 사랑받개는</b>  <br> <br>
			                    매년, 실종 유기되는 아이들의 수는 증가하고 있지만, <br>
			                    구조된 아이들의 절반은 보호소에서 생을 마감합니다.   <br>
			                    국가에서는 이러한 아이들을 보호하기위해 매년 유기동물 지원사업을   <br>
			                    시행하고 있습니다. 하지만 시간이 지날수록 보호가 필요한 아이들의 수는  <br>
			                    각 지자체와 보호소에서도 감당 할 수 없는 수준까지 늘어나고 있습니다.  <br>
			                    설령 구조됐다고 하더라도 아이들은 좁은철창안에서만 생활하며  <br>
			                    가족들이 다시 돌아오길 기다립니다.  <br>
			                    그리고 15일이 지나면 안락사가 진행됩니다.  <br>
			                    <br>
			                    파양과 유기라는 단어는 더이상 우리에게 낯선단어가 아닙니다.  <br>
			                    이러한 현실 속에서 저희가 할 수있는일은 없을지 고민했습니다.  <br>
			                    조그만 변화로 큰 변화를 만드는 나비효과처럼 저희가 작은 날개짓을 만들어  <br>
			                    사람과 동물이 공존할 수 있는 기적을  꿈꾸는 곳입니다.
                </p>
       
			<br clear="both">
	        <!-- 이미지2 -->
	        <div class="int-2" style="float:right;">
            <img class="image2" src="<%=contextPath%>/resources/images/testimg.jpg">
			</div>
			  
               <!-- 이미지2 옆 텍스트 영역  -->
                <p class="int-text" style="margin-left:50px;">
                    <b class="title">다시, 사랑받개! 의 원칙</b> <br>
			                    첫번째, 보호소라고하면 어떤 느낌이 드시나요? <br>
			                    저희는 보호소라는 공간을 따듯함이 떠오르는 공간이 되도록 노력하겠습니다.
			                    사람의 기준이 아닌 아이들의 입장에서 낯선 공간에서도 잘 어울릴 수 있도록 
			                    천천히 조금씩 충분한 시간을 가지고 적응할 수 있는 공간을 만들겠습니다. <br>
			                    <br>
			                    두번째, 아이들이 따듯한 가족들을 만날 수 있도록 최선을 다하겠습니다. <br>
			                    유기동물과 파양동물들에대한 인식이 나아질 수 있도록 노력하겠습니다. <br>
			                    어딘가 아파서, 문제가 있을거라는 막연한 편견을 바꾸겠습니다. <br>
			                    전문 관리사들이 아이들의 건강상태와 정신적인 건강을 체크하고, <br>
			                    어디에서든 안정적으로 적응할 수 있도록<br>
			                     휴식과 놀이시간을 충분히 가질 것 입니다. <br>
			                     <br>
			                    세번째, 입양이후 아이들의 소식에도 귀기울이겠습니다. <br>
			                    단순히 입양만 보냈다고해서 아이들의 삶이 나아졌을까요? <br>
			                    그건 아니라고 생각합니다. 
			                    그 이후의 삶이 더욱 중요하기에, 잘 적응하고 있는지 <br>
			                    다른 문제상황은 없는지 늘 귀기울이는 보호소가 되겠습니다.<br>

                </p>
       </div>

     
       <div>
       <!-- 푸터바 -->
       <%@ include file="../common/footerbar.jsp" %>
       </div>
       
    </div>
</body>
</html>