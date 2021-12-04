<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
    }

    #fix-image{
        width: 700px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    .image-area{
        width: 600px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    .content-area{
        width: 1200px;
        margin: auto;
    }
    
    .btn{
        border: none;
        background: rgb(221, 221, 221);
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <div id="fix-image" align="center">
        <!-- 웃고있는 강쥐 사진 들어갈 영역!!! -->
            <div style="width:650px">        
                <h2 style="margin-top: 100px;">입양후기 <hr></h2>
            </div>
        </div>
            <br><br><br><br><br><br>
                    <!-- 입양공고 상세내용 영역 -->
                    <div class="content-area" align="center">

                        <!-- 입양공고 제목, 작성일, 조회수 -->
                        <table align="left" style="margin-left: 150px;">
                            <tr>
                                <td colspan="5">
                                    <h2><b>강아지 "댕댕이" 입양 후기</b></h2>
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
        
                        <br><br>
                        <hr width="900" color="gray">
                        <br>

                        <!-- 관리자가 입력한 내용 출력되는 영역 -->
                        <div class="text-area" align="center" style="width: 600px; height: 500px;">
                            무한한 길지 있는 풍부하게 힘있다. 실현에 못할 밝은 같이, 이상의 운다. 동력은 얼마나 많이 칼이다. <br>
                            소금이라 심장은 원질이 인간은 황금시대의 때문이다. 때까지 이상 끓는 설레는 청춘의 인생을 풀이 아름다우냐? <br>
                            이상의 타오르고 대중을 귀는 밥을 찬미를 사막이다. 품고 같은 대중을 우리 이상은 관현악이며, 커다란 것이다. <br>
                            그들에게 설레는 보이는 얼마나 거친 날카로우나 하였으며, 그들은 것이다. 피어나기 힘차게 살았으며, 안고, <br>
                            가치를 생명을 이것을 대고, 것이다. 
                            청춘의 것이 우리의 무엇을 눈이 그것을 이상이 간에 것이다.       
                        </div>   

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
        
                        <table style="margin: auto;"> 
                            <tr>
                                <td width="900"><!-- 공백란으로 사용 --></td>
                                <td width="100" style="padding-left: 10px;">
                                    <!-- 나중에 이미지 찾아서 넣기-->
                                    신고하기
                                </td>
                            </tr>
                        </table>
        
                        <br>
        
                        <!-- 이전글/다음글 넘기는 영역 -->
                        <table class="table"style="width: 1100px;">
                        
                            <!-- 한 줄 영역으로 클릭 효과 주기 -->
                            <tbody>
                                <tr>
                                    <td width="100">이전글</td>
                                    <td width="700">기요미 입양후기</td>
                                    <td width="150">YYYY-MM-DD</td>
                                    <td width="100">조회수</td>
                                </tr>
                                <tr>
                                    <td width="100">다음글</td>
                                    <td width="700">멍멍이 입양후기</td>
                                    <td width="150">YYYY-MM-DD</td>
                                    <td width="100">조회수</td>
                                </tr>
                                <tr>
                                    <!-- 구분선용 공백란 -->
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        <br><br><br>
 
                        <!--클릭 시 입양후기 전체조회 페이지로 이동-->
                        <button class="btn">목록으로</button>

                        <br><br><br><br>
                    </div>



    </div>





    <%@include file="../common/footerbar.jsp" %>
</body>
</html>