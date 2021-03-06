<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList, com.dashi.adoptBoard.model.vo.AdoptNotice, com.dashi.adoptReviewBoard.model.vo.AdoptReview" %>   
 <%
 	ArrayList<AdoptNotice> anList = (ArrayList<AdoptNotice>)request.getAttribute("anList");
 	ArrayList<AdoptReview> arlist = (ArrayList<AdoptReview>)request.getAttribute("arlist");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다시,사랑받개!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    div{box-sizing: border-box;}
   
    /* 메인페이지 전체 감싸는 div */
    .outer{
        margin: auto;
        margin-top: 50px;
        width: 1200px;
        padding-bottom: 80px;
    }

    /* 메인 이미지 영역 스타일 */
    .image-area{
        width: 700px;
        margin: auto;
    }
    .carousel-inner img {
    width: 100%;
    height: 100%;
  }

    /* 입양 공고 영역 스타일 */
    .adopt-area{
        width: 1100px;
        margin: auto;
        height: 220px;
    }
    .notice-box{
        width: 210px; 
        height: 220px;
        float: left;
        margin-left: 9px;
    }
    
    
    /*이미지 공통 사이즈*/
    .photo-area>img{
        width: 195px; 
        height: 200px;
    }

    /* 입양 후기 영역 스타일 */
    .review-area{
        width: 1100px;
        margin: auto;
        height: 200px;
    }
    .review-box{
   		width: 210px; 
        height: 220px;
        float: left;
        margin-left: 9px;
    }

    /* 입양공고,입양후기 타이틀 영역 스타일 */
    .title{ 
       margin-top: 50px;
       padding-left: 20px;
    }
    .title>b{
        margin-left: 50px;
        text-decoration: none;
        color: black;
        font-size: 25px;
    }
    .title>a:hover{
        text-decoration: none;
        color: black
    }
    
    /*글씨 중략해서 보여지게*/
     #noticeTitle{
        font-size: 14px; 
        width:180px;
        overflow: hidden;
        text-overflow: ellipsis; 
        white-space: nowrap;

    }
	
	.notice-box:hover{
		cursor: pointer;
	}
	
</style>
</head>
<body>

	<%@ include file="views/common/menubar.jsp" %>

    <div class="outer">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
              <li data-target="#demo" data-slide-to="0" class="active"></li>
              <li data-target="#demo" data-slide-to="1"></li>
              <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            
            <div class="carousel-inner" align="center">
                <div class="carousel-item active">
                    <img src="resources/images/testimg.jpg" alt="" style="width: 900px;">
                </div>
                <div class="carousel-item">
                    <img src="resources/images/testimg2.jpg" alt="" style="width: 900px;">
                </div>
                <div class="carousel-item">
                    <img src="resources/images/testimg3.jpg" alt="" style="width: 900px;">
                </div>
            </div>

            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <!-- 하단 타이틀 눌렀을 때 입양공고 메인페이지로 이동 -->
        <div class="title">
   		<b>입양 공고</b>
   		<a href="<%=contextPath %>/adlist.adt?cpage=1" style="font-size:13px; color:darkgray;"> 더보기+ </a>
   		</div>
        <hr style="width: 1100px; margin-top: 10px;">
        <!-- 입양 공고 게시글 띄우는 영역 -->
        <div class="adoptNotice">
            <%if(anList.isEmpty()) {%>
            <div style="margin-top:150px; height:100px;" align="center">입양공고글이 존재하지 않습니다.</div>
            <%} else { %>
            	<%for(AdoptNotice an : anList) {%>
		            <div class="notice-box" align="center">
		            	<input type="hidden" value=<%=an.getAnlistNo() %>>
		                <div class="photo-area"><img src="<%=an.getTitleImg() %>"></div>
		                <div id="noticeTitle"><%=an.getAnTitle() %></div>
		            </div>
            	<%} %>
            <%} %>
        </div>
        
        <script>
        
        	window.onload = function(){

        		// 입양공고, 입양후기 div
        		var adoptNotice = document.getElementById("adoptNotice");
        		var adoptRewiew = document.getElementById("adoptReview");

        		$.ajax({
        			url:"newadoptNotice.me",
        			success:function(data){
        				let value = "";
        				for(let i in data){

        					value += "<div class='notice-box' align='center'>"
        					   + "<input type='hidden' value='" + data[i].getAnlistNo+"'>"
							   + "<div class='photo-area'><img src='" + data[i].getTitleImg +"'></div>"
							   + "<div id='noticeTitle'>" + data[i].getAnTitle +"</div>"
    						   + "</div>";
        				}
        				adoptNotice.innerHTML = value;
        			}, error:function(){
        				console.log("메인페이지 new AdoptNotice ajax 통신 실패");
        			}
        		})
        		
				$.ajax({
        			url:"newadoptReview.me",
        			success:function(data){
        				let value = "";
        				for(let i in data){

        					value += "<div class='notice-box' align='center'>"
        					   + "<input type='hidden' value='" + data[i].getArlistNo+"'>"
							   + "<div class='photo-area'><img src='" + data[i].getTitleImg +"'></div>"
							   + "<div id='noticeTitle'>" + data[i].getArTitle +"</div>"
    						   + "</div>";
        				}
        				adoptReview.innerHTML = value;      				
        			}, error:function(){
        				console.log("메인페이지 new AdoptReview ajax 통신 실패");
        			}
        		})
        	
        		$(".notice-box").click(function(){
        			console.log($(this).children().eq(0).val());
        			location.href='<%=contextPath%>/addetail.adt?adtno=' + $(this).children().eq(0).val();
       			})
        	}

        </script>
       
        
        <!-- 하단 타이틀 눌렀을 때 입양후기 메인페이지로 이동 -->
        <div class="title">
        <b>입양 후기</b>
        <a href="<%=contextPath%>/list.ar?cpage=1" style="font-size:13px; color:darkgray;"> 더보기+</a>
        </div>
        <hr style="width: 1100px; margin-top: 10px;">
        
        <!-- 입양 후기 게시글 띄우는 영역 -->
        <div class="review-area">
            <%if(arlist.isEmpty()) {%>
            <div style="margin-top:150px; height:100px;" align="center">입양후기가 존재하지 않습니다.</div>
            <%} else { %>
            	<%for(AdoptReview ar : arlist) {%>
		            <div class="reviewlist" align="center" style="float:left; padding:10px;">
		            	<input type="hidden" value=<%=ar.getArlistNo() %>>
		                <div class="photo-area"><img src="<%=ar.getTitleImg() %>"></div>
		                <div id="noticeTitle" style="margin-top:10px;"><%=ar.getArTitle() %></div>
		            </div>
            	<%} %>
            <%} %>
        </div>
        <script>
        	$(function(){
        		$(".reviewlist").click(function(){
        			console.log($(this).children().eq(0).val());
        			location.href='<%=contextPath%>/detail.ar?arno=' + $(this).children().eq(0).val();
        		})
        	})
        </script>
        
        <br><br>
    </div>
	
    <%@ include file="views/common/footerbar.jsp" %>
</body>
</html>