<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>    
    /*왼쪽 메뉴바 작업*/
    #aMenubar{
        width: 200px; 
        height: auto; 
        margin-top: 18px;
    }
    #menu-list{
        width: 100%;
        border: 1px solid #a3b6a0;
        background: white;
    }
    #menu-list>div, #menu-list li{
        height: 35px;
        line-height: 35px;
        text-align: center;
        
    }
    #menu-list>ul{
       margin: 0;
       padding: 0;
    }
    #menu-list a{
        width: 100%;
        height: 100%;
        display: block;
    }
    #member, #apply, #list, #report, #payment, #animal{
        background: #b9c9b6;
        border-bottom: 2px dashed #115206;
    }
    #fighting{
       width:150px;
       height:100px;
       border:1px solid black;
    }
    #menu-list>ul>li{
        list-style-type: none;
    }
    #menu-list>ul>li>a{
        text-decoration: none;
        color: black;
    }

    /* 입양신청 스타일 영역 */
    #adoptApply a{
        display: block;
        width: 100%;
        height: 100%;
        text-decoration: none;          
        color: black;
    }
</style>


</head>
<body>

	
    <!-- 관리자 메뉴바입니다-->
    <div id="adminMenu">
        
        <!--왼쪽메뉴바-->
        <div id="aMenubar">
        		
            <div style="width:200px; height:80px; margin-bottom:5px;">
            	<!-- servlet생성 후 경로수정 -->
                <a href="<%=request.getContextPath()%>/views/admin/adminMainPage.jsp">
                	<img src="<%=request.getContextPath()%>/resources/images/adminlogo.JPG" alt="관리자 로고입니다." style="width:100%">
                </a>
            </div>

            <div id="menu-list" style="height: 670px;">
        
                <div class="aMenu" id="member">회원관리</div>
                <ul>
                    <li><a href="" id="sel-mem">전체회원조회</a></li>
                    <li><a href="" id="sel-black">블랙리스트조회</a></li>
                </ul>
                
                <div class="aMenu" id="apply">신청내역관리</div>
                <ul>
                	<li id="adoptApply"><a href="<%= request.getContextPath()%>/adapplylist.ad">입양신청</a></li>
                    <li><a href="" id="sel-apply">입소신청</a></li>
                </ul>
                
                <div class="aMenu" id="list">게시글관리</div>
                <ul>
                    <li><a href="<%=request.getContextPath()%>/noList.ad" id="sel-notice">공지사항</a></li>
                    <li><a href="<%=request.getContextPath()%>/adlist.ad" id="sel-adopt">입양공고</a></li>
                    <li><a href="<%=request.getContextPath()%>/reviewlist.ad" id="sel-review">입양후기</a></li>
                    <li><a href="" id="sel-dsp">실종/보호</a></li>
                    <li><a href="" id="sel-question">1:1문의</a></li>
                    <li><a href="<%=request.getContextPath()%>/faqList.ad" id="sel-faq">FAQ</a></li>
                </ul>

                <div class="aMenu" id="report">신고내역관리</div>
                <ul>
                    <li><a href="<%=request.getContextPath()%>/reportList.ad" id="sel-report">전체신고내역</a></li>
                </ul>

                <div class="aMenu" id="payment">결제내역관리</div>
                <ul>
                    <li><a href="" id="sel-pay">전체결제내역</a></li>
                </ul>

                <div class="aMenu" id="animal">동물관리</div>
                <ul>
                    <li><a href="<%=request.getContextPath() %>/anlist.ad" id="sel-animal">전체동물조회</a></li>
                </ul>
         
         
            </div>
         
       </div>
   
    </div>
    



</body>
</html>