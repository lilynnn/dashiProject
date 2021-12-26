<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page  import = "java.util.ArrayList, com.dashi.adoptReviewBoard.model.vo.AdoptReview, com.dashi.common.model.vo.Attachment" %>

<%
 	AdoptReview ar = (AdoptReview)request.getAttribute("ar");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
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
    .input-area{
        width: 1000px;
        font-weight: 900;
        padding: 20px;
        margin: auto;
    }
    .btn2{
        border: none;
        background: rgb(221, 221, 221);
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <!--입양후기(타이틀)-->
        <div id="title" style="width: 20%; font-size: 26px; font-weight: 900;">
            입양후기 수정
        </div>
        <hr>        
        <!--입력폼-->
        <form action="<%=contextPath%>/update.ar" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userNo" value="<%= ar.getMemNo() %>">
        	<input type="hidden" name="userId" value="<%= ar.getMemId() %>">
        	<input type="hidden" name="nickname" value="<%= ar.getNickname() %>">
        	<input type="hidden" name="arno" value="<%= ar.getArlistNo() %>" >
        	
            <div class="input-area">
                <!--사용자 선택 말머리 영역-->
                말머리를 선택해주세요
                <select name="animal" value="<%= ar.getAnType() %>" required>
                    <option value="dog">강아지</option>
                    <option value="cat">고양이</option>
                    <option value="etc">기타</option>
                </select>
            </div>
            <div class="input-area">
                <!--사용자 입력 제목 영역-->
                <div style="width: 100px; float: left;">
                제목                    
                </div>
                <input type="text" style="width: 850px; height: 30px;" name="title" required value="<%= ar.getArTitle()%>">
            </div>
            <div class="input-area" style="height: 400px;">
                <div style="width: 100px; float: left;">
                 내용   
                </div>
                <div style="width: 850px; float: left;">
                    <textarea id="summernote" name="content" required><%=ar.getArContent()%></textarea>
                </div>
            </div>
            <br><br>
            <div class="input-area" style="height: 220px;">
            	<div style="width: 100px; float: left;">
                    대표이미지
            	</div>
                <div style="width: 850px; float: left;">
                    <img id="titleImg" width="150" height="150" src="<%=contextPath%>/<%=list.get(0).getPath()%><%=list.get(0).getChangeName()%>" onclick="chooseFile(1);">
                    <input type="hidden" name="originFileNo1" value="<%= list.get(0).getAttachNo() %>">
                </div>
            </div>
            <div class="input-area" style="height: 220px;">
                <div style="width: 100px; float: left;">
                    상세이미지
                </div>
                <div style="width: 850px; float: left;">
                	<!-- 기존이미지 -->
                	<% for(int i=1; i<list.size(); i++){ %>
		             <img id="contentimg<%=i%>" width="150" height="150" onclick="chooseFile(<%=i+1%>);" src="<%=contextPath%>/<%=list.get(i).getPath()+list.get(i).getChangeName()%>">
                	 <input type="hidden" name="originFileNo<%=i+1%>" value="<%=list.get(i-1).getAttachNo()%>">
					<% } %>
				</div>
					<!-- 첨부파일 입력 칸 5칸으로 보여지게 -->
					<%for(int i=list.size() + 1; i < 5; i++){ %>
						<img id="contentImg<%=i+1%>" width="150" height="150" src="" alt="" onclick="chooseFile(<%= i+2 %>)" src="">
					<%} %>                
            </div>
            
           
           <!-- 첨부파일 입력받는 영역 -->
            <div class="input-area" style="height:80px; margin-top: 20px; display:none">
                <div style="width: 120px; float:left;">
                    첨부파일                
                </div>
                <div id="file-area" style="width: 830px; float: left;">
                    <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
                    <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                    <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                    <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
                    <input type="file" name="file5" id="file5" onchange="loadImg(this, 5);">
                </div>
            </div>


            <script>
            	function chooseFile(num){
            		$("#file" + num).click();	
            	}
            
                function loadImg(inputFile, num){
                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                    // num: 몇번째 input요소인지 확인 후 해당 그 영역에 미리보기하기 위해 전달받는 숫자

                    // 선택된 파일이 있다면 inputFile.files[0]에 선택된 파일이 담겨있음
                    //                       => inputFile.files.length 또한 1이 될것임
                    if(inputFile.files.length == 1){ // 파일 선택된 경우 => 파일 읽어들여서 미리보기

                        // 파일을 읽어들일 FileReader 객체 생성
                        const reader = new FileReader();

                        // 파일을 읽어들이는 메소드
                        reader.readAsDataURL(inputFile.files[0]);
                        // 해당 파일을 읽어들이는 순간 해당 이 파일만의 고유한 url 부여

                        // 파일 읽어들이기가 완료됐을 때 실행할 함수 정의해두기
                        reader.onload = function(e){
                            // e.target.result => 읽어들인 파일의 고유한 url
                            switch(num){
                                case 1: $("#titleImg").attr("src", e.target.result); break;
                                case 2: $("#contentImg1").attr("src", e.target.result); break;
                                case 3: $("#contentImg2").attr("src", e.target.result); break;
                                case 4: $("#contentImg3").attr("src", e.target.result); break;
                                case 5: $("#contentImg4").attr("src", e.target.result); break;
                            }
                        }

                    }else{ // 선택된 파일이 취소된 경우 => 미리보기된 것도 사라지게
                        switch(num){
                            case 1: $("#titleImg").attr("src", null); break;
                            case 2: $("#contentImg1").attr("src", null); break;
                            case 3: $("#contentImg2").attr("src", null); break;
                            case 4: $("#contentImg3").attr("src", null); break;
                            case 5: $("#contentImg4").attr("src", null); break;
                        }
                    }
                }
            </script>            
            <div class="input-area" align="center">
                <button class="btn2" type="reset" onclick="location.href='<%=contextPath%>/list.ar'">취소</button>
                <button class="btn2" type="submit" onclick="location.href='<%=contextPath %>/update.ar'" style="background: rgb(102,184,94);">수정</button>
            </div>
        </form>

    </div>
    <script>
        $("#summernote").summernote({
            placeholder: '내용을 입력해주세요.',
            tabsize: 2,
            height: 350
        });
        console.log(summernote)
    </script>

    <%@include file="../common/footerbar.jsp" %>
</body>
</html>