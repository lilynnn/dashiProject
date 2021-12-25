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
        width: 1150px;
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
    .adminList{
    	width: 950px;
    	font-size:10px;
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
	.btn-up{width:50px;}
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

                <div style="margin-top:10px; width:100%;">
                    <table class="table-bordered adminList" style="font-size:14px;">
                        <thead>
                            <tr align="center">
                                <th width="50">사번</th>
                                <th width="100">이름</th>
                                <th width="100">아이디</th>
                                <th width="200">이메일</th>
                                <th width="150">전화번호</th>
                                <th width="150">입사일</th>
                                <th width="150">퇴사일</th>
                                <th width="100">퇴사여부</th>
                                <th width="100"></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<% if(list.isEmpty()){ %>
	                            <!--사원 없을때-->
	                            <tr align="center">
	                                <td colspan="9">존재하는 사원이 없습니다.</td>
	                            </tr>
							<% }else{ %>
	                            <!--사원 있을때-->
	                            <% for(Manager a : list){ %>
	                            <tr align="center" class="adminNo">
	                                <td><%=a.getMnNo()%></td>
	                                <td>
	                                    <button type="button" class="btn btn-sm btn-outline-info" onclick="selectAdmin(<%=a.getMnNo()%>);" data-toggle="modal" data-target="#checkInfo"><%=a.getMnName()%></button> 
	                                </td>
	                                <td><%=a.getMnId()%></td>
	                                <td><%=a.getMnEmail()%></td>
	                                <td><%=a.getMnPhone()%></td>
	                                <td><%=a.getMnJoin()%></td>
									<td><%=a.getMnQuit()%></td>    
	                                <td><%=a.getActivation()%></td>
	                                <td><a href="<%=contextPath%>/updateForm.ad?ano=<%=a.getMnNo()%>" class="btn btn-sm btn-up btn-outline-danger">수정</a></td>
	                            </tr>	                            
	                            
	                         	<% } %>
							<% } %>
                        </tbody>
                    </table>
                </div>

				<div style="width:100%; margin-top:30px" align="center">
	                <button type="button" class="btn btn-light" style="background:rgb(143,153,142);" onclick="history.back();">뒤로가기</button>
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
                <button type="button" class="btn btn-outline-danger" id="adminUpdate" onclick="updateAdmin();">수정</button>
            	<button type="button" class="btn btn-outline-primary" id="adminUpdateInfo" onclick="updateAdminInfo();">수정완료</button>
                <button type="button" class="btn btn-light" data-dismiss="modal" onclick="history.go(0)">닫기</button>
            </div>
            
              <script>

			    	function selectAdmin(adminNo){
			    		
			    		$.ajax({
			    			
				    		url:"detail.ad",
				    		data:{ano:adminNo},
				    		success:function(result){

				    			let name = "";
				    			name += "<h4 class='modal-title'>" + "<input type='text' name='adminName' value='" +result.mnName+ "' readonly>" + "</h4>"
				    			$(".modal-header").html(name);
				    			
								let info = "";
		    					info += "<tr>"
				    					 + "<th width='100'>사번</th>"
										 + "<td width='200' id='adminNo'>" + result.mnNo + "</td>"
										 + "<td rowspan='8' width='200' heigth='300'>"
				                         + "<img src='<%=contextPath%>/resources/images/idcard.png' style='width: 100%;'>"
				                         + "</td>"
								  	 + "</tr>" + "<tr>"
										 + "<th>아이디</th>"
										 + "<td>" + result.mnId + "</td>"
									 + "</tr>" + "<tr>"
										 + "<th>비밀번호</th>"
										 + "<td>" + "<input type='text' name='adminPwd' value='" +result.mnPwd+ "' readonly>" + "</td>"
								     + "</tr>" + "<tr>"
										 + "<th>이메일</th>"
										 + "<td>" + "<input type='text' name='email' value='" +result.mnEmail+ "' readonly>" + "</td>"
								     + "</tr>" + "<tr>"
										 + "<th>전화번호</th>"
										 + "<td>" + "<input type='text' name='phone' value='" +result.mnPhone+ "' readonly>" + "</td>"
								     + "</tr>" + "<tr>"
										 + "<th>입사일</th>"
										 + "<td>" + result.mnJoin + "</td>"
								     + "</tr>" + "<tr>"
								 		 + "<th>퇴사일</th>"
										 + "<td>" + result.mnQuit + "</td>"
								     + "</tr>"	+ "<tr>"	 
										 + "<th>퇴사여부</th>"
										 + "<td>"+ result.activation + "</td>"
								     + "</tr>"
				    			
				    			$(".modal-body>table").html(info);
				    			
				    			$("#adminUpdateInfo").hide();
				    			
				    		},error:function(){
				    			console.log("사원 조회용 ajax통신 실패");
			    			}
			    		
			    		})		
			    			
			    	}
			    	
					function updateAdmin(){
			    		
			    		$(".modal-body>table>tr>td>input").attr("readonly", false);
			    		$("#adminUpdate").hide();
			    		$("#adminUpdateInfo").show();
						
						
			    				    		
			    	}
			    	
			    	function updateAdminInfo(){
			    		
			    		$.ajax({
			    			url:"update.ad",
			    			data:{
			    				adminNo:$("#adminNo").text(),
			    				adminPwd:$("input[name=adminPwd]").val(),
			    				adminName:$("input[name=adminName]").val(),
			    				email:$("input[name=email]").val(),
			    				phone:$("input[name=phone]").val()
			    			},
			    			type:"post",
			    			success:function(result){
			    				
			    				console.log(result);
			    				if(result > 0){
				    				alert("관리자 정보 수정에 성공했습니다!");
				    				$("#adminUpdate").show(); 
				    				$("#adminUpdateInfo").hide();
				    				$(".modal-body>table>tr>td>input").attr("readonly", true);
			    				}else{
			    					alert("관리자 정보 수정에 실패했습니다.");
			    				}
			    				
			    			},error:function(){
			    				console.log("관리자 수정용 ajax통신 실패");
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