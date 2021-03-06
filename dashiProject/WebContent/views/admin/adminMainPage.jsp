<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.notice.model.vo.Notice"%>
<%
	int adpCount = (int)request.getAttribute("adpCount");
	int noCount = (int)request.getAttribute("noCount");
	int entCount = (int)request.getAttribute("entCount");
	 
	
	String noDate = (String)request.getAttribute("noDate");
	String adtDate = (String)request.getAttribute("adtDate");
	String adpDate = (String)request.getAttribute("adpDate");
	String aniDate = (String)request.getAttribute("aniDate");
	String entDate = (String)request.getAttribute("entDate");
	String reDate = (String)request.getAttribute("reDate");
	String faqDate = (String)request.getAttribute("faqDate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1100px;
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
    #munubar{width:150px}
    #menu{width: 850px; height: 100%; margin-left: 20px;}
    #message>div{
        float: left; 
        box-sizing: border-box;
        height: 60px;
    }
    #message>div>a{
        text-decoration:none;
        color: brown;
        font-weight: 900;
    }
    #boxset{width:100%;}
    #boxset>div{float: left;}
    .box{
        width: 200px;
        height: 220px;
        margin-top: 10px;
        margin-left: 10px;
        margin-bottom: 10px;
    }
    .box>div{
        width: 100%;
        height: 50%;
        text-align: center;
        font-weight: 900;
    }
    .countNum{
        line-height: 150px; 
        font-size: 40px;
    }
    .categoryDate{
        width: 150px; 
        text-align: right; 
        color: gray;
    }
    #adminlist1>div, #adminlist2>div{
        float: left;
        box-sizing: border-box;
        width: 250px;
        height: 200px;
        margin-left: 20px;
        margin-top: 20px;
    }
    #adminlist1 a, #adminlist2 a{
        text-decoration: none; 
        color: black;
    }
    .footer{
    margin-top : 90px;
    
    }
</style>
</head>
<body>
    
    <%@ include file="../common/menubar.jsp" %>
    
    <!--전체를 감싸는 큰 div-->
    <div class="outer">
    
    	<div id="menubar">
    		<%@ include file="adminMenubar.jsp" %>
    	</div>

        <!--관리자메인페이지 안내와 메세지입니다-->
        <div id="menu">
        	<hr>
            <div id="message">
                <div style="width: 25%; font-size: 24px; font-weight: 900; line-height:50px">
                    	관리자 메인페이지
                </div>
                <div style="text-align: left; width: 50%; font-size: 15px; color: lightslategrey; line-height:55px">
                    	관리자님, 오늘도 좋은 하루 보내세요!
                </div>

                <!--admin01로그인시에만 나타남-->
                <% if(loginAdmin != null && loginAdmin.getMnId().equals("admin01")){ %>
                <div style="text-align: right; width: 100px; line-height: 60px;">
                    <img src="<%=contextPath%>/resources/images/bulb.png" width="15%">
                    <a href="<%=contextPath%>/empList.ad?cpage=1">사원관리</a>
                </div>
                <% } %>
                
                <!-- 관리자 로그아웃 임시방편 -->
                <% if(loginAdmin != null){ %>
                <div style="width: 90px; line-height: 60px; text-align: right;">
                <a href="<%= contextPath %>/logout.me">로그아웃</a>
                </div>
                <% } %>
            </div>
				

            <!--색깔 박스들, 게시글카운트 가져올 부분입니다-->
            <div id="boxset">

                <div class="box" style="background: #cce9d3;">
                    <div class="countNum">
                        <%=adpCount %>
                    </div>
                    <div>입양신청</div>
                </div>
                <div class="box" style="background: #abd1a4;">
                    <div class="countNum">
                       	 <%=entCount%>
                    </div>
                    <div>입소신청</div>
                </div>
                <div class="box" style="background: #91c5ab;">
                    <div class="countNum">
                       	 1
                    </div>
                    <div>1:1문의</div>
                </div>
                <div class="box" style="background: #74947d;">
                    <div class="countNum">
                       	 <%=noCount%>
                    </div>
                    <div>공지사항</div>
                </div>
            </div>

            <!--각 게시판 링크로 연결될 div랑 table입니다-->
            <div id="adminlist1">
                <div>
                    <div style="font-size: 20px; font-weight:550;">회원관리</div>
                    <hr>
                    <div>
                        <table>
                            <tr>
                                <td style="width: 150px;"><a href="<%=contextPath%>/memberlist.ad?cpage=1">전체회원조회</a></td>
                                <td class="categoryDate">2021/12/27</td>
                            </tr>
                            <tr>
                                <td style="width: 150px;"><a href="">블랙리스트조회</a></td>
                                <td class="categoryDate">2021/12/27</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">신청내역관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/adplist.ad?cpage=1">입양신청</a></td>
                                <td class="categoryDate">2021/12/20</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/entListView.ad?cpage=1">입소신청</a></td>
                            <td class="categoryDate"><%=entDate%></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">게시글관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/noList.ad?cpage=1">공지사항</a></td>
                            <td class="categoryDate"><%=noDate%></td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/adlist.ad?cpage=1">입양공고</a></td>
                            <td class="categoryDate">2021/12/20</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/reviewlist.ad?cpage=1">입양후기</a></td>
                            <td class="categoryDate">2021/12/27</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/adlist.dsp">실종/보호/목격</a></td>
                            <td class="categoryDate">2021/12/28</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="">1:1문의</a></td>
                            <td class="categoryDate">2021/12/28</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/faqList.ad">FAQ</a></td>
                            <td class="categoryDate"><%=faqDate%></td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <div id="adminlist2">
                <div>
                    <div style="font-size: 20px; font-weight:550;">신고내역관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/reportList.ad?cpage=1">전체신고내역</a></td>
                            <td class="categoryDate">2021/12/20</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">결제내역관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="">전체결제내역</a></td>
                            <td class="categoryDate">2021/12/21</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">동물관리</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/anlist.ad?cpage=1">전체동물조회</a></td>
                            <td class="categoryDate"><%=aniDate %></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>


	<div class="footer">
	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>
	</div>
	
	
</body>
</html>