<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<title>Summernote</title>

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
            입양후기
        </div>
        <hr>        
        <!--입력폼-->
        <form action="<%=contextPath%>/insert.ar" id="enroll-form" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userNo" value="<%= loginUser.getMemNo() %>">
        	<input type="hidden" name="userId" value="<%= loginUser.getMemId() %>">
        	<input type="hidden" name="nickname" value="<%= loginUser.getNickname() %>">
        	
            <div class="input-area">
                <!--사용자 선택 말머리 영역-->
                말머리를 선택해주세요
                <select name="animal" required>
                    <option value="dog">강아지</option>
                    <option value="cat">고양이</option>
                    <option value="etc" selected>기타</option>
                </select>
            </div>
            <div class="input-area">
                <!--사용자 입력 제목 영역-->
                <div style="width: 100px; float: left;">
                제목                    
                </div>
                <input type="text" style="width: 850px; height: 30px;" placeholder="제목을 입력해주세요." name="title" required>
            </div>
            <div class="input-area" style="height: 400px;">
                <div style="width: 100px; float: left;">
                 내용   
                </div>
                <div style="width: 850px; float: left;">
                    <textarea id="summernote" name="content" required></textarea>
                </div>
            </div>
            <br><br>
            <div class="input-area" style="height: 220px;">
                <div style="width: 100px; float: left;">
                    대표이미지
                </div>
                <div style="width: 850px; float: left;">
                    <img id="titleImg" width="150" height="150" onclick="chooseFile(1);">
                </div>
            </div>
            <div class="input-area" style="height: 220px;">
                <div style="width: 100px; float: left;">
                    상세이미지
                </div>
                <div style="width: 850px; float: left;">
                    <img id="contentImg1" width="100" height="100" onclick="chooseFile(2);">
                    <img id="contentImg2" width="100" height="100" onclick="chooseFile(3);">
                    <img id="contentImg3" width="100" height="100" onclick="chooseFile(4);">
                    <img id="contentImg4" width="100" height="100" onclick="chooseFile(5);">
                </div>
            </div>
            <div class="input-area" style="height:80px; margin-top: 20px; display:none">
                <div style="width: 120px; float:left;">
                    첨부파일                
                </div>
                <div id="file-area" style="width: 830px; float: left;">
                    <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required >
                    <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);" required>
                    <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);" required>
                    <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);" required>
                    <input type="file" name="file5" id="file5" onchange="loadImg(this, 5);" required>
                </div>
            </div>
            <div class="input-area" align="center">
                <button class="btn2" type="reset">이전으로</button>
                <button class="btn2" type="submit" style="background: rgb(102,184,94);">등록하기</button>
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
                                case 1: $("#titleImg").attr("src",e.target.result); break;
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