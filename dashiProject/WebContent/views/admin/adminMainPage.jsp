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
    
    <!--????????? ????????? ??? div-->
    <div class="outer">
    
    	<div id="menubar">
    		<%@ include file="adminMenubar.jsp" %>
    	</div>

        <!--???????????????????????? ????????? ??????????????????-->
        <div id="menu">
        	<hr>
            <div id="message">
                <div style="width: 25%; font-size: 24px; font-weight: 900; line-height:50px">
                    	????????? ???????????????
                </div>
                <div style="text-align: left; width: 50%; font-size: 15px; color: lightslategrey; line-height:55px">
                    	????????????, ????????? ?????? ?????? ????????????!
                </div>

                <!--admin01?????????????????? ?????????-->
                <% if(loginAdmin != null && loginAdmin.getMnId().equals("admin01")){ %>
                <div style="text-align: right; width: 100px; line-height: 60px;">
                    <img src="<%=contextPath%>/resources/images/bulb.png" width="15%">
                    <a href="<%=contextPath%>/empList.ad?cpage=1">????????????</a>
                </div>
                <% } %>
                
                <!-- ????????? ???????????? ???????????? -->
                <% if(loginAdmin != null){ %>
                <div style="width: 90px; line-height: 60px; text-align: right;">
                <a href="<%= contextPath %>/logout.me">????????????</a>
                </div>
                <% } %>
            </div>
				

            <!--?????? ?????????, ?????????????????? ????????? ???????????????-->
            <div id="boxset">

                <div class="box" style="background: #cce9d3;">
                    <div class="countNum">
                        <%=adpCount %>
                    </div>
                    <div>????????????</div>
                </div>
                <div class="box" style="background: #abd1a4;">
                    <div class="countNum">
                       	 <%=entCount%>
                    </div>
                    <div>????????????</div>
                </div>
                <div class="box" style="background: #91c5ab;">
                    <div class="countNum">
                       	 1
                    </div>
                    <div>1:1??????</div>
                </div>
                <div class="box" style="background: #74947d;">
                    <div class="countNum">
                       	 <%=noCount%>
                    </div>
                    <div>????????????</div>
                </div>
            </div>

            <!--??? ????????? ????????? ????????? div??? table?????????-->
            <div id="adminlist1">
                <div>
                    <div style="font-size: 20px; font-weight:550;">????????????</div>
                    <hr>
                    <div>
                        <table>
                            <tr>
                                <td style="width: 150px;"><a href="<%=contextPath%>/memberlist.ad?cpage=1">??????????????????</a></td>
                                <td class="categoryDate">2021/12/27</td>
                            </tr>
                            <tr>
                                <td style="width: 150px;"><a href="">?????????????????????</a></td>
                                <td class="categoryDate">2021/12/27</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">??????????????????</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/adplist.ad?cpage=1">????????????</a></td>
                                <td class="categoryDate">2021/12/20</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/entListView.ad?cpage=1">????????????</a></td>
                            <td class="categoryDate"><%=entDate%></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">???????????????</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/noList.ad?cpage=1">????????????</a></td>
                            <td class="categoryDate"><%=noDate%></td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/adlist.ad?cpage=1">????????????</a></td>
                            <td class="categoryDate">2021/12/20</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/reviewlist.ad?cpage=1">????????????</a></td>
                            <td class="categoryDate">2021/12/27</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/adlist.dsp">??????/??????/??????</a></td>
                            <td class="categoryDate">2021/12/28</td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><a href="">1:1??????</a></td>
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
                    <div style="font-size: 20px; font-weight:550;">??????????????????</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/reportList.ad?cpage=1">??????????????????</a></td>
                            <td class="categoryDate">2021/12/20</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">??????????????????</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="">??????????????????</a></td>
                            <td class="categoryDate">2021/12/21</td>
                        </tr>
                    </table>
                </div>
                <div>
                    <div style="font-size: 20px; font-weight:550;">????????????</div>
                    <hr>
                    <table>
                        <tr>
                            <td style="width: 150px;"><a href="<%=contextPath%>/anlist.ad?cpage=1">??????????????????</a></td>
                            <td class="categoryDate"><%=aniDate %></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>


	<div class="footer">
	<!-- footerbar?????? -->
	<%@ include file="../common/footerbar.jsp" %>
	</div>
	
	
</body>
</html>