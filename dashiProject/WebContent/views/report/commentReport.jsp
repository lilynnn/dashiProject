<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 화면에 연결할 때 삭제하기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

    .outer{
        width: 850px;
        margin: auto;
    }
    .content-area{width: 850px; margin: auto;}
    .content-area button{border: none; background: white;}
    .content-area button:hover{cursor: pointer;}
    
    .report-area{border: 1px solid black;}
    #report-btn{border: none; background: white;}
    #report-btn:hover{cursor: pointer;}
    /* modal관련 스타일 */
    .modal{
        /* margin으로 modal위치 조정 */
        margin: 100px 400px; 
        width: 600px; 
        height: 450px; 
        background: white; 
        padding: 5px;
    }
    .modal #report-title{
        background: lightgray; 
        padding:10px; 
        margin: 0px 12px ;
    }
    .modal #report-ara{ padding:10px;}
    .modal table{
        margin: 12px; 
        width: 565px; 
        font-size: 13px;
    }
    .modal table>label{font-size: 13px;}
</style>
</head>
<body>
    <!-- 지희 작업 중 -->
    <!-- 댓글 신고하기 -->
    <div class="outer">
        <div class="content-area" align="right">
            
            <button id="report-btn" onclick="" data-toggle="modal" data-target="#reportModal">신고</button>

        </div>
    </div>

    <!-- 신고하기 버튼 클릭시 보여질 내용 -->
    <div class="modal" id="cmtReport"> 
        <form action="">
            <button type="button" class="close" data-dismiss="modal">&times;</button><br>
            <div id="report-title">
                <b>신고하기</b>
            </div>

            <div id="report-content">

                <!-- 신고게시글 정보 담아 전달하는 table -->
                <!-- 신고한 사용자 아이디, 신고 당한 게시글 번호, 제목, 작성자 담아서 전달 -->
                <table>
                    <tr>
                        <th width="80">댓글내용 </th>
                        <td>신고글제목보여지게</td>
                    </tr>
                    <tr>
                        <th>작 성 자 </th>
                        <td>신고글작성자보여지게</td>
                    </tr>
                </table>
                <hr>
               <!-- 신고 타입 및 내용 작성하는 table -->
                <table>
                    <tr>
                        <th width="75"> 사유선택 </th>
                        <td style="font-size:12px; color: gray;">
                            여러사유에 해당하는 경우 대표적인 사유 1개를 선택해주세요.
                        </td>
                    </tr>
                    <tr>
                        <!-- 버튼 아이디 및 라벨 연결 임의 설정 !! 나중에 내용에 맞게 수정하기 -->
                        <!-- 스타일도 나중에 헤더로 옮기기 -->
                        <th>&nbsp;</th>
                        <td>
                            <input name="radio" id="radio1" value="1" type="radio">
                            <label for="radio1">욕설 또는 음란성 내용</label> <br>
                            
                            <input name="radio" id="radio2" value="2" type="radio">
                            <label for="radio2">부적절한 홍보성 댓글</label> <br>
                            
                            <input name="radio" id="radio3" value="3" type="radio">
                            <label for="radio3">사생활 침해 및 불법 촬영물</label> <br>
                            
                            <input name="radio" id="radio4" value="4" type="radio">
                            <label for="radio4">명예훼손 및 저작권침해</label> <br>
                            
                            <input name="radio" id="radio5" value="5" type="radio">
                            <label for="radio5">기타</label><br>
                            
                            <textarea name="" cols="60" rows="" id="input-area" disabled></textarea>
                            
                        </td>
                    </tr>
                </table>
                <div align="center">
                    <button class="btn btn-secondary">신고하기</button>
                </div>


                <!-- 라디오버튼 value값 수정시 script에 사용된 val 같이 수정하기 -->
                <script>
                    $(function(){
                        $("input:radio[name=radio]").click(function(){
                            // value값이 5인 라디오버튼 체크시에만 text-area 활성화
                            if($("input[name=radio]:checked").val() == "5"){
                                $("#input-area").attr("disabled",false);
                            } else{
                                $("#input-area").attr("disabled",true);
                            }

                        })
                    })
                </script>

            </div>
        </form>
    </div>
</body>
</html>