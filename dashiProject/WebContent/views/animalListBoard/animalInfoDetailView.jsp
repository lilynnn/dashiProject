<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /* 전체 div 스타일 */
    .outer{
        width: 1200px;
        height: 800px;
        margin: auto;
        margin-top: 30px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
	.content-area{
         width: 850px;
         float: left;
         margin-left: 20px;
    }
    /* 제목영역 스타일 */
	.title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        width: 950px;
    }
    /* 동물이미지 영역 스타일 */
    .image-area{
        margin: auto;
        border: 1px solid gray;
        width: 600px;
        height: 400px;

    }
    /* 동물정보 테이블 스타일 */
    .content-area table thead{font-size: 15px;}
    #animalInfo{font-size: 13px; border-collapse: separate; line-height: 200%;}
    #animalInfo th{font-size: 13px; text-align: right; padding-right: 15px;}
    #animalInfo input,textarea{margin: 1px 0px; width: 100%; background: rgb(228, 228, 228); border: none;}

</style>
</head>
<body>

    <!-- 동물정보 조회 및 수정하는 페이지 -->
    <%@ include file="../common/menubar.jsp" %>

    <!-- 전체 영역 감싸는 div -->
    <div class="outer">

        <!-- 관리자 메뉴바 div -->
        <div class="menu">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>

        <form action="">

            <div class="content-area">
                <div class="title-area">
					동물정보 수정하기
				</div>
                <hr style="width: 900px;">
                <br>

                <!-- 동물사진 보여질 div  -->
                <div class="image-area" align="center">
                    보호소에서 등록한 동물 기본이미지 보여질 div
                </div>
                <br>

                <!-- 입소번호, 입소일, 입양여부 보여질 table -->
                <table align="center" style="width: 700px; text-align: center; font-size: 13px;">
                    <thead>
                        <tr>
                           <th width="200">입소번호</th> 
                           <th width="200">입소일</th>
                           <th width="200">입양여부</th>
                           <th width="200">입양날짜</th>
                        </tr>
                        <tr>
                            <td>EN-001</td>
                            <td>2021-11-01</td>
                            <td>Y/N</td>
                            <td> -- / 2021-12-11</td>
                        </tr>
                    </thead>
                </table>
                <br><br><br>
                <!-- 동물 정보 보여질 테이블 -->
                <table id="animalInfo" style="width: 700px;">
                    <tr>
                        <th>동물품종</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>동물이름</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>나이</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>접종유무</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>질병유무</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>특이사항</th>
                        <td>
                            <textarea name="" rows="10" ></textarea>
                        </td>
                    </tr>

                </table>

                <div style=" text-align: center;">
					<br><br>
                    <!--if 입양상태가 N일때 보여질 버튼-->
                    <button class="btn btn-warning">공고등록하기</button>
                    <!--나머지는 기본으로 보여지게-->
                    &nbsp;
                    <button class="btn btn-secondary">목록보기</button>
                    &nbsp;
					<button class="btn btn-success">수정하기</button>
					
				</div>

                <br><br><br><br>
            </div>

        </form>

    </div>
</body>
</html>