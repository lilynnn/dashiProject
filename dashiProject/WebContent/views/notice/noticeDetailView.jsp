<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dashi.notice.model.vo.Notice, com.dashi.common.model.vo.*"%>
<%
	Notice n = (Notice)request.getAttribute("n");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1100px;
        height: 1500px;
        margin: auto;
        margin-top: 50px;
    }
    .outer>div{
        box-sizing: border-box;
        float: left;
    }
    /*게시판 이름*/
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
    }
    /*본문*/
    #noContent{
        width: 100%;
        height: auto;
    }
    /*글넘기기*/
    #befAft{margin-top: 50px; margin-bottom: 20px;}
    #befAft>div{
        float: left;
        box-sizing: border-box;
        text-align: center;
        border-top: 1px solid silver;
        border-bottom: 1px solid silver;
        height: 30px;
        line-height: 30px;
    }
    /*목록으로 버튼*/
    #btn{width: 100%;}
    #btn>button{
        border-radius: 10px;
        border: none;
        width: 80px;
        height: 30px;
        background: rgb(143,153,142);
    }
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp"%>


    <div class="outer">
        <!--게시판 이름-->
        <div id="name">
            공지사항
            <hr>
        </div>

        <!--제목, 등록일, 조회수-->
        <div id="title"><%=n.getNoticeTitle()%></div>
        <div class="dateView">등록일</div>
        <div class="dateView" style="width: 120px;"><%=n.getWriteDate()%></div>
        <div class="dateView">조회수</div>
        <div class="dateView" style="width: 900px;"><%=n.getViewCount()%></div>
        
        <!--본문-->
        <div id="noContent">
            <hr>
            <p><%=n.getNoticeContent() %></p>
        </div>
        <div style="width:100%;">
        	<% if(at == null){ %>
        		<hr>
        		첨부파일이 없습니다.
        	<% }else{ %>
        		<hr>
        		<a download="<%=at.getOriginName()%>" href="<%=contextPath%>/<%=at.getPath() + at.getChangeName()%>"><%=at.getOriginName()%></a>
        	<% } %>
        </div>

        <div id="btn" align="center">
            <button onclick="location.href='<%=contextPath%>/list.no?cpage=1';">목록으로</button>
        </div>


    </div>

    <%@ include file="../common/footerbar.jsp"%>

</body>
</html>