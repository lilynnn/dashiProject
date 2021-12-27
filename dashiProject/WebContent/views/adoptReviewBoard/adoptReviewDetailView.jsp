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
    }

    /*사용자 첨부 이미지 영역*/
    .image-area{
        width: 600px;
        height: auto;
        margin: auto;
        margin-top: 30px;
    }

    /*사용자 작성 글내용 영역*/
    .content-area{
        width: 1200px;
        margin: auto;
        height: auto;
    }

    /*버튼 영역*/
    .btnn{
        border: none;
        background: rgb(221, 221, 221);
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }
    .btnn:hover{
        color:black;
        cursor:pointer;
    }
    .text-area{
        width: 600px;
        margin-bottom: 100px;
        margin-top: 100px;
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
    #cmtReport input{
    	border:none;
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
        height: 470px; 
        background: white; 
        padding: 5px;
    }
    #boardReport #report-title,#cmtReport #report-title{
        background: lightgray; 
        padding:10px; 
        margin: 0px 12px ;
    }
    #boardReport #report-area,#cmtReport #report-area{ padding:10px;}
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
    table{
    	border-collapse: collapse;
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
                <!-- 입양후기 제목, 작성일 -->
                <table align="left" style="margin-left: 150px;">
                    <tr>
                        <td colspan="5" style="height: 80px;">
                            <h2><b>
			                <% if(ar.getAnType().equals("cat")){ %>
			                [고양이]
			                <%}else if(ar.getAnType().equals("dog")){ %>
			                [강아지]
			                <%}else if(ar.getAnType().equals("etc")){ %>
			                [기타동물]
			                <%} %>
                            &nbsp;<%= ar.getArTitle() %></b></h2>
                        </td>
                    </tr>
                    <tr style="color: rgb(87, 87, 85); font-size: 14px;">
                        <td style="color:black;">작성자&nbsp;</td>
                        <td><%= ar.getNickname() %>&nbsp;&nbsp;</td>
                        <td style="color:black;">작성일&nbsp;</td>
                        <td><%= ar.getWriteDate() %></td>
                        <td>&nbsp;<!--공백란--></td>
                    </tr>
                </table>

                <div align="center">
                    <!--로그인 되어있고 작성자와 일치할 경우-->
                    <%if(loginUser != null && loginUser.getNickname().equals(ar.getNickname())) { %>
                        <button onclick="location.href='<%=contextPath %>/updateform.ar?arno=<%=ar.getArlistNo()%>'" class="btn btn-sm btn-warning">수정하기</button>
                        <button id="ardelete" class="btn btn-sm btn-danger">삭제하기</button>
                    <% } %>
                </div>
                <script>
                $("#ardelete").click(function(){
                	var result = confirm('게시글을 삭제하시겠습니까?');
                	if(result){
                		location.href='<%=contextPath %>/delete.ar?arno=<%=ar.getArlistNo()%>';
                	}else{
                		return false;
                	}
                })
                </script>
        
                <br><br><br><br>
                <hr width="900" color="gray">
                <br>

                <!-- 사용자 작성 글내용 -->
                <div class="text-area" align="center">
                    <%=ar.getArContent() %>     
                </div>   

                <!-- 사용자 첨부 이미지 -->
                <div class="image-area">
                    <img  class="image-area" src="<%=contextPath %>/<%=list.get(0).getPath() + list.get(0).getChangeName() %>">
                </div>
                <br><br>
                <div class="image-area">
                	<% for(int i=1; i<list.size(); i++){ %>
                    <img class="image-area" src="<%=contextPath %>/<%=list.get(i).getPath() + list.get(i).getChangeName() %>">
                    <% } %>
                </div>
            </div>
        
                <br><br><br><br><br>
                <!-- 신고하기 버튼 영역 -->
                <div class="report-area" align="right">
            
                    <button data-toggle="modal" data-target="#boardReport" class="btnn" style="border: none;
                    background: rgb(221, 221, 221);
                    color: rgb(80, 79, 79);
                    font-size: 14px;
                    font-weight: bold;
                    height: 33px;
                    width: 100px;
                    border-radius: 9px;">신고하기</button>

                    <br><br>
                </div>

				<% if(loginUser != null){  // 로그인인 되어있을 경우 %>
                <!-- 신고하기 버튼 클릭시 보여질 내용 -->
                <div class="modal" id="boardReport"> 
                    
                    <form action="<%=contextPath%>/report.bo" method="post">
                    
                    <input type="hidden" name="boardNo" value="<%=ar.getArlistNo() %>">
                    <input type="hidden" name="writerNo" value="<%=ar.getMemNo() %>">
                    <input type="hidden" name="boardContent" value="<%=ar.getArContent() %>">
                    <input type="hidden" name="loginUser" value="<%=loginUser.getMemNo() %>">
                    
                        <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                        <div id="report-title" align="left">
                            <b>신고하기</b>
                        </div>
						
                        <div align="center">
                            <!-- 신고게시글 정보 담아 전달하는 table -->
                            <!-- 신고한 사용자 아이디, 신고 당한 게시글 번호, 제목, 작성자 담아서 전달 -->
                            <table style="float:left; margin-left:10px;">
                            	<tr>
                                    <th width="75" style="font-size:13px;">제 &nbsp; 목 </th>
                                    <td style="font-size:13px;"><%=ar.getArTitle() %></td>
                                </tr>
                                <tr>
                                    <th style="font-size:13px;">작 성 자 </th>
                                    <td style="font-size:13px;"><%=ar.getMemId() %></td>
                                </tr>
                            </table>
                            <br><br>
                            <hr>
                        <!-- 신고 타입 및 내용 작성하는 table -->
                            <table style="float:left; margin-top:0px; margin-left:10px; font-size:15px;">
                                <tr>
                                    <th style="width:75px;"> 사유선택 </th>
                                </tr>
                                <tr><td style="font-size:12px; color: gray;">
                                        여러사유에 해당하는 경우 대표적인 사유 1개를 선택해주세요.
                                    </td></tr>
                                <tr>
                                    <!-- 버튼 아이디 및 라벨 연결 임의 설정 !! 나중에 내용에 맞게 수정하기 -->
                                    <!-- 스타일도 나중에 헤더로 옮기기 -->
                                    <td  style="padding-left:10px;">
                                        <input name="radio" id="radio1" value="1" type="radio">
                                        <label for="radio1" style="font-size:13px;">욕설 또는 음란성 내용</label> <br>
                                        
                                        <input name="radio" id="radio2" value="2" type="radio">
                                        <label for="radio2" style="font-size:13px;">부적절한 홍보게시글</label> <br>
                                        
                                        <input name="radio" id="radio3" value="3" type="radio">
                                        <label for="radio3" style="font-size:13px;">사생활 침해 및 불법 촬영물</label> <br>
                                        
                                        <input name="radio" id="radio4" value="4" type="radio">
                                        <label for="radio4" style="font-size:13px;">명예훼손 및 저작권침해</label> <br>
                                        
                                        <input name="radio" id="radio5" value="5" type="radio">
                                        <label for="radio5" style="font-size:13px;">기타</label><br>
                                        
                                        <textarea name="ectContent" cols="50" id="input-area" disabled></textarea>
                                    </td>
                                </tr>
                            </table>
                            <br>
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
                <% } %>
        
                <div align="center" style="height: auto;">
                    <!--댓글영역-->
                    <table width="1025" align="center" class="font" style="border-bottom: solid 1px rgb(175, 173, 173);">
                        <tr id="comm-count">
                            <td style="height: 20px; width: 70px;"><img src="resources/images/comment.png" style="width:20px; height: 20px;"></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tbody id="comm-outer">
							
                       
							
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
                        <% }else { // 로그인 되어있지 않을 경우 %>
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
                            <div style="width: 100%;" align="center">
                                <!--클릭 시 입양후기 전체조회 페이지로 이동-->
                                <button onclick="location.href='<%= contextPath %>/list.ar?cpage=1'" class="btnn" style="background:rgb(102,184,94);">목록으로</button>
                            </div>
                                
                
                <script>
                    	$(function(){
                    	
                    		selectReplyList();
                    		
                    		//setInterval(selectReplyList, 1000);
                    		
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
                    					result += // 댓글영역
                    							"<tr>"
						                            + "<td>&nbsp;</td>"
						                        + "</tr>"
						                        + "<tr>"
						                           + "<td colspan=2><b>" + list[i].nickname + "</b></td>"
						                           + "<td width=200px;>"+ list[i].writeDate + "</td>"
						                           + "<td width=600px;></td>"
						                        + "</tr>"
						                        + "<tr>"
						                           + "<td>&nbsp;</td>"
						                        + "</tr>"
						                        + "<tr id=\"repcontent-area" + list[i].replyNo +"\">"
						                           + "<td colspan=5 id='repcontent'>"+ list[i].replyContent +"</td>"
						                           + "<td><button onclick=\"updateReplyForm('" + list[i].replyNo + "');\">수정</button></td>"
						                           + "<td><button onclick=\"deleteReply('" + list[i].replyNo + "');\">삭제</button></td>"
						                           //+ "<td><button class=\"font comm-btn\" id=\"report-btn\" onclick=\"cmtReport('"+ i +"');\" data-toggle=\"modal\" data-target=\"#cmtReport\">신고</button></td>"
						                           + "<td><button class=\"font comm-btn\" id=\"report-btn\" onclick=\"cmtReport('"+ list[i].replyNo +"','"+ list[i].replyContent +"','"+list[i].memNo+"','"+list[i].nickname+"');\" data-toggle=\"modal\" data-target=\"#cmtReport\">신고</button></td>"
						                           + "<td><button onclick=\"plusReplyForm('"+ list[i].replyNo +"');\">답글</button></td>"
						                        + "</tr>"
							                    + "<tr id=\"update-input"+ list[i].replyNo +"\" style=\"display: none;\">"
						                           + "<td colspan=5><textarea cols=100 rows=8 id='upReplycontent"+ list[i].replyNo +"'>" + list[i].replyContent + "</textarea></td>"
						                           + "<td><button onclick=\"updateReply('" + list[i].replyNo + "');\">수정</button></td>"
						                           + "<td><button onclick=\"upcancel('" + list[i].replyNo + "');\">취소</button></td>"
						                        + "</tr>"
						                        + "<tr style='border-bottom: solid 1px rgb(175, 173, 173);'>"
						                           + "<td>&nbsp;</td>"
						                        + "</tr>"
						                        // 대댓글 시연용
						                        +"<tr class='prview" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td style='height: 20px;'></td>"
								                            +"<td width= \"70px;\"></td>"
								                        +"</tr>"
								                        +"<tr class='prview2" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td width=\"70px;\" style=\"text-align: center;\">➜</td>"
								                            +"<td width='100px;' style=\"font-weight: 900;\">겨울이아빠</td>"
								                            +"<td width=\"110px;\">21-12-28 10:27</td>"
								                            +"<td width=\"560px;\"></td>"
								                        +"</tr>"
								                        +"<tr class='prview2" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td>&nbsp;</td>"
								                        +"</tr>"
								                        +"<tr class='prview2" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td width=\"70px;\"></td>"
								                            // 대댓글 내용
								                            +"<td id='prcontent"+ list[i].replyNo +"' colspan=\"5\">답글테스트</td>"
								                            +"<td><button class=\"font comm-btn\">수정</button></td>"
								                            +"<td><button class=\"font comm-btn\">삭제</button></td>"
								                            +"<td><button class=\"font comm-btn\" id=\"report-btn\" onclick=\"\" data-toggle=\"modal\" data-target=\#cmtReport\">신고</button></td>"
								                        +"</tr>"
								                        // 대댓글 작성폼
									                    + "<tr class=\"prview1"+ list[i].replyNo +"\" style=\"display: none;\">"
								                           + "<td colspan=5><textarea cols=100 rows=8 id='pr-content"+ list[i].replyNo +"'></textarea></td>"
								                           + "<td><button onclick=\"updatepr('" + list[i].replyNo + "');\">작성</button></td>"
								                           + "<td><button onclick=\"prcancel('" + list[i].replyNo + "');\">취소</button></td>"
								                        + "</tr>"
								                        
								                        +"<tr class='prview" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td>&nbsp;</td>"
								                        +"</tr>"
						                        
						                        
						                        // 대댓글 영역
						                        	/*
									                    +"<tr class='prview" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td style='height: 20px;'></td>"
								                            +"<td width= \"70px;\"></td>"
								                        +"</tr>"
								                        +"<tr class='prview" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td width=\"70px;\" style=\"text-align: center;\">➜</td>"
								                            +"<td>"+list[i].nickname+"</td>"
								                            +"<td width=\"110px;\">"+ list[i].writeDate + "</td>"
								                            +"<td width=\"560px;\"></td>"
								                        +"</tr>"
								                        +"<tr class='prview" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td>&nbsp;</td>"
								                        +"</tr>"
								                        +"<tr class='prview" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td width=\"70px;\"></td>"
								                            // 대댓글 내용
								                            +"<td id='prcontent"+ list[i].replyNo +"' colspan=\"5\" style=\"font-weight: 900;\">"+ list[i].replyContent +"</td>"
								                            +"<td><button class=\"font comm-btn\">수정</button></td>"
								                            +"<td><button class=\"font comm-btn\">삭제</button></td>"
								                            +"<td><button class=\"font comm-btn\" id=\"report-btn\" onclick=\"\" data-toggle=\"modal\" data-target=\#cmtReport\">신고</button></td>"
								                        +"</tr>"
								                        // 대댓글 작성폼
									                    + "<tr class=\"pr-input"+ list[i].replyNo +"\" style=\"display: none;\">"
								                           + "<td colspan=5><textarea cols=100 rows=8 id='pr-content"+ list[i].replyNo +"'></textarea></td>"
								                           + "<td><button onclick=\"updatepr('" + list[i].replyNo + "');\">작성</button></td>"
								                           + "<td><button onclick=\"prcancel('" + list[i].replyNo + "');\">취소</button></td>"
								                        + "</tr>"
								                        
								                        +"<tr class='prview" + list[i].replyNo + "' style='display:none;'>"
								                            +"<td>&nbsp;</td>"
								                        +"</tr>"
								                        */
						                        ;
                    				}

                                    $("#comm-outer").html(result);
                                    
                    				
                    			},error:function(){
                    				console.log("댓글목록 조회용 ajax 통신 실패")
                    			}
                    		});
                    	}
                    	
                    	// 댓글 삭제용
                    	function deleteReply(replyNo){
                    		var result = confirm('댓글을 삭제하시겠습니까?');
                    		if(result){
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
                    		}else{
                    			
                    		}
                    	
                    	}
                    	
                    	// 댓글 수정 폼용
                    	function updateReplyForm(replyNo){
                    		
                    		$.ajax({
                    			url:"rupform.ar",
                    			type:"post",
                    			data:{
                    				replyNo: replyNo
                    			},
                    			success:function(arp){
                    				$('#repcontent-area'+replyNo).attr('style', "display:none;");  // 기존댓글 숨기기
                    				$('#update-input'+replyNo).attr('style', "display:'';");  // 댓글수정영역 나타내기
                    			}
                    		});
                    	}
                    	
                    	
                    	// 댓글 수정 완료용
						function updateReply(replyNo){
                    		$.ajax({
                    			url:"rupdate.ar",
                    			type:"post",
                    			data:{
                    				replyNo: replyNo,
                    				replyContent:$("#upReplycontent"+replyNo).val()
                    			},
                    			success:function(result){
                    				alert("댓글 수정 완료");
                    				if(result > 0){
                    					selectReplyList();
                    				}
                    				
                    			}, error:function(){
                    				console.log("댓글수정용ajax 통신 실패")
                    			}
                    		});
                    	}
                    	
                    	// 댓글 수정 취소용
                    	function upcancel(replyNo){
            				$('#update-input'+replyNo).attr('style', "display:none;");  // 댓글수정영역 숨기기
            				$('#repcontent-area'+replyNo).attr('style', "display:'';");  // 기존댓글 나타내기
                    	}
                    	
                    	// 답글 작성 폼용
                    	/*
                    	function plusReplyForm(replyNo){
                    		$('.prview'+replyNo).attr('style', "display:none;");  // 답글작성폼 나타내기
                    		$('.prinput'+replyNo).attr('style', "display:'';");
                    	}
                    	*/
                    	
                    	// 답글 시연용
       					function plusReplyForm(replyNo){
                    		$('.prview'+replyNo).attr('style', "display:'';");  // 답글작성폼 나타내기
                    		$('.prview1'+replyNo).attr('style', "display:'';");
                    	}
                    	
                    	function updatepr(replyNo){
                    		$('.prview1'+replyNo).attr('style', "display:none;");
                    		$('.prview2'+replyNo).attr('style', "display:'';");
                    	}
                    	
                    	
						// 댓글신고시 모달 호출용 함수
						function cmtReport(replyNo, replyContent, memNo, nickName){
							console.log(replyNo);
							console.log(replyContent);
							console.log(memNo);
							console.log(nickName);
							
							$("#replyNo").val(replyNo);
							$("#replyContent").val(replyContent);
							$("#memNo").val(memNo);
							$("#nickName").val(nickName);
							
							$("#cmtReport").show();

						}

                    	
                    
                    </script>

                <!-- 댓글 신고하기 버튼 클릭시 보여질 내용 -->
                <div class="modal" id="cmtReport"> 
                    
                    <form action="<%=contextPath%>/report.cmt" method="post">
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
                                    <td><input id="replyContent" name="replyContent" style="border:none;" readonly></td>
                                </tr>
                                <tr>
                                    <th>작 성 자 </th>
                                    <td><input id="nickName" name="nickName" style="border:none;" readonly></td>
                                </tr>
                            </table>
                            <input type="hidden" name="replyNo" id="replyNo">
                       		<input type="hidden" name="memNo" id="memNo">
                            <hr>
                        <!-- 신고 타입 및 내용 작성하는 table -->
                            <table>
                                <tr>
                                    <th width="75"> 사유선택 </th>
                                    <td style="font-size:12px; color: gray;">
                                        여러사유에 해당하는 경우 대표적인 사유 1개를 선택해주세요.
                                    </td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <!-- 버튼 아이디 및 라벨 연결 임의 설정 !! 나중에 내용에 맞게 수정하기 -->
                                    <!-- 스타일도 나중에 헤더로 옮기기 -->
                                    <td colspan="2" style="padding-left:10px;">
                                        <input name="radio2" id="radio21" value="21" type="radio">
                                        <label for="radio21">욕설 또는 음란성 내용</label> <br>
                                        
                                        <input name="radio2" id="radio22" value="22" type="radio">
                                        <label for="radio22">부적절한 홍보성 댓글</label> <br>
                                        
                                        <input name="radio2" id="radio23" value="23" type="radio">
                                        <label for="radio23">사생활 침해 및 불법 촬영물</label> <br>
                                        
                                        <input name="radio2" id="radio24" value="24" type="radio">
                                        <label for="radio24">명예훼손 및 저작권침해</label> <br>
                                        
                                        <input name="radio2" id="radio25" value="25" type="radio">
                                        <label for="radio25">기타</label><br>
                                        
                                        <textarea name="" cols="60" rows="" id="input-area2" disabled></textarea>
                                        
                                    </td>
                                </tr>
                            </table>
                            <div align="center">
                                <button class="btnn btn-secondary" style="">신고하기</button>
                            </div>


                            <!-- 라디오버튼 value값 수정시 script에 사용된 val 같이 수정하기 -->
                            <script>
                                $(function(){
                                    $("input:radio[name=radio2]").click(function(){
                                        // value값이 5인 라디오버튼 체크시에만 text-area 활성화
                                        if($("input[name=radio2]:checked").val() == "25"){
                                            $("#input-area2").attr("disabled",false);
                                        } else{
                                            $("#input-area2").attr("disabled",true);
                                        }

                                    })
                                })
                            </script>

                        </div>
                    </form>
                </div>
        </div>	
        <br><br><br><br><br>
				
				

            
 
        

    </div>


    <%@include file="../common/footerbar.jsp" %>
</body>
</html>