<!-- 210412 22:05 김하린 (최종수정자) -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<!-- 구글 Noto 바탕체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">
<!-- 구글 Noto 굴림체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">

<style>

/*상세페이지 타이틀 백그라운드 이미지*/
.topBackgroundImg {
		width:0px auto;
		height:220px;
		margin-top: 200px;
	}
	
/* 대한민국 소개 전체 영역 지정 */
	#koreaIntroContent {
		position: relative;
		margin:0px auto;
		width: 975px;
		height: 700px;
	}

/*대한민국 소개 타이틀 위치 지정*/
	.koreaIntroTitle {
		display: block;
		text-align: center;
		font-size:35px;
		font-family:'Noto Serif', serif;
	}

/* 대한민국 소개 이미지 스타일 지정*/
	.koreaIntroImg {
		position : absolute;
		margin-top:30px;
 		width : 975px;
		height: auto;
	}
	
</style>

	<section>
		<img class="topBackgroundImg" src="<%= request.getContextPath() %>/resources/images/detailbggreen.png"/>
	<div id="koreaIntroContent">
		<span class="koreaIntroTitle">대한민국 소개</span>
		<div id="koreaIntro">
				<img class="koreaIntroImg" src="<%= request.getContextPath() %>/resources/images/hanRiver02.jpg" 
				alt="대한민국 소개" />
		</div>
	</div>
	</section>

<!-- <%@ include file="/views/common/footer.jsp"%> -->
