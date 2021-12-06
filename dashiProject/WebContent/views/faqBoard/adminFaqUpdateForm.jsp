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
        margin-top: 50px;
        margin: auto;
    }
    #menubar{width: 200px;}
    .outer>div{float: left;}
    /*faq목록*/
    .faqLine{
        width: 800px;
        box-sizing: border-box;
        margin: 20px;
    }
    .faqLine>div{
        float: left;
    }
    #faqLine1{
        width: 100%;
        font-size: 24px;
        font-weight: 900;
        margin-top: 20px;
    }
    #faqLine2{
        width: 100%;
        height: 50px;
        box-sizing: border-box;
    }
    #faqLine2>div{
        float: left;
        height: 100%;
        width: 260px;      
    }
    #aFadList{width: 100%;}
    .question:hover{
        cursor: pointer;
    }
    .faqAnswer a{
        color: black;
        font-size: 12px;
        font-weight: 600;
    }
    .faqAnswer textarea{
        border: none;
        background: lightgray;
    }
    #updatebtn{
        padding: 0; 
        padding-top: 20px; 
        padding-left: 10px;
    }
    .faqAnswer{display: none;}
    .faqAnswer input{
        width: 100%;
        border: none;
        background: lightgray;
    }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <div id="menubar">
            <%@ include file="../admin/adminMenubar.jsp"%>
        </div>

        <div class="faqLine">
            
            <div id="faqLine1">
                FAQ관리
                <hr>
            </div>

            <div id="faqLine2">
                <div>
                    <select name="category" id="">
                        <option value="1">입양</option>
                        <option value="2">입소</option>
                        <option value="3">결제</option>
                        <option value="4">실종/보호</option>
                        <option value="5">기타</option>
                        <option selected>전체</option>
                    </select>
                </div>
                <div align="center">
                    <input type="text">
                    <button type="button">조회</button>
                </div>
                <div align="right">
                    <a href="" class="btn btn-sm btn-success">
                        등록하기
                    </a>
                </div>
            </div>

            
            <div id="aFadList">

                <form action="">

                <table class="table table-hover">
                    <thead>
                        <tr align="center">
                            <th width="100">카테고리</th>
                            <th width="550">제목</th>
                            <th width="80"></th>
                            <th width="80"></th>
                        </tr>
                    </thead>

                    <tbody>
                        
                        <!--게시글 없을경우-->
                        <tr align="center">
                            <td colspan="4">조회된 게시글이 없습니다.</td>
                        </tr>

                        <!--게시글 있을경우-->
                        <tr align="center" class="question">
                            <td>입소</td>
                            <td>너무힘든데 대신 해주실분?</td>
                            <td>
                                <button type="button" class="btn btn-sm btn-light" onclick="history.back();">
                                    취소
                                </button>
                            </td>
                            <td>
                                <a href="" class="btn btn-sm btn-danger">
                                    삭제
                                </a>
                            </td>
                        </tr>

                        <!--답변 있을경우-->
                        <tr class="faqAnswer" style="background: lightgray;">
                            <td>
                                <select name="category" id="">
                                    <option value="1">입양</option>
                                    <option value="2">입소</option>
                                    <option value="3">결제</option>
                                    <option value="4">실종/보호</option>
                                    <option value="5">기타</option>
                                </select>
                            </td>   
                            <td colspan="2">
                                <input type="text" name="title" required value="제목입니다">
                                <hr>
                                <textarea name="content" cols="70" rows="6" style="resize: none;">내용입니다</textarea>
                            </td>
                            <td id="updatebtn">
                                <button type="submit" class="btn btn-sm btn-warning">확인</button>
                            </td>
                        </tr>

                    </tbody>
                </table>

                </form>
            </div>

        
        </div>

    </div>

    <script>
        $(function(){
            $(".question").click(function(){
                
                const $answer = $(this).next(); 

                if($answer.css("display") == "none"){

                    $(this).siblings(".faqAnswer").slideUp();

                    $answer.slideDown(1000);

                }else{

                    $answer.slideUp();

                }

            })
        })
    </script>




	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>