<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1100px;
        height: 1000px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    /*왼쪽메뉴바*/
    #munubar{width:200px}
    /*게시판이름*/
    #noTitle{
        width: 800px;
        height: 70px;
        font-size: 24px;
        font-weight: 900;
        line-height: 100px;
        margin-left: 20px;
    }
    /*상세페이지*/
    #noDetailEnroll{
        margin-left: 20px;
        width: 800px;
        border: 1px solid gray;
        margin-top: 30px;
    }
    #noContent{
        width: 100%;
        padding-top: 20px;
    }
    #noDetailEnroll div{
        box-sizing: border-box;
        float: left;
    }
    #noFile{
        width: 100%;
        padding-left: 70px;
        padding-bottom: 20px;
        margin-top: 20px;
        border-bottom: 1px solid gray;
    }
    #noBtns{
        padding-top: 20px;
        padding-bottom: 20px;
        width: 100%;
        background: #e4f0df;
    }
</style>

</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	
	<div class="outer">
    
    	<div id="menubar">
    		<%@ include file="../admin/adminMenubar.jsp" %>
    	</div>

        <div id="noTitle">
            공지사항
        </div>

        <!--관리자 공지사항 상세페이지-->
        <div id="noDetailEnroll">
            <form action="" id="enroll-form" method="post">
                <div style="width: 100%; padding: 20px; font-weight: 600;">
                    	공지 선택
                    <select name="noSelect">
                        <option selected value="N">선택안함</option>
                        <option value="Y">공지</option>
                    </select>
                </div>
                <br><br>
                
                <div style="width: 100%; padding: 20px; font-weight: 600;">
                    	제목 &nbsp;&nbsp;&nbsp;
                    <input type="text" name="title" style="width: 90%;" required placeholder="제목을 입력해주세요.">
                </div>
                <br><br>

                <!--내용부분-->
                <div style="padding:20px; font-weight: 600;">
                    	내용
                </div>
                <div id="noContent" style="width: 90%;">
                    <textarea id="summernote" name="content"></textarea>
                </div>

                <div id="noFile">
                    <input type="file">
                </div>

                <div id="noBtns" align="center" style="border: none;">
                    <button type="button" onclick="history.back();" class="btn btn-sm" style="background:rgb(143,153,142)">
                        뒤로가기
                    </button>
                    <button type="reset" class="btn btn-sm" style="background:lightgray;">
                        초기화
                    </button>
                    <button type="submit" class="btn btn-sm" style="background: rgb(102,184,94);">
                        등록하기
                    </button>
                </div>
                
            </form>
        </div>
    </div>

    <script>
        $("#summernote").summernote({
            placeholder: '내용을 입력해주세요.',
            tabsize: 2,
            height: 400
        });
        console.log(summernote)
    </script>



    <!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>


</body>
</html>