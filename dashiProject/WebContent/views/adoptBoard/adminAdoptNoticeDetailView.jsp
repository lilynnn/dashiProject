<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.dashi.adoptBoard.model.vo.AdoptNotice, com.dashi.common.model.vo.Attachment" %>
<%
	AdoptNotice an = (AdoptNotice)request.getAttribute("an");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 관리자메뉴바 (입양공고) 효과 */
	#sel-adopt{
		font-weight: 700;
        color:rgb(252, 186, 3);
	}
    .outer{
        width: 1200px;
        margin: auto;
        height: 1100px;
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
	.title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        margin-left: 20px;
        width: 950px;
    }

    #animalInfo{font-size: 13px; border-collapse: separate; margin: auto;}
	#animalInfo th{text-align: center; line-height: 200%;}
	#animalInfo>tbody th{background: lightgray;}
	#animalInfo input{width: 100%;}
	#text-area{width: 100%; resize: none;}
	table td{
		line-height: 180%;
	}
    #btn-area a{margin: auto;}
</style>
</head>
<body>

    <!-- 지희 수정중  -->
	<!-- 입양공고리스트에서 해당 공고 눌렀을 때 상세보기 페이지 -->
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">

		<div id="menubar" style="margin-right: 20px;" >
			<%@ include file="../admin/adminMenubar.jsp" %>
		</div>
        <div class="content-area">

            <div class="title-area">
                입양공고글 상세보기
            </div>

            <hr style="width: 900px;" style="width: 900px;">
            <br>
            <table align="center" id="animalInfo" style="width: 900px;">
                <thead>
                    <tr>
                        <th style="font-size: 20px;">제목</th>
                        <td colspan="2">
                            가져온 board의 제목 get
                        </td>
                    </tr>
                    <!-- 공백란 -->
                    <tr><td>&nbsp;</td></tr>

                    <!--동물 사진 보여질 table-->
                    <tr>
                        <th width="290">대표사진</th>
                        <th width="290">상세사진1</th>
                        <th width="290">상세사진2</th>
                    </tr>
                    <tr>
                        <td><img src="" width="290" height="250"></td>
                        <td><img src="" width="290" height="250"></td>
                        <td><img src="" width="290" height="250"></td>
                    </tr>

                    <!-- 공백란 -->
                    <tr><td>&nbsp;</td></tr>

                </thead>
                <tbody>
                    <tr>
                        <td colspan="3"><b style="font-size: 18px; padding-left: 5px;">동물 정보</b></td>
                    </tr>
                    <!-- 동물 품종  -->
                    <tr>
                        <th>묘종 / 견종</th>
                        <td colspan="2">가져온 board의 동물정보 get</td>
                    </tr>

                    <!-- 동물 나이 -->
                    <tr>
                        <th>나 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이</th>
                        <td colspan="2">가져온 board의 동물정보 get</td>
                    </tr>

                    <!-- 동물 성별 -->
                    <tr>
                        <th>성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 별</th>
                        <td colspan="2">가져온 board의 동물정보 get</td>
                    </tr>

                    <!-- 접종 여부 -->
                    <tr>
                        <th>접종 &nbsp; 여부</th>
                        <td colspan="2">가져온 board의 동물정보 get</td>
                    </tr>
                    
                    <!-- 중성화 여부 -->
                    <tr>
                        <th>중성화여부</th>
                        <td colspan="2">가져온 board의 동물정보 get</td>
                    </tr>
                    
                    <!-- 특이사항 -->
                    <tr>
                        <th>특이 &nbsp; 사항</th>
                        <td colspan="2">가져온 board의 동물정보 get</td>
                    </tr>

                    <!-- 내용 -->
                    <tr>
                        <th>내 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 용</th>
                        <td colspan="2">
                            <textarea name="" id="text-area" cols="30" rows="10" >
                                가져온 board의 content내용
                            </textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br><br><br>

           <div id="btn-area" align="center">
            <a href="<%=contextPath%>/adnoupdate.ad" class="btn btn-success">수정하기</a>
            <a href="" class="btn btn-secondary">목록보기</a>
           </div>
        </div>

    </div>
    <br><br><br>
    <%@ include file="/views/common/footerbar.jsp" %>
</body>
</html>