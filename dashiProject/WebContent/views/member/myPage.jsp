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
    #updateimage{
        width:60px;
        height: 60px;
    }
    .bottomimage{
        width: 60px;
        height: 60px;;  
    }

    /*폰트 스타일*/
    p{
        color:rgb(54, 53, 53); 
        font-weight: 900;
        font-size: 14px;
    }

    /*입양신청 현황 스타일*/
    .adopt-status{
        width: 100px;
        height: 100px;
        float: left;
        margin-left: 23px;
        margin-top: 20px;
        text-align: center;
        font-size: large;
        font-weight: 550;
        padding-top: 35px;
        background: lightgray;
        color: rgb(54, 53, 53);
    }
    .arrow{
        width: 50px;
        height: 100px;
        float: left;
        margin-left: 23px;
        margin-top: 20px;
        text-align: center;
        font-size: large;
        font-weight: 550;
        padding-top: 25px;
    }
    #arrowimage{width: 50px; height: 50px;}
   #toparea>div:hover{
        cursor: pointer;
    }
    #bottomarea>div:hover{
        cursor: pointer;
    }

    /*-------------모달창-----------------*/

    #payMent{
          width: 140px;
          height: 45px;
          border: none;
          background-color: rgb(207, 60, 60);
          color: white;
          font-size: 17px;
          font-weight:bolder;
          margin-top: 30px;
          margin-left: 70%;
          border-radius: 4px;
      }
      .pay-area{
        font-size: 18px; 
        text-align: center; 
        background:rgb(212, 212, 212);
        font-weight: bold;
        height: 35px;
        width: 370px;
        margin: auto;
        margin-bottom: 20px;
        
      }
      #cardNum{
        width: 342px;
        height: 36px; 
      } 
      
      #CVCNum, #cardAbleTerm{
        width: 150px; 
        height: 36px; 
      }

</style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>

<div class="outer">
        <!--마이페이지(타이틀)-->
        <div id="title" style="width: 20%; font-size: 26px; font-weight: 900; margin-left: 200px;">
            마이페이지
        </div>
        <br>
        <div class="wrap">
        <hr>
        <!--상단부-->
        <div id="toparea">
            <div id="top_1">
                <div class="box box1">

                    <!--회원정보 수정 영역(클릭 시 이동)-->
                    <div class="txtarea1"  align="center">
                        <!-- 회원정보 수정 아이콘 이미지 들어갈 공간 -->
                        <div>  
                        	<a href="<%=contextPath%>/updateInfo.me">
                            <img id="updateimage" src="<%=contextPath%>/resources/images/pencil.png">
                        	<br><br>
                            <p align="center">회원정보수정</p></a>
                        </div>
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
                        <button style="width:150px; height:40px; background:rgb(102,184,94); border:none; border-radius: 5px; font-weight: 900;" class="btn btn-primary" data-toggle="modal" data-target="#payment">
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
                <p style="margin-top: 15px;">&nbsp;입양신청현황</p>
                </div>
                
                <div style="width: 98%; height: 80%; margin-top: 25px;" >
                    <!--입양신청 없을 시??????-->
                    <!--<h3 align="center" style="margin: auto; margin-top: 80px;">신청 내역이 없습니다.</h3>-->
                    <!--입양신청 처리상태 1(승인대기)일 시-->

                        <div class="adopt-status" style="background: rgb(102,184,94);">입양신청</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">신청승인</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">결제완료</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">입양완료</div>

                    
                    <!--입양신청 처리상태 2(결제대기)일 시-->
                    <!--

                        <div class="adopt-status">입양신청</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status" style="background: rgb(102,184,94);">신청승인</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">결제완료</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">입양완료</div>

                    -->
                    <!--입양신청 처리상태 3(결제완료)일 시-->
                    <!--                    

                        <div class="adopt-status">입양신청</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">신청승인</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status" style="background: rgb(102,184,94);">결제완료</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">입양완료</div>

                    -->
                    <!--입양신청 처리상태 4(입양완료)일 시-->  
                    <!--                  

                        <div class="adopt-status" >입양신청</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">신청승인</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status">결제완료</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div class="adopt-status" style="background: rgb(102,184,94);">입양완료</div>

                    -->
                    <!--입양신청 처리상태 5(반려))일 시-->
                    <!--<h3 align="center" style="margin: auto; margin-top: 80px;">입양 신청이 반려되었습니다.</h3>-->
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
                            <img class="bottomimage" src="<%=contextPath%>/resources/images/heart.png">
                        <br><br>
                        <p align="center">찜 목록확인</p>
                    </div>

                </div>
            </div>
            <!-- 찜목록 클릭시 페이지 이동 스크립트  -->
		    <script>
		        $(function(){
		            $("#bottomarea").click(function(){
		                location.href = '<%= contextPath%>/likepage.me';
		            })
		        })
		    </script>
            
            <div id="bottom2">
                <div class="box box3">

                    <!--글쓴내역 조회 영역(클릭 시 이동)-->
                    <div class="txtarea2"  align="center">
                        <!-- 글쓴내역 아이콘 이미지 들어갈 공간 -->
                        <div>
                        	<a href="<%=contextPath%>/boardList.me">
                            <img class="bottomimage" src="<%=contextPath%>/resources/images/post.png">
	                        <br><br>
                            <p align="center">글쓴내역확인</p></a>
                        </div>
                    </div>

                </div>
            </div>
            <div id="bottom3">
                <div class="box box3">

                    <!--1:1문의 조회 영역(클릭 시 이동)-->
                    <div class="txtarea2"  align="center">
                        <!-- 1:1문의 아이콘 이미지 들어갈 공간 -->
                            <img class="bottomimage" src="<%=contextPath%>/resources/images/answer.png">
                        <br><br>
                        <p align="center">1:1문의내역</p>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/footerbar.jsp" %>


<!-- 결제용 모달-->

<!-- The Modal -->
<div class="modal fade" id="payment">
    <div class="modal-dialog modal-dialog-centered" style="width: 1000px;">
      <div class="modal-content" style="border-radius: 2px;">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title" style="margin-left: 163px; padding: 10px;"><b>결제 정보</b></h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        
        <!-- 입력란 --> <!--AJAX사용해서 클릭시 밑에 보이는게 달라지게 설정-->
        <div class="modal-body">

            <form action=""> <!--만약 Form으로 감싸면 여기서부터 @@@@@@@@@-->
                <!-- 결제수단 고르기 -->

                <div class="pay-area">
                    <p style="padding-top: 7px;">결제수단을 선택해주세요</p>
                </div>  

                    <!-- 결제수단 고르기 -->
                <div style="font-size: 16px; width: 370px; margin:auto; margin-bottom: 20px;">
                    <input type="radio" name="payMethod" value="card" checked="checked" >&nbsp;신용카드 
                                                                                                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="payMethod" value="bank">&nbsp;무통장입금
                </div>


                    <!-- 신용/직불카드번호 입력란 -->
                <div style="width: 370px; margin:auto; margin-bottom: 20px;">
                    <p>신용/직불카드번호</p>
                    <input type="number" id="cardNum" name="cardNum" placeholder="카드 번호 입력(-제외)" required style="padding-top: 0px;">
                </div>


                    <!-- 카드유효기간 입력란--> 
                <div style="width: 370px; margin:auto;">
                    <table>
                        <tr>
                            <td>
                                <p style="height: 9px;">카드 유효기간</p>
                                <input type="text" id="cardAbleTerm" name="cardAbleTerm" placeholder="mm/yy" required>
                            </td>
                            <td>
                                                                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <!-- CVC번호 입력란--> 
                            <td>
                                <p style="height:9px;float: left;" >CVC(카드 뒷면 세자리)</p>
                                <input type="number" id="CVCNum" name="CVCNum" placeholder="CVC" required>
                            </td>
                        </tr>
                    </table> 
                </div>

                <p style="font-size: 14px; text-align: center; margin-top: 28px; margin-bottom: 25px;" >이 결제를 진행함으로써 <b style="color: rgb(34, 125, 211);">개인정보 처리방침</b> 및 <b style="color: rgb(34, 125, 211);">이용약관</b>에 동의합니다.</p>

                <hr>

                <h1 style="text-align: right; font-size: 23px; font-weight: bold;">총 50,000원</h1>
                    
                <input type="submit" id="payMent" value="결제하기">

            </form><!--여기까지 @@@@@@@@@-->

        </div><!-- 여기까지가 모달 바디 영역-->
        

      </div>
    </div>
  </div>

  

</body>
</html>