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
        height: 500px;
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
    #faqAnswer a{
        color: black;
        font-size: 12px;
        font-weight: 600;
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
                    <select name="faqList" id="">
                        <option value="adopt">입양</option>
                        <option value="ent">입소</option>
                        <option value="pay">결제</option>
                        <option value="dsp">실종/보호</option>
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
                        <tr align="center">
                            <td>입소</td>
                            <td>너무힘든데 대신 해주실분?</td>
                            <td>
                                <a href="" class="btn btn-sm btn-warning">
                                    수정
                                </a>
                            </td>
                            <td>
                                <a href="" class="btn btn-sm btn-danger">
                                    삭제
                                </a>
                            </td>
                        </tr>

                        <!--답변창-->
                        <tr id="faqAnswer">      
                            <td colspan="3">
                               
                            </td>
                            <td>
                                <a href="">수정완료</a>
                            </td>
                        </tr>

                    </tbody>
                </table>

            </div>
        </div>

    </div>


	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>