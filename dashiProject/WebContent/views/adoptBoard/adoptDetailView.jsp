<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dashi.adoptBoard.model.vo.AdoptNotice, java.util.ArrayList, com.dashi.common.model.vo.Attachment" %>
<% 
	AdoptNotice an = (AdoptNotice)request.getAttribute("an");
	// 글번호, 제목, 내용, 작성일, 조회수, 입소번호
	// 동물품종, 동물이름, 성별, 나이, 접종여부, 중성화여부, 질병유무, 특이사항
	
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /* 전체 영역 감싸는 div */
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
        height: auto;
    }

    .image-area>img{
        width: 600px;
        height: 500px;
        margin: auto;
    }
	#img-area img{width:400px; height:370px;}
    .content-area{
        width: 1200px;
        margin: auto;
    }
    
    /* 동물정보가 담겨있는 테이블 */
    .animal-info{
        text-align: center;
        height: 140px;
        font-size: 13px;
        border-collapse: separate;
        border-spacing: 1px;
    }
    .animal-info th{background: rgb(157, 219, 167); width: 180px;}
    .animal-info td{width: 220px;}
    
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
</style>
</head>
<body>

	<!-- 지희 수정중  -->
	<!-- 사용자가 보게될 입양 공고문의 상세 페이지 -->
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">

            <br><br><br><br>
            
            <!-- 입양공고 상세내용 영역 -->
            <div class="content-area" align="center">

                <!-- 입양공고 제목, 작성일, 조회수 -->
                <table align="left" style="margin-left: 150px;">
                    <tr>
                        <td colspan="5">
                            <h6><b><%= an.getAnTitle() %></b></h6>
                        </td>
                    </tr>
                    <tr style="color: rgb(87, 87, 85); font-size: 14px;">
                        <td>작성일&nbsp;</td>
                        <td><%= an.getWriteDate() %></td>
                        <td>&nbsp;<!--공백란--></td>
                        <td>조회수</td>
                        <td><%=an.getViewCount() %></td>
                    </tr>
                </table>

                <br><br>
                <hr width="900" color="gray">
                <br>

				<!-- 관리자가 업로드한 동물 대표 이미지 보여질 table -->
                <div class="image-area">
           			<img src="<%=contextPath %>/<%=list.get(0).getPath()+list.get(0).getChangeName() %>">
                </div>
                <br><br>

                <!-- 동물 상세정보 -->
                <table class="animal-info" width="800px">
                    <tr>
                        <th>품종</th>
                        <td><%=an.getAnimalVariety() %></td>
                        <th>나이</th>
                        <td><%=an.getAnimalAge() %> 살</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td><%=an.getAnimalGender() %></td>
                        <th>접종여부</th>
                        <td><%=an.getAnimalVaccin() %></td>
                    </tr>
                    <tr>
                        <th>중성화여부</th>
                        <td><%=an.getAnimalNeutral() %></td>
                        <th>특이사항</th>
                        <td><%=an.getAnimalIssue() %></td>
                    </tr>
                </table>
 				<br><br><br>
 				
   				<!-- 관리자가 업로드한 동물 상세 이미지 보여질 table -->
				<table id="img-area">
                	<tr>
	                	<td><img src="<%=contextPath %>/<%=list.get(1).getPath()+list.get(1).getChangeName() %>"></td>
	                	<td><img src="<%=contextPath %>/<%=list.get(2).getPath()+list.get(2).getChangeName() %>" ></td>
                	</tr>
                </table>
                <br><br><br>
                
                
                <!-- 관리자가 입력한 내용 출력되는 영역 -->
                <div class="text-area" align="center" style="width: 600px; height: 200px;">
					<%= an.getAnContent() %>
                </div>  

                <!-- 고정으로 가져갈 주의사항 멘트 -->
                <img src="<%= contextPath%>/resources/images/adopt/adoptProcedureGuide.png" style="width: 800px;">
                <br>
                <img src="<%=contextPath%>/resources/images/adopt/adoptnotice.png" width="600">
                <br><br><br><br><br>
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

	</div>
	
	<script>
		$(function(){
	   		selectReplyList();
	   		setInterval(selectReplyList, 1000);
	   	});
		
		// 댓글 작성
      	function insertReply(){
      		
      		$.ajax({
      			url:"rinsert.an",
      			data:{
      				content:$("#write-area").val(),
      				arno:'<%=an.getAnlistNo()%>'
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
		
     	// 댓글 목록 조회
      	function selectReplyList(){
      		
      		$.ajax({
      			url:"rlist.an",
      			data:{arno:'<%=an.getAnlistNo()%>'},
      			success:function(list){
      				
      				let result = "";
      				for(let i=0; i<list.length; i++){
      					result += "<tr>"
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
		                           + "<td><button onclick=\"updateReplyForm('" + list[i].replyNo + ","+list[i].memNo+"');\">수정</button></td>"
		                           + "<td><button onclick=\"deleteReply('" + list[i].replyNo + ","+list[i].memNo+"');\">삭제</button></td>"
		                           + "<td><button class=\"font comm-btn\" id=\"report-btn\" onclick=\"cmtReport('"+ list[i].replyNo +"','"
		                        		   + list[i].replyContent +"','"+list[i].memNo+"','"+list[i].nickname+"');\" data-toggle=\"modal\" "
		                        		   + "data-target=\"#cmtReport\">신고</button></td>"
		                           + "<td><button onclick=\"plusReplyForm('"+ list[i].replyNo +"');\">답글</button></td>"
		                        + "</tr>"
			                    + "<tr id=\"update-input"+ list[i].replyNo +"\" style=\"display: none;\">"
		                           + "<td colspan=5><textarea cols=100 rows=8 id='upReplycontent"+ list[i].replyNo +"'>" + list[i].replyContent + "</textarea></td>"
		                           + "<td><button onclick=\"updateReply('" + list[i].replyNo + "');\">수정</button></td>"
		                           + "<td><button onclick=\"upcancel('" + list[i].replyNo + "');\">취소</button></td>"
		                        + "</tr>"
		                        + "<tr style='border-bottom: solid 1px rgb(175, 173, 173);'>"
		                           + "<td>&nbsp;</td>"
		                        + "</tr>" ;
      				}
                    $("#comm-outer").html(result);

      			},error:function(){
      				console.log("댓글목록 조회용 ajax 통신 실패")
      			}
      		});
        }
        
     	// 댓글 삭제용
      	function deleteReply(replyNo, memNo){
     		if(<%=loginUser.getMemNo()%> == memNo){	 
	      		var result = confirm('댓글을 삭제하시겠습니까?');
	      		if(result){
		       		$.ajax({
		       			url:"rdelete.an",
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
	      			alert("삭제가 취소되었습니다.");
	      		}
     		}else{
     			alert("삭제 권한이 없습니다.");
     		}
     	}
     	
     	// 댓글 수정 폼용
     	function updateReplyForm(replyNo, memNo){
     		if(loginUser.memNo == memNo){
     			$.ajax({
         			url:"rupform.an",
         			type:"post",
         			data:{
         				replyNo: replyNo
         			},
         			success:function(arp){
         				$('#repcontent-area'+replyNo).attr('style', "display:none;");
         				$('#update-input'+replyNo).attr('style', "display:'';");
         			}
         		});	
     		}else{
     			alert("수정 권한이 없습니다.");
     		}
     	}
     	
     	// 댓글 신고하기
     	function rpdata(){
            	
            var content = $("#input-area2").val();
           	var rpCategory = $('input[name=rpcategory]:checked').val();
            var rpValue;

            if(rpCategory == 'etc'){
             	if(content.length > 5){
                       rpValue = $("#input-area2").val();
               	}else{
               		alert("최소 5글자 이상 입력해주세요");
               	}
            }else{
               	rpValue= $('input[name=rpcategory]:checked').val();
           	}
               
           $.ajax({
				url:"report.me",
                data:{
                    reportMemNo:$("#reportMemNo").val(),
                    refCategory:$("#refCategory").val(),
                    refBNo:$("#refBNo").val(),
                    content:rpValue
                },success:function(result){
                    alert("해당 글의 신고가 완료되었습니다.");
   					opener.parent.location.reload();
                    window.close();
               	},error:function(){
               		alert("해당 글의 신고가 실패했습니다.");
   					opener.parent.location.reload();
                   	window.close();
               	}
           });
		}
	</script>
   	

	<%@ include file="/views/common/footerbar.jsp" %>

</body>
</html>