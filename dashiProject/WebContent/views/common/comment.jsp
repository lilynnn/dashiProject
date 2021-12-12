<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box;}

    .comm-outer{
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

    button:hover{
        color: black;
        cursor:pointer;    
    }
    .comm-btn{
        background: none;
        border: none;
        width: 40px;
    }
</style>
</head>
<body>

    <div class="comm-outer">
        <!--댓글영역-->
        <table width="1025" align="center" class="font" style="border-bottom: solid 1px rgb(175, 173, 173);">
            <tr>
                <td><img src="resources/images/comment.png" style="width:20px; height: 20px;"></td>
                <!--댓글 수 카운트-->  
                <td>3</td>
            </tr>
            <tr>
                <td style="height: 20px; width: 70px;"></td>
            </tr>
            <tr>
                <!--작성자 닉네임-->
                <td colspan="2">작성자</td>
                <!--댓글 작성일-->
                <td width="110px;">YYYY-MM-DD</td>
                <!--댓글 작성시간-->
                <td width="90px;">HH-MM</td>
                <td width="610px;"></td>
            </tr>
            <tr>
                <td style="height: 20px;"></td>
            </tr>
            <tr>
                <td colspan="5">댓글내용</td>
                <!--답글 작성자에게만 노출-->
                <td><button class="font comm-btn">수정</button></td>
                <!--답글 작성자에게만 노출-->
                <td><button class="font comm-btn">삭제</button></td>
                <!--클릭 시 댓글 작성란이 답글 작성으로 변경-->
                <td><button class="font comm-btn">답글</button></td>
            </tr>
            <tr>
                <td style="height: 20px;"></td>
            </tr>
        </table>
        <!--대댓글영역-->
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
                <td style="height: 20px;"></td>
            </tr>
            <tr>
                <td width="70px;"></td>
                <td colspan="5">댓글내용</td>
                <td><button class="font comm-btn">수정</button></td>
                <!--답글 작성자에게만 노출-->
                <td><button class="font comm-btn">삭제</button></td>
                <!--클릭 시 댓글 작성란이 답글 작성으로 변경-->
                <td><button class="font comm-btn">답글</button></td>
            </tr>
            <tr>
                <td style="height: 20px;"></td>
            </tr>
        </table>

        <br><br><br>
            <!--댓글 입력란-->
            <div align="center">
                <textarea class="write-area" cols="130" rows="8" placeholder="댓글을 작성해주세요"></textarea>
            </div>
            <div align="right">
            <br>
            <!--클릭 시 댓글 작성 실패|성공 alert창-->
            <button class="write-btn">댓글쓰기</button>
            </div>
            <br><br><br><br><br>
    </div>  

</body>
</html>