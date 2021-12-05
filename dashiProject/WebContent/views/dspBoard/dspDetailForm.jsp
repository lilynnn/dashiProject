<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        border: 1px solid red;
    }

    /*전체를 감싸는 틀*/
    .outer{
        border: 1px solid black;
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        height: 3000px;
    }

    /*제목 및 작성일 */
    .title{
        margin-top: 20px;
        margin-left: 30px;
        margin-bottom: 20px;
    }

    /*동물사진 및 작성자가 쓴글*/        
    .animal-image, .dspConent{
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
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <hr>
        <table class="title" border="1px">
            <tr style="font-size: 15px;">
                <th style="text-align: right;">[실종]</th>
                <th >귀요미를 찾습니다.</th>
            </tr>
            <tr>
                <td>작성일 2021-11-13</td>
                <td align="center">조회수 89</td>
            </tr>
        </table>
        <hr>
    

        <!--실종 보호 목격 정보글-->    
        <div class="Info_outer1" align="center" style="margin-top: 30px;">

            <div class="animal-image" >
                동물사진입니다.
            </div>

            <div>
                <table class=animalInfo border="1">
                    <tr>
                        <th>묘종/견종</th>
                        <td>믹스견</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>암컷</td>
                    </tr>
                    <tr>
                        <th>실종날짜</th>
                        <td>2021-11-14</td>
                    </tr>
                    <tr>
                        <th>지역</th>
                        <td>서울시 강남구</td>
                    </tr>
                    <tr>
                        <th>사례금</th>
                        <td>5억</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>010-1111-2222</td>
                    </tr>
                    <tr>
                        <th>특징</th>
                        <td>코 옆 까만점,입주변 하연털</td>
                    </tr>
                </table>

            </div>



        </div>  
        
        

        <div class="Info_outer2">
            <div class= "animal-image">동물사진</div>
            <div class= "animal-image">동물사진</div>
            <div class= "dspConent" style="text-align: center; font-size: 17px;"> 
                무한한 길지 있는 풍부하게 힘있다. 실현에 못할 밝은 같이, 이상의 운다. 동력은 얼마나 많이 칼이다. <br>
                소금이라 심장은 원질이 인간은 황금시대의 때문이다. 때까지 이상 끓는 설레는 청춘의 인생을 풀이 아름다우냐? <br>
                이상의 타오르고 대중을 귀는 밥을 찬미를 사막이다. 품고 같은 대중을 우리 이상은 관현악이며, 커다란 것이다. <br>
                그들에게 설레는 보이는 얼마나 거친 날카로우나 하이름은 귀요미 입니다.
            </div>
        </div> 


        
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
    </div>





</body>
</html>