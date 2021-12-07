<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1200px;
        height: 1600px;
    }

    div{
        border: 1px solid red;
    }
    .outer>div{
        float:left;
        box-sizing: border-box;
    }

    .content-area{
         margin-left: 20px;
    }
  
    #title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        margin-left: 20px;
     
    }
    /*안에 내용의 전체틀*/
    #paylist-outer{
        margin-left: 20px;
        width: 800px;
    }


    /*테이블간격 없애기*/
    table{
        border-collapse: collapse;
        width: 100%;
        height: 250px;
        text-align: center;
    }

    table th{
        background-color: rgb(235, 234, 234);
    }





</style>
</head>
<body>
    <div class="outer">
        
        <div id="menubar" style="margin-right: 20px;">
            <%@ include file="../admin/adminMenubar.jsp" %>
        </div>

        <div class="content-area">
            <div id="title-area">
                결제 내역 조회
            </div>
            <hr><br>

            <div id="paylist-outer">
 
                <div id="search-area">

                    <form action="">
                        <button>모든결제</button>
                        <button>결제대기</button>
                        <button>결제완료</button>
                    </form>

                </div>
                    <br>
                <div>
                    <table class="payList" border> 
                        <tr>
                            <th style="width: 80px;">결제방식</th>
                            <th>입양공지문 제목/번호</th>
                            <th>결제자</th>
                            <th>휴대전화</th>
                            <th>결제일시</th>
                            <th>결제금액</th>
                            <th>확인/취소</th>
                        </tr>
                        <tr>
                            <td>무통장 또는 신용카드</td>
                            <td>Y5125481-11</td>
                            <td>홍길동</td>
                            <td>010-1111-2222</td>
                            <td>12.15 15:35</td>
                            <td>50,000</td>
                            <td>
                                <select name="" id="">
                                    <option value="payWait">결제대기</option>
                                    <option value="payOk">결제완료</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>무통장 또는 신용카드</td>
                            <td>Y5125481-11</td>
                            <td>홍길동</td>
                            <td>010-1111-2222</td>
                            <td>12.15 15:35</td>
                            <td>50,000</td>
                            <td>
                                <select name="" id="">
                                    <option value="payWait">결제대기</option>
                                    <option value="payOk">결제완료</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>무통장 또는 신용카드</td>
                            <td>Y5125481-11</td>
                            <td>홍길동</td>
                            <td>010-1111-2222</td>
                            <td>12.15 15:35</td>
                            <td>50,000</td>
                            <td>
                                <select name="" id="">
                                    <option value="payWait">결제대기</option>
                                    <option value="payOk">결제완료</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>무통장 또는 신용카드</td>
                            <td>Y5125481-11</td>
                            <td>홍길동</td>
                            <td>010-1111-2222</td>
                            <td>12.15 15:35</td>
                            <td>50,000</td>
                            <td>
                                <select name="" id="">
                                    <option value="payWait">결제대기</option>
                                    <option value="payOk">결제완료</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
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






