<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dashi.adoptBoard.model.vo.AdoptApply"%>
<%	AdoptApply ap = (AdoptApply)request.getAttribute("ap"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>



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
                        	<a href="<%=contextPath%>/updatePwd.me">
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
                        <span><strong><span style="font-size: 20px;">
                        <%if(loginUser.getGrade() == 1){ %>
                        실버
                        <%}else if(loginUser.getGrade() == 2){ %>
                        골드
                        <%}else if(loginUser.getGrade() == 3){ %>
                        다이아
                        <%}else if(loginUser.getGrade() == 4){ %>
                        블랙리스트
                        <%} %>
                        </span></strong>입니다</span> <br><br>
                        <!--(입양신청내역 없을 시)등급별권한안내-->
                        <p style="color:rgb(121, 118, 118); font-weight: 500;"><span>
                        <%if(loginUser.getGrade() == 1){ %>
                        입양신청 / 입소신청 / 댓글  / 실종,보호,목격글 작성
                        <%}else if(loginUser.getGrade() == 2){ %>
                        <!--(입양승인 시)결제하기버튼-->
							<%if(loginUser.getPayYN().equals("N")){ %>
							<button style="width:150px; height:40px; background:rgb(102,184,94); border:none; border-radius: 5px; font-weight: 900;" id="payBtn">
	                         	   책임비 결제하기
	                        </button> 
	                        console.log(<%=loginUser.getPayYN()%>);
							<%}else { %>
							 <button style="width:150px; height:40px; background:rgb(102,184,94); border:none; border-radius: 5px; font-weight: 900;" id="payBtn" disabled>
	                         	   책임비 결제완료
	                        </button> 
							 <%} %>
						 <%}else if(loginUser.getGrade() == 3){ %>
                        입양신청 / 입소신청 / 댓글  / 실종,보호,목격 / 입양후기 작성 
                        <%} %>
						 </span>이(가) 가능합니다.</p>
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
                
                <div id="adoptst" style="width: 98%; height: 80%; margin-top: 25px;" >
	                    
	                    <!--입양신청 없을 시??????-->
	                    <h3 id="stnone" align="center" style="margin: auto; margin-top: 80px; display: none;">신청 내역이 없습니다.</h3>
	                    <!--입양신청 처리상태 1(승인대기)일 시-->
	                    <h3 id="stdecline" align="center" style="margin: auto; margin-top: 80px; display: none;">입양 신청이 반려되었습니다.</h3>
                        <div id="st1" class="adopt-status">입양신청</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div id="st2" class="adopt-status">신청승인</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div id="st3" class="adopt-status">결제완료</div>
                        <div class="arrow"><img id="arrowimage" src="<%=contextPath%>/resources/images/arrow.png"></div>
                        <div id="st4" class="adopt-status">입양완료</div>


                    <!--입양신청 처리상태 5(반려))일 시-->
                    <!--<h3 align="center" style="margin: auto; margin-top: 80px;">입양 신청이 반려되었습니다.</h3>-->
                </div>
                <% if(loginUser!= null && loginUser.getGrade() == 1 && loginUser.getAdoptYN().equals("Y")){ %>
            		<script>
                    $("#st1").css("backgroundColor","rgb(102,184,94)");
                    </script>
                <%}else if(loginUser!= null && loginUser.getGrade() == 2){ %>
            		<script>
                    $("#st2").css("backgroundColor","rgb(102,184,94)");
                    </script>
                <%}else if(loginUser!= null && loginUser.getGrade() == 3){ %>
            		<script>
                    $("#st3").css("backgroundColor","rgb(102,184,94)");
                    </script>
                <%}else if(loginUser!= null && loginUser.getGrade() == 4){ %>
            		<script>
                    $("#st4").css("backgroundColor","rgb(102,184,94)");
                    </script>
                <%}else if(loginUser != null && loginUser.getAdoptYN().equals("N")){ %>
                	<script>
                	$(".arrow").css("display","none");
                	$(".adopt-status").css("display","none");
                	$("#stnone").css("display","");
                	</script>
                <%} %>   
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
                  		 <a href="<%= contextPath %>/asList.as">
                        <!-- 1:1문의 아이콘 이미지 들어갈 공간 -->
                            <img class="bottomimage" src="<%=contextPath%>/resources/images/answer.png">
                        <br><br>
                        <p align="center">1:1문의내역</p>
                    </div></a>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../common/footerbar.jsp" %>

<script>

    $(function(){
    	$("#payBtn").click(function () {
    		IMP.init('imp45615037');
    		IMP.request_pay({
    		    pg : 'kcp',
    		    pay_method : 'card',
    		    merchant_uid : 'merchant_' + new Date().getTime(),
    		    name : '책임비 결제' , //결제창에서 보여질 이름
    		    amount : 100, //실제 결제되는 가격
    		    buyer_memno : '<%=loginUser.getMemNo()%>',
    		    buyer_email : '<%=loginUser.getEmail()%>',
    		    buyer_name : '<%=loginUser.getMemName()%>',
    		    buyer_phone : '<%=loginUser.getPhone()%>',
    		    buyer_addr : '<%=loginUser.getAddressDetail()%>',
    		    buyer_postcode : '<%=loginUser.getAddress()%>'
    		}, function(rsp) {
    			console.log(rsp);
    		    if ( rsp.success ) {
    		    	var msg = '결제가 완료되었습니다.';
    		        msg += '고유ID : ' + rsp.imp_uid;
    		        msg += '상점 거래ID : ' + rsp.merchant_uid;
    		        msg += '결제 금액 : ' + rsp.paid_amount;
    		        msg += '카드 승인번호 : ' + rsp.apply_num; 
    		    } else {
    		    	 var msg = '결제에 실패하였습니다.';
    		         msg += '에러내용 : ' + rsp.error_msg;
    		    }
    		    alert(msg);
    		    
    		    
    		    $.ajax({
    				url : 'pay.do',
    				data: {memno : <%=loginUser.getMemNo()%>},
    				success : function(){},
					error : function(){}    		    
    		    })

    		    
    		});
    	});
    })

    </script>
    
    


  

</body>
</html>