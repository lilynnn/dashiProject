<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin-top: 50px;
        width: 1200px;
        margin: auto;
    }

    /*댓글영역 전체 스타일*/
    .comment-area{
        width:1000px;
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
        color: rgb(87, 87, 85); 
        font-size: 12px;
    }

    /*답글|수정|삭제 스타일*/
    .btn{
        border: none;
        background: none;
        font-weight: 900;
        float: right;
    }

    /*댓글 전체 스타일*/
    .comment{
        margin-top: 50px;
        margin-bottom: 30px;
    }

    /*답글 전체 스타일*/
    .recomment{
        background:rgb(236, 244, 247); 
        border-top: solid 1px rgb(179, 177, 177);
        border-bottom: solid 1px rgb(179, 177, 177);
        margin-bottom: 40px;
    }
</style>
</head>
<body>

    <div class="outer">
        <div class="comment-area">
            <div class="comment">
                <table style="margin-top: 20px;">
                    <tr>
                        <tr class="font">
                            <!--작성자 닉네임-->
                            <td width="60px">작성자</td>
                            <!--작성일-->
                            <td width="100px">YYYY-MM-DD</td>
                            <!--작성시간-->
                            <td width="100px">HH-MM</td>
                    </tr>
                </table> 
                <table>
                    <tr class="content">
                        <!--사용자가 입력한 댓글 내용-->
                        <td colspan="4" width="855" style="font-weight: 900;">댕댕아 이제는 행복해~</td>
                        <!--클릭 시 댓글 작성란이 답글 작성으로 변경-->
                        <td><button class="font btn">답글</button></td>
                        <!--답글 작성자에게만 노출-->
                        <td><button class="font btn">수정</button></td>
                        <!--답글 작성자에게만 노출-->
                        <td><button class="font btn">삭제</button></td>
                    </tr>                    
                </table>

                
            </div>
            <div class="recomment">
                <table style="margin-top: 23px;">
                    <tr class="font">
                        <td style="text-align: right;" width="80">➜</td>
                        <!--답글 작성자 닉네임-->
                        <td width="60px">작성자</td>
                        <!--답글 작성일-->
                        <td width="100px">YYYY-MM-DD</td>
                        <!--답글 작성시간-->
                        <td width="100px">HH-MM</td>
                    </tr> 
                    </table> 
                    <table style="margin-bottom: 23px;">
                    <tr>
                        <td width="80"></td>
                        <!--사용자가 입력한 답글 내용-->
                        <td colspan="4" class="content" width="770" style="font-weight: 900;">감사합니다. 행복하게 살게요.</td>
                        <!--클릭 시 댓글 작성란이 답글 작성으로 변경-->
                        <td><button class="font btn">답글</button></td>
                        <!--답글 작성자에게만 노출-->
                        <td><button class="font btn">수정</button></td>
                        <!--답글 작성자에게만 노출-->
                        <td><button class="font btn">삭제</button></td>
                    </tr>                         
                    </table>
                                    
            </div>
            <!--댓글 입력란-->
            <div align="center">
                <textarea class="write-area" cols="140" rows="8" placeholder="댓글을 작성해주세요"></textarea>
            </div>
            <div align="right">
            <br>
            <!--클릭 시 댓글 작성 실패|성공 alert창-->
            <button class="write-btn">댓글쓰기</button>
            </div>
        </div>
    </div>

</body>
</html>