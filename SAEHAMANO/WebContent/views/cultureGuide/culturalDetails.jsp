<!-- 210427 23:17 김하린 (최종수정자) -->

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mvc.cultureGuide.model.vo.Culture"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/headerDetail.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%
	Culture culture = (Culture) request.getAttribute("culture");
%>
 <!-- jQuery 1.8 or later, 33 KB -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Fotorama from CDNJS, 19 KB -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

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
   height: 0 auto;
   margin-top:330px;
   margin-bottom:100px;
   margin-left:-10px;
   padding:10px;
   color:white;
}
/*컨텐츠 영역*/
   #conbox{
      width:100%;
       position:relative; 
       top:20px;
       margin:0 auto;
      font-family: 'GmarketSansLight';
   }
/*영역 지정*/
div#cul-detail-con {
	width: 1100px;
	height: 1000px;
	margin:0 auto;
	overflow: auto;
}
div#back-button {width:1100px; height:60px; margin-bottom: 50px;}
#back-button button{width:80px; height:30px; background:none; border:1px solid white; border-radius:5px; font-size:12pt; color:white;}
#back-button button:hover {border:2px solid wheat;}
/*문화안내 타이틀 지정*/
div#cul-detail-con .cul-title{	width:1000px; font-size:25pt;	text-align:center; 	display:inline-block; font-family: 'GmarketSansMedium';}
/*문화재 소개 부분 영역 지정*/
div.cul-box1 {
	width: 500px;
	height:0 auto;
	float:right;
	margin-right:50px;
}
/*문화재 이름 영역 지정*/
div#cul-name{width: 500px; height:80px;}
/*글자 설명 박스 지정*/
div#cul-content {
	width:500px;
	height: 500px;
	overflow: auto;
	margin-top:30px;
}
/*문화재 번호&이름 스타일*/
#cul-name .cul-no {	font-sizt:15pt;}
#cul-name .cul-name2{font-size:20pt;}
	
/*좋아요 부분 영역 지정*/
div.cul-like {
	height:35px;
	text-align: right;
	margin: 5px 10px;
}
/*강조스타일*/
.cul-summary {font-weight:bold;	color:wheat;}
	
/*사진 영역 위치 조정*/
div.fotorama {float:left;	margin:0 auto;}
</style>
<div id="box">
<section id="culturalDetails">
<div id="conbox">
		<div id="cul-detail-con">
			<div id="back-button">
			<button onclick="location.href='<%= request.getContextPath() %>/cultural/list?'">목록으로</button>
			<span class="cul-title">문화안내</span>
			</div>
		
		
<div class="fotorama"
	data-allowfullscreen="true"
	data-width="450"
     data-height="500"
     data-width="100%"
     data-ratio="800/600"
     data-nav="thumbs">
<img src="<%= culture.getImg1() %>" />
    <% if(culture.getImg2() != null) {%>
<img src="<%= culture.getImg2()%>" />
<% } else{ %>
 <p> - </p>
 <% }
    if(culture.getImg3() != null){ %>
<img src="<%= culture.getImg3()%>" />
<% } else{ %>
 <p> - </p>
 <% } %>
  </div>

		<div class="cul-box1">
				<div id="cul-name">
				<span class="cul-no">국보 제  <span><%= culture.getCul_no() %></span>  호</span><br>
				<span class="cul-name2"><%= culture.getCul_name() %></span>
				</div>
				
					<div>
					<span class="cul-summary">분&emsp;류&nbsp;&nbsp; </span>
					<% if(culture.getCul_category() != null){ %>
							<span><%=culture.getCul_category() %> </span><br>
					<% }else{ %>
							<span> - </span><br>
					<% } %>
					<span class="cul-summary">시&emsp;대&nbsp;&nbsp; </span>
					<% if(culture.getCul_era() != null){ %>
							<span><%= culture.getCul_era() %></span><br>
					<% }else{ %>
							<span> - </span><br>
					<% } %>
						<span class="cul-summary">크&emsp;기&nbsp;&nbsp; </span>
					<% if(culture.getCul_invalid() != null){ %>
							<span><%= culture.getCul_invalid() %> </span><br>
					<% }else{ %>
							<span> - </span><br>
					<% } %>
					<%
			//start_date 형변환
		String deg_date = culture.getDeg_date();
		SimpleDateFormat dfFormat = new SimpleDateFormat("yyyyMMdd");
	
		Date formatDate = dfFormat.parse(deg_date); 
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String cul_deg_dage = sdf.format(formatDate);
		%>
					<span class="cul-summary">지정일&nbsp;&nbsp; </span>
					<% if(culture.getDeg_date() != null) {%>
							<span><%= cul_deg_dage %></span><br>
					<% }else{ %>
							<span> - </span><br>
					<% } %>
					<span class="cul-summary">위&emsp;치&nbsp;&nbsp; </span>
					<% if(culture.getCul_location() != null) { %>
							<span><%= culture.getCul_location() %></span><br>
					<% }else{ %>
							<span> - </span><br>
					<% } %>
					</div>
				
				<div id="cul-content">
					<p>
					&nbsp;&nbsp; <%= culture.getCul_description() %>
					
					</p>
				</div>
			</div>
			
		
</div>
</div>
</section>
</div>

<%@ include file="/views/common/footer.jsp" %>