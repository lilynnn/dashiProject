<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{border: 1px solid blue;}
	/* 전체 감싸는 div */
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
    .title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        margin-left: 20px;
        width: 950px;
    }

    /* 상태수정버튼 div */
    #statusBtn{
        margin-top: 10px;
        margin-right: 30px;
    }
    
    /* 신청자기본정보, 상세정보 전체 감싸는 div */
    .content-area{
        margin-left: 20px;
        margin-top: 10px;
        width: 950px;
        float: left;
    }

    /* 신청자기본정보테이블 */
    #writerInfo{
        width: 900px;
        text-align: center;
        margin-left: 20px;
        font-size: 13px;
        border-collapse: separate;
    }
    #writerInfo th{background: lightgray; line-height: 200%;}

    #status option{
        font-size: 13px;
        text-align: center;
    }

    .active{background:rgb(40,112,37);}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<!-- 전체 영역 감싸는 div -->
    <div class="outer">
        
        <!-- 관리자 menubar div -->
		<div id="menubar">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>

        <!-- 입양신청서 상세보기 타이틀 영역 -->
        <div class="title-area">
            입양신청서 상세보기
            <hr>
        </div>

        <form action="">

            <!-- 상태수정버튼 영역 -->
            <div id="statusBtn" style="float: right;">
                <button class="btn btn-success">수정</button>
                <button class="btn btn-secondary">삭제</button>
            </div>

            <!-- 신청 기본 정보 table -->
            <div class="content-area">
                <table id="writerInfo" border="1">
                    <tr>
                        <th width=250>작성자</th>
                        <td width=300>testuser01</td>
                        <th width=250>카테고리</th>
                        <td width=300>강아지</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td>2021-11-01</td>
                        <th>승인상태</th>
                        <td>
                            <select name="status" id="status" class="btn btn-sm dropdown-toggle" style="width: 99%;">
                                <option value="1">승인대기</option>
                                <option value="2">결제대기</option>
                                <option value="3">결제완료</option>
                                <option value="4">입양완료</option>
                                <option value="5">반려</option>
                            </select>

                        </td>
                    </tr>
                </table>
                <br>
                <!-- 신청서/서약서 내용 보여지는 div -->
                <div class="btn-group" style="margin-left: 20px;">
                    <button class="btn">신청서</button>
                    <button class="btn">서약서</button>
                </div>

                <!-- 신청서div (기본값 display:none) -->
                <div style="margin-left: 20px;">

                    <table border="1" style="width: 900px; font-size: 14px; margin: 10px 0px;">
                        <tr>
                            <th colspan="" style="text-align: center;">입양공고문 제목</th>
                            <td colspan=""><input style="width: 100%;" value="[동물품종][이름]의 가족을 기다려요."></td>                            </tr>
                        <tr> <!-- 공백란 -->
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2"><b style="font-size: 17px;">신청자 정보</b></td>
                        </tr>
                    </table>
                        
                    <!-- 신청자 상세정보 -->
                    <table border="1" style="text-align: center; width: 900px; font-size: 13px; margin: 10px 0px;">
                        <tr>
                            <th width=200>이름</th>
                            <td width=200>XXX</td>
                            <th width=200>아이디</th>
                            <td width=200>@@@</td>
                        </tr>
                        <tr>
                            <th>나이</th>
                            <td>--</td>
                            <th>성별</th>
                            <td>M or F</td>
                        </tr>
                        <tr>
                            <th>나이</th>
                            <td>--</td>
                            <th>성별</th>
                            <td>M or F</td>
                        </tr>
                    </table>





                    </table>
                </div>

                <!-- 서약서div (기본값 display:none) -->

            </div>
        </form>
        
        <script>
            $(function(){



            })
        </script>
	
	</div>

</body>
</html>