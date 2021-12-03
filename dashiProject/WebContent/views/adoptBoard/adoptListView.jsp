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
    }

    /* 이미지 추가시 스타일 변경하기 */
    .image-area{
        width: 700px;
        height: 300px;
        margin: auto;
        margin-top: 10px;
        border: 1px solid black;
    }

    /* .list-area table>td{width: 250px;} */
    
    /* 입양공고 이미지 띄우는 div */
    .adt-image{width: 90%; height: 90%; border: 1px solid black;}
    
    /* 동물 종류 표시할 영역 */
    .category{width: 50px; float: left; margin-left: 20px;}
    /* 입양공고 제목 영역 */
    .adt-title{box-sizing: border-box; margin-left: 5px;}

</style>
</head>
<body>

	<%@ include file="/views/common/menubar.jsp" %>

    <!-- 나중에 서블릿연결해서 form 추가하기!!  -->

    <div class="outer">

        <div class="image-area" align="center">
            
            <h1 style="padding:180px">입양공고</h1>

        </div>
        
        <form action=""></form>
            <div class="search-area" style="margin-top: 40px; width: 1100px;" align="right">
            
                <select name="animal-category">
                    <option value="dog">강아지</option>
                    <option value="cat">고양이</option>
                    <option value="etc">기타</option>
                </select>

                <input type="text" placeholder="검색어를 입력하세요.">
                
                <button>검색하기</button>
            </div>
        </form>

        <div class="list-area" align="center">
            <table align="center" style="width: 1000px; height: 1100px; margin-top: 30px;">
                <tr>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[강아지]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[고양이]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[강아지]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[고양이]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[강아지]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[고양이]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[강아지]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[고양이]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[강아지]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[고양이]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                    <td align="center">
                        <div class="adt-image"></div>
                        <span class="category">[기타]</span>
                        <span class="adt-title">[품종명][이름] 입양하기</span>
                    </td>
                </tr>
            </table>

        </div>

        <br><br><br><br><br>
    </div>
	
</body>
</html>