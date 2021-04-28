<!-- 210428 09:49 조한결  -->
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mvc.event.model.vo.Event"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/views/common/headerDetail.jsp"%>

<%
	Event event = (Event) request.getAttribute("event");
%>

<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Arita-buri-SemiBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-buri-SemiBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/*-----------------------제일 바탕 영역 설정------------------------*/
		#box{ 
			background-color:#948c84;
			width:100%;
			height:850px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
			margin-top:330px;
			margin-bottom:100px;
			margin-left:-10px;
			padding:10px;
		}
/*-----------------컨텐츠 박스 -----------------------------*/
		#conbox{
			width:1000px; /*해당 페이지 컨텐츠 영역 가로사이즈 설정*/
			position:relative;
			top:0px;
			margin:auto;
			
			color:#2a1b0a;
		}
/*----------축제 제목------------*/
			#title{
				margin-top:50px; 
				margin-bottom:10px;
				font-family: 'GmarketSansMedium';
				font-size: 20pt;
			}
/*-------------축제 이미지------------------*/
			#img{
				width:400px;
				height:550px;
				margin:10px;
				/*상  우   하   좌*/
				position:relative;
				overflow:hidden;
				float:left;
				
			
			}
/*----------------------설명 박스 설정-------------------------*/
			#explain{
				margin-left:20px;
				position:ralative;
				width:500px;
				height:650px;
				float:left;
			}
/*------------------설명 줄글 박스-------------------*/
			#detailex{
				height:310px;
				overflow-y:scroll;
			}
/*----------장소 홈페이지 행사기간 등-------------------*/
				#explain p{
					 font-family: 'GmarketSansLight';
					 font-size:13pt;
				}
				
				#explain p b{
				font-family: 'GmarketSansLight';
				font-size:14pt;
					
				}
				
				#explain p a{
					color:#2a1b0a;
					 text-decoration: none;
				}
				
				#explain p a:hover{
					font-family: 'GmarketSansMedium';
					color:wheat;
				}
/*---------------------목록으로-------------------------------*/
				#back{
					position:relative;
					float:right;
				}
				
				#back a{
				 	font-family: 'GmarketSansLight';
					font-size:12pt;
					color:#2a1b0a;
					text-decoration: none;
				}
				
				#back :hover{
					font-family: 'GmarketSansMedium';
					color:wheat;
				}
</style>


<div id="box">
<section>
<div id="conbox">
	<div id="title">
			<span><%= event.getEvent_name() %></span>
	</div>
	<div id="content">
		<div id="img">
			<img src="<%=event.getEvent_img() %>" height="650"/>
		</div>
		
		
		<div id="explain">
					<p>
						<b>행사기간</b><br>
	<%
	//start_date 형변환
		String event_start_date = event.getEvent_start_date();
		SimpleDateFormat dfFormat = new SimpleDateFormat("yyyyMMdd");
	
		Date formatDate = dfFormat.parse(event_start_date); 
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String start = sdf.format(formatDate);
		
		
	//last_date형변환
		String event_last_date = event.getEvent_last_date();
		SimpleDateFormat dfFormat2 = new SimpleDateFormat("yyyyMMdd");
	
		Date formatDate2 = dfFormat2.parse(event_last_date); 
	
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일");
		String last = sdf2.format(formatDate2);	
		
	%>
							<%= start %> 부터 <br>
							<%= last %> 까지
					</p>
		            <p>
		            	<b>장소 </b>
		            	<% if(event.getEvent_place() == null) { %>
		            	<b> 정보가 없습니다.</b>
		            	<%}else{ %>
		            	<%= event.getEvent_place() %>
		            	<input type="button" value="지도보기"
		            		onclick = "location.href ='https://map.naver.com/v5/search/<%=event.getEvent_place() %>'"/>
		            	<% } %>
		            </p>
		           	<p>
		           		<b>주최 </b> 
		           		<% if(event.getEvent_hosting() == null){ %>
		           		<b> 정보가 없습니다.</b>
		           		<%} else { %>
		           		<%= event.getEvent_hosting() %>
		           		<% } %>
		           	</p>
					<p>
						<b>정보 제공 사이트 </b>
						<% if(event.getEvent_insta() != null){ %>
						<a href="<%= event.getEvent_insta() %>">인스타그램</a>
						<%} if(event.getEvent_home() != null){ %>
						<a href="<%= event.getEvent_home()%>">홈페이지</a>
						<%}  %>
					</p>	
					
					<p id="detailex">
						<%= event.getEvent_content() %>
						</p> 	
		</div>
		
		
		<div id="back">
				<a href="<%= request.getContextPath() %>/event/eventschedule">목록으로</a>
		</div>
		
	</div>	
	
		
</div>
</section>
</div>

<%@ include file = "/views/common/footer.jsp"%>
