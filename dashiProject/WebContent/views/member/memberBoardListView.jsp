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
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
        height:1000px
    }
    #mem-boardlist{
        background: rgb(32, 68, 28);
        color: white;
    }
    /*게시판 이름*/
    #bo-name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    /*글쓴내역들*/
    #board-list{
        width: 1040px;
        margin: auto;
        margin-top: 40px;
    }
    #apply-list{
        width: 100%;
    }
    th{
        font-size: 20px;
        background: #eafcef;
        border-bottom: 1px solid gray;
    }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

	<!--전체 div-->
	<div class="outer">

        <!--게시판 안내-->
        <div id="bo-name">
            	글쓴내역확인
        <hr>
        </div>
        
        <!--회원정보 메뉴바-->
        <div style="margin-left: 30px;">
            <%@ include file="../common/memberUpdateMenubar.jsp" %>
        </div>
    
        <!--글쓴내역 폼-->
        <div id="board-list">

            <table id="apply-list" class="table table-hover">

                <tr>
                    <td colspan="5" style="border: none; background: white;">
                        <a href="" class="btn btn-sm btn-danger">삭제</a>
                    </td>
                </tr>
                <tr align="left">
                    <th colspan="5">입소신청</th>
                </tr>
                <tr  style="background: white;">
                    <td align="center" colspan="4"></td>
                    <td>
                        <a href="">더보기▼</a>
                    </td>
                </tr>
                <tr align="center">
                    <td width="30">No.</td>
                    <td width="30"></td>
                    <td width="750">제목</td>
                    <td width="110">신청날짜</td>
                    <td width="110">진행상태</td>
                </tr>

                <!--글 없을때-->
                <tr align="center">
                    <td colspan="5">작성된 글이 없습니다.</td>
                </tr>

                <!--글 있을때-->
                <tr align="center">
                    <td>1</td>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>여기는 제목자리</td>
                    <td>2021-12-08</td>
                    <td>승인</td>
                </tr>
            </table>
        
            <br><br>
            
            <table id="adopt-list" class="table table-hover">
                <tr align="left">
                    <th colspan="5">입양신청</th>
                </tr>
                <tr style="background: white;">
                    <td colspan="4"></td>
                    <td align="center">
                        <a href="">더보기▼</a>
                    </td>
                </tr>
                <tr align="center">
                    <td width="30">No.</td>
                    <td width="30"></td>
                    <td width="750">제목</td>
                    <td width="110">신청날짜</td>
                    <td width="110">진행상태</td>
                </tr>

                <!--글 없을때-->
                <tr align="center">
                    <td colspan="5">작성된 글이 없습니다.</td>
                </tr>

                <!--글 있을때-->
                <tr align="center">
                    <td>1</td>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>여기는 제목자리</td>
                    <td>2021-12-08</td>
                    <td>결제대기</td>
                </tr>
            </table>
        
            <br><br>
            
            <table id="adopt-review" class="table table-hover">
                <tr align="left">
                    <th colspan="5">입양후기</th>
                </tr>
                <tr style="background: white;">
                    <td colspan="4"></td>
                    <td align="center">
                        <a href="">더보기▼</a>
                    </td>
                </tr>

                
                <tr align="center">
                    <td width="30">No.</td>
                    <td width="30"></td>
                    <td width="750">제목</td>
                    <td width="110">작성날짜</td>
                    <td width="110">조회수</td>
                </tr>

                <!--글 없을때-->
                <tr align="center">
                    <td colspan="5">작성된 글이 없습니다.</td>
                </tr>

                <!--글 있을때-->
                <tr align="center">
                    <td>1</td>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>여기는 제목자리</td>
                    <td>2021-12-08</td>
                    <td>123</td>
                </tr>
            </table>

            <br><br>
            
            <table id="adopt-list" class="table table-hover">
                <tr align="left">
                    <th colspan="5">실종/보호</th>
                </tr>
                <tr style="background: white;">
                    <td colspan="4"></td>
                    <td align="center">
                        <a href="">더보기▼</a>
                    </td>
                </tr>
                <tr align="center">
                    <td width="30">No.</td>
                    <td width="30"></td>
                    <td width="750">제목</td>
                    <td width="110">작성날짜</td>
                    <td width="110">조회수</td>
                </tr>

                <!--글 없을때-->
                <tr align="center">
                    <td colspan="5">작성된 글이 없습니다.</td>
                </tr>

                <!--글 있을때-->
                <tr align="center">
                    <td>1</td>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>여기는 제목자리</td>
                    <td>2021-12-08</td>
                    <td>123</td>
                </tr>
            </table>
        
        
        </div>
        
     </div>
	
    <div style="margin-top: 700px;">
     <%@ include file="../common/footerbar.jsp"%>
    </div>
</body>
</html>