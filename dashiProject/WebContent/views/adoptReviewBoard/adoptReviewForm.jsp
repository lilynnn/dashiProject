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
        <form action="">
            <div class="input-area">
                <!--사용자 선택 말머리 영역-->
                말머리를 선택해주세요
                <select name="animal">
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
                <input type="text" style="width: 850px; height: 30px;" placeholder="제목을 입력해주세요.">
            </div>
            <div class="input-area" style="height: 400px;">
                <div style="width: 100px; float: left;">
                 내용   
                </div>
                <div style="width: 850px; float: left;">
                    <textarea id="summernote"></textarea>
                </div>
            </div>
            <div class="input-area" style="height:80px; margin-top: 20px;">
                <div style="width: 120px; float:left;">
                    첨부파일                
                </div>
                <div style="width: 830px; float: left;">
                    <input type="file" name="upfile">
                </div>
            </div>
            <div class="input-area" align="center" >
                <button class="btn2" type="reset">이전으로</button>
                <button class="btn2" type="submit" style="background: rgb(102,184,94);">등록하기</button>
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