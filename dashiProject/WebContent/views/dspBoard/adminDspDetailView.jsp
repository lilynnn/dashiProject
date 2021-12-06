<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{

        width: 1200px;
        height: 1600px;
    }
    .outer>div{
        float:left;
        box-sizing: border-box;
    }

    .content-area{
         width: 850px;
         margin-left: 20px;
    }
  
    #title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        margin-left: 20px;
     
    }
    /*안에 내용의 전체틀*/
    #animalInfo-outer{
        margin: auto;
        width: 700px;
    }

    #title{
        font-size: 20px;
        font-weight: 600;
    }

    #animal-image{
        border: 1px solid blue; /*나중에 지울것*/
        width:450px;
        height: 300px;
        margin: auto;
        margin-top: 30px;
        margin-bottom: 30px;
    }


    /*테이블간격 없애기*/
    table{border-collapse: collapse;}



    /*정보 테이블의 th요소 스타일*/
    table th{
        background: rgb(236, 236, 236);
		font-size: 15px;
        width: 250px;
        height: 25px;
    }

    /*정보 테이블의 td요소 스타일*/
    table td{
		font-size: 15px;
        width: 400px;
    }


    /*확인 버튼 스타일*/
    button{
        background-color: rgb(78, 76, 76);
        color:white;
        font-size: 15px;
        width: 75px;
        height: 35px;
        border-radius: 3px;
        border:none;
        margin-left:46%;
    }


</style>
</head>
<body>
    <div class="outer">
        
        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>

        <div class="content-area">
            <div id="title-area">
                실종/보호/목격글 상세보기
            </div>
            <hr><br>


            <!--실종/보호/동물에 대한 정보(사진 정보) 틀-->
            <div id="animalInfo-outer">
               
                <!--제목-->
                <div id="title">
                    [강아지] 실종 믹스견
                </div>

                <!--사진-->
                <div id="animal-image">
                   강아진 사진입니다. 
                </div>

                <!--동물, 기본정보 정보-->
                <div>
                    <div style="font-size: 17px;">
                        동물정보
                    
                    </div>
                    <!--동물정보-->
                    <div>
                        <table id="animal-Info" border="">
                            <tr>
                                <th>성 별</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>나 이</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>몸무게</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>중성화</th>
                                <td></td>
                            </tr>
                        </table>
                    </div><br>
                    <!--기본정보-->
                    <div style="font-size: 17px;">
                        기본정보
                    </div>
                    
                    <table id="basic -Info" border="">
                        <tr>
                            <th>날 짜</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>장 소</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>특 징</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>기 타</th>
                            <td></td>
                        </tr>

                    </table><br><br><br><br>

                    <button>확인</button>
                </div>
            </div>





































        </div>
    </div>

</body>
</html>