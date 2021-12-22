<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dashi.entranceBoard.model.vo.Entrance"%>
<%
	ArrayList<Entrance> list = (ArrayList<Entrance>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*outer 스타일*/
    .outer{
        
        width: 1100px;
        margin: auto;
        margin-top: 50px;
        height:900px;

    }
    /*찜하기 스타일*/
    #name{
        width: 100%;
        font-size: 24px;
        line-height: 50px;
        font-weight: 900;
    }
    /* 전체 찜리스트를 감싸는 div*/
    .likeList-area{
        width: 1140px;
        margin: auto;
        margin-top: 20px;
    }
    #category{
        margin-left: 5px; 
        width: 50px; 
        font-weight: 700;
    }
    /*각각의 리스트 스타일*/
    .likeList-area>.list{
        width: 250px;
        height: 300px;
        display:inline-block;
        margin-left: 17px;
    }


    /*사진 밑에 동물종류 및 입양공고제목 정렬스타일*/

    .likeList-area .list{
        display: inline-block;
    }

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
   	#boardlist-ent{
	font-weight:900px;
   	color:rgb(252, 186, 3);
   	background: rgb(32, 68, 28);
	}
    #mem-boardlist{
       background: rgb(32, 68, 28);
       color: orange;
    }



</style>
</head>
<body> 
    <%@ include file="../common/menubar.jsp" %> 
   

    <div class="outer">
                <!--게시판 안내-->
                <div id="name">
                    	입소신청목록
                    <hr>
                </div>
        
                <!--회원정보 메뉴바-->
                <div>
                    <%@ include file="../common/memberUpdateMenubar.jsp" %>
                    <br><br>
                </div>

                <!--전체 찜목록-->
                <div class="likeList-area">
                    
   					<% if(list.isEmpty()){ %>
   					<div class="img-wrap">
                                            조회된 입소신청글이 없습니다.
                    </div>
   					<% }else{ %>
   					
   					<% for(Entrance e : list){ %>
                    <div class="list">
                        <div class="img-wrap">
                        	<input type="hidden" value=<%=e.getEntNo()%>>
                            <img src="<%=contextPath%>/<%=e.getTitleimg()%>" width="250" height="260">
                        </div>
                        <p>
                            <span id="category" class="badge badge-primary"><%=e.getProcessResult()%></span> 
                            <span><%=e.getEntTitle()%></span>
                        </p>
                    </div>
                    <% } %>
					<% } %>

                </div>   


    </div>
    <br><br><br><br>
	
		<script>
			$(function(){
				$(".img-wrap").click(function(){
					location.href = "<%=contextPath%>/entDetail.ent?eno=" + $(this).children("input").val();
				})
			})
		</script>



    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>