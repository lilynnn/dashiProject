<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /*전체를 감싸는 틀*/
    .outer{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        height: 2100px;
    }

    /*제목 및 작성일 */
     #name{
        width: 100%;
        font-size: 20px;
        font-weight: 900;
    }
    /*상세보기 제목*/
    #title{
        font-size: 24px;
        font-weight: 900;
        width: 100%;
        margin-top: 10px;
    }
    /*등록일~조회수*/
    .dateView{
        font-size: 12px;
        color: silver;
        width: 40px;
        margin-top: 10px;
        margin-bottom: 10px;
        float: left;
    }

    /*동물사진*/        
    .animal-image{
        border: 1px solid black;
        width: 500px;
        height:300px;
    }

    /*동물정보를 알려주는 테이블*/
    .animalInfo * {
        width: 200px;
        height:40px;
        text-align: center;
        font-size: 17px;
    }

    /*동물과정보를 같이볼수있게 양옆으로 배치*/
    .Info_outer1>div{
        display: inline-block;
        vertical-align: middle;
    }

    /*나머지는 한줄로 배치*/
    .Info_outer2 > div{
        margin: auto;
        margin-top: 40px;
    }

    table{
        border-collapse: collapse;

    }
/*댓글창 스타일ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/

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

    /* .btn으로 하니까 modal내부에 있는 버튼까지 스타일 잡혀서 .recomment .btn으로 수정했어요~!! 
        그리구 웹에서 확인해보니까 답글, 수정, 삭제 얘네들 세로로 보여지던데 맞나요..??
        - 지희
    */

    /*답글|수정|삭제 스타일*/
    .recomment .btn{
        border: none;
        background: none;
        font-weight: 900;
        float: right;
        width: 100p;
    }

    /*댓글 전체 스타일*/
    .comment{
        margin-top: 10px;
        margin-bottom: 10px;
    }

    /*답글 전체 스타일*/
    .recomment{
        background:rgb(236, 244, 247); 
        border-top: solid 1px rgb(179, 177, 177);
        border-bottom: solid 1px rgb(179, 177, 177);
        margin-bottom: 40px;
    }

    .befAft1>div, .befAft2>div{
        display: inline-block;
        text-align: center;
        height: 30px;
        font-size: 15px;
    }

    .fontBtn{
        width: 50px;
        border: none;
    }


     /*신고하기 관련 스타일*/
    /* 신고하기 영역 */
    .report-area{width: 1050px; margin: auto;}
    .report-area button{border: none; background: white;}
    .report-area button:hover{cursor: pointer;}

    /* modal관련 스타일 */
    #reportModal{
        /* margin으로 modal위치 조정 */
        margin: 100px 400px; 
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

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <hr>
        <div style="margin-left: 100px; margin-top: 30px;">
            <div id="title">[실종] 귀요미를 찾습니다.</div>
            <div class="dateView">등록일</div>
            <div class="dateView" style="width: 100px;">2021.12.24</div>
            <div class="dateView">조회수</div>
            <div class="dateView" style="width: 900px;">123</div>
        </div>
        
        <br><hr>
    

        <!--실종 보호 목격 정보글-->    
        <div class="Info_outer1" align="center" style="margin-top: 30px;">

            <img class="animal-image" src=""></img>

            <div>
                <table class=animalInfo border="1">
                    <!--실종동물 종류-->
                    <tr>
                        <th>묘종/견종</th>
                        <td>믹스견</td>
                    </tr>
                    <!--실종동물 성별-->
                    <tr>
                        <th>성별</th>
                        <td>암컷</td>
                    </tr>
                    <!--실종날짜-->
                    <tr>
                        <th>실종날짜</th>
                        <td>2021-11-14</td>
                    </tr>
                    <!--실종지역-->
                    <tr>
                        <th>지역</th>
                        <td>서울시 강남구</td>
                    </tr>
                    <!--사례금-->
                    <tr>
                        <th>사례금</th>
                        <td>5억</td>
                    </tr>
                    <!--작성자 연락처-->
                    <tr>
                        <th>연락처</th>
                        <td>010-1111-2222</td>
                    </tr>
                    <!--실종동물 특징-->
                    <tr>
                        <th>특징</th>
                        <td>코 옆 까만점,입주변 하연털</td>
                    </tr>
                </table>

            </div>



        </div>  
        <br><br><br>
        
        <!-- 밑에 동물사진 2개 및 설명-->
        <div class="Info_outer2" align="center">
            <img class= "animal-image" src="" ></img><br><br><br><br>
            <img class= "animal-image" src=""></img><br><br>
            <div class= "dspConent" style="text-align: center; font-size: 17px; width: 500px; height:300px;"> 
                무한한 길지 있는 풍부하게 힘있다. 실현에 못할 밝은 같이, 이상의 운다. 동력은 얼마나 많이 칼이다. <br>
                소금이라 심장은 원질이 인간은 황금시대의 때문이다. 때까지 이상 끓는 설레는 청춘의 인생을 풀이 아름다우냐? <br>
                이상의 타오르고 대중을 귀는 밥을 찬미를 사막이다. 품고 같은 대중을 우리 이상은 관현악이며, 커다란 것이다. <br>
                그들에게 설레는 보이는 얼마나 거친 날카로우나 하이름은 귀요미 입니다.
            </div>
        </div> 

        <br><br>
        
        <!-- 신고하기 버튼 영역 -->
        <div class="report-area" align="right">
    
            <button onclick="" data-toggle="modal" data-target="#reportModal">신고하기</button>
            <br><br>
        </div>

        <!-- 신고하기 버튼 클릭시 보여질 Modal -->
        <div class="modal" id="reportModal"> 
            
            <form action="">
                <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                <div id="report-title">
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
                        <button id="report-btn" class="btn btn-secondary" style="margin: auto;">신고하기</button>
                    </div>


                    <!-- 라디오버튼 value값 수정시 script에 사용된 val 같이 수정하기 -->
                    <!-- Modal안에서 보여져야할 내용이라 여기에 넣었어요!! -->
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
                
        <!--본문내용 - 댓글 구분선-->
        <hr width="1000px">
        
        <div class="comment-area">
            <div class="comment">
                <table>
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
                        <td><button class="fontBtn">답글</button></td>
                        <!--답글 작성자에게만 노출-->
                        <td><button class="fontBtn">수정</button></td>
                        <!--답글 작성자에게만 노출-->
                        <td><button class="fontBtn">삭제</button></td>
                    </tr>                    
                </table>
            </div>

        
            <div class="recomment">
                <table style="margin-top: 10px;">
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
                <table>
                    <tr>
                        <td width="80"></td>
                        <!--사용자가 입력한 답글 내용-->
                        <td colspan="4" class="content" width="770" style="font-weight: 900;">감사합니다. 행복하게 살게요.</td>
                        <!--클릭 시 댓글 작성란이 답글 작성으로 변경-->
                        <td><button class="fontBtn">답글</button></td>
                        <!--답글 작성자에게만 노출-->
                        <td><button class="fontBtn">삭제</button></td>
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
            <br>
        </div>

        <div class="befAft" align="center">
            
            <div><!-- 이전글 다음글-->
                <table class="table"style="width: 1100px;">
                
                    <!-- 한 줄 영역으로 클릭 효과 주기 -->
                    <tbody>
                        <tr>
                            <td width="100">이전글</td>
                            <td width="700">[실종]멍멍이 찾아요ㅠㅠ</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr>
                            <td width="100">다음글</td>
                            <td width="700">[보호]야옹이를 보호하고있어요 !</td>
                            <td width="150">YYYY-MM-DD</td>
                            <td width="100">조회수</td>
                        </tr>
                        <tr>
                            <!-- 구분선용 공백란 -->
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

            </div>

            <button>목록으로</button>
            <button>공유하기</button>
        </div>
        <br><br><br><br><br>
        <%@ include file="../common/footerbar.jsp" %>
    </div>

</body>
</html>