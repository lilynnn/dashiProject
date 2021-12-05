<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 전체 감싸는 div */
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
    }

    /* 이미지 추가시 스타일 변경하기 */
    .image-area{
        width: 700px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    
    /* 입양공고 이미지 띄우는 div */
    .adt-image{width: 230px; height: 230px; border: 1px solid black;}
    
    /* 동물 종류 표시할 영역 */
    .category{width: 70px; float: left; margin-left: 5px; font-weight: 700;}
    /* 입양공고 제목 영역 */
    .adt-title{box-sizing: border-box; }

    .list-area>table{
        width: 1000px;
        height: 1300px; 
        margin-top: 30px;
    }

    /* 입양공고이미지+제목 클릭시 효과 */
    .list-area>table td:hover{
        cursor: pointer;
    }

</style>
</head>
<body>
	
	<!-- 지희 수정중  -->
	<!-- 사용자 입양공고리스트 조회페이지 -->
	
	<%@ include file="../common/menubar.jsp" %>

    <!-- 나중에 서블릿연결해서 form 추가하기!!  -->

    <div class="outer">

        <div class="image-area" align="center">
            <!-- 백그라운드 이미지 넣기 -->
            <h1 style="padding:120px">입양공고</h1>

        </div>
        
        <form action="">
            <div class="search-area" style="margin-top: 40px; width: 1100px;" align="right">
                <select name="animal-category">
                    <option value="dog">강아지</option>
                    <option value="cat">고양이</option>
                    <option value="etc">기타</option>
                </select>

                <input type="text" placeholder="검색어를 입력하세요.">
                
                <button>검색하기</button>
            </div>


            <div class="list-area" align="center">
                <table>
                    <tr style="height:250px">
                        <td align="center" style="border: 3px solid red;">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-warning" style="margin-left: 5px; width: 55px; font-weight: 700;">[고양이]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-secondary" style="margin-left: 5px; width: 55px; font-weight: 700;">[기타]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                    </tr>
                    <tr style="height:250px">
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-warning" style="margin-left: 5px; width: 55px; font-weight: 700;">[고양이]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-secondary" style="margin-left: 5px; width: 55px; font-weight: 700;">[기타]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                    </tr>
                    <tr style="height:250px">
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-warning" style="margin-left: 5px; width: 55px; font-weight: 700;">[고양이]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-secondary" style="margin-left: 5px; width: 55px; font-weight: 700;">[기타]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                    </tr>
                    <tr style="height:250px">
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-warning" style="margin-left: 5px; width: 55px; font-weight: 700;">[고양이]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-secondary" style="margin-left: 5px; width: 55px; font-weight: 700;">[기타]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                    </tr>
                    <tr style="height:250px">
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-warning" style="margin-left: 5px; width: 55px; font-weight: 700;">[고양이]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-secondary" style="margin-left: 5px; width: 55px; font-weight: 700;">[기타]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                        <td align="center">
                            <div class="adt-image"></div>
                            <span class="badge badge-success" style="margin-left: 5px; width: 55px; font-weight: 700;">[강아지]</span>
                            <span class="adt-title">[품종명][이름]의 가족을 기다려요</span>
                        </td>
                    </tr>
                </table>

            </div>
        </form>
    </div>

	<br><br><br><br><br>
	
    <%@include file="../common/footerbar.jsp" %>

    <script>
        // 나중에 수정하기!!!
        $(function(){
            $(".list-area>table td").click(function(){

                location.href = '<%= contextPath%>/views/adoptBoard/adoptDetailView.jsp';
            
            })
        })
    </script>
	
</body>
</html>