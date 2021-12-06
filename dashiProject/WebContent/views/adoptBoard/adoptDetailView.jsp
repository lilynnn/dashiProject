<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /* 전체 영역 감싸는 div */
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
        border: 1px solid black;
    }

    .content-area{
        width: 1200px;
        margin: auto;
    }
    
    /* 동물정보가 담겨있는 테이블 */
    .animal-info{
        text-align: center;
        height: 140px;
        font-size: 13px;
        border-collapse: separate;
        border-spacing: 1px;
    }
    .animal-info th{background: rgb(157, 219, 167); width: 180px;}
    .animal-info td{width: 220px;}
</style>
</head>
<body>

	<!-- 지희 수정중  -->
	<!-- 사용자가 보게될 입양 공고문의 상세 페이지 -->
	
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="outer">

        <form action="">

            <div class="image-area" align="center">
                <!-- 백그라운드 이미지 넣기 -->
                <h3 style="padding:120px">입양공고</h3>

            </div>
            <br><br>
            
            <!-- 입양공고 상세내용 영역 -->
            <div class="content-area" align="center">

                <!-- 입양공고 제목, 작성일, 조회수 -->
                <table align="left" style="margin-left: 150px;">
                    <tr>
                        <td colspan="5">
                            <h6><b>[동물품종] [이름]의 가족을 기다려요.</b></h6>
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

                <div class="image-area">
                    관리자가 작성시 업로드한 동물 사진
                </div>
                <br><br>

                <!-- 동물 상세정보 -->
                <table class="animal-info" width="800px">
                    <tr>
                        <th>품종</th>
                        <td>~~~~</td>
                        <th>나이</th>
                        <td>10개월령</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>남</td>
                        <th>접종여부</th>
                        <td>O</td>
                    </tr>
                    <tr>
                        <th>중성화여부</th>
                        <td>O</td>
                        <th>특이사항</th>
                        <td>~~~~~~~</td>
                    </tr>
                </table>
                <div class="image-area">
                    관리자가 작성시 업로드한 동물 사진
                </div>
                <br>
                <!-- 관리자가 입력한 내용 출력되는 영역 -->
                <div class="text-area" align="center" style="width: 600px; height: 200px;">
                    선한 눈매가 매력적인 푸딩이의 새 가족을 찾습니다. <br>
                    푸딩이는 배변훈련이 잘 되어있어요! <br>
                    순하고 사람을 좋아하는 아이입니다. <br>
                    먹성도 좋은편이예요 <br>
                    식탐이 있다고 해서 먹을때 건들면 공격성이 있는 아이들이 있는데 <br>
                    이 친구는 세상 순한 아이입니다. <br>
                    눈치가 엄청나게 빠른 친구예요<br>
                    푸딩이와 가족이 되어주세요♥<br>

                </div>  

                <br><br>
                <!-- 고정으로 가져갈 주의사항 멘트 -->
                <img src="<%= contextPath%>/resources/images/adopt/adoptProcedureGuide.png" style="width: 800px;">
                <br>
                <img src="<%=contextPath%>/resources/images/adopt/adoptnotice.png" width="600">
                <br><br>
                
                <br><br><br><br>

                <table style="margin: auto;"> 
                    <tr>
                        <td width="900"><!-- 공백란으로 사용 --></td>
                        <td width="100" style="padding-left: 30px;">
                            <!-- 나중에 이미지 찾아서 넣기-->
                            찜하기
                        </td>
                        <td width="100" style="padding-left: 10px;">
                            <!-- 나중에 이미지 찾아서 넣기-->
                            공유하기
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
                            <td width="700">[동물품종][이름]의 가족을 기다려요.</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr>
                            <td width="100">다음글</td>
                            <td width="700">[동물품종][이름]의 가족을 기다려요.</td>
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


                <!-- 나중에 경로 수정하기!! -->
                <a href="<%= contextPath%>/views/adoptBoard/adoptApplyView.jsp" class="btn btn-success">입양신청하기</a>
                <a href="<%= contextPath%>/adoptlist.bo" class="btn btn-secondary">목록보기</a>
                <br><br><br><br>

                
            </div>
        </form>
    </div>

    <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>