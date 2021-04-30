<!-- 210430 조한결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/views/common/header.jsp"%>


<!-- jQuery 1.8 or later, 33 KB -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Fotorama from CDNJS, 19 KB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<script>
        $(document).on('mouseover', '.list8', function () {
        	$('.hlist8wd').show();
        });
        
        $(document).on('mouseleave', '.hlist8', function () {
                 $('.hlist8wd').hide();  
        });
        
        
</script>
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
		.conbox span{ font-size:40pt; color:white;margin:0px 0px 10px 0px;}
	
		/*------마지막 영역 밑단 길이 조정--------*/
		#lastbox{ margin-bottom:200px;}


		/*------세부페이지 링크 설정-------------*/
		.gotodetail{ width:100%; position:relative; margin:0px 25px 0px 0px; }
		.gotodetail a{ text-decoration:none; color:white; float:right;}
		.gotodetail a:hover{ font-family: 'GmarketSansMedium'; color:wheat;}


/*----공통 끝-------공통 끝-------공통 끝------------공통 끝-------------공통 끝---------공통 끝-------공통 끝-------공통 끝--*/



/*----------문화안내-----------지도----------------문화안내----------지도-------------*/

/*--------------  지도 지역 위치 설정 ------------------*/
.list1 { clear:both; position: absolute; z-index: 1; top: 410px; left: 23.5px; width:187px; }/*전남*/
.list2 { clear:both; position: absolute; z-index: 2; top: 334px; left: 75px; width:142px; } /*전북*/
.list3 { clear:both; position: absolute; z-index: 3; top: 361px; left: 185px; width:155px; } /*경남*/
.list4 { clear:both; position: absolute; z-index: 4; top: 50px; left: 131.5px; width:220px; } /*강원*/
.list5 { clear:both; position: absolute; z-index: 5; top: 228px; left: 50.5px; width:145px; } /*충남*/
.list6 { clear:both; position: absolute; z-index: 6; top: 95px; left: 89px; width:122px; } /*경기*/
.list7 { clear:both; position: absolute; z-index: 7; top: 208px; left: 154px; width:131px; } /*충북*/
.list8 { clear:both; position: absolute; z-index: 8; top: 220px; left: 204px; width:167px; } /*경북*/
.list8wd { clear:both; position: absolute; z-index: 8; top: 200px; left: 519px; width:30px; } /*울릉도 독도*/
.list9 { clear:both; position: absolute; z-index: 9; top: 600px; left: 60px; width:77px; } /*제주*/
.list10 { clear:both; position: absolute; z-index: 10; top: 155px; left: 110px; width:52px; } /*서울*/
.list11 { clear:both; position: absolute; z-index: 11; top: 142px; left: 67px; width:46px; } /*인천*/
.list12 { clear:both; position: absolute; z-index: 12; top: 306px; left: 164px; width:37px; } /*대전*/
.list13 { clear:both; position: absolute; z-index: 13; top: 437px; left: 115px; width:35px; } /*광주*/
.list14 { clear:both; position: absolute; z-index: 14; top: 360.5px; left: 268px; width:38px; } /*대구*/
.list15 { clear:both; position: absolute; z-index: 15; top: 384px; left: 313px; width:63px; } /*울산*/
.list16 { clear:both; position: absolute; z-index: 16; top: 421px; left: 298.5px; width:55px; }/*부산*/



/*-------------------------호버할때 이미지---------------------------------*/
/*--------------  지도 지역 위치 설정 ------------------*/
.hlist1 { clear:both; position: absolute; z-index: 1; top: 410px; left: 23.5px; width:187px; }/*전남*/
.hlist2 { clear:both; position: absolute; z-index: 2; top: 334px; left: 75px; width:142px; } /*전북*/
.hlist3 { clear:both; position: absolute; z-index: 3; top: 361px; left: 185px; width:155px; } /*경남*/
.hlist4 { clear:both; position: absolute; z-index: 4; top: 50px; left: 131.5px; width:220px; } /*강원*/
.hlist5 { clear:both; position: absolute; z-index: 5; top: 228px; left: 50.5px; width:145px; } /*충남*/
.hlist6 { clear:both; position: absolute; z-index: 6; top: 95px; left: 89px; width:122px; } /*경기*/
.hlist7 { clear:both; position: absolute; z-index: 7; top: 208px; left: 154px; width:131px; } /*충북*/
.hlist8 { clear:both; position: absolute; z-index: 8; top: 220px; left: 204px; width:167px; } /*경북*/
.hlist8wd { clear:both; position: absolute; z-index: 8; top: 200px; left: 519px; width:30px; } /*울릉도 독도*/
.hlist9 { clear:both; position: absolute; z-index: 9; top: 600px; left: 60px; width:77px; } /*제주*/
.hlist10 { clear:both; position: absolute; z-index: 10; top: 155px; left: 110px; width:52px; } /*서울*/
.hlist11 { clear:both; position: absolute; z-index: 11; top: 142px; left: 67px; width:46px; } /*인천*/
.hlist12 { clear:both; position: absolute; z-index: 12; top: 306px; left: 164px; width:37px; } /*대전*/
.hlist13 { clear:both; position: absolute; z-index: 13; top: 437px; left: 115px; width:35px; } /*광주*/
.hlist14 { clear:both; position: absolute; z-index: 14; top: 360.5px; left: 268px; width:38px; } /*대구*/
.hlist15 { clear:both; position: absolute; z-index: 15; top: 384px; left: 313px; width:63px; } /*울산*/
.hlist16 { clear:both; position: absolute; z-index: 16; top: 421px; left: 298.5px; width:55px; }/*부산*/

/*-------------------------호버할때 이미지---------------------------------*/

.hover{
opacity:0;
}

.hover:hover{
opacity:1;
}


#culture{margin:57px 0px 0px 0px; padding-top:47px;
}

#conbox{
	 width:1500px; 
	 height:700px; 
	 margin:auto;
	background-image:url(<%=request.getContextPath()%>/resources/images/mf.png);
	background-size:1500px 700px;
}

#map{ width:400px; margin:auto; }

/* --------------------- 소개 ---------------------- */
#introimg{ height:650px; margin:0px; }

/*소개 테이블 전체 영역 지정*/
.saehamanoIntroTable {
	width: 1000px;
	height:0 auto; 
	 font-family: 'GmarketSansLight';
	margin-top:0px;
	}
	
/* 새하마노 소개 이미지 */
 .saehamanoIntroImg {
 		width: 482px;
 		height: 549px;
 		object-fit:cover;
 }
 
 /* 새하마노 소개 제목*/
 .shmnTitle {
 	font-family: 'GmarketSansMedium';
  	color: white;
 	font-size:25pt;
 	
 }
 
 /* 새하마노 설명 영역 지정 */
 .content {
 	width: 500px;
 	height: 300px;
 	padding-top:30px;
 	padding-bottom:10px;
 }

 /* 새하마노 설명 문단 스타일 */
 .shmnIntroContent {
 color: white;
 line-height: 2em;
 padding-right:60px;
 }

/* 새하마노 뜻 문단 스타일*/
.shmnIntroContent span {
  font-size: 18pt;
  font-weight : bold;
  color: wheat;
  }


/*-----------------  축제  ------------------------*/
		/*----------축제영역 설정------------*/
		#event{ margin:auto; }
		#slide{width:1000px;margin-top:10px;}
		
	


		/*라이브러리 사이즈*/
		.fotorama{ margin-top:0px;}
		.fotorama img{ height:100%; }
		.fes-title{ position: relative; top:470px; color:white;  font-size:18pt; text-decoration:none;}
		.fes-title p{ text-align:center; margin:0px;  background-color: rgba( 42, 27, 10, 0.8 ); padding:35px;  }
		
/*--------------- 커뮤니티 --------------------*/
		/*---------------커뮤니티 배경 설정---------------*/
		#community{ 
			margin-top:70px;
			padding-top:250px;
			width:1200px;
			height:700px;
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
<div id="conbox" style="z-index:0;">
	<div id ="culture">
		<div id="map">
			<div style="clear:both; position: relative; z-index: 1; top: -35px; left: 25; ">
				
				
				<img src="<%=request.getContextPath()%>/resources/images/map/061.gif" alt='' border='0' name='jeonS' class='list1' >
				
				<img src='<%=request.getContextPath()%>/resources/images/map/063.gif' alt='' border='0' name='jeonN' class='list2' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/055.gif" alt='' border='0' name='gyeongS' class='list3' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/033.gif" alt='' border='0' name='gangwon' class='list4' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/041.gif" alt='' border='0' name='choongS' class='list5' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/031.gif" alt='' border='0' name='gyeonggi' class='list6' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/043.gif" alt='' border='0' name='choongN' class='list7' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/054.gif" alt='' border='0' name='gyeongN' class='list8' >
				<img src="<%=request.getContextPath()%>/resources/images/map/wd.gif" alt='' border='0' name='gyeongN' class='list8wd ' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/064.gif" alt='' border='0' name='jeju' class='list9' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/02.gif" alt='' border='0' name='seoul' class='list10' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/032.gif" alt='' border='0' name='incheon' class='list11' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/042.gif" alt='' border='0' name='daejeon' class='list12' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/062.gif" alt='' border='0' name='gwangju' class='list13' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/053.gif" alt='' border='0' name='daegu' class='list14' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/052.gif" alt='' border='0' name='woolsan' class='list15' >
				
				<img src="<%=request.getContextPath()%>/resources/images/map/051.gif" alt='' border='0' name='busan' class='list16' >       
			
			
			</div>
			
			
			
			
			<div style="clear:both; position: relative; z-index: 1; top: -35px; left: 25; ">
				
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h061.gif" alt='' border='0' name='jeonS' class='hlist1 hover' ></a>
				
				<a href="#" >
				<img src='<%=request.getContextPath()%>/resources/images/map/h063.gif' alt='' border='0' name='jeonN' class='hlist2 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h055.gif" alt='' border='0' name='gyeongS' class='hlist3 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h033.gif" alt='' border='0' name='gangwon' class='hlist4 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h041.gif" alt='' border='0' name='choongS' class='hlist5 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h031.gif" alt='' border='0' name='gyeonggi' class='hlist6 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h043.gif" alt='' border='0' name='choongN' class='hlist7 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h054.gif" alt='' border='0' name='gyeongN' class='hlist8 hover' >
				<img src="<%=request.getContextPath()%>/resources/images/map/hwd.gif" alt='' border='0' name='gyeongN' class='hlist8wd hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h064.gif" alt='' border='0' name='jeju' class='hlist9 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h02.gif" alt='' border='0' name='seoul' class='hlist10 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h032.gif" alt='' border='0' name='incheon' class='hlist11 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h042.gif" alt='' border='0' name='daejeon' class='hlist12 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h062.gif" alt='' border='0' name='gwangju' class='hlist13 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h053.gif" alt='' border='0' name='daegu' class='hlist14 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h052.gif" alt='' border='0' name='woolsan' class='hlist15 hover' ></a>
				
				<a href="#" >
				<img src="<%=request.getContextPath()%>/resources/images/map/h051.gif" alt='' border='0' name='busan' class='hlist16 hover' ></a>       
				
			
			</div>
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
			<table class="saehamanoIntroTable">
	            <tr>
	                <td><p class="shmnTitle">새하마노<br>소개<br></p>
	                </td>
	                <td rowspan="2">
	                <img class="saehamanoIntroImg" src="<%= request.getContextPath() %>/resources/images/Gyeongbokgung1.jpg" alt="새하마노소개">
	                </td>
	            </tr>
            <tr>
                <td class="content">
                <p class="shmnIntroContent">
                 
                &nbsp;&nbsp;<span>새하마노</span>는 ‘동, 서, 남, 북에서 불어오는 바람’을 뜻하는 우리말로, 샛바람, 하늬바람, 마파람, 높바람에서 새, 하늬, 마, 높을 따와서 새하마노라 부른다.
                <br>
				&nbsp;&nbsp;대한민국의 문화가 늘 곁에서 부는 바람처럼 일상 속에 자연스럽게 스며들기를 바라는 취지로 ‘새하마노’ 라는 이름을 지었다.<br><br>
				<span>&nbsp;&nbsp;"역사를 잊은 민족에게 미래는 없다"</span><br>&nbsp;&nbsp;대한민국의 역사와 문화재를 쉽고 부담 없이 접하여 한국 문화에 관심을 갖게 되는 발판이 되는 걸 목표로 한다.                 
                </p>
                </td>
            </tr>
        </table>
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
		<div id="slide">
			<!-- Add images to <div class="fotorama"></div> -->
			<div class="fotorama" 
				data-width="1200px"
			    data-height="630px"
			    data-autoplay="true"
			    data-loop="true"
			>
					<div data-img="<%=request.getContextPath()%>/resources/images/sanggwabang2.jpg">
						<a href="<%=request.getContextPath()%>/event/viewEvent?event_no=61 " class="fes-title">
						<p>경복궁 생과방 | 2021년 04월 15일 ~ 2021년 06월 30일</p></a>
					</div>
					<div data-img="<%=request.getContextPath()%>/resources/images/busanyeondeungfestival.jpg">
						<a href="<%=request.getContextPath()%>/event/viewEvent?event_no=53 " class="fes-title">
						<p>2565부산연등축제 | 2021년 05월 01일 ~ 2021년 05월 16일</p></a>
					</div>
					<div data-img="<%=request.getContextPath()%>/resources/images/firstgarden.jpg">
						<a href="<%=request.getContextPath()%>/event/viewEvent?event_no=57"  class="fes-title">
						<p>별빛이 흐르는 정원 2021 | 2021년 01월 01일 ~ 2021년 12월 31일</p></a>
					</div>
					<div data-img="<%=request.getContextPath()%>/resources/images/herbisland.jpg">
						<a href="<%=request.getContextPath()%>/event/viewEvent?event_no=56"  class="fes-title">
						<p>불빛 동화 축제 2021 | 2021년 01월 01일 ~ 2021년 12월 31일</p></a>
					</div>
					
					
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


