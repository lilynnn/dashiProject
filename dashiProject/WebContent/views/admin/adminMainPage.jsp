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
    #menubar{
        width: 150px; 
        height: 90%; 
        margin-top: 70px;
        margin-left: 40px;
    }
    #menu{width: 830px; height: 100%; margin-left: 20px;}
    #menubar>div{
        width: 100%;
        height: 30px;
        text-align: right;
        line-height: 30px;
    }
    #member, #apply, #list, #report, #payment, #animal{
        background: lightgray;
    }
    #message>div{float: left; box-sizing: border-box; line-height: 90px;}
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
    
    <!--관리자 메뉴바 부분입니다-->
    <div class="outer">
        <div id="menubar">
        
            <div id="member">회원관리</div>
            <div>전체회원조회</div>
            <div>블랙리스트조회</div>
            
            <div id="apply">신청내역관리</div>
            <div>입양신청</div>
            <div>입소신청</div>
            
            <div id="list">게시글관리</div>
            <div>공지사항</div>
            <div>입양공고</div>
            <div>입양후기</div>
            <div>실종/보호</div>
            <div>1:1문의</div>
            <div>FAQ</div>
            
            <div id="report">신고내역관리</div>
            <div>전체신고내역</div>
            
            <div id="payment">결제내역관리</div>
            <div>전체결제내역</div>
            
            <div id="animal">동물관리</div>
            <div>전체동물조회</div>
        </div>

        <!--관리자메인페이지 안내와 메세지입니다-->
        <div id="menu">
            <div id="message">
                <div style="width: 30%; height: 70px; font-size: 24px; font-weight: 900;">
                    관리자 메인페이지
                </div>
                <div style="text-align: left; width: 70%; height: 70px; font-size: 10px; color: lightslategrey;">
                    관리자님, 오늘도 좋은 하루 보내세요!
                </div>
            </div>

            <!--색깔 박스들, 게시글카운트 가져올 부분입니다-->
            <div id="boxset">
                <hr>
                <div class="box" style="background: #b7dabf;">
                    <div style="line-height: 150px; font-size: 26px;">
                        	카운트숫자
                    </div>
                    <div>입양신청</div>
                </div>
                <div class="box" style="background: #a3ce9b;">
                    <div style="line-height: 150px; font-size: 26px;">
                       	 카운트숫자
                    </div>
                    <div>입소신청</div>
                </div>
                <div class="box" style="background: #7fb198;">
                    <div style="line-height: 150px; font-size: 26px;">
                       	 카운트숫자
                    </div>
                    <div>1:1문의</div>
                </div>
                <div class="box" style="background: #678d72;">
                    <div style="line-height: 150px; font-size: 26px;">
                       	 카운트숫자
                    </div>
                    <div>공지사항</div>
                </div>
            </div>

            <!--각 게시판 링크로 연결될 div랑 table입니다-->
            <div id="adminlist1">
                <div>
                    <div style="font-size: 20px;">회원관리</div>
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
                    <div style="font-size: 20px;">신청내역관리</div>
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
                    <div style="font-size: 20px;">게시글관리</div>
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
                    <div style="font-size: 20px;">신고내역관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a>전체신고내역</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px;">결제내역관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a>전체결제내역</a></td>
                            <td style="width: 150px; text-align: right; color: gray;">날짜칸</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px;">동물관리</div>
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