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
        height: 900px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    /*왼쪽메뉴바*/
    #munubar{
		width:200px;
		height: 800px;
	}
	/*신고상세내역*/
	.re-up-content{
		width: 850px;
		margin-left: 30px;
	}
    #boardName{
		font-size: 24px;
		font-weight: 900;
	}
    #re-detail{
        margin-top: 25px;
    }
    #re-up-content{
        background: #e9faf9;
    }
    #up-name{
        border-top: 1px solid gray;
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
	
	<div class="outer">

		<div id="menubar">
    		<%@ include file="../admin/adminMenubar.jsp" %>
    	</div>

		<div class="re-up-content">

            <table id="re-detail">
                <tr>
                    <td colspan="8" width="850px" id="boardName">전체 신고 내역</td>
                </tr>

                <tr>
                    <th colspan="8"><hr style="height: 1px;"></th>
                </tr>

                <tr>
                    <td colspan="8" height="40px" align="right">
                        <a href="" class="btn" style="background: rgb(102,184,94);">복구</a>
                        <a href="" class="btn" style="background: tomato">삭제</a>
                    </td>
                </tr>

                <tr height="40">
                    <td width="100"><mark style="background: #d5c4fb91;">해당글번호</mark></td>
                    <td width="100">
                        COMM-001
                    </td>
                    <td width="100"><mark style="background: #d5c4fb91;">신고일</mark></td>
                    <td colspan="3" width="300">
                        2021-12-07
                    </td>
                    <td width="50"><mark style="background: #d5c4fb91;">신고분류</mark></td>
                    <td width="40">
                        	1	
                    </td>
                </tr>

                <tr height="40" id="up-name">
                    <td><mark style="background: #d5c4fb91;">작성자</mark></td>
                    <td width="100">
                        bad01
                    </td>
                    <td width="50"><mark style="background: #d5c4fb91;">작성일</mark></td>
                    <td width="100">
                        2021-12-07
                    </td>
                    <td width="70"><mark style="background: #d5c4fb91;">신고사유</mark></td>
                    <td width="150">
                        	홍보성 내용 포함
                    </td>
                    <td width="100"><mark style="background: #d5c4fb91;">처리여부</mark></td>
                    <td width="20">
                        	N
                    </td>
                </tr>

                <tr height="40">
                    <td><mark style="background: #d5c4fb91;">제목</mark></td>
                    <td colspan="7">
                        	여기는제목자리
                    </td>
                </tr>

                <tr align="center">
                    <td colspan="8"><textarea name="" id="re-up-content" cols="110" rows="18" style="resize: none; padding: 20px;">내용은여기!</textarea></td>
                </tr>

                <tr align="center">
                    <td colspan="8"><button type="button" class="btn btn-sm" style="background: rgb(143,153,142);">목록으로</button></td>
                </tr>


            </table>
        
        </div>

    </div>




    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>