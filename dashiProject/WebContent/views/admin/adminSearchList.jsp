<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dashi.admin.model.vo.Manager" %>
<%
	ArrayList<Manager> list = (ArrayList<Manager>)request.getAttribute("list");
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
    /*왼쪽메뉴바*/
    #munubar{width:200px}
    /*사원관리 시작*/
 	#adminlist{
         margin-left: 30px;
         width: 850px;
    }
    .table-bordered *{
        height: 40px;
    }
    #adminlist div{float: left;}
    /*검색창*/
    #search{width: 250px;}
    #search>button{
    	border:none;
    	height:30px;
    	border-radius:3px;
    }
    .btn-sm>button{
        border-radius: 5px;
        border: white;
        width: 60px;
        font-size: 13px;
    }
    /*타이틀 정리*/
    #title{
        width: 100%; 
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
    }
    .btn-sm{
        width: 80px;
        height: 30px;
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
    /*사원정보보기*/
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
    
    <%@ include file="../common/menubar.jsp" %>
    
    
    <!--전체를 감싸는 큰 div-->
    <div class="outer">
    
    	<div id="menubar">
    		<%@ include file="../admin/adminMenubar.jsp" %>
    	</div>

        <!--관리자 사원관리 목록-->
        <div id="adminlist">
        	
        	<!-- <form action="">  -->

                <div id="title">
                    	사원관리
                <hr>
                </div>

                <div style="margin-top: 10px;">
                    <table class="table-bordered adminList">
                        <thead>
                            <tr align="center">
                                <th width="50">사번</th>
                                <th width="100">이름</th>
                                <th width="100">아이디</th>
                                <th width="200">이메일</th>
                                <th width="150">전화번호</th>
                                <th width="100">입사일</th>
                                <th width="100">퇴사일</th>
                                <th width="100">퇴사여부</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<% if(list.isEmpty()){ %>
	                            <!--사원 없을때-->
	                            <tr align="center">
	                                <td colspan="8">존재하는 사원이 없습니다.</td>
	                            </tr>
							<% }else{ %>
	                            <!--사원 있을때-->
	                            <% for(Manager a : list){ %>
	                            <tr align="center" class="adminNo">
	                                <td><%=a.getMnNo()%></td>
	                                <td>
	                                    <button type="button" onclick="selectAdmin();" data-toggle="modal" data-target="#checkInfo"><%=a.getMnName()%></button> 
	                                </td>
	                                <td><%=a.getMnId()%></td>
	                                <td><%=a.getMnEmail()%></td>
	                                <td><%=a.getMnPhone()%></td>
	                                <td><%=a.getMnJoin()%></td>
									<td><%=a.getMnQuit()%></td>    
	                                <td><%=a.getActivation()%></td>
	                            </tr>	                            
	                            
	                         	<% } %>
							<% } %>
                        </tbody>
                    </table>
                </div>

				<div style="width:100%; margin-top:30px" align="center">
					<button type="button" onclick="history.back();" class="btn btn-warning">뒤로가기</button>
				</div>
            
        	

        </div>
    </div>


    <!--관리자 정보확인/수정용 모달-->
    <!-- The Modal -->
    <div class="modal" id="checkInfo">
        <div class="modal-dialog">
        	<div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            

            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <table>
							
					<!-- ajax자리 -->
				
                </table>
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
                <a href="<%=contextPath%>/updateForm.ad?num=101" class="btn btn-warning" data-dismiss="modal">정보수정</a>
                <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
            </div>
            
              <script>

			    	function selectAdmin(){
			    		
			    		$.ajax({
			    			
				    		url:"detail.ad",
				    		data:{ano:$(".adminList>tbody>tr").children().eq(0).text()},
				    		success:function(result){

				    			let name = "";
				    			name += "<h4 class='modal-title'>" + result.mnName + "</h4>"
				    			$(".modal-header").html(name);
				    			
								let info = "";
		    					info += "<tr>"
				    					 + "<th width='100'>사번</th>"
										 + "<td width='200'>" + result.mnNo + "</td>"
										 + "<td rowspan='8' width='200' heigth='300'>"
				                         + "<img src='<%=contextPath%>/resources/images/idcard.png' style='width: 100%;'>"
				                         + "</td>"
								  	 + "</tr>" + "<tr>"
										 + "<th>아이디</th>"
										 + "<td>" + result.mnId + "</td>"
								     + "</tr>" + "<tr>"
										 + "<th>이메일</th>"
										 + "<td>" + result.mnEmail + "</td>"
								     + "</tr>" + "<tr>"
										 + "<th>전화번호</th>"
										 + "<td>" + result.mnPhone + "</td>"
								     + "</tr>" + "<tr>"
										 + "<th>입사일</th>"
										 + "<td>" + result.mnJoin + "</td>"
								     + "</tr>" + "<tr>"
								 		 + "<th>퇴사일</th>"
										 + "<td>" + result.mnQuit + "</td>"
								     + "</tr>"	+ "<tr>"	 
										 + "<th>퇴사여부</th>"
										 + "<td>" + result.activation + "</td>"
								     + "</tr>"

				    			
				    			$(".modal-body>table").html(info);
				    			console.log(result);
				    			
				    		},error:function(){
				    			console.log("사원 조회용 ajax통신 실패");
			    			}
			    		
			    		})		
			    			
			    	}
			    
			    
			    	
			    </script>
            
    
    
        	</div>
        </div>
    </div>
  
























	<!-- footerbar영역 -->
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>