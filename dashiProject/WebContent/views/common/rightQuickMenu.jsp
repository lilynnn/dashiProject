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
		position: relative;
		cursor: pointer;
		background: yellowgreen;
		top: 650px;
		left: 1500px;
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
	}
	input[class="slidemenu"]{
		display:none;
	}
	input[class="slidemenu"] + label{
		display: block;
		width: 40px;
		height: 40px;
		border-radius: 100%;
		position: relative;
		cursor: pointer;
		background: yellowgreen;
	}
	input[class="slidemenu"] + label span{
		display: block;
		position: absolute;
		width: 35px;
		height: 100%;
		color: black;
		transition: all .35s;
	}
	input[class="slidemenu"] + label span:nth-child(1){
		top:20%;
		transform: translateX(30%);
	}
	input[id="home"] + label{
		top: 400px;
		left: 1500px;
		z-index: 1;
	}
	input[id="quickanswer"] + label{
		top: 410px;
		left: 1500px;
		z-index: 2;
	}
	input[id="up"] + label{
		top: 420px;
		left: 1500px;
		z-index: 3;
	}
</style>
</head>
<body>

	
		<input type="checkbox" id="menuicon">
		<label for="menuicon">
			<span></span>
			<span></span>
		</label>

		<input type="checkbox" class="slidemenu" id="home">
		<label for="slidemenu">
			<span>홈</span>
		</label>

		<input type="checkbox" class="slidemenu" id="quickanswer">
		<label for="slidemenu">
			<span>1:1</span>
		</label>

		<input type="checkbox" class="slidemenu" id="up">
		<label for="slidemenu" id="upicon">
			<span>▲</span>
		</label>



		<script>
			$(document).ready(function() {

				$("#upicon").click(function() {
					$('html, body').animate({scrollTop:0}, '300');
				});
			
			});
		</script>



</body>
</html>