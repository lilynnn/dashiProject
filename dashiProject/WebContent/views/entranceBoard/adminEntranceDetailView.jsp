<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입소신청 상세페이지</title>
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

    .table{
        border-spacing: 20px;
    }

    .table td{
        background-color: lightgrey;
    }

    .content-area{
        width: 1200px;
        margin: auto;
    }
    
    /* 동물정보가 담겨있는 테이블 */
    .animal-info{
        text-align: center;
        height: 40px;
        font-size: 13px;
        border-collapse: separate;
        border-spacing: 1px;
        border: 1px solid gray;
    }
    .animal-info th{background: rgb(211, 208, 208); width: 180px;}
    .animal-info td{width: 220px;}
</style>
</head>
<body>

	<!-- 지희 수정중  -->
	<!-- 사용자가 보게될 입양 공고문의 상세 페이지 -->
	
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="outer">

        <form action="">

           
            <div>
                <h3>입소신청</h3>
            </div>
           <hr>
            
          
            <div class="content-area" align="center">

                <!-- 입양공고 제목, 작성일, 조회수 -->
                <table align="left" style="margin-left: 150px;">
                    <tr>
                        <td colspan="5">
                            <h5><b>[동물품종] [이름]의 입소신청 어쩌구</b></h5>
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

                <div>
                   <h4> 신청자 정보 </h4>
                </div>
                <br><br>

                <!-- 동물 상세정보 -->
                <table class="animal-info" width="800px">
                    <tr>
                        <th>작성자</th>
                        <td>~~~~</td>
                        <th>카테고리</th>
                        <td>강아지</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td>YYYY-MM-DD</td>
                        <th>처리결과</th>
                        <td> 
                            <select name="search-category">
                            <option value="">승인대기</option>
                            <option value="">승인</option>
                            <option value="">반려</option>
                            </select>
                    </td>
                    </tr>
                </table>
                <div class="image-area">
                    작성시 업로드한 동물 사진
                </div>
                <br>
                <!-- 내역 -->
                <div >
               <b>신청 상세 내역</b>
                </div>
               <br><br>

                <table class="table" style="text-align: left;">
                    <tr>
                        <th>1. 신청 보호소명  </th>
                        <th></th>
                        <td> 다시 사랑하개 ! </td>
                    </tr>
                    <tr>
                        <th>2. 품종</th>
                        <th></th>
                        <td> 강아지</td>
                    </tr>
                    <tr>
                        <th>3. 성별 </th>
                        <th></th>
                        <td>여</td>
                    </tr>
                    <tr>
                        <th>4. 나이 </th>
                        <th></th>
                        <td> XX세 </td>
                    </tr>
                    <tr>
                        <th>5. 접종여부 </th>
                        <th></th>
                        <td>Y </td>
                    </tr>
                    <tr>
                        <th>6. 중성화 유무</th>
                        <th></th>
                        <td>Y </td>
                    </tr>
                    <tr>
                        <th>7. 질병 유무 </th>
                        <th></th>
                        <td> 질병 상세 기입 </td>
                    </tr>
                    <tr>
                        <th>8. 특이사항</th>
                        <th></th>
                        <td>특이사항 상세기입 </td>
                    </tr>
                    <tr>
                        <th>9. 입소 희망 일시 </th>
                        <th></th>
                        <td>2021년 12월 31일 19시 </td>
                    </tr>
                    <tr>
                        <th>10. 사진 </th>
                        <th></th>
                        <!-- 사용자가 첨부한 이미지 파일 -->
                        <td> 첨부파일1 , 첨부파일2 </td> 

                    </tr>
                </table>
                
                <br><br><br><br>
                <br>

                </table>


            </div>
        </form>
    </div>

    <%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>