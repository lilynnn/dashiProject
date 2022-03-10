<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dashi.common.model.vo.Attachment, com.dashi.adoptBoard.model.vo.AdoptApply" %>    
<%
	AdoptApply ap = (AdoptApply)request.getAttribute("apply");
	Attachment at = (Attachment)request.getAttribute("at");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    /* 관리자메뉴바 글자 스타일*/
    #adoptApply{
        font-weight: 700;
        color:rgb(252, 186, 3);
    }
	/* 전체 감싸는 div */
    .outer{
        width: 1200px;
        height: 1000px;
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
    #btn-area{
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
    #app-form table{border-collapse: separate;}
    #app-form th{background: lightgray; line-height: 200%;}

    /* 입양신청 설문지 div */
    #app-form{display: none;}
    /* 서약서 div */
    #con-form{display: none;}
    #con-form table{
    	width:800px;
    }
    #con-form table th{
    	width:20%;
    }
	
</style>
</head>
<body>

	<!-- 지희 수정중  -->
	<!-- 관리자 입양신청서 상세조회 페이지  -->
	
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
		<form action="adpupdate.ad" method="post">
			<!-- 순서대로 : 입양신청서번호, 입양공고번호, 회원번호 -->
			<input type="hidden" id="adpNo" name="adpNo" value="<%=ap.getAalistNo() %>">
			<input type="hidden" id="adtNo" name="adtNo" value="<%=ap.getAnlistNo() %>">
			<input type="hidden" id="memNo" name="memNo" value="<%=ap.getMemNo() %>">
			
	        <!-- 상태수정버튼 영역 -->
	        <%if(loginAdmin != null) {%>
	        <div id="btn-area" style="float: right;">
	            <button id="statusBtn" type="submit" class="btn btn-success">수정하기</button>
	            <a href="adplist.ad?cpage=1" class="btn btn-secondary">목록보기</a>
	        </div>
			<%} %>
	        <!-- 신청 기본 정보 table -->
	        <div class="content-area">
	            <table id="writerInfo">
	                <tr>
	                    <th width=250>작성자</th>
	                    <td width=300><%=ap.getMemId() %></td>
	                    <th width=250>작성인명</th>
	                    <td width=300><%=ap.getMemName() %></td>
	                </tr>
	                <tr>
	                    <th>작성일</th>
	                    <td><%=ap.getApplyDate() %></td>
	                    <th>승인상태</th>
	                    <td>
	                        <select name="status" id="status" class="btn btn-sm dropdown-toggle" style="width: 99%;">
	                           	<option id="opt1" value="1">승인대기</option>
	                            <option id="opt2" value="2">신청승인(결제대기)</option>
	                           	<option id="opt3" value="3">결제완료</option>
	                           	<option id="opt4" value="4">입양완료</option>
	                           	<option id="opt5" value="5">반려</option>               
	                        </select>
							<script>
							$(function(){
								const statusNum = <%=ap.getAdtStatus() %>
								
								switch(statusNum){
									case 1:
										$("#opt1").attr("selected","selected");
									break
									
									case 2:
										$("#opt2").attr("selected","selected");
									break
									
									case 3:
										$("#opt3").attr("selected","selected");
									break
									
									case 4:
										$("#opt4").attr("selected","selected");
									break
									
									case 5:
										$("#opt5").attr("selected","selected");
									break
									
								}
							})
							</script>
	                    </td>
	                </tr>
	            </table>
	            <br>
	  
	
	            <!-- 신청서/서약서 내용 보여지는 div -->
	            <div id="btn1" class="btn btn-secondary" style=" margin-left: 20px;">신청서</div>
	            <div id="btn2" class="btn btn-secondary">서약서</div>
	
	            <!-- 신청서div (기본값 display:none) -->
	            <div id="app-form" style="margin-left: 20px;">
	
	                <table style="width: 900px; font-size: 17px; margin: 10px 0px;">
	                    <tr>
	                        <td>&nbsp;</td>
	                    </tr>
	                    <tr>
	                        <td style="text-align: center; width: 200px;"><b>입양공고문 제목</b></td>
	                        <td colspan="">
	                            <!-- input요소에서 disable 사용하면 값 전달 안됨, but readonly는 값 전달 -->
	                            <input style="width: 99%; font-size: 15px;" value="<%=ap.getAaTitle() %>" readonly>
	                        </td>                            
	                    </tr>
	                    <tr> 
	                        <!-- 공백란 -->
	                        <td>&nbsp;</td>
	                    </tr>
	                        
	                    <tr>
	                        <td colspan="2"><b style="font-size: 17px;">신청자 정보</b></td>
	                    </tr>
	                </table>
	                        
	                <!-- 신청자 상세정보 -->
	                <table style="text-align: center; width: 900px; font-size: 13px; margin: 10px 0px;">
	                    <tr>
	                        <th width=200>이름</th>
	                        <td width=200><%=ap.getAaName() %></td>
	                        <th width=200>나이</th>
	                        <td width=200><%=ap.getAaAge() %></td>
	                    </tr>
	                    <tr>
	                        <th>성별</th>
	                        <td><%=ap.getAaGender() %></td>
	                        <th>결혼여부</th>
	                        <td><%=ap.getMarriageYN() %></td>
	                    </tr>
	                    <tr>
	                        <th>전화번호</th>
	                        <td><%=ap.getAaPhone() %></td>
	                        <th>이메일</th>
	                        <td><%=ap.getAaEmail() %></td>
	                    </tr>
	                    <tr>
	                        <th>직업</th>
	                        <td><%=ap.getAaJob() %></td>
	                        <th>주소</th>
	                        <td style="text-align:left; padding-left:10px"><%=ap.getAaAddress() %></td>
	                    </tr>
	                </table>
	                    
	                <br>
	
	                <table style="width: 900px; line-height: 200%;">
	                    <!-- 기초 조사 설문지 -->
	
	                    <tr>
	                        <td>1. 유기동물 입양을 결심하게 된 계기를 입력해주세요.(상세히 써주세요)</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 100px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getAdoptReason() %>
	                            </div>
	                        </td>
	                    </tr>
	                      
	                    <tr>
	                        <td>2. 반려동물을 키워본 경험이 있으십니까?</td>
	                    </tr>                        
	                    <tr>
	                        <td>
	                            <div style="height: 50px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getParentExp() %>
	                            </div>
	                        </td>
	                    </tr>
	                        
	                    <tr>
	                        <td>3. 현재 반려동물을 키우고 계십니까?</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 30px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getHavePetYN() %>
	                            </div>
	                        </td>
	                    </tr>
	                    <!-- 예 라디오버튼 클릭했을때 보여지게끔하기 -->
	                    <tr>
	                        <td>
	                            <table style="width: 99%; text-align: center;">
	                                <tr>
	                                    <th width=250>종류</th>
	                                    <th width=200>나이</th>
	                                    <th width=150>성별</th>
	                                    <th width=200>중성화여부</th>
	                                </tr>
	                                <tr>
	                                    <td>
		                                    <%if(ap.getPetType() != null) { %>
		                                    <%=ap.getPetType() %>
		                                    <%} else { %>
		                                    --
		                                    <%} %>
	                                    </td>
	                                    <td>
	                                    	<%if(ap.getPetAge() != null) {%>
	                                    	<%=ap.getPetAge() %>
	                                    	<%} else { %>
	                                    	--
	                                    	<%} %>
	                                    </td>
	                                    <td>
	                                    	<%if(ap.getPetGender() != null) {%>
	                                    	<%= ap.getPetGender() %>
	                                    	<%} else { %>
	                                    	-- 
	                                    	<%} %>
	                                    </td>
	                                    <td>
	                                    	<%if(ap.getPetNeutral() != null) {%>
	                                    	<%=ap.getPetNeutral() %>
	                                    	<%} else {%>
	                                    	--
	                                    	<%} %>
	                                    </td>
	                                </tr>
	                            </table>
	                        </td>
	                    </tr>
	        
	                    <tr>
	                        <td>4. 귀하의 가족은 모두 몇 명입니까?</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <table style="width: 99%; text-align: center;">
	                                <tr>
	                                    <th width=250>성인</th>
	                                    <th width=200>아동</th>
	                                    <th width=250>나이</th>
	                                </tr>
	                                <tr>
	                                    <td><%=ap.getaMate() %></td>
	                                    <td><%=ap.getcMate() %></td>
	                                    <td><%=ap.getChildAge() %></td>
	                                </tr>
	                            </table>
	                        </td>
	                    </tr>
	    
	                    <tr>
	                        <td>5. 귀하의 동거인은 입양에 찬성하시나요?</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 30px; border: 1px solid gray; padding-left:5px;">
	                            <%if(ap.getAgreeYPN().equals("Y")) {%>
	                            모두찬성
	                            <%}else if(ap.getAgreeNeiYN().equals("P")) {%>
	                            부분찬성
	                            <%} else {%>
	                            본인제외 모두 반대
	                            <%} %>
	                            </div>
	                        </td>
	                    </tr>
	    
	                    <tr>
	                        <td>6. 1년 이내에 결혼, 출산, 이사 등 환경변화 계획이 있으신가요? </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 100px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getEventMngAni() %>
	                            </div>
	                        </td>
	                    </tr>
	    
	                    <tr>
	                        <td>7. 하루에 몇 시간 이상 집을 비우시나요?</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 30px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getEmptyHour() %>
	                            </div>
	                        </td>
	                    </tr>
	    
	                    <tr>
	                        <td>8. 거주하고 계신 주택 형태에 표시해주세요</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 30px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getHouseType() %>
	                            </div>
	                        </td>
	                    </tr>
	    
	                    <tr>
	                        <td>9. 거주하고 계신 주택은 본인(혹은 가족)의 소유입니까?</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 30px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getHselfYN() %>
	                            </div>
	                        </td>
	                    </tr>
	    
	                    <tr>
	                        <td>10. 입양에 대해 이웃의 동의를 구하셨나요?</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 30px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getAgreeNeiYN() %>
	                            </div>
	                        </td>
	                    </tr>
	    
	                    <tr>
	                        <td>11. 한 달 기준 고정적으로 예상되는 예방접종 및 양육비용을 기입하세요.</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <div style="height: 30px; border: 1px solid gray; padding-left:5px;">
	                            <%=ap.getExpCost() %> &nbsp; 만원
	                            </div>
	                        </td>
	                    </tr>
	    
	                    <tr>
	                        <!-- 공백란 -->
	                        <td>&nbsp;</td>
	                    </tr>
	                </table>
	                    
	            </div>
	
	            <!-- 서약서div (기본값 display:none) -->
	            <div id="con-form" style="margin-left: 20px; height: 300px;">
	                <br><br>
	                <table>
	                    <tr>
	                        <th>첨부파일</th>

	                        <!-- 첨부파일은 다운로드 가능하게 -->
	                        <td>
	                        	<iframe style="width:700px; height:500px;" src="<%=contextPath %>/<%=at.getPath() + at.getChangeName() %>"></iframe>
	                        </td>
	                    </tr>
	                    <tr>
	                    	<td>다운로드</td>
	                    	<td><a download="<%=at.getOriginName() %>" href="<%=contextPath %>/<%=at.getPath() + at.getChangeName() %>"><%=at.getOriginName() %></a></td>
	                    </tr>
	                </table>
	            
	            </div>
	        </div>   
        </form>
        
    	
    </div>
	<%@ include file="../common/footerbar.jsp" %>
    <script>
        $(function(){

            $("#btn1").click(function(){
            
                const $div = $("#app-form"); 
                
                $(this).siblings("div").removeClass("btn-warning");
                $(this).addClass("btn-warning");
          
                if($div.css("display")=="none"){
                    
                    $("#con-form").slideUp();
                    //보여지게끔
                    $div.slideDown();
                } else {
                    // 사라지게끔
                    $div.slideUp();
                }
            })
                
            $("#btn2").click(function(){

                const $div = $("#con-form");

                $(this).siblings("div").removeClass("btn-warning");
                $(this).addClass("btn-warning");

                if($div.css("display")=="none"){
                    $("#app-form").slideUp();
                    $div.slideDown();
                } else {
                    $div.slideUp();
                }
            })
           
            		
        })
    </script>

</body>
</html>