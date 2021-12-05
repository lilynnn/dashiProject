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
        height: 800px;
        margin: auto;
        margin-top: 30px;
    }
    .outer>div{
        float: left;
        box-sizing: border-box;
    }
	.content-area{
         width: 850px;
         float: left;
         margin-left: 20px;
    }
	.content-area{
         width: 850px;
         float: left;
         margin-left: 20px;
    }
	.title-area{
        font-size: 24px; 
        font-weight: 700;
        margin-top: 20px;
        margin-left: 20px;
        width: 950px;
    }

	#animalInfo{font-size: 13px; border-collapse: separate;}
	#animalInfo th{text-align: center; line-height: 200%;}
	#animalInfo>tbody th{background: lightgray;}
	#animalInfo input{width: 100%;}
	#text-area{width: 100%; resize: none;}
	table td{
		line-height: 180%;
	}
	

</style>
</head>
<body>

	<!-- 지희 수정중  -->
	<!-- 관리자가 입양공고문을 작성하기 위한 페이지 -->
	<%@ include file="../common/menubar.jsp" %>

	<!-- 전체 영역 감싸는 div -->
	<div class="outer">

		<div id="menubar" style="margin-right: 20px;">
			<%@ include file="../admin/adminMenubar.jsp" %>
		</div>

		<form action="">

			<div class="content-area">

				<div class="title-area">
					입양공고글 수정하기
				</div>

				<hr style="width: 900px;">

				<table align="center" id="animalInfo" style="width: 900px;">
					<thead>
						<tr>
							<th style="font-size: 15px;">제목</th>
							<td>
								<input type="text" placeholder="동물품종 이름(이)의 가족을 기다려요">
							</td>
						</tr>
						<!-- 공백란 -->
						<tr><td>&nbsp;</td></tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="2"><b style="font-size: 18px; padding-left: 5px;">동물 정보</b></td>
						</tr>
						<!-- 동물 품종  -->
						<tr>
							<th>묘종 / 견종</th>
							<td><input type="text"></td>
						</tr>

						<!-- 동물 나이 -->
						<tr>
							<th>나 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이</th>
							<td><input type="text"></td>
						</tr>

						<!-- 동물 성별 -->
						<tr>
							<th>성 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 별</th>
							<td><input type="text" placeholder="남 / 여"></td>
						</tr>

						<!-- 접종 여부 -->
						<tr>
							<th>접종 &nbsp; 여부</th>
							<td><input type="text" placeholder="O / X"></td>
						</tr>
						
						<!-- 중성화 여부 -->
						<tr>
							<th>중성화여부</th>
							<td><input type="text" placeholder="O / X"></td>
						</tr>
						
						<!-- 특이사항 -->
						<tr>
							<th>특이 &nbsp; 사항</th>
							<td><input type="text" ></td>
						</tr>

						<!-- 내용 -->
						<tr>
							<th>내 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 용</th>
							<td>
								<textarea name="" id="text-area" cols="30" rows="10" ></textarea>
							</td>
						</tr>
						
						<!-- 첨부파일 -->
						<tr>
							<th>첨부 &nbsp; 파일</th>
							<td>
								<input type="file">
							</td>
						</tr>
					</tbody>
				</table>
				<div style=" text-align: center;">
					<br><br>
					<button class="btn btn-success">등록하기</button>
					&nbsp;
					<button class="btn btn-secondary">목록보기</button>
				</div>
			</div>
		</form>



	</div>
</body>
</html>