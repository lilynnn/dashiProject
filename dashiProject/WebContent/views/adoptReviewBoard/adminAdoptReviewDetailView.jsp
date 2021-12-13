<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 30px;
        height: 2200px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }

    /*입양후기 글 영역*/
    .content-area{
         width: 850px;
         float: left;
    }
    /*전체 제목 영역*/
    .title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }

    /*사용자 첨부 이미지 영역*/
    .image-area{
        width: 600px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    /*버튼 영역*/
    .btnn{
        border: none;
        background: rgb(102,184,94);
        color: rgb(70, 69, 69);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }
    /*사용자가 작성한 글 영역*/
    .text-area{
        width: 600px;
        margin-bottom: 100px;
        margin-top: 100px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <!-- 전체 영역 감싸는 div -->
    <div class="outer">
        
        <!-- 관리자 메뉴바 영역-->
        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>


             <!-- 입양후기 관리 영역 -->
            <div class="content-area">
                
                <!-- 전체 제목 div -->
                <div class="title-area">   
                    입양후기 관리
                </div>
                
                <hr style="width: 900px;">
                
	            <!-- 사용자가 작성한 입양후기 상세내용 영역 -->
	            <div class="content-area" align="center">
	
	                <!-- 입양후기 제목, 작성일, 조회수 -->
	                <table align="left">
	                    <tr>
	                        <td colspan="5">
	                            <h3><b>강아지 "댕댕이" 입양 후기</b></h3>
	                        </td>
	                    </tr>
	                    <tr style="color: rgb(87, 87, 85); font-size: 14px;">
	                        <td>작성일&nbsp;</td>
	                        <td>YYYY-MM-DD</td>
	                        <td>&nbsp;<!--공백란--></td>
	                        <td>조회수</td>
	                        <td>NN</td>
	                    </tr>
	                </table>
                    <br><br><br><br>
	                <hr width="900">
	                <br>
	
	                <!-- 사용자 작성 글내용 -->
	                <div class="text-area" align="center">
	                    무한한 길지 있는 풍부하게 힘있다. 실현에 못할 밝은 같이, 이상의 운다. 동력은 얼마나 많이 칼이다. <br>
	                    소금이라 심장은 원질이 인간은 황금시대의 때문이다. 때까지 이상 끓는 설레는 청춘의 인생을 풀이 아름다우냐? <br>
	                    이상의 타오르고 대중을 귀는 밥을 찬미를 사막이다. 품고 같은 대중을 우리 이상은 관현악이며, 커다란 것이다. <br>
	                    그들에게 설레는 보이는 얼마나 거친 날카로우나 하였으며, 그들은 것이다. 피어나기 힘차게 살았으며, 안고, <br>
	                    가치를 생명을 이것을 대고, 것이다. 
	                    청춘의 것이 우리의 무엇을 눈이 그것을 이상이 간에 것이다.     
                        무한한 길지 있는 풍부하게 힘있다. 실현에 못할 밝은 같이, 이상의 운다. 동력은 얼마나 많이 칼이다. <br>
	                    소금이라 심장은 원질이 인간은 황금시대의 때문이다. 때까지 이상 끓는 설레는 청춘의 인생을 풀이 아름다우냐? <br>
	                    이상의 타오르고 대중을 귀는 밥을 찬미를 사막이다. 품고 같은 대중을 우리 이상은 관현악이며, 커다란 것이다. <br>
	                    그들에게 설레는 보이는 얼마나 거친 날카로우나 하였으며, 그들은 것이다. 피어나기 힘차게 살았으며, 안고, <br>
	                    가치를 생명을 이것을 대고, 것이다. 
	                    청춘의 것이
  
	                </div>   
	
	                <!-- 사용자 첨부 이미지 -->
	                <div class="image-area">
	                    강쥐
	                </div>
	                <br><br>
	                <div class="image-area">
	                    강쥐
	                </div>
	                <br><br>
	                <div class="image-area">
	                    강쥐
	                </div>
	        
	                <br><br>
	                <br><br><br><br>

	                <!--클릭 시 삭제 확인 alert창 발생-->
	                <button class="btnn" style="margin-bottom: 100px;">삭제하기</button>
	            </div>
            </div>

    </div>
</body>
</html>