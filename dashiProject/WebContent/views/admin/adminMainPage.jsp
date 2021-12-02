<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1100px;
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    #menu{width: 830px; height: 100%; margin-left: 20px;}
    #message>div{float: left; box-sizing: border-box;}
    #boxset>div{float: left;}
    .box{
        width: 200px;
        height: 220px;
        margin-top: 10px;
        margin-left: 5px;
        margin-bottom: 10px;
    }
    .box>div{
        width: 100%;
        height: 50%;
        text-align: center;
        font-weight: 900;
    }
    #adminlist1>div, #adminlist2>div{
        float: left;
        box-sizing: border-box;
        width: 250px;
        height: 200px;
        margin-left: 20px;
        margin-top: 20px;
    }
    a{text-decoration: none; color: black;}
</style>
</head>
<body>
    
    <%@ include file="adminMenubar.jsp" %>
    
    <!--전체를 감싸는 큰 div-->
    <div class="outer">

        <!--관리자메인페이지 안내와 메세지입니다-->
        <div id="menu">
        	<hr>
            <div id="message">
                <div style="width: 25%; height: 60px; font-size: 24px; font-weight: 900; line-height:50px">
                    	관리자 메인페이지
                </div>
                <div style="text-align: left; width: 75%; height: 60px; font-size: 15px; color: lightslategrey; line-height:55px">
                    	관리자님, 오늘도 좋은 하루 보내세요!
                </div>
            </div>
				

            <!--색깔 박스들, 게시글카운트 가져올 부분입니다-->
            <div id="boxset">

                <div class="box" style="background: #cce9d3;">
                    <div style="line-height: 150px; font-size: 26px;">
                        	카운트숫자
                    </div>
                    <div>입양신청</div>
                </div>
                <div class="box" style="background: #abd1a4;">
                    <div style="line-height: 150px; font-size: 26px;">
                       	 카운트숫자
                    </div>
                    <div>입소신청</div>
                </div>
                <div class="box" style="background: #91c5ab;">
                    <div style="line-height: 150px; font-size: 26px;">
                       	 카운트숫자
                    </div>
                    <div>1:1문의</div>
                </div>
                <div class="box" style="background: #74947d;">
                    <div style="line-height: 150px; font-size: 26px;">
                       	 카운트숫자
                    </div>
                    <div>공지사항</div>
                </div>
            </div>

            <!--각 게시판 링크로 연결될 div랑 table입니다-->
            <div id="adminlist1">
                <div>
                    <div style="font-size: 20px; font-weight:550;">회원관리</div>
                    <hr>
                    <div>
                        <table>
                            <tr>
                                <td style="width: 150px;"><a>전체회원조회</a></td>
                                <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                            </tr>
                            <tr>
                                <td style="width: 150px;"><a>블랙리스트조회</a></td>
                                <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">신청내역관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a>입양신청</a></td>
                                <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a>입소신청</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">게시글관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a>공지사항</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a>입양공고</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a>입양후기</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a>실종/보호/목격</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a>1:1문의</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a>FAQ</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <div id="adminlist2">
                <div>
                    <div style="font-size: 20px; font-weight:550;">신고내역관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a>전체신고내역</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">결제내역관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a>전체결제내역</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">동물관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a>전체동물조회</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>


</body>
</html>