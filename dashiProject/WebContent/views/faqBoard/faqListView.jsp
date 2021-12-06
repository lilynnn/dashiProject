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
        height:800px
    }
    .outer>div{
        float: left; 
        box-sizing: border-box;
    }
    /*자주하는질문~노력하겠습니다div*/
    #name, #serve, #meno{margin-top: 10px; height: 50px;}
    #name{
        width: 250px;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    #serve{
        width: 450px;
        color: darkgray;
        line-height: 60px;
    }
    #meno{width: 700px;}
    #meno>div{
        width: auto;
        float: left;
        font-weight: 900;
    }
    #call{
        width: 200px;
        height: 100px;
        position: absolute;
        margin-left: 880px;
    }
    /*키워드 검색*/
    #kDiv{width: 100%;}
    .keyword{
        float: left;
        width: 80px;
        text-align: left;
        margin-bottom: 30px;
        font-size: 12px;
        font-weight: 600;
        color: rgb(84, 103, 121);
    }
    .keyword:hover{
        color:orange;
        cursor: pointer;
    }
    /*FAQ 목록*/
    #list>table{
        text-align: center;
    }
    thead>tr{height: 30px;}
    /*답변작업*/
    #question:hover{
        cursor: pointer;
    }
	#answer{
		display:none;
	}
    /*pagingbar*/
    .paging-area{
        width: 100%;
        margin-top: 30px;
    }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
    <%@ include file="../common/menubar.jsp" %>

    <!--전체 div-->
	<div class="outer">

        <!--게시판 안내-->
        <div id="name">
            자주 하는 질문(FAQ)
        </div>
        <div id="serve">| 자주 질문되는 내용입니다</div>
        <div id="meno">
            <div style="width: 70px;">고객님의</div>
            <div style="width: 306px; color:blue;">
                궁금증과 문제점을 신속하고 정확하게 해결
            </div>
            <div>하기 위해 노력하겠습니다.</div>
        </div>

        <!--상담전화카드-->
        <div id="call">
            <img src="<%=contextPath%>/resources/images/FAQphonecard.JPG" alt="상담전화카드 사진입니다." style="width:100%">
        </div>

        <!--키워드 검색-->
        <div id="kDiv">
            <div class="keyword">입양</div>
            <div class="keyword">입소</div>
            <div class="keyword">결제</div>
            <div class="keyword" style="width: 110px;">실종/보호</div>
            <div class="keyword">기타</div>
        </div>

        <!--FAQ 리스트-->
        <div id="list">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th width="60px">번호</th>
                        <th width="80px"></th>
                        <th width="700px">제목</th>
                        <th width="120px">날짜</th>
                        <th width="120px">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <!--FAQ 없을 때-->
                    <tr>
                        <td colspan="5">게시된 공지사항이 없습니다.</td>
                    </tr>
        
                    <!--FAQ 있을 때-->
                    <tr id="question">
                        <td>1</td>
                        <td></td>
                        <td>제목</td>
                        <td>2021-12-04</td>
                        <td>123</td>
                    </tr>

                    <!--FAQ 답변창-->
                    <tr id="answer">
                        <td colspan="5" style="background: #ecfafa;">
                            <div align="left">
                                <p>
                                   	커피는 역시 아이스카페라떼
                                <hr>
                                </p>
                                <p style="font-weight: 600;">
                                   	 네 저도 동의합니다.<br>
                                                                         시럽을 넣지 않아야 진정한 커피라고 할 수 있습니다.
                                </p>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="paging-area" align="center">

			아직 페이징바는 미완성 상태!
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>6</button>
            <button>7</button>
            <button>8</button>
            <button>9</button>
            <button>10</button>
            <button>&gt;</button>

        </div>

    </div>

    <script>
        $(function(){
            $("#question").click(function(){

                if($("#answer").css("display") == "none"){

                    $(this).siblings("#answer").slideUp();

                    // 보여지게끔
                    $("#answer").slideDown(800);

                }else{
                    // 사라지게끔
                    $("#answer").slideUp(800);

                }
            })
        })
    </script>

	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>