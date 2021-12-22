<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.dashi.common.model.vo.*, com.dashi.adoptReviewBoard.model.vo.*" %>
    
<%
	AdoptReview ar = (AdoptReview)request.getAttribute("ar");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	AdoptReviewReply arp = (AdoptReviewReply)request.getAttribute("arp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
        height: auto;
    }

    /*상단 입양후기 백그라운드이미지 영역*/
    #fix-image{
        width: 700px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    /*사용자 첨부 이미지 영역*/
    .image-area{
        width: 600px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    /*사용자 작성 글내용 영역*/
    .content-area{
        width: 1200px;
        margin: auto;
    }

    /*버튼 영역*/
    .btn{
        border: none;
        background: rgb(221, 221, 221);
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }
    .btn:hover{
        color:black;
        cursor:pointer;
    }
    .text-area{
        width: 600px;
        margin-bottom: 100px;
        margin-top: 100px;
    }

    /* 신고하기 영역 */
    .report-area{width: 1050px; margin: auto;}
    .report-area button{border: none; background: white;}
    .report-area button:hover{cursor: pointer;}

    /* modal관련 스타일 */
    #reportModal{
        /* margin으로 modal위치 조정 */
        margin: 120px 530px;
        width: 500px; 
        height: 450px; 
        background: white; 
        padding: 5px;
    }
    #reportModal #report-title{
        background: lightgray; 
        padding:10px; 
        margin: 0px 12px ;
    }
    #reportModal #report-area{ padding:10px;}
    #reportModal table{
        margin: 12px; 
        width: 565px; 
        font-size: 13px;
    }
    #reportModal table>label{font-size: 13px;}
    .table>tbody tr:hover{
        background: rgb(233, 230, 230);
        cursor: pointer;
    }

    /*댓글영역 스타일*/

    #comm-outer{
        margin-top: 50px;
        width: 1000px;
        margin: auto;
    }

    /*댓글쓰기 버튼 스타일*/
    .write-btn{
        border: none;
        background: rgb(221, 221, 221);
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }

    /*댓글입력란 스타일*/
    .write-area{
        background: rgb(240, 238, 238);
        border: none;
        resize: none;
        border-radius: 7px;
    }

    /*폰트*/
    .font{
        color: rgb(94, 94, 92); 
        font-size: 14px;
    }
    #comm-outer {
    	border-bottom: solid 1px rgb(175, 173, 173);
    }
    #comm-outer td>button{
        color: rgb(94, 94, 92); 
        font-size: 14px;
        background: none;
        border: none;
        width: 40px;
    }
    button:hover{
        color: black;
        cursor:pointer;    
    }
    /*신고하기 관련 스타일*/
    /* 신고하기 영역 */
    .report-area{width: 1050px; margin: auto;}
    .report-area button{border: none; background: white;}
    .report-area button:hover{cursor: pointer;}

    /* modal관련 스타일 */
    #boardReport,#cmtReport{
        /* margin으로 modal위치 조정 */
        margin: 120px 530px; 
        width: 500px; 
        height: 450px; 
        background: white; 
        padding: 5px;
    }
    #boardReport #report-title,#cmtReport #report-title{
        background: lightgray; 
        padding:10px; 
        margin: 0px 12px ;
    }
    #boardReport #report-area,#cmtReport #report-area{padding:10px;}
    #boardReport table,#cmtReport table{
        margin: 12px; 
        width: 565px; 
        font-size: 13px;
    }
    #boardReport table>label,#cmtReport table>label{font-size: 13px;}

    .table>tbody tr:hover{
        background: rgb(233, 230, 230);
        cursor: pointer;
    }

    #update{
        color:red;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>



    <div class="outer">
	        <div id="fix-image" align="center">
	        <!-- 웃고있는 강쥐 사진 들어갈 영역!!! -->
	            <div style="width:650px">        
	                <h2 style="margin-top: 100px;">입양후기 <hr></h2>
	            </div>
	        </div>
            <br><br><br><br><br><br>
            <!-- 입양후기 상세내용 영역 -->
            <div class="content-area" align="center">
                <!-- 입양후기 제목, 작성일, 조회수 -->
                <table align="left" style="margin-left: 150px;">
                    <tr>
                        <td colspan="5" style="height: 80px;">
                            <h2><b>[<%= ar.getAnType() %>]&nbsp;<%= ar.getArTitle() %></b></h2>
                        </td>
                    </tr>
                    <tr style="color: rgb(87, 87, 85); font-size: 14px;">
                        <td>작성자</td>
                        <td><%= ar.getNickname() %></td>
                        <td>작성일&nbsp;</td>
                        <td><%= ar.getWriteDate() %></td>
                        <td>&nbsp;<!--공백란--></td>
                        <td>조회수</td>
                        <td><%=ar.getViewCount() %></td>
                    </tr>
                </table>
        
                <br><br><br><br>
                <hr width="900" color="gray">
                <br>

                <!-- 사용자 작성 글내용 -->
                <div class="text-area" align="center">
                    <%=ar.getArContent() %>     
                </div>   

                <!-- 사용자 첨부 이미지 -->
                <div class="image-area">
                    <img src="<%=contextPath %>/<%=list.get(0).getPath() + list.get(0).getChangeName() %>">
                </div>
                <br><br>
                <div class="image-area">
                	<% for(int i=1; i<list.size(); i++){ %>
                    <img src="<%=contextPath %>/<%=list.get(i).getPath() + list.get(i).getChangeName() %>">
                    <% } %>
                </div>

        
                <br><br><br><br><br>
                <!-- 신고하기 버튼 영역 -->
                <div class="report-area" align="right">
            
                    <button onclick="" data-toggle="modal" data-target="#reportModal">신고하기</button>
                    <br><br>
                </div>

                <!-- 신고하기 버튼 클릭시 보여질 내용 -->
                <div class="modal" id="reportModal"> 
                    
                    <form action="">
                        <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                        <div id="report-title" align="left">
                            <b>신고하기</b>
                        </div>

                        <div id="report-content" align="center">

                            <!-- 신고게시글 정보 담아 전달하는 table -->
                            <!-- 신고한 사용자 아이디, 신고 당한 게시글 번호, 제목, 작성자 담아서 전달 -->
                            <table>
                                <tr>
                                    <th width="75">제 &nbsp; 목 </th>
                                    <td>신고글제목보여지게</td>
                                </tr>
                                <tr>
                                    <th>작 성 자 </th>
                                    <td>신고글작성자보여지게</td>
                                </tr>
                            </table>
                            <hr>
                        <!-- 신고 타입 및 내용 작성하는 table -->
                            <table>
                                <tr>
                                    <th width="75"> 사유선택 </th>
                                    <td style="font-size:12px; color: gray;">
                                        여러사유에 해당하는 경우 대표적인 사유 1개를 선택해주세요.
                                    </td>
                                </tr>
                                <tr>
                                    <!-- 버튼 아이디 및 라벨 연결 임의 설정 !! 나중에 내용에 맞게 수정하기 -->
                                    <!-- 스타일도 나중에 헤더로 옮기기 -->
                                    <th>&nbsp;</th>
                                    <td>
                                        <input name="radio" id="radio1" value="1" type="radio">
                                        <label for="radio1">욕설 또는 음란성 내용</label> <br>
                                        
                                        <input name="radio" id="radio2" value="2" type="radio">
                                        <label for="radio2">부적절한 홍보게시글</label> <br>
                                        
                                        <input name="radio" id="radio3" value="3" type="radio">
                                        <label for="radio3">사생활 침해 및 불법 촬영물</label> <br>
                                        
                                        <input name="radio" id="radio4" value="4" type="radio">
                                        <label for="radio4">명예훼손 및 저작권침해</label> <br>
                                        
                                        <input name="radio" id="radio5" value="5" type="radio">
                                        <label for="radio5">기타</label><br>
                                        
                                        <textarea name="" cols="60" rows="" id="input-area" disabled></textarea>
                                        
                                    </td>
                                </tr>
                            </table>
                            <div align="center">
                                <button class="btn btn-secondary" style="line-height: 100%;">신고하기</button>
                            </div>


                            <!-- 라디오버튼 value값 수정시 script에 사용된 val 같이 수정하기 -->
                            
                            <script>
                                $(function(){
                                    $("input:radio[name=radio]").click(function(){
                                        // value값이 5인 라디오버튼 체크시에만 text-area 활성화
                                        if($("input[name=radio]:checked").val() == "5"){
                                            $("#input-area").attr("disabled",false);
                                        } else{
                                            $("#input-area").attr("disabled",true);
                                        }

                                    })
                                })
                            </script>
                            
                        </div>
                    </form>
                </div>
        
                <div>
                    <!--댓글영역-->
                    <table width="1025" align="center" class="font" style="border-bottom: solid 1px rgb(175, 173, 173);">
                        <tr id="comm-count">
                            <td style="height: 20px; width: 70px;"><img src="resources/images/comment.png" style="width:20px; height: 20px;"></td>
                            <!--댓글 수 카운트-->  
                            <td>3</td>
                        </tr>
                        <tbody id="comm-outer">
							
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr id="comm-writer">
                                <td colspan=2>작성자</td>
                                <td width=110px;>YYYY-MM-DD</td>
                                <td width=90px;>HH-MM</td>
                                <td width=610px;></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr id="comm-content">
                                <td colspan="5">댓글내용</td>
                                <td><button>수정</button></td>
                                <td><button>삭제</button></td>
                                <td><button id="report-btn" onclick="" data-toggle="modal" data-target="#cmtReport">신고</button></td>
                                <td><button>답글</button></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
							
                        </tbody>

                    </table>
                    <!--대댓글영역-->
                    <!--
                    <table width="1025" align="center" class="font" style="background: rgb(236, 244, 247);border-bottom: solid 1px rgb(175, 173, 173);">
                        <tr>
                            <td style="height: 20px; "></td>
                            <td width= "70px;"></td>
                        </tr>
                        <tr>
                            <td width="70px;" style="text-align: center;">➜</td>
                            <td>작성자</td>
                            <td width="110px;">YYYY-MM-DD</td>
                            <td width="90px;">HH-MM</td>
                            <td width="560px;"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="70px;"></td>
                            <td colspan="5" style="font-weight: 900;">댓글내용</td>
                            <td><button class="font comm-btn">수정</button></td>
                            <td><button class="font comm-btn">삭제</button></td>
                            <td><button class="font comm-btn" id="report-btn" onclick="" data-toggle="modal" data-target="#cmtReport">신고</button></td>
                            <td><button class="font comm-btn">답글</button></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    -->

            
                    <br><br><br>
                        <!--댓글 입력란-->
                        <% if(loginUser != null){  // 로그인인 되어있을 경우 %>
	                        <div align="center">
	                            <textarea id="write-area" cols="130" rows="8" placeholder="댓글을 작성해주세요" style="resize: none;"></textarea>
	                        </div>
	                        <div align="right">
	                        <br>
	                        <!--클릭 시 댓글 작성 실패|성공 alert창-->
	                        <button class="write-btn" onclick="insertReply();">댓글쓰기</button>
	                        </div>
                        <% }else{ // 로그인 되어있지 않을 경우 %>
	                        <div align="center">
	                            <textarea class="write-area" cols="130" rows="8" placeholder="로그인 후 이용가능한 서비스입니다." style="resize: none;" readonly></textarea>
	                        </div>
	                        <div align="right">
	                        <br>
	                        <!--클릭 시 댓글 작성 실패|성공 alert창-->
	                        <button class="write-btn" disabled>댓글쓰기</button>
	                        </div>
                        <% } %>
                        <br><br><br><br><br>
                </div> 
                
                <script>
                    	$(function(){
                    	
                    		selectReplyList();
                    		
                    		setInterval(selectReplyList, 1000);
                    		
                    	});
                    	

                    	
                    	// ajax로 댓글 작성용
                    	function insertReply(){
                    		
                    		$.ajax({
                    			url:"rinsert.ar",
                    			data:{
                    				content:$("#write-area").val(),
                    				arno:'<%=ar.getArlistNo()%>'
                    			},
                    			type:"post",
                    			success:function(result){
                    				if(result > 0){ // 댓글작성 성공 => 갱신된 댓글 리스트 조회
                    					selectReplyList();
                    					$("#write-area").val(""); // testarea 초기화
                    				}
                    			},error:function(){
                    				console.log("댓글작성용ajax 통신실패");
                    			}
                    			
                    		});
                    	}
                    	

                    	
                    	// ajax로 해당 게시글에 달린 댓글 목록 조회용
                    	function selectReplyList(){
                    		$.ajax({
                    			url:"rlist.ar",
                    			data:{arno:'<%=ar.getArlistNo()%>'},
                    			success:function(list){
                    				
                    				let result = "";
                    				for(let i=0; i<list.length; i++){
                    					result += "<tr>"
						                            + "<td>&nbsp;</td>"
						                        + "</tr>"
						                        + "<tr>"
						                           + "<td colspan=2>" + list[i].nickname + "</td>"
						                           + "<td width=200px;>"+ list[i].writeDate + "</td>"
						                           + "<td width=610px;></td>"
						                        + "</tr>"
						                        + "<tr>"
						                           + "<td>&nbsp;</td>"
						                        + "</tr>"
						                        + "<tr>"
						                           + "<td colspan=5>"+ list[i].replyContent +"</td>"
						                           + "<td><button>수정</button></td>"
						                           + "<td><button onclick=\"deleteReply('" + list[i].replyNo + "');\">삭제</button></td>"
						                           + "<td><button>답글</button></td>"
						                        + "</tr>"
						                        + "<tr>"
						                           + "<td>&nbsp;</td>"
						                        + "</tr>";
                    				}

                                    $("#comm-outer").html(result);
                    				
                    			},error:function(){
                    				console.log("댓글목록 조회용 ajax 통신 실패")
                    			}
                    		});
                    	}
                    	
                    	// 댓글 삭제용
                    	function deleteReply(replyNo){
                    		
                    		$.ajax({
                    			url:"rdelete.ar",
                    			type:"post",
                    			data:{
                    				replyNo: replyNo
                    				},
                    			success:function(result){
                    				if(result > 0){ // 댓글삭제 성공 => 갱신된 댓글 리스트 조회
                    					selectReplyList();
                    				}
                    			},error:function(){
                    				console.log("댓글작성용ajax 통신실패");
                    			}
                    			
                    		});
                    	
                    	}
                    	
                    	// 댓글 수정용
                    	


                    	
                    
                    </script>


                <!-- 이전글/다음글 넘기는 영역 -->
                <table class="table" style="width: 1050px; border-collapse: collapse;">
                        
                    <!-- 한 줄 영역으로 클릭 효과 주기 -->
                    <tbody>
                        <tr style="border-top: solid 1px rgb(175, 173, 173); height: 50px; font-weight: 600;">
                            <td width="100">이전글</td>
                            <td width="700">기요미 입양후기</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr style="border-top: solid 1px gray; border-bottom: solid 1px rgb(175, 173, 173); height: 50px; font-weight: 600;">
                            <td width="100">다음글</td>
                            <td width="700">멍멍이 입양후기</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                    </tbody>
                </table>
                <br><br><br>
 
                <!--클릭 시 입양후기 전체조회 페이지로 이동-->
                <a href="<%= contextPath %>/list.ar" class="btn" >목록으로</a>

                <br><br><br><br>
                                <!-- 댓글 신고하기 버튼 클릭시 보여질 내용 -->
                                <div class="modal" id="cmtReport"> 
                                    <form action="">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                                        <div id="report-title">
                                            <b>댓글 신고하기</b>
                                        </div>
                
                                        <div id="report-content">
                
                                            <!-- 신고게시글 정보 담아 전달하는 table -->
                                            <!-- 신고한 사용자 아이디, 신고 당한 게시글 번호, 제목, 작성자 담아서 전달 -->
                                            <table>
                                                <tr>
                                                    <th width="80">댓글내용 </th>
                                                    <td>신고글제목보여지게</td>
                                                </tr>
                                                <tr>
                                                    <th>작 성 자 </th>
                                                    <td>신고글작성자보여지게</td>
                                                </tr>
                                            </table>
                                            <hr>
                                        <!-- 신고 타입 및 내용 작성하는 table -->
                                            <table>
                                                <tr>
                                                    <th width="75"> 사유선택 </th>
                                                    <td style="font-size:12px; color: gray;">
                                                        여러사유에 해당하는 경우 대표적인 사유 1개를 선택해주세요.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <!-- 버튼 아이디 및 라벨 연결 임의 설정 !! 나중에 내용에 맞게 수정하기 -->
                                                    <!-- 스타일도 나중에 헤더로 옮기기 -->
                                                    <th>&nbsp;</th>
                                                    <td>
                                                        <input name="radio" id="radio1" value="1" type="radio">
                                                        <label for="radio1">욕설 또는 음란성 내용</label> <br>
                                                        
                                                        <input name="radio" id="radio2" value="2" type="radio">
                                                        <label for="radio2">부적절한 홍보성 댓글</label> <br>
                                                        
                                                        <input name="radio" id="radio3" value="3" type="radio">
                                                        <label for="radio3">사생활 침해 및 불법 촬영물</label> <br>
                                                        
                                                        <input name="radio" id="radio4" value="4" type="radio">
                                                        <label for="radio4">명예훼손 및 저작권침해</label> <br>
                                                        
                                                        <input name="radio" id="radio5" value="5" type="radio">
                                                        <label for="radio5">기타</label><br>
                                                        
                                                        <textarea name="" cols="60" rows="" id="input-area" disabled></textarea>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                            <div align="center">
                                                <button class="btn btn-secondary">신고하기</button>
                                            </div>
                
                
                                            <!-- 라디오버튼 value값 수정시 script에 사용된 val 같이 수정하기 -->
                                            
                                            <script>
                                                $(function(){
                                                    $("input:radio[name=radio]").click(function(){
                                                        // value값이 5인 라디오버튼 체크시에만 text-area 활성화
                                                        if($("input[name=radio]:checked").val() == "5"){
                                                            $("#input-area").attr("disabled",false);
                                                        } else{
                                                            $("#input-area").attr("disabled",true);
                                                        }
                
                                                    })
                                                })
                                            </script>
                							
                                        </div>
                                    </form>
                                </div>
            </div>
 
        

    </div>


    <%@include file="../common/footerbar.jsp" %>
</body>
</html>