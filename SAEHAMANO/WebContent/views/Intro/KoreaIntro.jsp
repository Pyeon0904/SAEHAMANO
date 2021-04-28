<!-- 대한민국 소개 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/headerDetail.jsp"%>

<style>
@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#box{ 
   background-color:#2a1b0a;
   width:100%;
   height:0 auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
   margin-top:330px;
   margin-bottom:100px;
   margin-left:-10px;
   padding:10px;
   color:white;
}


/*컨텐츠 영역*/
   #conbox{
      width: 1280px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
       position:relative; 
       top:20px;
       margin:0 auto;
       align:center;
   }


/* ---- 대한민국 소개 전체 영역 지정 ---- */
#kor-intro-Content {
/* 페이지 영역 전체에 같은 폰트 적용*/
	height:2500px;
    font-family: 'GmarketSansLight';
}

/* 레이아웃 영역 지정 */
#koreaIntroImg-top {width: 1280px; height: 550px; overflow:hidden; display: flex;}
#firstIntro-short {width: 1280px;height: 150px;}
#intro-box-title {width: 1280px;	height: 170px; }
#introBox-leftImg {width: 1280px;	height: 600px;}
#middle-line {	width: 1280px;height:110px; padding-top: 40px;text-align:center;}
#introBox-rightImg {width: 1280px; height: 600px;}


/*---------- 스타일 지정 -----------*/
/* 1. 대한민국 짧은 소개 부분 스타일*/
#firstIntro-short {
	text-align:center;
	font-size : 22px;
	margin :0;
}
.short-intro {
	margin:0;
	padding: 5px 15px 5px 15px;
	display:inline-block;
	background:white;
	color: #2a1b0a;
	font-weight:bold;
}


/*대한민국 소개(타이틀 부분) - 스타일 지정*/
#intro-box-title {
	margin-top:70px;
	margin-bottom: 50px;
	font-size : 40px;
	text-align:center;
}

/* ---- 대한민국 소개 본문 한글 위치 및 스타일 지정 ---- */
/* 이미지 영역 크기&위치 지정*/
.intro-img-left {
	float: left;
	width: 510px;
	height: 590px;
	overflow: hidden;
}

/* 텍스트 스타일&크기 지정*/
.koreaIntro-kor {
	float:right;
	width: 510px;
	heidht: 600px;
	font-size : 15pt;
}

/*본문 타이틀 지정*/
.koreaIntro-kor span {
	display:inline-block;
	padding-top: 50px;
	font-size : 25pt;
}

/* 중간 라인 이미지 크기 지정*/
#middle-line img {
	height: 70px;
	width:auto;
}

/* ---- 대한민국 소개 본문 영문 위치 및 스타일 지정 ---- */
/* 이미지 영역 크기&위치 지정*/
.intro-img-right {
	float: right;
	margin-top:25px;
	width: 510px;
	height: 590px;
	overflow: hidden;
}

/* 텍스트 스타일&크기 지정*/
.koreaIntro-eng {
	float:left;
	width: 510px;
	height: 590px;
	font-size : 13pt;
}

/*본문 타이틀 지정*/
.koreaIntro-eng span {
	display:inline-block;
	padding-top: 50px;
	font-size : 35px;
}

/* 본문 이미지 크기 지정 */
#introBox-leftImg img {width: 510px; hieght: 590px;} 
#introBox-rightImg img {	width: 510px; hieght: 590px;}
</style>

<div id="box">
<section id="kor-intro-Content">
		<div id="conbox">
				<div id="koreaIntroImg-top">
					<img class="introimg-top" src="<%= request.getContextPath() %>/resources/images/introimgtop.png"/>
				</div>
			
				<div id="firstIntro-short">
					<br>
					<p class="short-intro">
					<span class="firstIntro-kor">대한민국</span>(大韓民國)은 동아시아의 반도 국가로, 민주공화국이다
					</p>
					<p>The Republic of Korea is a peninsula country in East Asia</p>
				</div>
				
		<div id="intro-box-title">
					<span> 대한민국 소개 </span>
				<div class="intro-line">
					<img style="height:70px;" src="<%= request.getContextPath() %>/resources/images/Introline1.png"/>
				</div>	
		</div>
				
				<div id="introBox-leftImg">
					<div class="intro-img-left">
						<img src="<%= request.getContextPath() %>/resources/images/taegeukgi.png"/>
					</div>
					<div class="koreaIntro-kor">
						<span> 대한민국 </span>
						<p>
							대한민국의 정식 국호는 "대한민국(大韓民國)"이나 사용의 편의상 "대한(大韓)" 또는 "한국(韓國)"으로 약칭하여 쓸 수 있다.<br><br>
							대한민국은 동아시아 끝자락에 자리 잡은 반도 국가로, &emsp;남북으로 길게 뻗은 반도와 3,200여 개의 섬으로 이루어져 있다.<br><br>
							고구려, 백제, 신라의 삼국시대 및 남북국시대를 거쳐 중세에는 고려가 세워졌으며, 이후 조선이 건립되어 근대까지 이어졌다.
							현대 들어 35년의 일제강점기를 거쳐 제2차 세계대전 뒤 미국과 소련 군대의 한반도 분할 주둔으로 남북으로 나뉘었고 1948년 대한민국이 수립되었다.
							<br>이후 6·25전쟁이 일어나 휴전중이며, 현재까지 분단국가로 남아 있다.
						</p>
					</div>							
				</div>
							<!--  &nbsp; : 스페이스 / &ensp; : 스페이스 / &emsp; : 큰스페이스 -->
							<div id="middle-line">
								<img src="<%= request.getContextPath() %>/resources/images/intromid_line.png"/>							
							</div>
							
				<div id="introBox-rightImg">
					<div class="intro-img-right">
						<img src="<%= request.getContextPath() %>/resources/images/mugunghwa.png"/>
					</div>
					<div class="koreaIntro-eng">
						<span> Republic of Korea </span>
						<p>
							The official name of the Republic of Korea is "대한민국 (大韓民國)" In other words, it may be abbreviated as &nbsp; "대한(Daehan)" or "한국(Hankok)" for convenience of use.<br>
				The Republic of Korea is a peninsula located at the end of East Asia, consisting of a long peninsula extending north and south and 3,200 islands.
			<br>Goryeo was established during the Three Kingdoms Period, Goguryeo, Baekje, Silla, and the Inter-Korean States Period, and later Joseon was established until modern times. After 35 years of Japanese colonial era, it was divided into two Koreas after World War II due to the division of U.S. and Soviet troops on the Korean Peninsula, and the establishment of the Republic of Korea in 1948.<br>Since then, the Korean War has broken out and is in a truce, and it has remained a divided country to date.	
						</p>
					</div>							
				</div>
			</div>		
</section>
</div>
<%@ include file="/views/common/footer.jsp"%>
