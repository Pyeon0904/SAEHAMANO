<!-- 210427 09:48 이재용 --> 
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mvc.common.util.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mvc.event.model.vo.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/views/common/headerDetail.jsp"%>


<%
	List<Event> list = (ArrayList) request.getAttribute("list");	
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
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
/*제일 바탕 영역 설정*/
#box{ 
	background-color:#2a1b0a;
	width:100%;
	height:850px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
	margin-top:330px;
	margin-bottom:100px;
	margin-left:-10px;
	padding:10px;
}	
/*컨텐츠 영역*/
#conbox{
	
	 width:1000px; /*각자 컨텐츠에 맞춰서 가로사이즈 지정하세요,.*/
	 position:relative;
	 top:0px;
	 margin:auto;
}
/*해당 페이지 제목*/
#title{ margin-top:50px; margin-bottom:20px; font-family: 'GmarketSansMedium'; font-size:25pt; text-align:center; color:white;}
/* 행사소개 틀 */
.festivalinfo{ width:300px; height:300px; margin:10px; border:2px solid white; background-color:white;
	position:relative;
	float:left;
	
}
.festivalinfo a{ text-decoration:none; color:#2a1b0a; }
/*페이지 버튼*/
#pageBar{ width:1000px; text-align:center; margin:700px 0px 10px 0px; }
#pageBar button {
 font-family: 'GmarketSansMedium';
	font-size: 15px;
	width: 25px; height: 25px;
	margin: 0px 3px;
	background:none;
	border : none;
	color:white;
}
/*번호 선택 스타일*/
#pageBar button:disabled{
	border-bottom:2px solid wheat;
	color:wheat;
}
/*불러올 축제 이미지*/
.img{ width:280px; height:200px; margin:10px; overflow:hidden;	}
/*불러올 축제이름 및 기간*/
#festitle{ text-decoration:none; width:280px; height:25px; margin:15px 0px 7px 12px; overflow:hidden;
			font-family: 'GmarketSansLight'; font-size:13pt; }
#fesdate{ width:280px; height:30px; margin-top:0px; margin-left:13px; 
			font-family: 'GmarketSansLight'; font-size:7pt; }
</style>
<section>
<!-- 겉 제일 큰 박스  -->
	<div id="box">
<!-- 컨텐츠 박스 -->
	<div id="conbox">
<!-- 해당 페이지 제목 -->
		<div id="title">
			<span>한국의 축제</span>
		</div>
		<% if(list.isEmpty()){%>
			<p>조회된 게시글이없습니다</p>
		<% } else{
			for(Event event : list){%>
		
	
<!-- 축제 1번 박스  -->
		<div class="festivalinfo">
		<a href="<%= request.getContextPath() %>/event/viewEvent?event_no=<%=event.getEvent_no()%>">
			<div class="img">
				<img src="<%= event.getEvent_img()%>" width="280"/>
			</div>
			<div>
				<p id="festitle">
					<%=event.getEvent_name() %>
				</p>
				<p id="fesdate">
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
<%= start %> ~ <%= last %>

				</p>
				
			</div>
			</a>
		</div>	
		<% }
		}
		%>
	
			

<!-- 페이지 넘버 버튼 -->	
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/event/eventschedule?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/event/eventschedule?page=<%= pageInfo.getPrvePage() %>'">&lt;</button>

			<!--  10개 페이지 목록 -->
			
		<% for(int p= pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++) {%>
				<%if(p==pageInfo.getCurrentPage()){ %>
					<button disabled><%= p %></button>
				<%} else{ %>
					<button onclick="location.href='<%= request.getContextPath()%>/event/eventschedule?page=<%= p %>'"><%= p %></button>
				<%} %>
			<% } %>
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/event/eventschedule?page=<%= pageInfo.getNextPage() %>'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath()%>/event/eventschedule?page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
		</div>
		</div>
		
	</div>

</section>


<%@ include file = "/views/common/footer.jsp"%>