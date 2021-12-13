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
        height: 800px;
        margin: auto;
        margin-top: 50px;
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
    #dsplist-outer{
        margin-left: 20px;
        width: 800px;
    }
    /*작성목록 스타일*/
    #dspList{
        font-size: 20px;
        font-weight: 600;
        background-color: rgb(235, 234, 234);
    }

    #enroll-Btn{   
        margin-left: 720px;
        
    }

    /*테이블간격 없애기*/
    table{
        border-collapse: collapse;
        width: 100%;
        height: 150px;
        text-align: center;
    }

    table th{
        background-color: rgb(235, 234, 234);
    }





</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    
    <div class="outer">
        
        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>

        <div class="content-area">
            <div id="title-area">
                실종/보호/목격글 상세보기
            </div>
            <hr><br>

            <div id="dsplist-outer">
               
            
                <div id="dspList">
                    작성 목록
                </div><br>

        
                <div id="search-area">

                    <button id="enroll-Btn">등록하기</button>

                    <form action="">
                        <select name="dsp-category" id="dsp-category">
                            <!--실종보호목격에 따라 게시판이 보여짐-->
                            <option value="">실종</option>
                            <option value="">보호</option>
                            <option value="">목격</option>
                            </select> 

                       <input type="text" name="search">

                       <button>검색</button> 
                    </form>


                </div>
<br>
                <div>
                    <table border> 
                        <tr>
                            <th>분류</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>작성일시</th>
                            <th>수정 및 삭제</th>
                        </tr>
                        <tr>
                            <td>목격</td>
                            <td>user01</td>
                            <td>제목1</td>
                            <td>2011/11/11</td>
                            <td><button>수정</button>&nbsp;&nbsp;&nbsp;&nbsp;<button>삭제</button></td>
                        </tr>
                        <tr>
                            <td>보호</td>
                            <td>홍길동</td>
                            <td>제목2</td>
                            <td>2021/04/12</td>
                            <td><button>수정</button>&nbsp;&nbsp;&nbsp;&nbsp;<button>삭제</button></td>
                        </tr>
                        <tr>
                            <td>실종</td>
                            <td>admin01</td>
                            <td>제목3</td>
                            <td>2015/08/13</td>
                            <td><button>수정</button>&nbsp;&nbsp;&nbsp;&nbsp;<button>삭제</button></td>
                        </tr>
                    </table>
                </div>
                <div class="paging-area" align="center" style="margin-top: 30px;">

                    <button>&lt;</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>&gt;</button>
                </div>
   

            </div>






