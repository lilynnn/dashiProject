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
		height: 100px;
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
</style>
</head>
<body>

	
		<input type="checkbox" id="menuicon">
			<label for="menuicon">
				<span></span>
				<span></span>
		</label>
		
		<div class="sidebar">
			<div><a href="<%=request.getContextPath()%>">
				<img src="<%=request.getContextPath()%>/resources/images/home.png" width="50%" height="100%">
			</a></div>
			
			<div><img id="top" src="<%=request.getContextPath()%>/resources/images/up.png" width="50%" height="100%"></div>
		</div>	

		<script>
			$('#top').click(function(){
				$('html, body').animate({scrollTop:0}, 400);
				return false;
			});
		</script>

		


</body>
</html>