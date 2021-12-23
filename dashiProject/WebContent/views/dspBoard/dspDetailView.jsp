<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.dspBoard.model.vo.Dsp, com.dashi.common.model.vo.Attachment"%>
    
<%
	Dsp d = (Dsp)request.getAttribute("d");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /*전체를 감싸는 틀*/
    .outer{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        height: 2100px;
    }

    /*제목 및 작성일 */
     #name{
        width: 100%;
        font-size: 20px;
        font-weight: 900;
    }
    /*상세보기 제목*/
    #title{
        font-size: 24px;
        font-weight: 900;
        width: 100%;
        margin-top: 10px;
    }
    /*등록일~조회수*/
    .dateView{
        font-size: 12px;
        color: silver;
        width: 40px;
        margin-top: 10px;
        margin-bottom: 10px;
        float: left;
    }

    /*동물사진*/        
    .animal-image{
        width: 500px;
        height:300px;
    }

    /*동물정보를 알려주는 테이블*/
    .animalInfo * {
        width: 200px;
        height:40px;
        text-align: center;
        font-size: 17px;
    }

    /*동물과정보를 같이볼수있게 양옆으로 배치*/
    .Info_outer1>div{
        display: inline-block;
        vertical-align: middle;
    }

    /*나머지는 한줄로 배치*/
    .Info_outer2 > div{
        margin: auto;
        margin-top: 40px;
    }

    table{
        border-collapse: collapse;

    }
/*댓글창 스타일ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/

    .comment-area{
        width:1000px;
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
        color: rgb(87, 87, 85); 
        font-size: 12px;
    }

    /*답글|수정|삭제 스타일*/
    .recomment .btn{
        border: none;
        background: none;
        font-weight: 900;
        float: right;
        width: 100p;
    }

    /*댓글 전체 스타일*/
    .comment{
        margin-top: 10px;
        margin-bottom: 10px;
    }

    /*답글 전체 스타일*/
    .recomment{
        background:rgb(236, 244, 247); 
        border-top: solid 1px rgb(179, 177, 177);
        border-bottom: solid 1px rgb(179, 177, 177);
        margin-bottom: 40px;
    }

    .befAft1>div, .befAft2>div{
        display: inline-block;
        text-align: center;
        height: 30px;
        font-size: 15px;
    }

    .fontBtn{
        width: 50px;
        border: none;
        background:none;
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
    #backBtn{
        border: none;
        background: rgb(102,184,94);
        color: white;
        font-size: 18px;
        font-weight: bold;
        height: 50px;
        width: 130px;
        border-radius: 5px;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <hr>
        <div style="margin-left: 100px; margin-top: 30px;">
            <div id="title">[<%=d.getCtg()%>] <%=d.getDspTitle()%></div>
            <div class="dateView">등록일</div>
            <div class="dateView" style="width: 100px;"><%=d.getWriteDate()%></div>
            <div class="dateView">조회수</div>
            <div class="dateView" style="width: 900px;"><%=d.getViewCount()%></div>
        </div>
        
        <br><hr>

        <div align="center">
            
			<%if(loginUser != null && loginUser.getNickname().equals(d.getNickName())) { %>
	            <!--로그인한 사용자가 게시글 작성자일경우-->
	            <a href="<%=contextPath %>/updateForm.dsp?dno=<%=d.getDspNo()%>" class="btn btn-sm btn-warning">수정하기</a>
	            <a onclick="deleteconfirm()" class="btn btn-sm btn-danger">삭제하기</a>
            <% } %>
            <script>
            function deleteconfirm(){
            	  if(!confirm('정말로 삭제하시겠습니까?\n삭제하시면 복구할 수 없습니다.')){
            		    // 아니오를 클릭할 경우 아무 액션 없음
            		    return false;
            		  }
            	  location.href = '<%= contextPath%>/delete.dsp?dno=<%=d.getDspNo()%>';
            }
            </script>
        </div>


        <!--실종 보호 목격 정보글-->    
        <div class="Info_outer1" align="center" style="margin-top: 30px;">

            <img class="animal-image" src="<%=contextPath%>/<%=list.get(0).getPath() + list.get(0).getChangeName() %>"></img>

            <div>
                <table class=animalInfo border="1">
                    <!--실종동물 종류-->
                    <tr>
                        <th>묘종/견종</th>
                        <td><%=d.getVariety() %></td>
                    </tr>
                    <!--실종동물 성별-->
                    <tr>
                        <th>나이</th>
                        <td><%=d.getAge()%></td>
                    </tr>
                    <tr>
                        <th>몸무게</th>
                        <td><%=d.getWeight()%></td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td><%=d.getGender()%></td>
                    </tr>                    
                    <!--실종날짜-->
                    <tr>
                        <th>실종날짜</th>
                        <td><%=d.getIssueDate()%></td>
                    </tr>
                    <!--실종지역-->
                    <tr>
                        <th>지역</th>
                        <td><%=d.getLocationName()%></td>
                    </tr>
                    <!--사례금-->
                    <tr>
                        <th>사례금</th>
                        <td><%=d.getMoney()%></td>
                    </tr>
                    <!--작성자 연락처-->
                    <tr>
                        <th>연락처</th>
                        <td><%=d.getPhone()%></td>
                    </tr>
                    <!--실종동물 특징-->
                    <tr>
                        <th>특징</th>
                        <td><%=d.getIssue()%></td>
                    </tr>
                </table>

            </div>



        </div>  
        <br><br><br><br><br>
        
        <!-- 밑에 동물사진 2개 및 설명-->
        <div class="Info_outer2" align="center">
        	
        	<%for(int i = 1 ; i<list.size() ; i++){ %>
            	<img class= "animal-image" src="<%=contextPath%>/<%=list.get(i).getPath() + list.get(i).getChangeName() %>" ></img><br><br><br><br><br>
            <%} %>

          
            <div class= "dspConent" style="text-align: center; font-size: 17px; width: 500px; height:300px;"> 
              <%=d.getEtc()%>
            </div>
        </div> 

        <br><br>
        
        <!-- 신고하기 버튼 영역 -->
        <div class="report-area" align="right">
    
            <button onclick="" data-toggle="modal" data-target="#boardReport">신고하기</button>
            <br><br>
        </div>

        <!-- 신고하기 버튼 클릭시 보여질 Modal -->
        <div class="modal" id="boardReport"> 
            
            <form action="">
                <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                <div id="report-title">
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
                        <button id="report-btn" class="btn btn-secondary" style="margin: auto;">신고하기</button>
                    </div>

                    <!-- 라디오버튼 value값 수정시 script에 사용된 val 같이 수정하기 -->
                    <!-- Modal안에서 보여져야할 내용이라 여기에 넣었어요!! -->
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
        </div><br><br>
                
        <!--본문내용 - 댓글 구분선-->
        
        <!-- 
            일반사용자한테 보여질 버튼 : 답글, 신고
            작성자한테 보여질 버튼 : 답글, 신고, 수정, 삭제
        -->
        
        <div class="comment-area" >
            <table width="1025" align="center" class="font" style="border-bottom: solid 1px rgb(175, 173, 173);">
                        <tr id="comm-count">
                            <td style="height: 20px; width: 70px;"><img src="resources/images/comment.png" style="width:20px; height: 20px;"></td>
                            <!--댓글 수 카운트-->  
                            <td>3</td>
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
                        
                             <script>
                    	$(function(){
                    	
                    		selectReplyList();
                    		
                    		//setInterval(selectReplyList, 1000);
                    		
                    	});
                    	
                    	// ajax로 댓글 작성용
                    	function insertReply(){
                    		
                    		$.ajax({
                    			url:"rinsert.dsp",
                    			data:{
                    				content:$("#write-area").val(),
                    				dspno:'<%=d.getDspNo()%>'
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
                    			url:"rlist.dsp",
                    			data:{dspno:'<%=d.getDspNo()%>'},
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
						                        + "<tr id=\"repcontent-area\">"
						                           + "<td colspan=5 id='repcontent'>"+ list[i].replyContent +"</td>"
						                           + "<td><button onclick=\"updateReplyForm('" + list[i].replyNo + "');\">수정</button></td>"
						                           + "<td><button onclick=\"deleteReply('" + list[i].replyNo + "');\">삭제</button></td>"
						                           + "<td><button class=\"font comm-btn\" id=\"report-btn\" onclick=\"\" data-toggle=\"modal\" data-target=\"#cmtReport\">신고</button></td>"
						                           + "<td><button>답글</button></td>"
						                        + "</tr>"
						                        + "<tr id=\"update-input\" style=\"display: none;\">"
					                               + "<td colspan=5><textarea cols=100 rows=8 id='upReplycontent'>" + list[i].replyContent + "</textarea></td>"
					                               + "<td><button onclick=\"updateReply('" + list[i].replyNo + "');\">수정</button></td>"
					                               + "<td><button onclick=\"upcancel();\">취소</button></td>"
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
                    			url:"rdelete.dsp",
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
                    	
                    	// 댓글 수정 폼용
                    	function updateReplyForm(replyNo){
                    		
                    		$.ajax({
                    			url:"rupform.dsp",
                    			type:"post",
                    			data:{
                    				replyNo: replyNo
                    			},
                    			success:function(arp){
                    				$('#repcontent-area').attr('style', "display:none;");  // 기존댓글 숨기기
                    				$('#update-input').attr('style', "display:'';");  // 댓글수정영역 나타내기
                    			}
                    		});
                    	}
                    	
                    	
                    	// 댓글 수정 완료용
						function updateReply(replyNo){
                    		$.ajax({
                    			url:"rupdate.dsp",
                    			type:"post",
                    			data:{
                    				replyNo: replyNo,
                    				replyContent:$("#upReplycontent").val()
                    			},
                    			success:function(result){
                    				if(result > 0){
                    					selectReplyList();
                    				}
                    			}, error:function(){
                    				console.log("댓글수정용ajax 통신 실패")
                    			}
                    		});
                    	}
                    	
                    	// 댓글 수정 취소용
                    	function upcancel(){
            				$('#update-input').attr('style', "display:none;");  // 댓글수정영역 숨기기
            				$('#repcontent-area').attr('style', "display:'';");  // 기존댓글 나타내기
                    	}
                    	
                    	

                    	
                    
                    </script>
        </div>

        <div class="befAft" align="center">
            
            <div><!-- 이전글 다음글-->
                <table class="table"style="width: 1100px;">
                
                    <!-- 한 줄 영역으로 클릭 효과 주기 -->
                    <tbody>
                        <tr>
                            <td width="100">이전글</td>
                            <td width="700">[실종]멍멍이 찾아요ㅠㅠ</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr>
                            <td width="100">다음글</td>
                            <td width="700">[보호]야옹이를 보호하고있어요 !</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr>
                            <!-- 구분선용 공백란 -->
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

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
<br><br>
            <button id="backBtn">목록으로</button>
        </div>
        <br><br><br><br><br>
        <%@ include file="../common/footerbar.jsp" %>
    </div>

    <script>
        $(function(){
            $("#backBtn").click(function(){
                location.href = '<%= contextPath%>/list.dsp';
            })
        })
    </script>

</body>
</html>