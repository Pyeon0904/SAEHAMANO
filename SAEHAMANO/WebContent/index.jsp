
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/views/common/header.jsp"%>

<style>
/*--------------------------------------------------- 공통부분 -------------------------------------------------*/
	/*----------제일 뒷 배경색---------------*/
	.box{ 	
		font-family: 'GmarketSansLight';
		background-color:#2a1b0a;
		width:100%;
		height:820px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
		margin-top:350px;
		margin-bottom:470px;
		margin-left:-10px;
		padding:10px;
	}

		/*------------------컨텐츠 박스-------------------- */
		.conbox{ width:1200px; margin:auto;}
		.conbox span{ font-size:40pt; color:white;margin:0px 0px 0px 0px;}
	
		/*------마지막 영역 밑단 길이 조정--------*/
		#lastbox{ margin-bottom:200px;}


		/*------세부페이지 링크 설정-------------*/
		.gotodetail{ width:100%; position:relative; margin:0px 25px 0px 0px; }
		.gotodetail a{ text-decoration:none; color:white; float:right;}
		.gotodetail a:hover{ color:wheat;}


/*----공통 끝-------공통 끝-------공통 끝------------공통 끝-------------공통 끝---------공통 끝-------공통 끝-------공통 끝--*/






/*-----------------  문화안내  ------------------------*/
#map{ width:100%;  margin-top:20px;background-color:white;}


/* --------------------- 소개 ---------------------- */
#introimg{ height:650px; margin:10px 0px 0px 0px; }


/*-----------------  축제  ------------------------*/
		/*----------축제영역 설정------------*/
		#event{ width:100%; margin:27px 0px 0px 0px; }
		
		/* ---------- 행사소개 틀 ---------- */
			.festivalinfo{ 
				width:270px; 
				height:600px; 
				margin:10px; 
				border:2px solid white; 
				background-color:white;
				position:relative;
				float:left;
			}
			
		
		
				/*-----------------불러올 축제 이미지-----------------*/
				.img{ width:250px; height:500px; margin:10px; overflow:hidden;	}
				
				
				
				/*---------------불러올 축제이름 및 기간-------------------*/
				#festitle{ width:280px; height:10px; margin-top:15px; margin-left:12px; font-family: 'GmarketSansLight'; font-size:13pt; }
				#fesdate{ width:280px; height:30px; margin-top:0px; margin-left:13px; font-family: 'GmarketSansLight'; font-size:7pt; }
				




/*--------------- 커뮤니티 --------------------*/
		/*---------------커뮤니티 배경 설정---------------*/
		#community{ 
			margin-top:80px;
			padding-top:250px;
			width:1200px;
			height:900px;
			background-image:url(<%=request.getContextPath()%>/resources/images/comm.png);
			background-size: 1200px;
			background-repeat:no-repeat;
		}
		
		
				/*------------------- 커뮤니티 세부 링크-------------------*/
				#community a { text-decoration:none; }
				#community span{ position:relative; font-size:35pt; }
				#community span:hover{ color:wheat; font-family: 'GmarketSansMedium'; text-decoration:none;}
				#re{ left:18.5%; }
				#qna{ left:65%; }
		

</style>



<!-- 지도-문화안내 -->
<div class="box">
<section>
<div class="conbox">
	<div id ="culture">
		<div>
		<img id="map" src="" />
		</div>
	</div>
</div>
</section>
</div>
	
	
	
<!-- 소개, 공지사항 -->	
<div class="box">
<section>
<div class="conbox">
	<div id="intro">
		<span>INTRO | </span>
		<div>
			<img id="introimg" src="<%=request.getContextPath()%>/resources/images/intro.png"/>
		</div>
		
		<div class="gotodetail">
			<a href="<%= request.getContextPath() %>/Intro/SaehamanoIntro"><p>더 보기</p></a>
		</div>
	</div>
</div>
</section>
</div>	
	



<!-- 축제 -->
<div class="box">
<section>
<div class="conbox">
	<div>
		<span>FESTIVAL | </span>
	</div>
	
	<div id="event">
<!-- 축제 -->		
		<div class="festivalinfo">
		<a href="#">
			<div class="img">
				<img src="<%=request.getContextPath()%>/resources/images/hanriver.jpg"/>
			</div>
		</a>
			<div>
				<p id="festitle">
				축제 이름
				</p>
		
				<p id="fesdate">
				YYYY년 MM월 DD일 부터<br>
				YYYY년 MM월 DD일 까지
				</p>
			</div>
		</div>
<!-- 축제 -->		
		<div class="festivalinfo">
		<a href="#">
			<div class="img">
				<img src="<%=request.getContextPath()%>/resources/images/hanriver.jpg"/>
			</div>
		</a>
			<div>
				<p id="festitle">
				축제 이름
				</p>
		
				<p id="fesdate">
				YYYY년 MM월 DD일 부터<br>
				YYYY년 MM월 DD일 까지
				</p>
			</div>
		</div>
<!-- 축제 -->			
		<div class="festivalinfo">
		<a href="#">
			<div class="img">
				<img src="<%=request.getContextPath()%>/resources/images/hanriver.jpg"/>
			</div>
		</a>
			<div>
				<p id="festitle">
				축제 이름
				</p>
		
				<p id="fesdate">
				YYYY년 MM월 DD일 부터<br>
				YYYY년 MM월 DD일 까지
				</p>
			</div>
		</div>
		
<!-- 축제 -->		
		<div class="festivalinfo">
		<a href="#">
			<div class="img">
				<img src="<%= request.getContextPath()%>/resources/images/hanriver.jpg"/>
			</div>
		</a>
			<div>
				<p id="festitle">
				축제 이름
				</p>
		
				<p id="fesdate">
				YYYY년 MM월 DD일 부터<br>
				YYYY년 MM월 DD일 까지
				</p>
			</div>
		</div>
		
		
	</div>
		
	<div class="gotodetail">
		<a href="<%= request.getContextPath() %>/event/eventschedule"><p>더 보기</p></a>
	</div>	
</div>
</section>
</div>		
	
	
	
<!-- 커뮤니티 : 후기, Q&A -->	
<div class="box" id="lastbox">
<section>
<div class="conbox">
	<div>
		<span>COMMUNITY | </span>
	</div>

	<div id="community">
		<div>
			<a href="<%= request.getContextPath() %>/community/review"><span id="re">후기</span></a>
			<a href="<%= request.getContextPath() %>/community/qna"><span id="qna">Q&A</span></a>
		</div>
	</div>
</div>
</section>
</div>	


<%@ include file = "/views/common/footer.jsp"%>


