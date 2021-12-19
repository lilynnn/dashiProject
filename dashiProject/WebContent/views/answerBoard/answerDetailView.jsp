<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의관리</title>
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
    /*왼쪽메뉴바*/
    #munubar{width:150px}
    /*공지사항시작*/
 	#adminNoticeList{
         margin-left: 30px;
         width: 850px;
    }
    #adminNoticeList div{float: left;}
    /*검색창*/
    #search{width: 200px;}
    #btn{
        width: 650px;
    }
    #btn>button{
        border-radius: 5px;
        border: white;
        width: 60px;
        font-size: 13px;
    }
    thead, tbody{
        text-align: center;
    }
    table{ 
        border-top:1px solid;
        border-bottom: 1px solid;    
    }
    thead{background: rgb(224, 223, 223);}
    
    /*타이틀 정리*/
    #title{
        width: 100%; 
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }
    #searchbtn{
    background: rgb(102,184,94);
    font-size: 13px;
    border: none;
    border-radius: 5px;
    color: #fff;
    display: inline-block;
    font-weight: bold;
    position: relative;
    text-transform: uppercase;
    padding: 5px;
    }

    .checkState{
        border-radius: 10px;
        }
    #answ{
    font-size:15px;
    background: rgb(102,184,94);
    border: none;
    border-radius: 5px;
    color: #fff;
    display: inline-block;
    font-weight: bold;
    position: relative;
    text-transform: uppercase;
    
    }
        
</style>
</head>
<body>
    
    <%@ include file="../common/menubar.jsp" %>
    
    <!--전체를 감싸는 큰 div-->
    <div class="outer" >
    
                <div id="title">
                    	1:1 문의 관리
                <hr style="width: 950px;">
                </div>
			<% if(loginUser != null) { %>
			
	        <!--로그인한 회원만 보여지는 div-->
	        <div align="right" style="width:860px">
	            <a href="<%= contextPath %>/enrollForm.bo" class="btn btn-sm btn-secondary">글작성</a>
	            <br><br>
	        </div>
        <% } %>
        
            <!-- 1:1 목록-->
        <div id="answerlist" >
        	
        	<form action="<%= contextPath %>/select.as" method="post">

                <!-- 카테고리 및 검색창-->
                 <div class="search-area" style="margin: 20px 0px; display:inline-block;">
                    <select name="search-category" style="height: 30px; margin: 5px;">
                        <option value="">카테고리</option>
                        <option value="입양문의">입양문의</option>
                        <option value="입소문의">입소문의</option>
                        <option value="실종문의">실종문의</option>
                        <option value="로그인관련">로그인관련</option>
                        <option value="결제문의">결제문의</option>
                        <option value="기타문의">기타문의</option>
                    </select>

                    <input type="text" placeholder="검색어를 입력하세요.">
                    
                    <button id="searchbtn" style="margin: 5px; padding-left: 10px;padding-right: 10px;">검색</button>
                </div>
                
                <div id="btn" align="right"; style="display: inline-block;" >
                    <button>수정</button>
                    <button>삭제</button>
                </div>

                
                   <table align="center" class="table" width="900px">
                        <thead>
                            <tr>
                                <td></td>
                                <th>No.</th>
                                <th>이름</th>
                                <th>분류</th>
                                <th width="500">제목</th>
                                <th>작성일</th>
                                <th width="100"> 상태 </th>
                                <th width="100"> 답변 </th>


                            </tr>
                        </thead>
                        <tbody>
                                
        <tr> <!-- 아이디 -->
            <th  width=220 colspan="2">아이디 <b>*</b></th> 
            <td  width=780><input type="text" style="width: 690px" name="Id" value="" placeholder="아이디를 입력해주세요." required></td>
        </tr>
        <tr> <!-- 제목 -->
            <th width=220 colspan="2">제목<b>*</b></th>
            <td width=780><input type="text" style="width: 690px" name="qTitle" value="" placeholder="제목을 입력해주세요." required></td>
        </tr>
        <tr style="margin-bottom:30px;" > <!-- 문의내용 -->
            <th width=220 colspan="2" rowspan="2">문의내용 <b>*</b> </th>
            <td width=780><textarea name="qContent" placeholder="내용 입력" cols="35" rows="10" style="resize:none; width:690px;" required></textarea></td>
        </tr>

			
                        </tbody>
                    </table>

            </form>
        	
        	
                    <div align="center" style="margin-top: 30px;">
                        <button class="btn btn-light">&lt;</button>
                        <button class="btn btn-light">1</button>
                        <button class="btn btn-light">2</button>
                        <button class="btn btn-light">3</button>
                        <button class="btn btn-light">4</button>
                        <button class="btn btn-light">&gt;</button>
                    </div>
        	
        	
        </div>
    </div>

	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>