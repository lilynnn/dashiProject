<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input[id="menuicon"]{
		display:none;
	}
	input[id="menuicon"] + label{
		display: block;
		width: 40px;
		height: 40px;
		border-radius: 100%;
		position: fixed;
		cursor: pointer;
		background: yellowgreen;
		right: 0;
		top: clac(50% -25px);
		top: 400px;
		z-index: 4;
	}
	input[id="menuicon"] + label span{
		display: block;
		position: absolute;
		width: 35px;
		height: 3px;
		border-radius: 30px;
		background: white;
		transition: all .35s;
		margin-left: 2px;
	}
	input[id="menuicon"] + label span:nth-child(1){
		top:50%;
		transform: translateY(-48%);
	}
	input[id="menuicon"] + label span:nth-child(2){
		top:50%;
		transform: translateY(-48%) rotate(90deg);
	}
	input[id="menuicon"]:checked + label span:nth-child(1){
		top:50%;
		transform: translateY(-50%) rotate(45deg);
	}
	input[id="menuicon"]:checked + label span:nth-child(2){
		bottom:0%;
		transform: translateY(1%) rotate(-45deg);
	}input[id="menuicon"]:checked + label{
		z-index: 2;
		right: 100px;
		top: 400px;
	}
	div[class="sidebar"]{
		width: 100px;
		padding:10px;
		background: #f6f6cd;
		border-radius: 20px;
		position: fixed;
		top: 400px;
		right: -100px;
		z-index: 1;
		transition: all 35.;
	}
	input[id="menuicon"]:checked + label + div{right: 0;}
	.sidebar>div{
		width: 80px;
		height: 35px;
		margin: auto;
		margin-top: 8px;
		text-align: center;
	}
	#top:hover{
		cursor: pointer;
	}
	
	/*미니메뉴 1:1 버튼 이미지 */
	.modal-btn{
		padding:0;
		width:50%;
		height:100%;
		background:none;
		border:none;
	}
	.modal-btn img{
		width:100%;
		height:100%;
	
	}

	#answer-box .modal-dialog{
		position: absolute;
		margin:0;
		right: 0;
	    bottom: 0;
	    width: 400px;
	}
	
	#answer-box .modal-header{
		border-bottom:0;
	}
	
	#answer-box .modal-title{
		text-align: center;
	    width: 80%;
	}
	
	#answer-box .modal-content{
		border-radius:0;
		border-top-left-radius: 110px 158px;
	}
	
	#answer-box .modal-title a{ 
	 	text-decoration: none;
    	color: black;
	}
	
	
	#answer-box .modal-body{
		width:300px;
		margin: 0 auto;
		
	}
	
	#answer-box .modal-body .modal-label{
		margin: 8px 0px;
		font-weight:bold;
	}
	
	#answer-box .modal-body input{
		width:100%;
		padding:5px;
	}
	
	#answer-box .modal-body textarea{
		width:100%;
		height:150px;
		resize:none;
		padding:5px;
	}
	
	#answer-box .modal-footer{
		border-top:0px;
	}
</style>
</head>
<body>

	
		<input type="checkbox" id="menuicon">
			<label for="menuicon">
				<span></span>
				<span></span>
		</label>
		
		<div class="sidebar">
		
			<div>
				<button class="modal-btn" type="button" data-toggle="modal" data-target="#answer-box">
				 	<img src="<%=request.getContextPath()%>/resources/images/answer.png">
				</button>
			</div>
		
			<div>
				<a href="<%=request.getContextPath()%>">
					<img src="<%=request.getContextPath()%>/resources/images/home.png" width="50%" height="100%">
					
				</a>
			
			</div>
			
			<div><img id="top" src="<%=request.getContextPath()%>/resources/images/up.png" width="50%" height="100%"></div>
		</div>	

		<!-- The Modal -->
		<div class="modal" id="answer-box">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title"><a href="">1:1 문의</a></h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      
		 
		      	<div class="modal-label">
		      	성함 
		      	</div>
		       <input placeholder="성함을 입력해주세요" type="text" />
		       
		       	<div class="modal-label">
		      	연락처
		      	</div>
		       <input placeholder="연락처를 입력해주세요" type="text" />
		       
		       	<div class="modal-label">
		      	문의내용
		      	</div>
		       <textarea placeholder="내용을 입력하세요" ></textarea>
		      
		       
		       
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn" data-dismiss="modal">제출</button>
		      </div>
		
		    </div>
		  </div>
		</div>

		
		<script>
			$('#top').click(function(){
				$('html, body').animate({scrollTop:0}, 400);
				return false;
			});
		</script>

		


</body>
</html>