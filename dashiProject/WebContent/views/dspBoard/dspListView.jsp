<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , com.dashi.dspBoard.model.vo.Dsp"%>
    
<%
	ArrayList<Dsp> list = (ArrayList<Dsp>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    .outer{

        margin: auto;
        margin-top: 50px;
        width: 1200px;
        height: auto;
    }
    .image-area{
        width: 1100px;
        height: 110px;
        margin: auto;
        border: 1px solid black;
    }
    .dsp{
        display: table-cell;
        width: 60px;
        height: 50px;
    }
    .dsp a{
        text-decoration: none;
        color: black;
        font-size: 22px;
        font-weight: bold;
        line-height: 50px;
    }
    .dsp-nav a:hover{
        color:rgb(102,184,94);
    }

    .search-area{
        text-align: right;
        width: 1150px;
        margin-top: 30px;
    }
    .write{
        text-align: right;
        width: 135px;
        margin-top: 30px;
    }
    .writeBtn{
        border: none;
        background: rgb(102,184,94);
        color: white;
        width: 80px;
        height: 35px;
        font-size: 15px;
        font-weight: bold;
        border-radius: 3px;
    }

    #searchBtn{
        border-radius: 5px;
        border: none;
        height: 32px;
    }
    #searchBtn:hover{
        background: rgb(126, 126, 126);
    }

    .dspList-area{
        width: 1150px;
        margin: auto;
        margin-top: 30px;
        
    }

    .dspList-area>.list{
        width: 250px;
        height: auto;
        display:inline-block;
        margin-left: 25px;
        margin-bottom: 25px;
    }

    /*정해진 구간에서 확대할수 있게*/

    .img-wrap {
    overflow: hidden;
  }
    
    .list:hover img{
        cursor: pointer;
        transform: scale(1.05);
        transition-duration: 0.3s;
        /* 이게 크롬에서 실행 할수 있게
        -webkit-transition-duration: 0.3s;*/
    }    
    .list:hover p{
        cursor: pointer;
        text-decoration: underline;
 
    }

    /*pagingbar*/
    .paging-area{
        width: 100%;
        margin-top: 30px;
    }
    .paging-area>button{
    	border-radius:3px;
    	border:none;
    }

</style>
</head>

<!-- AJAX활용해서 실중누르면 실종글만 보호누르면 보호글만 목격 누르면 목격글만하기-->
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <div class="image-area" >
            이미지
        </div>
        
        <div class="dsp-nav" align="center" style="margin-top:30px;">
            <div class="dsp"><a href="">실종</a></div>
            <div class="dsp"><a href="">보호</a></div>
            <div class="dsp"><a href="">목격</a></div>
        </div>


        <div class="search-area">
            <form action="">

                <select name="animal-category">
                    <option value="dog">강아지</option>
                    <option value="cat">고양이</option>
                    <option value="etc">기타</option>
                </select>

                <input type="search" placeholder="검색어를 입력하세요." style="border: 1px solid black;">
                
                <button id="searchBtn">검색하기</button>
            </form>
        </div>
        <%if(loginUser != null){ %>
        	<div class="write"><button class="writeBtn">글쓰기</button></div>
		<%} %>
        <div class="dspList-area">
        
        	<%if(list.isEmpty()){ %>
	            <!-- case 1. 조회된 게시글이 없을경우-->
	            <p style="text-align: center;">조회된 게시글이 없습니다.</p>
			<%}else{ %>
            <!-- case 1. 조회글이 있을경우-->
            <!--for문 돌려서 썸네일 여러개 만들거임-->
				<%for(Dsp d:list) {%>
		            <div class="list">
		                <div class="img-wrap">
		                   <img src="<%=contextPath%>/<%= d.getTitleImg() %>" width="250" height="260"> 
		                </div>
		                
		                <p>
		                    <span style="color: red; font-weight: bold;">[<%=d.getCtg() %>]</span> <%=d.getDspTitle() %><br><br>
		                    <span style="color: red; font-weight: bold;">사례금 : <%=d.getMoney() %> </span> / <%=d.getLocationName() %><br>
		                   		<%=d.getIssue() %>
		                </p>
		            </div>
	            <%} %>
            <%} %>

        </div>



        <!-- 페이징바 영역 -->
        <div class="paging-area" align="center">

            <button class="btn btn-light">&lt;</button>
            <button class="btn btn-light">1</button>
            <button class="btn btn-light">2</button>
            <button class="btn btn-light">3</button>
            <button class="btn btn-light">4</button>
            <button class="btn btn-light">5</button>
            <button class="btn btn-light">&gt;</button>

        </div>
    </div><br>
    <br><br><br><br>

    <%@ include file="../common/footerbar.jsp" %>

    <script>
        // 나중에 수정하기!! => 글 번호에 맞춰서 연결하기
        $(function(){
            $(".dspList-area>div").click(function(){
                //const num = $(this).children().eq(0).text();

                //location.href = '<%= contextPath%>/detail?dspno='+num;
                location.href = '<%= contextPath%>/detail.dsp';
            })
        })
    </script>
    
    <!-- 글작성 클릭시 스크립트 -->
    <script>
        $(function(){
            $(".writeBtn").click(function(){
                location.href = '<%= contextPath%>/write.dsp';
            })
        })
    </script>
    
    
</body>
</html>