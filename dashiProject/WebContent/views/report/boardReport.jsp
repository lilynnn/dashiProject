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
        width: 1200px;
        margin: auto;
    }
    .content-area{width: 850px; margin: auto;}
    .content-area button{border: none; background: white;}
    .content-area button:hover{cursor: pointer;}
    
    .report-area{border: 1px solid black;}
</style>
</head>
<body>
    <!-- modal로 띄울지 팝업으로 띄울지 결정하기 -->
    <!-- 지희 작업 중 -->
    <!-- 게시글 신고하기 -->
    <div class="outer">
        <div class="content-area" align="right">
            
            <button onclick="" data-toggle="modal" data-target="#updatePwdModal">신고하기</button>

        </div>
    </div>

    <!-- 신고하기 버튼 클릭시 보여질 내용 -->
    <div class="report-area" style="margin-top: 50px; width: 600px;"> 
        <form action="">
            <div id="report-title" style="background: lightgray; padding: 10px; margin: 5px 10px;">
                <b>신고하기</b>
            </div>
            <div id="report-content">

                <!-- 신고게시글 정보 담아 전달하는 table -->
                <!-- 신고한 사용자 아이디, 신고 당한 게시글 번호, 제목, 작성자 담아서 전달 -->
                <table style="margin: 10px; width: 580px; font-size: 14px;">
                    <tr>
                        <th width="100">제 &nbsp; 목 </th>
                        <td><input type="text" value="신고글의 제목 보여지게" style="width: 100%;"></td>
                    </tr>
                    <tr>
                        <th>작 성 자 </th>
                        <td><input type="text" value="신고글의 작성자 보여지게" style="width: 100%;"></td>
                    </tr>
                </table>
                <hr>
               <!-- 신고 타입 및 내용 작성하는 table -->
                <table style="margin: 10px; width: 580px; font-size: 14px;">
                    <tr>
                        <th width="100"> 사유선택 </th>
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
                            <label for="radio1" style="font-size: 13px;">욕설 또는 음란성 내용</label> <br>
                            
                            <input name="radio" id="radio2" value="2" type="radio">
                            <label for="radio2" style="font-size: 13px;">부적절한 홍보게시글</label> <br>
                            
                            <input name="radio" id="radio3" value="3" type="radio">
                            <label for="radio3" style="font-size: 13px;">사생활 침해 및 불법 촬영물</label> <br>
                            
                            <input name="radio" id="radio4" value="4" type="radio">
                            <label for="radio4" style="font-size: 13px;">명예훼손 및 저작권침해</label> <br>
                            
                            <input name="radio" id="radio5" value="5" type="radio">
                            <label for="radio5" style="font-size: 13px;">기타</label><br>
                            
                            <textarea name="" cols="60" rows="" id="input-area" disabled></textarea>
                            
                        </td>
                    </tr>
                </table>
                <div align="center">
                    <button class="btn btn-secondary">신고하기</button>
                </div>
                <br>

                <script>
                    $(function(){
                        $("input:radio[name=radio]").click(function(){

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