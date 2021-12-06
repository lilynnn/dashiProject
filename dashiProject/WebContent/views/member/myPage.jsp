<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box;}     
    .outer{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        padding-bottom: 80px;
    }
    .wrap{
        width:800px;
        height:900px;
        margin:auto;
    }
    .wrap>div{width:100%;}
    #title{height:5%}
    #toparea{height:40%;}
    #midarea{height:30%;}
    #bottomarea{height:25%}
    
    /*상단(회원정보수정, 회원등급 조회)영역 스타일*/
    #toparea>div{height:100%; float:left;}
    #top_1{width:50%;}
    #top_2{width:50%;}

    /*하단(찜목록, 글쓴내역, 1:1문의)영역 스타일*/
    #bottomarea>div{height:100%; float:left; display: flex;}
    #bottom1{width:33%;}
    #bottom2{width:34%;}
    #bottom3{width:33%;}

    /*박스 스타일*/
    .box{border:1px solid rgb(145, 144, 144); display: flex;}
    .box1{
        width: 90%;
        height: 70%;
        margin: auto;
        margin-top: 90px;
    }
    .box2{
        border:1px solid rgb(145, 144, 144);
        width: 95%;
        height: 90%;
        margin: auto; 
        margin-top: 1.5%;
    }
    .box2>div{margin:auto;}  
    .box3{
        width: 85%;
        height: 90%;
        margin: auto;  
    }

    /*탭 이름 영역 스타일*/
    .txtarea1{
        width: 40%;
        height: 40%;
        margin:auto;
    }
    .txtarea2{
        width: 40%;
        height: 60%;
        margin:auto;
    }
    #grade{
        width: 70%;
        height: 60%;
        margin:auto;  
    }

    /*각 탭 아이콘 스타일 (아이콘 이미지 넣은 뒤 border 지우기)*/
    #updateimage{
        border: 1px solid black;
        width:70px;
        height: 70px;;
    }
    .bottomimage{
        border: 1px solid black;
        width: 60px;
        height: 60px;;  
    }

    /*폰트 스타일*/
    p{
        color:rgb(54, 53, 53); 
        font-weight: 900;
        font-size: 12px;
    }

    /*입양신청 현황 스타일*/
    .adopt-status{
        width: 100px;
        height: 100px;
        float: left;
        margin: 23px;
        text-align: center;
        font-size: large;
        font-weight: 550;
        padding-top: 35px;
        background: lightgray;
        color: rgb(54, 53, 53);
    }

</style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>

<div class="outer">
    <div class="wrap">
        <!--마이페이지(타이틀)-->
        <div id="title" style="width: 20%; font-size: 26px; font-weight: 900;">
            마이페이지
        </div>
        <hr>
        <!--상단부-->
        <div id="toparea">
            <div id="top_1">
                <div class="box box1">

                    <!--회원정보 수정 영역(클릭 시 이동)-->
                    <div class="txtarea1"  align="center">
                        <!-- 회원정보 수정 아이콘 이미지 들어갈 공간 -->
                        <div id="updateimage">  
                        </div>
                        <p align="center">회원정보수정</p>
                    </div>
                    
                </div>
            </div>
            <div id="top_2">
                <div class="box box1">

                    <!--회원등급 조회 영역(클릭 시 이동)-->
                    <div id="grade" style="text-align: center;">
                        <p>현재 회원님의 등급은</p> <br>
                        <!--회원등급조회-->
                        <span><strong><span style="font-size: 20px;">XXX</span></strong>입니다</span> <br><br>
                        <!--(입양신청내역 없을 시)등급별권한안내-->
                        <p style="color:rgb(121, 118, 118); font-weight: 500;"><span>xxx,xxx</span>이(가) 가능합니다.</p>
                        <!--(입양승인 시)결제하기버튼--> 
                        <button style="width:150px; height:30px; background:rgb(102,184,94); border:none; border-radius: 5px; font-weight: 900;">
                            책임비 결제하기
                        </button> 
                    </div>

                </div>
            </div>
        </div>
        <!--중앙부-->
        <div id="midarea">
            <div class="box2">

                <!--입양신청현황 영역(클릭 시 이동)-->
                <div style="width: 98%; height: 15%; background: lightgray; margin-top: 7px;    display: flex;
                align-items: center;">
                <h4>입양신청현황</h4>
                </div>
                
                <div style="width: 98%; height: 80%; margin-top: 25px;">
                    <!--입양신청 없을 시??????-->
                    <!--<h3 align="center" style="margin: auto; margin-top: 80px;">신청 내역이 없습니다.</h3>-->
                    <!--입양신청 처리상태 1(승인대기)일 시-->
                    <div style="height: 60%; ">
                        <div class="adopt-status" style="background: rgb(102,184,94);">입양신청</div>
                        <div class="adopt-status">입양승인</div>
                        <div class="adopt-status">결제하기</div>
                        <div class="adopt-status">결제완료</div>
                        <div class="adopt-status">입양완료</div>
                    </div>
                    <!--입양신청 처리상태 2(결제대기)일 시-->
                    <!--입양신청 처리상태 3(결제완료)일 시-->
                    <!--입양신청 처리상태 4(입양완료)일 시-->
                    <!--입양신청 처리상태 5(반려))일 시-->
                </div>

            </div>
        </div>    
        <!--하단부-->
        <div id="bottomarea">
            <div id="bottom1">
                <div class="box box3">

                    <!--찜목록 조회 영역(클릭 시 이동)-->
                    <div class="txtarea2"  align="center">
                        <!-- 찜목록 아이콘 이미지 들어갈 공간 -->
                        <div class="bottomimage">
                        </div>
                        <p align="center">찜 목록확인</p>
                    </div>

                </div>
            </div>
            <div id="bottom2">
                <div class="box box3">

                    <!--글쓴내역 조회 영역(클릭 시 이동)-->
                    <div class="txtarea2"  align="center">
                        <!-- 글쓴내역 아이콘 이미지 들어갈 공간 -->
                        <div class="bottomimage">
                        </div>
                        <p align="center">글쓴내역확인</p>
                    </div>

                </div>
            </div>
            <div id="bottom3">
                <div class="box box3">

                    <!--1:1문의 조회 영역(클릭 시 이동)-->
                    <div class="txtarea2"  align="center">
                        <!-- 1:1문의 아이콘 이미지 들어갈 공간 -->
                        <div class="bottomimage">
                        </div>
                        <p align="center">1:1문의내역</p>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/footerbar.jsp" %>

</body>
</html>