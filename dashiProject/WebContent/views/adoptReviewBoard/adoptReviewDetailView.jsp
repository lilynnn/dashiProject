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

    /*상단 입양후기 백그라운드이미지 영역*/
    #fix-image{
        width: 700px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    /*사용자 첨부 이미지 영역*/
    .image-area{
        width: 600px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        border: 1px solid black;
    }

    /*사용자 작성 글내용 영역*/
    .content-area{
        width: 1200px;
        margin: auto;
    }

    /*버튼 영역*/
    .btn{
        border: none;
        background: rgb(221, 221, 221);
        color: rgb(80, 79, 79);
        font-size: 14px;
        font-weight: bold;
        height: 33px;
        width: 100px;
        border-radius: 9px;
    }
    .btn:hover{
        color:black;
        cursor:pointer;
    }
    .text-area{
        width: 600px;
        margin-bottom: 100px;
        margin-top: 100px;
    }

    /* 신고하기 영역 */
    .report-area{width: 1050px; margin: auto;}
    .report-area button{border: none; background: white;}
    .report-area button:hover{cursor: pointer;}

    /* modal관련 스타일 */
    #reportModal{
        /* margin으로 modal위치 조정 */
        margin: 120px 530px;
        width: 500px; 
        height: 450px; 
        background: white; 
        padding: 5px;
    }
    #reportModal #report-title{
        background: lightgray; 
        padding:10px; 
        margin: 0px 12px ;
    }
    #reportModal #report-area{ padding:10px;}
    #reportModal table{
        margin: 12px; 
        width: 565px; 
        font-size: 13px;
    }
    #reportModal table>label{font-size: 13px;}
    .table>tbody tr:hover{
        background: rgb(233, 230, 230);
        cursor: pointer;
    }

    /*댓글영역 스타일*/

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

    /*신고하기 관련 스타일*/
    /* 신고하기 영역 */
    .report-area{width: 1050px; margin: auto;}
    .report-area button{border: none; background: white;}
    .report-area button:hover{cursor: pointer;}

    /* modal관련 스타일 */
    #boardReport,#cmtReport{
        /* margin으로 modal위치 조정 */
        margin: 120px 530px; 
        width: 500px; 
        height: 450px; 
        background: white; 
        padding: 5px;
    }
    #boardReport #report-title,#cmtReport #report-title{
        background: lightgray; 
        padding:10px; 
        margin: 0px 12px ;
    }
    #boardReport #report-area,#cmtReport #report-area{ padding:10px;}
    #boardReport table,#cmtReport table{
        margin: 12px; 
        width: 565px; 
        font-size: 13px;
    }
    #boardReport table>label,#cmtReport table>label{font-size: 13px;}

    .table>tbody tr:hover{
        background: rgb(233, 230, 230);
        cursor: pointer;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
	        <div id="fix-image" align="center">
	        <!-- 웃고있는 강쥐 사진 들어갈 영역!!! -->
	            <div style="width:650px">        
	                <h2 style="margin-top: 100px;">입양후기 <hr></h2>
	            </div>
	        </div>
            <br><br><br><br><br><br>
            <!-- 입양후기 상세내용 영역 -->
            <div class="content-area" align="center">
                <!-- 입양후기 제목, 작성일, 조회수 -->
                <table align="left" style="margin-left: 150px;">
                    <tr>
                        <td colspan="5" style="height: 80px;">
                            <h2><b>강아지 "댕댕이" 입양 후기</b></h2>
                        </td>
                    </tr>
                    <tr style="color: rgb(87, 87, 85); font-size: 14px;">
                        <td>작성일&nbsp;</td>
                        <td>YYYY-MM-DD</td>
                        <td>&nbsp;<!--공백란--></td>
                        <td>조회수</td>
                        <td>NN</td>
                    </tr>
                </table>
        
                <br><br><br><br>
                <hr width="900" color="gray">
                <br>

                <!-- 사용자 작성 글내용 -->
                <div class="text-area" align="center">
                            무한한 길지 있는 풍부하게 힘있다. 실현에 못할 밝은 같이, 이상의 운다. 동력은 얼마나 많이 칼이다. <br>
                            소금이라 심장은 원질이 인간은 황금시대의 때문이다. 때까지 이상 끓는 설레는 청춘의 인생을 풀이 아름다우냐? <br>
                            이상의 타오르고 대중을 귀는 밥을 찬미를 사막이다. 품고 같은 대중을 우리 이상은 관현악이며, 커다란 것이다. <br>
                            그들에게 설레는 보이는 얼마나 거친 날카로우나 하였으며, 그들은 것이다. 피어나기 힘차게 살았으며, 안고, <br>
                            가치를 생명을 이것을 대고, 것이다. 
                            청춘의 것이 우리의 무엇을 눈이 그것을 이상이 간에 것이다.       
                </div>   

                <!-- 사용자 첨부 이미지 -->
                <div class="image-area">
                    강쥐
                </div>
                <br><br>
                <div class="image-area">
                    강쥐
                </div>
                <br><br>
                <div class="image-area">
                    강쥐
                </div>
        
                <br><br><br><br><br>
                <!-- 신고하기 버튼 영역 -->
                <div class="report-area" align="right">
            
                    <button onclick="" data-toggle="modal" data-target="#reportModal">신고하기</button>
                    <br><br>
                </div>

                <!-- 신고하기 버튼 클릭시 보여질 내용 -->
                <div class="modal" id="reportModal"> 
                    
                    <form action="">
                        <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                        <div id="report-title" align="left">
                            <b>신고하기</b>
                        </div>

                        <div id="report-content" align="center">

                            <!-- 신고게시글 정보 담아 전달하는 table -->
                            <!-- 신고한 사용자 아이디, 신고 당한 게시글 번호, 제목, 작성자 담아서 전달 -->
                            <table>
                                <tr>
                                    <th width="75">제 &nbsp; 목 </th>
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
                                        <label for="radio2">부적절한 홍보게시글</label> <br>
                                        
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
                                <button class="btn btn-secondary" style="line-height: 100%;">신고하기</button>
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
                            <td colspan="5" style="font-weight: 900;">댓글내용</td>
                            <!--답글 작성자에게만 노출-->
                            <td><button class="font comm-btn">수정</button></td>
                            <!--답글 작성자에게만 노출-->
                            <td><button class="font comm-btn">삭제</button></td>
                            <!-- 댓글 작성자가 아닐 시에만 노출-->
                            <td><button class="font comm-btn" id="report-btn" onclick="" data-toggle="modal" data-target="#cmtReport">신고</button></td>
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
                            <td colspan="5" style="font-weight: 900;">댓글내용</td>
                            <td><button class="font comm-btn">수정</button></td>
                            <!--답글 작성자에게만 노출-->
                            <td><button class="font comm-btn">삭제</button></td>
                            <!-- 댓글 작성자가 아닐 시에만 노출-->
                            <td><button class="font comm-btn" id="report-btn" onclick="" data-toggle="modal" data-target="#cmtReport">신고</button></td>
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
                
                


                <!-- 이전글/다음글 넘기는 영역 -->
                <table class="table" style="width: 1050px; border-collapse: collapse;">
                        
                    <!-- 한 줄 영역으로 클릭 효과 주기 -->
                    <tbody>
                        <tr style="border-top: solid 1px rgb(175, 173, 173); height: 50px; font-weight: 600;">
                            <td width="100">이전글</td>
                            <td width="700">기요미 입양후기</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr style="border-top: solid 1px gray; border-bottom: solid 1px rgb(175, 173, 173); height: 50px; font-weight: 600;">
                            <td width="100">다음글</td>
                            <td width="700">멍멍이 입양후기</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                    </tbody>
                </table>
                <br><br><br>
 
                <!--클릭 시 입양후기 전체조회 페이지로 이동-->
                <button class="btn">목록으로</button>

                <br><br><br><br>
                                <!-- 댓글 신고하기 버튼 클릭시 보여질 내용 -->
                                <div class="modal" id="cmtReport"> 
                                    <form action="">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                                        <div id="report-title">
                                            <b>댓글 신고하기</b>
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
            </div>
 
        

    </div>


    <%@include file="../common/footerbar.jsp" %>
</body>
</html>