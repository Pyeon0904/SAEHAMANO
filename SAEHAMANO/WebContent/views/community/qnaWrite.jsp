<!-- 210428(수) 15:36 김예원 (최종수정자) -->
<!-- 최종 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp"%>
<!-- 구글 Noto 바탕체 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@400;700&display=swap"
	rel="stylesheet">
<!-- 구글 Noto 굴림체 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Noto+Serif:wght@400;700&display=swap"
	rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.min.js"></script>

<title>Q&A 글쓰기 페이지</title>
<style>
		/* 전체 영역--------------------------------------------------------------------------*/
				
			/*---------------제일 바깥 영역 설정-----------------*/
			#box{ 
			   background-color:#948c84;
			   width:100%;
			   height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
			   margin-top:330px;
			   margin-bottom:100px;
			   margin-left:-10px;
			   padding:10px;
			}
			/*-------------------컨텐츠 영역---------------------*/
			#conbox{
				width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
				position:relative; 
				top:20px;
				margin:auto;
			}
			    
		/*-----------------------------------------------------------------------------------*/
			
		/* 페이지 상단 TEXT -----------------------------------------------------------------*/
			
			/* ----- 페이지 이름(후기작성 게시판) ----- */
			.pageName { 
				text-align: center;
				font-family: GmarketSansLight;
				color: white;
			}
			/* ----- 페이지 설명(국보문화재 관람 후기를 남겨~~~)*/
			.pageExplain {
				color: wheat;
				font-family: GmarketSansLight;
			}
			
		/*-----------------------------------------------------------------------------------*/
		
			/* 질문 작성 네모 칸에 대한 스타일 */
			#title { 
				width: 500px;
				height: 20px;
				align: center;
				outline-style: solid; 
				outline-color: wheat;
				position: relative; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
				z-index: 8;
				font-family: GmarketSansLight;
			}
	
		/* 말풍선 -----------------------------------------------------*/
		
			/* 말풍선 (질문제목) */
			.boardballoonTitle {
				margin-top: 150px;
				margin-left: 50px;
				position: relative;
				font-family: GmarketSansLight;
			}
			
			/* 말풍선 (유저정보) */
			.boardballoonUser {
				margin-top: -500px;
				margin-left: 1225px;
				position: relative;
				font-family: GmarketSansLight;
			}
		
			/* 말풍선 내부 "작성 TIP" */
			#titleWriteTip, #userWriteTip {
				color: green;
				font-weight: 1200;
				position: relative;
				font-family: GmarketSansLight;
			}
		
		/*------------------------------------------------------------*/
			
		/* 작성 TABLE -------------------------------------------------*/	
			/* 테이블 상단 영역 */
			.Qnatitle_area {
		   		margin-top : -530px;
				margin-left: 420px;
				height: 10px;
				font-family: GmarketSansLight;
			}
		
					
			div#board-write-container {
				width:0px;
				margin:0 auto;
				text-align:center;
				font-family: GmarketSansLight;
			}
			
			div#board-write-container h2 {
				margin:10px;
				font-family: GmarketSansLight;
			}
			
			/* 테이블 틀에 대한 스타일 */
			table#tbl-board {
				width:800px;
				margin:10 auto;
				border:1px solid black;
				border-collapse:collapse; /* 단선으로 바꿈! */
				background-color: wheat;
				position: relative; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
				z-index: 6;
			}
			
			/* 테이블 th에 대한 스타일 지정 */
			#tbl-board th {
				width:125px;
				border:1px solid;
				padding:5px 0;
				text-align:center;
				font-family: GmarketSansLight;
			}
			
			/* 테이블 td에 대한 스타일 지정 */
			#tbl-board td {
				border:1px solid;
				padding:5px 0 5px 10px;
				text-align:left;
				font-family: GmarketSansLight;
			}		
		/*------------------------------------------------------------*/
			
			/*마우스올렸을 때 강조 (제목/작성자/버튼)*/
			input:hover {
				background-color:honeydew;
			}	
		</style>


</head>

<body>
	<div id="box">
		<section id="section">
			<div id="conbox">

				<!-- 상단의 TEXT 구현 ---------------------------------------------------------- -->
				<div class="pageName">
					<h1>Q & A (질문과 답변)</h1>
					<hr>
					<h3 class="pageExplain">국보 문화재 관람시 궁금하신 내용을 작성해 전문가의 답변을
						받아보세요.</h3>
				</div>
				<!------------------------------------------------------------------------------- -->

				<!-- 말풍선 구현 ---------------------------------------------------------- -->
				<!-- '질문' 말풍선 + 내부에 text(글) 넣기 구현 -->
				<div style="position: relative;">
					<img class="boardballoonTitle" width="360px;" height="480px;"
						src="<%=request.getContextPath()%>/resources/images/boardBalloonTitle.png">
					<div
						style="left: 140px; font-family: GmarketSansLight; width: 450px; bottom: 130px; font-size: 12pt; font-weight: bold; position: absolute;">
						<p id="titleWriteTip">작성 TIP</p>
						정확한 답변을 원하시나요?<br> 궁금한 점을 상세하게<br> 알 수 있도록 작성해 보세요!<br>
						(최소 5자)<br> <br>
						<p id="writeTip">예시문</p>
						"숭례문 재건축일?"<br> "수원화성 위치는?"<br>
					</div>
				</div>

				<!-- '유저정보(닉네임,비밀번호)' 말풍선 + 내부에 text(글) 넣기 구현 -->
				<div style="position: relative;">
					<img class="boardballoonUser" width="480px;" height="360px;"
						src="<%=request.getContextPath()%>/resources/images/boardBalloonUser.png">
					<div
						style="left: 1330px; width: 450px; bottom: 120px; font-size: 12pt; font-weight: bold; position: absolute;">
						<p id="userWriteTip">작성 TIP</p>
						닉네임은 '작성자'에 사용됩니다.<br> 패스워드는 글을 수정, 삭제시 사용됩니다.<br> 계정정보를
						잊지 않도록 유의해주세요!<br> <br>
					</div>
				</div>
				<!---------------------------------------------------------------------------------->
					
					<!-- by.예원 form태그 추가/ 제목 input name 속성 추가 -->
					<form action="<%= request.getContextPath()%>/community/qna/write" method="POST">
							<div class="Qnatitle_area">
							<h2>
								<label style="color: wheat" >&nbsp;&nbsp;&emsp;제목&nbsp;&emsp; <input type="text" id="title" name ="title" maxlength="80" style="font-family: GmarketSansMedium;"placeholder="최대 80자까지 입력 가능합니다."></label>
							</h2>

								<!-- 게시글 작성 table 구현 -->
								<table id='tbl-board'>
									<tr>
										<th>작성자</th>
										<td>
											<!-- &nbsp; : 스페이스 / &ensp; : 스페이스 / &emsp; : 큰스페이스 --> 
											사용할 닉네임 &emsp;: <input type="text" style="width: 300px; font-family: GmarketSansMedium;" name="writer" placeholder="사용할 닉네임을 적어주세요." required>
											<br>
											<!-- 04.22 18:00 [type="password"로 변경] by.예원  --> 
											사용할 비밀번호 :
											<input type="password" style="width: 300px; font-family: GmarketSansMedium;" name="password" placeholder="사용할 비밀번호를 적어주세요." required>
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea name="content"
												style="width: 650px; resize: none; font-family: GmarketSansMedium;"
												placeholder=" 궁금하신 사항을 질문해 주세요.&#13;&#10;&#13;&#10;  
												&#13;&#10 질문작성시 아래와 같은 사항을 주의해 주세요!
												&#13;&#10; - 게시글 작성 에티켓 문화를 실천해주세요!
												&#13;&#10; - 남을 비방하는 내용이나 저속한 표현은 예고없이 삭제됩니다.
												&#13;&#10; - 광고성, 상업성 게시물은 예고 없이 삭제됩니다.
												&#13;&#10; - 국보문화재 관람 후기글은 후기게시판을 이용해 주시기 바랍니다. "
												cols="60" rows="20" style="resize: none"></textarea></td>
									</tr>
									<tr>
										<th colspan="2"><input type="submit" style="font-family: GmarketSansLight;" value="등록">
											<input type="reset" style="font-family: GmarketSansLight;" value="취소"></th>
									</tr>
								</table>
								<!---------------------------------------------------------------------------------->

								<h5 style="color: #696666; font-family: GmarketSansLight;">저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는
									게시물은 관련법률에 의해 제재를 받으실 수 있습니다.</h5>
							</div>
					</form>
				</div>
		</section>
	</div>
</body>
</html>

<%@ include file="/views/common/footer.jsp"%>